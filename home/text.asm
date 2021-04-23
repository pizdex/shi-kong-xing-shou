Func_19ca:
	ldh a, [hFFBC] ; text type?
	cp 1
	jr z, .type1
	cp 2
	jr z, .type2
	cp 3
	jr z, .type3
	cp 4
	jr z, .type4
	cp 5
	jr z, .type5
	ret

.type1
	ldh a, [hFFB6]
	jr .select_bank

.type2
	ldh a, [hFFC0]
	jr .select_bank

.type3
	ldh a, [hFFC3]
	jr .select_bank

.type4
	ldh a, [hFFB7]
	jr .select_bank

.type5
	ld a, [wdcb5]
	jr .select_bank

.select_bank
	rst Bankswitch
	push hl

CheckCharacter::
	pop hl
	ld a, [hli]
	push hl

	cp $f0
	jp nc, .SwitchCharacterSet
	cp $e0
	jp nc, CheckCharacter_Commands
	jp CheckCharacter_Continue

.SwitchCharacterSet:
	call GetCharacterSetBase
	jp CheckCharacter

GetCharacterSetBase:
; Determine which bank and address to get the character set from
; $f0 = 40:4000, $f1 = $40:6000, $f2 = $41:4000, etc.
	and $0f
	push af
	srl a
	add $40
	ld [hTargetBank], a
	pop af
	bit 0, a
	jr nz, .upper_characterset
; lower character set
	ld a, $40
	jr .store_address

.upper_characterset
	ld a, $60

.store_address
	ld [wdcd1 + 1], a
	xor a
	ld [wdcd1], a
	ret

CheckCharacter_Continue:
	ld [wCurrentCharacterByte], a
	call RequestLoadCharacter_wTilemap

.check_delay
	ldh a, [hJoypadDown]
	bit A_BUTTON_F, a
	jr z, .delay_text

; short delay
	ld a, 1
	ld [wTextDelayFrames], a

.delay_text
	call DelayFrame
	ld a, [wTextDelayFrames]
	dec a
	ld [wTextDelayFrames], a
	jr nz, .check_delay

	call .Func_1a5f
	ld a, 1
	ld [wCharacterBGMapTransferStatus], a
	call DelayFrame

	ld hl, wCharacterTilemapPos
	inc [hl]
	ld a, 3
	ld [wTextDelayFrames], a
	jp CheckCharacter

.Func_1a5f:
	lb hl, 5, 13
	ld a, [wTextboxPos]
	and a
	jr z, .asm_1a6b

; top half of screen
	lb hl, 5, 3

.asm_1a6b:
	ld a, [wTextLine]
	add a
	add l
	ld l, a
	ld a, [wCharacterTilemapPos]
	add a
	add h
	ld h, a
	call GetTextBGMapPointer
	ld e, l
	ld d, h
	ld hl, wBGMapBufferPointers
	push de
	call .StoreBGMapPointer
; round two
	pop de
	ld a, e
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
; fallthrough

.StoreBGMapPointer:
; Store two pointers into wBGMapBufferPointers at a time
; pointer to tile 1 or 3
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
; Next row in BG map
	ld a, 1 * BG_MAP_WIDTH
	add e
	ld e, a
	jr nc, .tile2_4

; $9800 - $9bff
	inc d
	ld a, d
	and 3
	or $98
	ld d, a

.tile2_4
; pointer to tile 2 or 4
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

RequestLoadCharacter_wTilemap:
; Tiles start at $8a80 with tile ID $a8
	ld a, [wCharacterTilePos]
	add $a8
	ld c, a
	ld [wcbf3], a
; [wCharacterTileDest] = $8xx0
; xx = 'a'
	swap a
	ld b, a
	and $0f
	or $80
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a

; Move from start of textbox to the start of text entry in wTilemap
	ld a, [wTextboxPointer]
	ld l, a
	ld a, [wTextboxPointer + 1]
	ld h, a
	decoord 5, 3, NULL
	add hl, de

; Initial starting position for tile 1
	ld a, [wCharacterTilemapPos]
	add a ; 2 tiles wide
	ld e, a

; Line to print text on (line 0 or line 1)
	ld a, [wTextLine]
	and a
	jr z, .load_character

; second line
	ld a, 2 * SCREEN_WIDTH
	add e
	ld e, a

.load_character
	ld d, 0
	add hl, de
	decoord 0, 1, NULL
	push hl
; Tile 1
	ld [hl], c
; Tile 2
	inc c
	add hl, de
	ld [hl], c
; Tile 3
	inc c
	pop hl
	inc hl
	ld [hl], c
; Tile 4
	inc c
	add hl, de
	ld [hl], c

; Get character tile source
	ld a, [wdcd1]
	ld e, a
	ld a, [wdcd1 + 1]
	ld d, a
; hl = a * (4*8) (4 tiles, 8 bytes)
	ld a, [wCurrentCharacterByte]
	ld l, a
	ld h, 0
REPT 5
	add hl, hl
ENDR
	add hl, de
	ld a, l
	ld [wCharacterTileSrc], a
	ld a, h
	ld [wCharacterTileSrc + 1], a
	ld a, 4
	ld [wCharacterTileCount], a
	ld a, 1
	ld [wCharacterTileTransferStatus], a
	call DelayFrame

	ld a, [wCharacterTilePos]
	add 4
	ld [wCharacterTilePos], a
	; 7 characters max per line
	cp 8 * 7
	ret c

	xor a
	ld [wCharacterTilePos], a
	ret

CheckCharacter_Commands:
	ld de, .commands
	sub $e0
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.commands
	dw Text_Init ; $e0
	dw Func_1c2c ; $e1 sign?
	dw Text_End  ; $e2
	dw Func_1c96 ; $e3
	dw Func_1ca9 ; $e4
	dw PrintTwoOptionMenu     ; $e5
	dw InterpretTwoOptionMenu ; $e6
	dw Func_1d41      ; $e7
	dw Func_1d67      ; $e8
	dw Text_Init      ; $e9
	dw Func_1e0a      ; $ea
	dw Func_1e1a      ; $eb
	dw Text_Paragraph ; $ec
	dw Text_NextLine  ; $ed
	dw Text_Cont      ; $ee
	dw Func_1fe9      ; $ef

Text_Init:
; Save name and face of person
	pop hl
	ld a, [hli]
	ld [wTextNameID], a
	ld a, [hli]
	ld [wTextFaceID], a

	push hl
	ld a, [_BANKNUM]
	push af
	ld a, BANK(Func_00a_4000)
	rst Bankswitch
	call Func_00a_4000 ; load face picture
	call DelayFrame
	call Func_1ba0
	call Func_00a_40b3
	call Func_0419
	call DelayFrame
	pop af
	rst Bankswitch

	xor a
	ld [wCharacterTilePos], a
	ld a, 1
	ld [wTextDelayFrames], a
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	hlcoord 5, 3, NULL
	add hl, de
	ld a, l
	ld [wd0d1], a
	ld a, h
	ld [wd0d1 + 1], a

	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	jp CheckCharacter

Func_1ba0:
; Clear old name buffer
	ld bc, $10 tiles
	ld hl, $8e00
	xor a
	call ByteFillVRAM
	call DelayFrame

; Load name
	ld a, BANK(NamePointers)
	rst Bankswitch
	xor a
	ld [wCharacterTilePos], a
	ld de, NamePointers
	ld a, [wTextNameID]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

RequestLoadCharacter_Name:
; Used for names on textboxes
	ld a, $0a
	rst Bankswitch
	ld a, [hli]
	push hl
	cp $f0
	jr nc, .switch_characterset
	cp TX_LINE
	jr z, .end_of_name

	ld [wCurrentCharacterByte], a
	ld a, [wCharacterTilePos]
	add $e0
	ld c, a
	ld [wcbf3], a
; [wCharacterTileDest] = $8xx0
; xx = 'a'
	swap a
	ld b, a
	and $0f
	or $80
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a

; Get character tile source
	ld a, [wdcd1]
	ld e, a
	ld a, [wdcd1 + 1]
	ld d, a
; hl = a * (4*8) (4 tiles, 8 bytes)
	ld a, [wCurrentCharacterByte]
	ld l, a
	ld h, 0
REPT 5
	add hl, hl
ENDR
	add hl, de
	ld a, l
	ld [wCharacterTileSrc], a
	ld a, h
	ld [wCharacterTileSrc + 1], a
	ld a, 4
	ld [wCharacterTileCount], a
	ld a, 1
	ld [wCharacterTileTransferStatus], a
	call DelayFrame

	ld a, [wCharacterTilePos]
	add 4
	ld [wCharacterTilePos], a
	pop hl
	jp RequestLoadCharacter_Name

.switch_characterset
	call GetCharacterSetBase
	pop hl
	jp RequestLoadCharacter_Name

.end_of_name
	pop hl
	ld a, $0a
	rst Bankswitch
	ret

Func_1c2c:
; Save current bank
	ld a, [_BANKNUM]
	push af
; Switch
	ld a, BANK(Func_00a_4063)
	rst Bankswitch
	call Func_00a_4063 ; load place name
	call DelayFrame
	call Func_00a_40b3
; Switch
	ld a, BANK(Func_004_4024)
	rst Bankswitch
	call Func_004_4024
; Restore old bank
	pop af
	rst Bankswitch

	xor a
	ld [wCharacterTilePos], a
	ld a, 1
	ld [wTextDelayFrames], a

	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	hlcoord 1, 3, NULL
	add hl, de
	ld a, l
	ld [wd0d1], a
	ld a, h
	ld [wd0d1 + 1], a

	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	jp CheckCharacter

Text_End:
	call Func_1fb9

Text_EndCont:
	ld a, [_BANKNUM]
	push af
	ld a, BANK(Func_00a_4178)
	rst Bankswitch
	call Func_1c8b
	call Func_0419
	call Func_00a_4178
	call DelayFrame
	pop af
	rst Bankswitch

	xor a
	ldh [hFFBC], a
	pop hl
	ret

Func_1c8b:
	ld hl, wcbd0
	ld c, $20
	xor a
.asm_1c91
	ld [hli], a
	dec c
	jr nz, .asm_1c91
	ret

Func_1c96:
	call Func_0817
	pop hl
	call $421a
	ld a, [wcbfe]
	ld l, a
	ld a, [wcbfe + 1]
	ld h, a
	push hl
	jp CheckCharacter

Func_1ca9:
	pop hl
	ld a, [wdcd3]
	ld l, a
	ld a, [wdcd3 + 1]
	ld h, a
	push hl
	jp CheckCharacter

PrintTwoOptionMenu:
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wcbfe], a
	ld a, h
	ld [wcbfe + 1], a
	push hl
	jp CheckCharacter

unk_1cc5:
	text "  ", 0
	text "是", 1
	text "  ", 0
	text "否", 1
	choice

unk_1cd0:
	text "  ", 0
	text "回", 1
	text "春", 3
	text " ", 0
	text "靈", 0
	text "動", 2
	choice

InterpretTwoOptionMenu:
	call .Main
	jp Text_EndCont

.Main:
	ld a, [wdaa3]
	res 3, a
	ld [wdaa3], a
	call Func_1f70
	ld hl, wcde0
	inc hl
	ld [hl], $40
	xor a
	ldh [hVBlank], a
	ldh [hJoypadPressed], a

.input_loop:
; Flash gameboy icon
	call Func_1f97
	call Func_1f8a

; Check left
	call DelayFrame
	ldh a, [hJoypadPressed]
	bit D_LEFT_F, a
	jr z, .check_right

; Pressed left
	ld hl, wcde0
	inc hl
	ld [hl], $40
	jr .check_A

.check_right
	ldh a, [hJoypadPressed]
	bit D_RIGHT_F, a
	jr z, .check_A

; Pressed right
	ld hl, wcde0
	inc hl
	ld [hl], $70
	jr .check_A ; inefficient

.check_A
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .loop

; Pressed A
	ld hl, wcde0
	inc hl
	ld a, [hl]
	cp $40
	jr z, .choose_option

	ld a, [wdaa3]
	set 3, a
	ld [wdaa3], a
	jr .choose_option

; ???
.loop
	jr .input_loop

.choose_option
	call Func_1fb1
	call Func_1f8a
	ret

Func_1d41:
	pop hl
	ld a, l
	ld [wdcd3], a
	ld a, h
	ld [wdcd3 + 1], a
	ld hl, .unk_1d59
	ld a, l
	ld [wcbfe], a
	ld a, h
	ld [wcbfe + 1], a
	push hl
	jp CheckCharacter

.unk_1d59:
	db $f0, $00
	db $f2, $4d
	db $f0, $00
	db $f2, $51
	db $f0, $00
	db $f1, $49, $4a
	db $e8

Func_1d67:
; Buy sell cancel menu
	call Func_1d6d
	jp Text_EndCont

Func_1d6d:
; Buy sell cancel menu for real

; Init position
	ld a, [wdaa4]
	res 0, a
	res 1, a
	ld [wdaa4], a
	call Func_1f70
	ld hl, wcde0
	inc hl
	ld [hl], $30
	xor a
	ldh [hVBlank], a
	ldh [hJoypadPressed], a

.CheckJoypad:
	call Func_1f97
	call Func_1f8a
	call DelayFrame
; check left
	ldh a, [hJoypadPressed]
	bit D_LEFT_F, a
	jr z, .check_right

; skip if already on option 0
	ld a, [wdaa4]
	and %11
	jr z, .check_a
; check if on option 1 or 2
	bit 1, a
	jr z, .left_option1

; on option 2
	ld a, [wdaa4] ; waste
	set 0, a
	res 1, a
	ld [wdaa4], a
	jr .asm_1dd4

.left_option1
	ld a, [wdaa4] ; waste
	res 0, a
	ld [wdaa4], a
	jr .asm_1dd4

.check_right
	ldh a, [hJoypadPressed]
	bit D_RIGHT_F, a
	jr z, .check_a

; skip if already on option 2
	ld a, [wdaa4]
	bit 1, a
	jr nz, .check_a
; check if on option 0 or 1
	bit 0, a
	jr nz, .right_option1

; option 0
	set 0, a
	ld [wdaa4], a
	jr .asm_1dd4

.right_option1
	set 1, a
	res 0, a
	ld [wdaa4], a

.asm_1dd4:
	ld a, [wdaa4]
	and %11
; a = a * $20
REPT 5
	add a
ENDR
	add $30
	ld hl, wcde0
	inc hl
	ld [hl], a

.check_a
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .loop

; pressed a
	ld hl, wcde0
	inc hl
	ld a, [hl]
	cp $40
	jr z, .exit

	ld a, [wdaa3]
	set 3, a
	ld [wdaa3], a
	jr .exit

.loop
	jr .CheckJoypad ; waste

.exit
	call Func_1fb1
	call Func_1f8a
	ret

Func_1e07:
	jp CheckCharacter

Func_1e0a:
	pop hl
	call $6e4d
	ld a, [wcbfe]
	ld l, a
	ld a, [wcbfe + 1]
	ld h, a
	push hl
	jp CheckCharacter

Func_1e1a:
	pop hl
	call $6de3
	ld a, [wcbfe]
	ld l, a
	ld a, [wcbfe + 1]
	ld h, a
	push hl
	jp CheckCharacter

Text_Paragraph:
	call Func_1fb9
	call Func_1e40
	call Func_1e7b
	xor a
	ld [wCharacterTilemapPos], a
	ld [wTextLine], a
	ld [wCharacterTilePos], a
	jp CheckCharacter

Func_1e40:
; Clear tilemap textbox
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	lb bc, 4, 14
	ld de, 6
.clear
	ld a, $a0
	ld [hli], a
	dec c
	jr nz, .clear
	add hl, de
	ld c, 14
	dec b
	jr nz, .clear
	ret

Text_NextLine:
	xor a
	ld [wCharacterTilemapPos], a

	ld a, [wTextLine]
	and a
	jp nz, Func_1e6e

	ld a, 1
	ld [wTextLine], a
	jp CheckCharacter

Func_1e6e:
	xor a
	ld [wCharacterTilemapPos], a
	call Func_1f24
	call Func_1e7b
	jp CheckCharacter

Func_1e7b:
	ld hl, $050d
	ld a, [wTextboxPos]
	and a
	jr z, .asm_1e87

	ld hl, $0503
.asm_1e87
	call GetTextBGMapPointer
	ld e, l
	ld d, h
	ld hl, wBGMapBufferPointers
	ld bc, $020e
	call Func_1efe
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	call Func_1ee4
	ld a, $1c
	ld [hFFA5], a
	ld a, $01
	ld [wcbf6], a
	call DelayFrame
	ld hl, $050f
	ld a, [wTextboxPos]
	and a
	jr z, .asm_1eb9

	ld hl, $0505
.asm_1eb9
	call GetTextBGMapPointer
	ld e, l
	ld d, h
	ld hl, wBGMapBufferPointers
	ld bc, $020e
	call Func_1efe
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	ld de, $0028
	add hl, de
	call Func_1ee4
	ld a, $1c
	ld [hFFA5], a
	ld a, $01
	ld [wcbf6], a
	call DelayFrame
	ret

Func_1ee4:
	ld de, wd128
	lb bc, 2, 14
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ld a, l
	add 6
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld c, 14
	dec b
	jr nz, .copy
	ret

Func_1efe:
	push bc
	push de
.asm_1f00:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .asm_1f00

	pop de
	ld a, $20
	add e
	ld e, a
	jr nc, .asm_1f1f

	inc d
	ld a, d
	and $03
	or $98
	ld d, a
.asm_1f1f
	pop bc
	dec b
	jr nz, Func_1efe
	ret

Func_1f24:
	ld a, [wd0d1]
	ld l, a
	ld a, [wd0d1 + 1]
	ld h, a
	push hl
	ld de, $28
	add hl, de
	pop de
	push hl
	lb bc, 2, 14
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ld a, e
	add 6
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, l
	add 6
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld c, 14
	dec b
	jr nz, .copy

	pop de
	lb bc, 2, 14
.clear
	ld a, $a0
	ld [de], a
	inc de
	dec c
	jr nz, .clear
	ld a, e
	add 6
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld c, 14
	dec b
	jr nz, .clear
	ret

Text_Cont:
	call Func_1fb9
	jp Text_NextLine

Func_1f70:
	ld hl, wcde0
	ld [hl], $3f
	ld a, [hFFD3]
	and a
	jr nz, .asm_1f81

	ld a, [wTextboxPos]
	and a
	jr nz, .asm_1f83

.asm_1f81
	ld [hl], $8f

.asm_1f83
	inc hl
	ld [hl], $98
	inc hl
	ld [hl], $03
	ret

Func_1f8a:
	homecall Func_004_4045
	ret

Func_1f97:
; Timer between flash
	ld bc, wcde0
	ld hl, 3
	add hl, bc
	inc [hl]
	ld a, [hl]
	cp 10
	ret c

	ld [hl], 0
	dec hl
	ld a, [hl]
	cp 3
	jr z, .asm_1fae

	ld [hl], 3
	ret

.asm_1fae
	ld [hl], 4
	ret

Func_1fb1:
; Inefficient
	ld hl, wcde0
	inc hl
	inc hl
	ld [hl], 0
	ret

Func_1fb9:
; Flashing gameboy icon on textbox stuff
	call Func_1f70
	xor a
	ldh [hVBlank], a
	ldh [hJoypadPressed], a
	call Func_1f8a
.joypad_loop
	ldh a, [hJoypadDown]
	and D_PAD | BUTTONS
	jr nz, .asm_1fda

	ldh a, [hVBlank]
	and a
	jr z, .joypad_loop

	xor a
	ldh [hVBlank], a
	call Func_1f97
	call Func_1f8a
	jr .joypad_loop

.asm_1fda
	ld a, $17
	call Func_2be2
	xor a
	ldh [hVBlank], a
	call Func_1fb1
	call Func_1f8a
	ret

Func_1fe9:
	xor a
	ldh [hFFBC], a
	pop hl
	ret

Func_1fee:
	ldh a, [hFFB6]
	rst Bankswitch
	ld a, [wd0cd]
	ld l, a
	ld a, [wd0cd + 1]
	ld h, a
	ld de, wda00
.asm_1ffc
	ld a, [hl]
	cp $88
	jr z, .asm_200f

	ld a, $ff
	ld [de], a
	inc de
	ld c, $0b
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	jr .asm_1ffc

.asm_200f
	ld [de], a
	ret

Func_2011:
	ld de, unk_209e
	ldh a, [hFF9A]
	ld l, a
	ld c, a
	ld b, 0
	ld h, 0
	add hl, hl
	add hl, bc
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ldh a, [hFF9B]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, hFFB2
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, [hli]
	ld [wd0cb], a
	ld a, [hli]
	ld [wd0cb + 1], a
	ld bc, $0c
	ldh a, [hFF9C]
	and a
	jr z, .asm_2052

.asm_204e
	add hl, bc
	dec a
	jr nz, .asm_204e

.asm_2052
	ld a, [wd9d2]
	and a
	jr z, .asm_205e

	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	ld a, [hli]
	jr .asm_206c

.asm_205e
	ld a, [hli]
	ldh [hFF96], a
	ld a, [hli]
	ldh [hFF97], a
	ld a, [hli]
	ld [wd0c9], a
	ld a, [hli]
	ld [wd0ca], a

.asm_206c
	ld de, hFFB6
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	inc de
	ld a, [hli]
	inc de
	ld a, [hli]
	inc de
	ld a, [hli]
	ld [wd0cd], a
	ld a, [hli]
	ld [wd0cd + 1], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wdf00
.asm_2086
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	ret z

REPT 5
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	jr .asm_2086
	ret ; ?

unk_209e:
	db $07, $00, $40, $07, $0f, $43, $10, $00
	db $40, $10, $7b, $48, $52, $00, $40, $63
	db $00, $40, $69, $00, $40, $69, $83, $48
	db $10, $00, $40

Func_20b9:
	ldh a, [hFFB2]
	rst Bankswitch
	push de
	ldh a, [hFF97]
	add c
	ld c, a
	ld hl, wc100
	ld a, [hFF98]
	ld e, a
	ld d, 0
	ld a, c
	and a
	jr z, .asm_20d2

.asm_20ce
	add hl, de
	dec c
	jr nz, .asm_20ce

.asm_20d2
	pop de
	ld a, d
	ld c, a
	ld d, 0
	ldh a, [hFF96]
	add e
	ld e, a
	add hl, de
	ld a, [wd0a2]
	ld e, a
	ld a, [wd0a2 + 1]
	ld d, a
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, b
	and a
	jr z, .asm_20f1

	inc hl
	inc hl
.asm_20f1
	ld a, c
	and a
	jr z, .asm_20f6

	inc hl
.asm_20f6
	ld a, [wd0b0]
	ld e, a
	ld a, [wd0b0 + 1]
	ld d, a
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wd0c8], a
	ret

Func_2108:
	ldh a, [hFFAC]
	and a
	jr z, .asm_211f

	ld a, [wdcd0]
	and a
	jr nz, .asm_211c

	ldh a, [hFFAD]
	inc a
	ldh [hFFAD], a
	cp 5
	jr c, .asm_211f

.asm_211c
	call Func_2123

.asm_211f
	call Func_21bb
	ret

Func_2123:
	xor a
	ldh [hFFAD], a
	ld [wdcd0], a
	ld hl, wcd07
	ld a, 1
	sub [hl]
	ld [hl], a

.asm_2130:
	ld a, [wcd04]
	ld [wdb1f], a
	call Func_2363
	ld a, [wdb1f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd03]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd05]
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $ff
	jr nz, .asm_216d
	ld a, h
	cp $ff
	jr nz, .asm_216d

	xor a
	ld [wcd05], a
	ld [wd3f4], a
	ldh [hFFAD], a
	ldh [hFFAC], a
	ret

.asm_216d:
	ld a, l
	cp $ee
	jr nz, .asm_2182
	ld a, h
	cp $ee
	jr nz, .asm_2182

	xor a
	ld [wcd05], a
	ld [wd3f4], a
	ldh [hFFAD], a
	jr .asm_2130

.asm_2182:
	ld a, [wcd06]
	swap a
	ld e, a
	ld a, [wcd07]
	and a
	jr z, .asm_2192

	ld a, $40
	add e
	ld e, a
.asm_2192
	ld d, $80
	ld bc, $40
	call CopyBytesVRAM
	ld hl, wcd05
	inc [hl]
	ld a, [hl]
	cp 1
	jr nc, .asm_21a7
	xor a
	ld [wd3f4], a

.asm_21a7
	ldh a, [hFFA7]
	and a
	ret nz
	ld a, [hl]
	bit 0, a
	ret z

	xor a
	ld [wcd05], a
	ld [wd3f4], a
	ldh [hFFAD], a
	ldh [hFFAC], a
	ret

Func_21bb:
	ld a, [wdcea]
	and a
	jp z, Func_224e
	ldh a, [hFFDB]
	and a
	jp z, Func_224e

	ld a, [wdceb]
	and a
	jr nz, .asm_21d8

	ldh a, [hFFDC]
	inc a
	ldh [hFFDC], a
	cp 5
	jp c, Func_224e

.asm_21d8
	xor a
	ldh [hFFDC], a
	ld [wdceb], a
	ld hl, wcd27
	ld a, 1
	sub [hl]
	ld [hl], a

.asm_21e5
	ld a, [wcd24]
	ld [wdb1f], a
	call Func_2363
	ld a, [wdb1f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd23]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd25]
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $ff
	jr nz, .asm_221f
	ld a, h
	cp $ff
	jr nz, .asm_221f

	xor a
	ld [wcd25], a
	ldh [hFFDC], a
	ldh [hFFDB], a
	ret

.asm_221f
	ld a, l
	cp $ee
	jr nz, .asm_2231
	ld a, h
	cp $ee
	jr nz, .asm_2231

	xor a
	ld [wcd25], a
	ldh [hFFDC], a
	jr .asm_21e5

.asm_2231
	ld a, [wcd26]
	swap a
	ld e, a
	ld a, [wcd27]
	and a
	jr z, .asm_2241

	ld a, $40
	add e
	ld e, a

.asm_2241
	ld d, $80
	ld bc, $40
	call CopyBytesVRAM
	ld hl, wcd25
	inc [hl]
	ret

Func_224e:
	ld bc, wcd40
.asm_2251:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_2293
	dec [hl]
	ld a, [hl]
	and a
	jr nz, .asm_2293

	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, 1
	sub [hl]
	ld [hl], a
	ld [wd9fe], a
	ld hl, $0d
	add hl, bc
	ld [hl], $14
	push bc
	call Func_22f6
	pop bc
	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld c, 4
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .copy
	ret

.asm_2293:
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	jr nc, .asm_22a0

	ld b, h
	ld c, l
	jr .asm_2251

.asm_22a0
	call Func_23a6
	ret

Func_22a4:
	ld bc, wcd40
.asm_22a7:
	ld hl, $0d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_22ea
	dec [hl]
	ld a, [hl]
	and a
	jr nz, .asm_22ea

	ld hl, 3
	ld de, wd9fa
	add hl, bc
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	ld a, 1
	sub [hl]
	ld [hl], a
	ld [wd9fe], a
	ld hl, $0d
	add hl, bc
	ld [hl], $0a
	push bc
	call Func_22f6
	pop bc
	push bc
	ld hl, 3
	ld de, wd9fa
	add hl, bc
	ld c, 4
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .copy

	pop bc
.asm_22ea:
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	ret nc

	ld b, h
	ld c, l
	jr .asm_22a7

Func_22f6:
	ld a, [wd9fb]
	ld [wdb1f], a
	call Func_2363
	ld a, [wdb1f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9fa]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd9fc]
	add a
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	cp $ff
	jr nz, .asm_2332
	ld a, h
	cp $ff
	jr nz, .asm_2332

	xor a
	ld [wd9fc], a
	ld hl, $0d
	add hl, bc
	ld [hl], 0
	ret

.asm_2332:
	ld a, l
	cp $ee
	jr nz, .asm_2341
	ld a, h
	cp $ee
	jr nz, .asm_2341

	xor a
	ld [wd9fc], a
	ret

.asm_2341
	ld a, [wd9fd]
	swap a
	ld e, a
	or $80
	ld d, a
	ld a, e
	and $f0
	ld e, a
	ld a, [wd9fe]
	and a
	jr z, .asm_2358

	ld a, $40
	add e
	ld e, a

.asm_2358
	ld bc, $40
	call CopyBytesVRAM
	ld hl, wd9fc
	inc [hl]
	ret

Func_2363:
	ld a, [wdb1f]
	cp $14
	jr c, .asm_239f
	cp $2e
	jr c, .asm_2390
	cp $53
	jr c, .asm_2381

	ld a, BANK(unk_060_4000)
	rst Bankswitch
	ld de, unk_060_4000
	ld a, [wdb1f]
	sub $53
	ld [wdb1f], a
	ret

.asm_2381
	ld a, BANK(unk_014_4000)
	rst Bankswitch
	ld de, unk_014_4000
	ld a, [wdb1f]
	sub $2e
	ld [wdb1f], a
	ret

.asm_2390
	ld a, BANK(unk_022_4000)
	rst Bankswitch
	ld de, unk_022_4000
	ld a, [wdb1f]
	sub $14
	ld [wdb1f], a
	ret

.asm_239f
	ld a, BANK(unk_004_48e7)
	rst Bankswitch
	ld de, unk_004_48e7
	ret

Func_23a6:
	ldh a, [hFFBF]
	and a
	ret nz
	ld a, [wd1f1]
	inc a
	ld [wd1f1], a
	cp 7
	ret nz

	xor a
	ld [wd1f1], a
	homecall Func_01c_4000
	ret

unk_23c5:
	db $05, $00, $00, $00, $00, $00, $00, $0a, $0a, $0a, $14, $14, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $0a, $0a, $0a, $0a, $0a, $00, $00, $08, $08, $08, $08, $00, $00, $00, $00, $0a, $0a, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
