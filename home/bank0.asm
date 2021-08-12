_Start::
; Save console type (DMG or CGB)
	ldh [hConsoleType], a

; Set stack
	ld sp, wdfff

; Scroll
	xor a
	ldh [rSCX], a
	ldh [rSCY], a
; LCD
	di
	ld a, LCDCF_OFF
	ldh [rLCDC], a
; Palettes
	ld a, %11100100
	ldh [rBGP], a
	ld a, %00011100
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a
; STAT
	ld a, $40
	ldh [rSTAT], a
	ld a, 143
	ldh [rLYC], a
; Interrupts
	ld a, 0
	ldh [rIF], a
	ld a, IEF_VBLANK + IEF_LCDC
	ldh [rIE], a

	jp Func_0200

unk_017f::
; Alternate header?
	INCBIN "data/unk_017f.bin"

Func_0200::
	call ClearMemory
	call WriteOAMDMACodeToHRAM

	ld hl, Func_106f
	ld a, l
	ld [wd9e0], a
	ld a, h
	ld [wd9e0 + 1], a
	ei
	ld a, 2
	ld [wd091], a
	call Func_262d

; Check SRAM
	call SRAMTest

	ld a, $03
	ldh [hMapNumber], a
	ld a, 0
	ldh [hWarpNumber], a
	ld [wd0ff], a
	ld [wd0df], a
	ld [wd0ef], a
	ld a, 0
	ld [hFFBA], a
	call LoadMapAndScriptPredef
	ld a, $12
	ld [wTargetMode], a

JumpToGameMode::
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call FadeOutPalette
	ld de, GameModes
	ld a, [wTargetMode]
	ld l, a
	ld h, 0
	add hl, hl
	add l
	ld l, a
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

JumpToModeAndSetMapPredefs::
	call LoadMapAndScriptPredef
	jr JumpToGameMode

GameModes::
; Seems to load on each map entry
	dba Func_005_41fb   ; $00
	dba MeteorCutscene  ; $01
	dba Func_03c_40d2   ; $02
	dba Func_03c_4343   ; $03
	dba Func_01b_4000   ; $04
	dba Func_05d_4000   ; $05
	dba Func_04e_4943   ; $06
	dba Func_055_4000   ; $07
	dba Func_01a_4000   ; $08
	dba Func_061_4000   ; $09
	dba Func_05c_55e7   ; $0a
	dba Func_061_5d22   ; $0b
	dba Func_05e_401c   ; $0c
	dba Func_05f_4000   ; $0d
	dba Func_05b_4000   ; $0e
	dba Func_04e_46e5   ; $0f
	dba Func_062_4000   ; $10
	dba Func_04e_4637   ; $11
	dba Intro_VastFame  ; $12
	dba Func_067_4000   ; $13
	dba Func_067_506e   ; $14
	dba Func_067_51f5   ; $15
	dba Func_062_5df3   ; $16
	dba Func_03c_40d2   ; $17
	dba Func_03c_40d2   ; $18
	dba Debug_SoundTest ; $19
	dba Func_03c_4c74   ; $1a
	dba Func_07a_401f   ; $1b
	dba Func_07a_4188   ; $1c
	dba Func_06f_4000   ; $1d
	dba Func_070_4000   ; $1e
	dba Func_071_4000   ; $1f
	dba Func_071_5a49   ; $20

DelayFrame::
; Wastes cycles until the VBlank interrupt occurs, where hVBlank is set to 1
; VBlank will never occur if the LCD is off
	ldh a, [rLCDC]
	and a
	ret z

	ldh a, [hVBlank]
	and a
	jr z, DelayFrame

	xor a
	ldh [hVBlank], a
	ret

INCLUDE "home/copy_vram.asm"

Func_0419::
	homecall Func_004_4000
	ret

Func_0426::
	ld a, [_BANKNUM]
	push af
	call Func_2108
	pop af
	rst Bankswitch
	ret

Func_0430::
	ld a, [_BANKNUM]
	push af
	ld a, 1
	ldh [hFFAC], a
	ld [wdcd0], a
	ld a, $0a
	ldh [hFFAD], a
	ld a, 1
	ldh [hFFDB], a
	ld [wdceb], a
	ld a, $0a
	ldh [hFFDC], a
	call Func_0453
	call Func_2108
	pop af
	rst Bankswitch
	ret

Func_0453::
	ld hl, wPartyMons
.asm_0456:
	ld a, [hl]
	cp $51
	jr z, .asm_0481
	cp $75
	jr z, .asm_0486
	cp $6c
	jr z, .asm_048b
	cp $5b
	jr z, .asm_0490
	cp $63
	jr z, .asm_0495
	cp $91
	jr z, .asm_049a
	cp $90
	jr z, .asm_049f
	cp $7e
	jr z, .asm_04a4

	ld bc, $16
	add hl, bc
	ld a, l
	cp $80
	ret nc
	jr .asm_0456

.asm_0481
	ld de, wde00
	jr .asm_04a9

.asm_0486
	ld de, wde16
	jr .asm_04a9

.asm_048b
	ld de, wde2c
	jr .asm_04a9

.asm_0490
	ld de, wde42
	jr .asm_04a9

.asm_0495
	ld de, wde58
	jr .asm_04a9

.asm_049a
	ld de, wde6e
	jr .asm_04a9

.asm_049f
	ld de, wde84
	jr .asm_04a9

.asm_04a4
	ld de, wde9a
	jr .asm_04a9

.asm_04a9:
	push hl
	ld bc, $16
.copy1
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	jr nz, .copy1

	pop de
	ld bc, .unk_04d0
	ld a, [wcd24]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $16
.copy2
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	jr nz, .copy2
	ret

.unk_04d0
	dw wde00
	dw wde00
	dw wde00
	dw wde16
	dw wde00
	dw wde2c
	dw wde00
	dw wde42
	dw wde00
	dw wde58
	dw wde00
	dw wde6e
	dw wde00
	dw wde84
	dw wde00
	dw wde9a
	dw wde00

Func_04f2::
	ld a, [wdcf3]
	ld de, wdd00
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [wdcf4]
	ld [hl], a
	and a
	ret nz
	ret

Func_0506::
	ld a, [wdcf3]
	ld de, .unk_0521
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $16
.asm_0517
	ld a, [hli]
	ld [hl], 0
	inc hl
; @bad
	dec c
	ld a, c
	or b
	jr nz, .asm_0517
	ret

.unk_0521
	dw wde00
	dw wde16
	dw wde2c
	dw wde42
	dw wde58
	dw wde6e
	dw wde84
	dw wde9a

Func_0531::
	ld a, [wcd00]
	ld b, a
	ld a, [wcd01]
	ld c, a
	ld de, .unk_054f
	ld a, [wcd03]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	add b
	ld [wcd20], a
	ld a, [hli]
	add c
	ld [wcd21], a
	ret

.unk_054f
	db $f0, $00
	db $10, $00
	db $00, $10
	db $00, $f0
	db $fa, $ff
	db $7f, $f5

Func_055b::
	ld a, [wd0c9]
	ld [wcd01], a
	ld a, [wd0ca]
	ld [wcd00], a
	ld a, 1
	ld [wcd02], a
	ldh [hFFAC], a
	ld [wdcd0], a
	ld a, $0a
	ldh [hFFAD], a
	ld a, [wd0e3]
	ld [wcd03], a
	ld a, [wd0e4]
	and a
	jr z, .asm_058a

	ld a, [wd0e4]
	ld [wcd04], a
	jp .asm_05e9 ; jr

.asm_058a
	ld a, [wd9dd]
	cp 3
	jr nz, .asm_05a0
	ld hl, wdd18
	ld a, [hl]
	cp $80
	jr nz, .asm_05a0

	ld a, $36
	ld [wcd04], a
	jr .asm_05a7

.asm_05a0
	ld a, [wd9dd]
	add a
	ld [wcd04], a

.asm_05a7
	ld a, [wdcea]
	and a
	jr z, .asm_05e9

	cp 2
	jr z, .asm_05b8

	ld a, 1
	ld [wcd24], a
	jr .asm_05ca

.asm_05b8
	ld a, [wd9dd]
	and a
	jr z, .asm_05c5

	add a
	inc a
	ld [wcd24], a
	jr .asm_05ca

.asm_05c5
	ld a, $10
	ld [wcd24], a

.asm_05ca
	ld a, [wcd03]
	ld [wcd23], a
	ld [wdcec], a
	call Func_0531
	ld a, 1
	ld [wcd22], a
	ldh [hFFDB], a
	ld [wdceb], a
	ld a, $0a
	ldh [hFFDC], a
	ld a, 8
	ld [wcd26], a

.asm_05e9
	call Func_2108
	call Func_22a4
	pop af
	rst Bankswitch
	ret

Func_05f2::
	ld a, [_BANKNUM]
	push af
	call Func_2108
	call Func_22a4
	pop af
	rst Bankswitch
	ret

Func_05ff::
	ld a, [_BANKNUM]
	push af
	call LoadMapData
	call Func_2433
	call LoadMapGFX
	call Func_24be
	call Func_1fee
	call Func_19b6
	pop af
	rst Bankswitch
	ret

Func_0618::
	ld a, [_BANKNUM]
	push af
	call Func_26e1
	pop af
	rst Bankswitch
	ret

Func_0622::
	ld a, [_BANKNUM]
	push af
	call Func_20b9
	pop af
	rst Bankswitch
	ret

Func_062c::
	homecall Func_009_4008
	ret

Func_0639::
	homecall Func_009_4000
	ret

INCLUDE "home/palettes.asm"

WaitVRAM_STAT::
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT

Func_06c6::
	ld a, [_BANKNUM]
	push af
	call Func_19ca
	pop af
	rst Bankswitch
	ret

Func_06d0::
	ld a, BANK(Func_00b_417b)
	rst Bankswitch
	call Func_00b_417b
	ld a, $05
	rst Bankswitch
	ret

GetScriptByte::
; Get byte from [hScriptBank]:[wScriptPos] and store it in [wScriptByte]
	ld a, [_BANKNUM]
	push af

; Get bank and address
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wScriptPos]
	ld l, a
	ld a, [wScriptPos + 1]
	ld h, a

; Get byte
	ld a, [hli]
	ld [wScriptByte], a
; Store new address
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a

	pop af
	rst Bankswitch
	ret

Func_06f8::
	ld a, [_BANKNUM]
	push af

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

	pop af
	rst Bankswitch
	ret

Func_0733::
	homecall Func_00c_6ed7
	ret

Func_0740::
	homecall Func_00c_4056
	ret

Func_074d::
	homecall Func_00d_4019
	ret

RequestLoadCharacter_PaperScroll::
	ld [wCurrentCharacterByte], a
	call DelayFrame
	ld a, [_BANKNUM]
	push af

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

	pop af
	rst Bankswitch
	ret

GetTextBGMapPointer::
; Calculate BGMap address from coords depending on SCXY
	push bc
	push de
	ld bc, vBGMap0
	ld e, h
	ld a, l
; a * 8 (1 tile = 8 pixels)
	add a
	add a
	add a
	ld l, a
	ldh a, [hSCY]
	add l
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl

	ld a, e
	add a
	add a
	add a
	ld e, a
	ldh a, [hSCX]
	add e
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	add hl, de
	add hl, bc

; store pointer
	ld a, l
	ld [wTextBGMapPointer], a
	ld a, h
	ld [wTextBGMapPointer + 1], a
	pop de
	pop bc
	ret

Func_07e2::
	push hl
	ld de, wd100
	lb bc, 20, 8
	ld a, b
	ldh [hFF92], a
	ld a, c
	ldh [hFF93], a
	call PlaceAttrmap

; Copy wTilemap textbox into VRAM
	pop hl
	ld a, [wTextboxPointer]
	ld e, a
	ld a, [wTextboxPointer + 1]
	ld d, a
	lb bc, 20, 8
	ld a, b
	ld [hFF92], a
	ld a, c
	ld [hFF93], a
	call PlaceTilemap
	ret

Func_080a::
	homecall Func_005_4000
	ret

Func_0817::
	ld a, [_BANKNUM]
	push af
	ld a, BANK(Func_005_4000)
	rst Bankswitch
	call Func_005_4000
	call ParseCurrentMapEvents
	pop af
	rst Bankswitch
	ret

Func_0827::
	homecall Func_01e_41e8
	ret

Func_0834::
	homecall Func_01e_4083
	ret

Func_0841::
	homecall Func_01e_4194
	ret

Func_084e::
	homecall Func_01e_4125
	ret

Func_085b::
	homecall Func_01e_4000
	ret

Func_0868::
; Load face pic bank
	ld a, [_BANKNUM]
	push af
	ld a, [wTextFaceID]
	cp 58
	jr c, .asm_087c

; [wTextFaceID] >= 58
	ld a, BANK(Func_015_4000)
	rst Bankswitch
	call Func_015_4000
	pop af
	rst Bankswitch
	ret

.asm_087c
	ld a, BANK(Func_01f_4000)
	rst Bankswitch
	call Func_01f_4000
	pop af
	rst Bankswitch
	ret

Func_0885::
; Load face pic bank 2?
	ld a, [_BANKNUM]
	push af
	ld a, [wTextFaceID]
	cp 58
	jr c, .asm_0899

; [wTextFaceID] >= 58
	ld a, BANK(Func_013_4000)
	rst Bankswitch
	call Func_013_4000
	pop af
	rst Bankswitch
	ret

.asm_0899
	ld a, BANK(Func_020_4000)
	rst Bankswitch
	call Func_020_4000
	pop af
	rst Bankswitch
	ret

Func_08a2::
	ld bc, wcd40
.asm_08a5
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr nz, Func_0915
	inc de

Func_08ae::
	ld a, [de]
	ld hl, 4
	add hl, bc
	ld [hl], a
	inc de
	ld a, [de]
	ld [wd0c3], a
	ld hl, hFFAA
	sub [hl]
REPT 4
	add a
ENDR
	add $08
	ld hl, 1
	add hl, bc
	ld [hld], a
	inc de
	ld a, [de]
	ld [wd0c2], a
	push hl
	ld hl, hFFAB
	sub [hl]
REPT 4
	add a
ENDR
	add $10
	pop hl
	ld [hl], a
	inc hl
	inc hl
	ld [hl], 1
	ld hl, 6
	add hl, bc
	ld a, c
	swap a
	and $0f
	add a
	add a
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, 8
	add hl, bc
REPT 5
	inc de
ENDR
	ld a, [de]
	ld [hli], a
	inc hl
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ld a, 1
	ld [hl], a
	ld hl, $12
	add hl, bc
	ld a, [wd0c2]
	ld [hli], a
	ld a, [wd0c3]
	ld [hl], a
	call LoadSpritePalette
	ret

Func_0915::
	ld hl, $20
	add hl, bc
	ld a, l
	cp $e0
	jr z, .asm_0922

	push hl
	pop bc
	jr Func_08a2.asm_08a5

.asm_0922
	ld c, 0
	ret

Func_0925::
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	jp Func_08ae

FadeOutPalette::
	ld a, 0
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr nz, .exit

; CGB only from here
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld hl, unk_2b38
	ld a, 0
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr FadeOutPalette

.exit
; Warning:: LCD disabled outside of VBlank here
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

Func_096a::
; Switch intro scene?
.loop
	ld a, 0
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	jr nz, .exit

	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld hl, unk_2b38
	ld a, 0
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr Func_096a

.exit
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

Func_09a6::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld hl, unk_2ab8
	ld a, 1
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	jr z, .exit

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jr Func_09a6

.exit
	ret

ClearBGMap0::
; Clear both banks of the BG map from address $9800 - $9c00
; Wastes cycles on DMG because banked VRAM doesn't exist there.
	call DelayFrame
	di
; Load VRAM bank 1
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
.clear_bank1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .clear_bank1
; clear byte
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank1

	ei
	call DelayFrame
	di
; Load VRAM bank 0
	xor a
	ldh [rVBK], a
	ld hl, vBGMap0
	ld bc, vBGMap1 - vBGMap0
.clear_bank0
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .clear_bank0
; clear byte
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank0

	ei
	ret

Func_0a0a::
	ld a, [_BANKNUM]
	push af

	ldh a, [hFFB2]
	rst Bankswitch
	ld a, [wd0a8]
	ld l, a
	ld a, [wd0a8 + 1]
	ld h, a
	ld de, wcab0
	ld c, $40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1
	pop af
	rst Bankswitch

	ld de, wcab0
	ld hl, $30
	add hl, de
	push hl
	pop de
	ld hl, .unk_0a3e
	ld bc, 8
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy2
	ret

.unk_0a3e
	dw $7fff
	dw $7e57
	dw $792c
	dw $0000

Func_0a46::
	ld hl, unk_2c24
	ld de, wcaf0
	ld c, $40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1

	ld de, unk_0a8b
	ld a, [wd9dd]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld de, wcaf0
	ld bc, 8
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy2

	ld de, wcaf0
	ld hl, $10
	add hl, de
	push hl
	pop de
	pop hl
	ld bc, 8
	add hl, bc
	ld bc, 8
.copy3
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	ld a, c
	or b
	jr nz, .copy3
	ret

unk_0a8b::
	dw .unk_0a9b
	dw .unk_0aab
	dw .unk_0abb
	dw .unk_0acb
	dw .unk_0adb
	dw .unk_0aeb
	dw .unk_0afb
	dw .unk_0b0b

.unk_0a9b
	dw $56b5
	dw $0000
	dw $001d
	dw $67bf
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.unk_0aab
	dw $56b5
	dw $0000
	dw $65ad
	dw $7bde
	dw $56b5
	dw $0000
	dw $0220
	dw $7fff

.unk_0abb
	dw $56b5
	dw $0000
	dw $0220
	dw $7fff
	dw $56b5
	dw $0000
	dw $2978
	dw $73df

.unk_0acb
	dw $56b5
	dw $0000
	dw $01fc
	dw $73df
	dw $56b5
	dw $0000
	dw $001e
	dw $77df

.unk_0adb
	dw $56b5
	dw $0000
	dw $7e80
	dw $77df
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.unk_0aeb
	dw $56b5
	dw $0000
	dw $4419
	dw $77df
	dw $56b5
	dw $0000
	dw $7ab0
	dw $77df

.unk_0afb
	dw $56b5
	dw $0000
	dw $65ad
	dw $7bde
	dw $56b5
	dw $0000
	dw $2978
	dw $73df

.unk_0b0b
	dw $56b5
	dw $0000
	dw $02fe
	dw $77df
	dw $56b5
	dw $0000
	dw $6a1e
	dw $73df

Func_0b1b::
	ld de, wcaf0
	ld hl, $18
	add hl, de
	push hl
	pop de
	ld hl, unk_2c3c
	ld c, 40
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ret

CopyBytes3::
; Copy bc bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Func_0b39::
	homecall Func_024_40fd
	ret

Func_0b46::
	ld a, [_BANKNUM]
	push af

	ld a, [wd9f1]
	rst Bankswitch
	ld a, [wd088]
	ld l, a
	ld a, [wd088 + 1]
	ld h, a
	ld a, [hli]
	ld [wd08a], a
	ld a, l
	ld [wd088], a
	ld a, h
	ld [wd088 + 1], a
	pop af
	rst Bankswitch
	ret

INCLUDE "home/text_menu.asm"
INCLUDE "home/load_mon_pics.asm"

IncFillBoxVRAM::
; Fill box b*c with value e starting at hl
; Increment e after every write
	push hl

.copy:
	ld a, e
	push bc
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; Write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written
	ld a, [hl]
	cp c
; @bug: if jump is taken, causes stack issue
	jr nz, .copy

	inc l
	inc e
	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc

	pop bc
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, IncFillBoxVRAM

	ld a, 0
	ldh [rVBK], a
	ret

Func_0f36::
	ld a, [_BANKNUM]
	push af
	ldh a, [hFFB2]
	rst Bankswitch
	call Func_259b
	ld a, [wd0aa]
	ld l, a
	ld a, [wd0aa + 1]
	ld h, a
	or l
	jr nz, .not_zero

	call Func_25a9
	pop af
	rst Bankswitch
	ret

.not_zero
	ld de, $9000
	ld bc, $800
	call CopyBytesVRAM
	ld a, [wd0ac]
	ld l, a
	ld a, [wd0ac + 1]
	ld h, a
	ld de, $8800
	ld bc, $300
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

LoadMapGFX::
	ld a, [_BANKNUM]
	push af
	ldh a, [hFFB2]
	rst Bankswitch
	call Func_25a2
	ld a, [wd0aa]
	ld l, a
	ld a, [wd0aa + 1]
	ld h, a
	or l
	jr nz, .not_zero

	call Func_25a9
	pop af
	rst Bankswitch
	ret

.not_zero
	ld de, $9000
	ld bc, $800
	call CopyBytesVRAM
	call DelayFrame
	ld a, [wd0ac]
	ld l, a
	ld a, [wd0ac + 1]
	ld h, a
	ld de, $8800
	ld bc, $300
	call CopyBytesVRAM
	call DelayFrame
	pop af
	rst Bankswitch
	ret

Func_0fac::
	ld de, wdd00
.asm_0faf
	ld a, [wd08e]
	inc a
	and $07
	ld [wd08e], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret nz
	jr .asm_0faf

Func_0fc4::
	ld de, wdd00
.asm_0fc7
	ld a, [wd08e]
	dec a
	and $07
	ld [wd08e], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hl]
	and a
	ret nz
	jr .asm_0fc7

Func_0fdc::
	ld a, [wd08e]
	ld hl, wPartyMons
	ld de, $16
	and a
	jr z, .asm_0fec

.asm_0fe8
	add hl, de
	dec a
	jr nz, .asm_0fe8

.asm_0fec
	push hl
	pop bc
	ret

Func_0fef::
	ld a, 0
	ldh [rVBK], a

.asm_0ff3
	push hl
	di

.waitLCD
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD

	ld [hl], 0
	ei
; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld e, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or e
	ld l, a
	dec b
	jr nz, .waitLCD

; Move to next row
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, .asm_0ff3

	ld a, 0
	ldh [rVBK], a
	ret

Func_1022::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a

.asm_102b
	push hl
	di

.waitLCD
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD

	ld [hl], 0
	ei
; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld e, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or e
	ld l, a
	dec b
	jr nz, .waitLCD

; Move to next row
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, .asm_102b

	ld a, 0
	ldh [rVBK], a
	ret

ByteFill::
; Fill bc bytes with the value of a, starting at hl
	ld d, a
.loop
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

ByteFillVRAM::
; Fill bc bytes with the value of a, starting at hl
; Wait until VRAM is write-able first
	ld d, a
.loop
	call WaitVRAM_STAT2
	ld a, d
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Func_106f::
	jp Finish_LCD

Func_1072::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	jp Finish_LCD

Func_107f::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, $80
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $9a
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_109a::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, $20
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $7f
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_10b5::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, $60
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $d0
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_10d0::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, $30
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $b5
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_10eb::
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	di
	ld a, [wd98f]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $07
	inc hl
	ld [hl], $11
	jp Finish_LCD

Func_1107::
	ld a, [wd9ab]
	ldh [rSCX], a
	ld a, [wd9ac]
	ldh [rSCY], a
	di
	ld a, [wd990]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $23
	inc hl
	ld [hl], $11
	jp Finish_LCD

Func_1123::
	ld a, [hSCX]
	ldh [rSCX], a
	ld a, [hSCY]
	ldh [rSCY], a
	di
	ld a, [wd98c]
	ldh [rLYC], a
	ei
	ld hl, wd9e0
	ld [hl], $eb
	inc hl
	ld [hl], $10
	jp Finish_LCD

Func_113f::
	homecall Func_025_5df5
	ret

Func_114c::
	homecall Func_025_4110
	ret

Func_1159::
	push bc
	ld a, [wd991]
	ld b, a
	sla a
	sla a
	add b
	inc a
	ld b, a
	ldh a, [hFF9D]
	add b
	ld b, a
	ldh a, [rLY]
	add b
	ld b, a
	ld a, [wGameTimeMinutes]
	add b
	ld b, a
	ld a, [wd991]
	add b
	ld [wd991], a
	pop bc
	ret

Func_117b::
	push hl
	push de
	push bc
	push af
	ld a, [wd9af]
	ld b, a
	ld a, [wd986]
	and a
	jr nz, .asm_1197
	ld a, [wd9b2]
	and a
	jr nz, .asm_119d

.asm_118f
	ld de, wd93c
	ld a, [wd987]
	jr .asm_11a3

.asm_1197
	ld a, [wd9b2]
	and a
	jr nz, .asm_118f

.asm_119d
	ld de, wd900
	ld a, [wd983]

.asm_11a3
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	pop af
	ld [hl], a
	pop bc
	pop de
	pop hl
	ret

Func_11b3::
	push hl
	push de
	push bc
	ld a, [wd9af]
	ld b, a
	ld a, [wd986]
	and a
	jr nz, .asm_11ce
	ld a, [wd9b2]
	and a
	jr nz, .asm_11d4

.asm_11c6
	ld de, wd93c
	ld a, [wd987]
	jr .asm_11da

.asm_11ce
	ld a, [wd9b2]
	and a
	jr nz, .asm_11c6

.asm_11d4
	ld de, wd900
	ld a, [wd983]

.asm_11da
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

Func_11e9::
	push hl
	push de
	push bc
	push af
	ld a, [wd9af]
	ld b, a
	ld a, [wd986]
	and a
	jr nz, .asm_1205

	ld a, [wd9b2]
	and a
	jr nz, .asm_120b

.asm_11fd
	ld de, wd93c
	ld a, [wd987]
	jr .asm_1211

.asm_1205
	ld a, [wd9b2]
	and a
	jr nz, .asm_11fd

.asm_120b
	ld de, wd900
	ld a, [wd983]

.asm_1211
	add a
	ld l, a
	add a
	add a
	add l
	add b
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld b, a
	pop af
	add b
	ld [hl], a
	ld a, [wd9af]
	cp 4
	jr nc, .asm_1236

	ld a, [hl]
	cp $0e
	jr nc, .asm_1234
	cp $07
	jr nc, .asm_1236

	ld [hl], $07
	jr .asm_1236

.asm_1234
	ld [hl], $0d

.asm_1236
	pop bc
	pop de
	pop hl
	ret

Func_123a::
	push bc
	ldh a, [hFFCD]
	and a
	jr nz, .asm_1259
	jr z, .asm_124c

; inaccessible
	push af
	ldh a, [hFFCB]
	ldh [hFFCD], a
	pop af
	ldh [hFFCB], a
	pop bc
	ret

.asm_124c
	ldh a, [hFFCC]
	and a
	jr z, .asm_1259

	ld b, a
	ldh a, [hFFCB]
	ldh [hFFCC], a
	ld a, b
	ldh [hFFCB], a

.asm_1259
	pop bc
	ret

Func_125b::
	push hl
	push de
	push bc
	ld a, [wd9af]
	ld c, a
	ld b, 0
	ld a, [wd986]
	and a
	jr nz, .asm_127a

	ld a, [wd9b2]
	and a
	jr nz, .asm_1280

.asm_1270
	ld a, [wd984]
	ld l, a
	ld a, [wd984 + 1]
	ld h, a
	jr .asm_1288

.asm_127a
	ld a, [wd9b2]
	and a
	jr nz, .asm_1270

.asm_1280
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a

.asm_1288
	add hl, bc
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

Func_128e::
	ld a, [wd981]
	ld c, a
	ld a, [wd981 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld a, [hli]
	ld [wd998], a
	ld a, [hli]
	ld [wd999], a
	xor a
	ld [wd9d7], a
	homecall Func_025_4110
	ldh a, [hFFCB]
	ld [wd99a], a
	ldh a, [hFFCC]
	ld [wd99b], a
	ret

Func_12bd::
	ld a, [wd984]
	ld c, a
	ld a, [wd984 + 1]
	ld b, a
	ld hl, 2
	add hl, bc
	ld a, [hli]
	ld [wd998], a
	ld a, [hli]
	ld [wd999], a
	xor a
	ld [wd9d7], a
	farcall Func_025_4101
	ldh a, [hFFCB]
	ld [wd99a], a
	ldh a, [hFFCC]
	ld [wd99b], a
	ret

Func_12e6::
	ld bc, wdb20
	ld a, [wdc9e]
	ld l, a
	ld a, [wd08e]
	add l
	and a
	ret z

.asm_12f3
	ld hl, $13
	add hl, bc
	push hl
	pop bc
	dec a
	jr nz, .asm_12f3
	ret

SRAMTest_Fast::
; Check for pattern at start of SRAM
; 00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f
; 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

; Enable SRAM
	ld a, SRAM_ENABLE
	ld [rRAMG], a

; Select bank
	xor a ; bank 0
	ld [rRAMB], a

; Check for increasing value pattern
	ld hl, _SRAM
	ld c, 0
.check_pattern1
	ld a, [hli]
	cp c
	jr nz, .no_pattern
	inc c
	ld a, c
	cp $10 + 1
	jr c, .check_pattern1

	ld c, $0f
.check_pattern2
	ld a, [hli]
	and a
	jr nz, .no_pattern
	dec c
	jr nz, .check_pattern2

; pattern found
	xor a
	ld [rRAMG], a
	xor a
	ret

.no_pattern
	xor a
	ld [rRAMG], a
	ld a, 1
	ret

Func_132b::
	call Func_05ff
	ret

Func_132f::
	push hl
	push de
	ld hl, wPartyMons
.asm_1334
	ld a, [hl]
	and a
	jr z, .asm_1346

	ld de, $16
	add hl, de
	ld a, l
	cp $80
	jr c, .asm_1334

	ld a, 1
	pop de
	pop hl
	ret

.asm_1346
	xor a
	push hl
	pop bc
	pop de
	pop hl
	ret

Func_134c::
	ld a, [_BANKNUM]
	push af
	ld a, [wd0f1]
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_135a::
	ld a, [_BANKNUM]
	push af
	ld a, $0c
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_1367::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a
	jp Func_1377

Func_1373::
	ld a, 0
	ldh [rVBK], a

Func_1377::
	push hl

.copy
	ld a, [de]
	push bc
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written
	ld a, [hl]
	cp c
	jr nz, .copy

; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or b
	ld l, a
	inc de

	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc
	ld a, h
	cp HIGH($9f00)
	jr c, .next_row
	ld h, HIGH(vBGMap1)

.next_row
	pop bc
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, Func_1377

	ld a, 0
	ldh [rVBK], a
	ret

Func_13b7::
	ld a, [_BANKNUM]
	push af
	ld a, $23
	rst Bankswitch
	ld a, [wd088]
	ld l, a
	ld a, [wd088 + 1]
	ld h, a
	ld a, [hli]
	ld [wd989], a
	ld a, l
	ld [wd088], a
	ld a, h
	ld [wd088 + 1], a
	pop af
	rst Bankswitch
	ret

Func_13d5::
	ld a, [_BANKNUM]
	push af
	ldh a, [hScriptBank]
	rst Bankswitch
	ld a, [wd0cd]
	ld l, a
	ld a, [wd0cd + 1]
	ld h, a
	ld de, wda00
.asm_13e7
	ld a, [hl]
	cp $88
	jr z, .asm_13fa

	ld a, $ff
	ld [de], a
	inc de
	ld c, 11
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	jr .asm_13e7

.asm_13fa
	ld [de], a
	pop af
	rst Bankswitch
	ret

PlayMapMusic::
	ld de, .map_music
	ldh a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ldh a, [hMapNumber]
	ld l, a
	ld h, 0
	add hl, de
	ldh a, [hCurSound]
	cp [hl]
	ret z

	ld a, [hl]
	and a
	ret z

	call PlaySound
	ret

.map_music
	dw .group_0
	dw .group_1
	dw .group_2
	dw .group_3
	dw .group_4
	dw .group_5
	dw .group_6
	dw .group_7

.group_0
	db SFX_00, BGM_59, BGM_65, BGM_65, BGM_59, BGM_59, BGM_59, BGM_59
	db BGM_59, BGM_65, BGM_65, BGM_65, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_5e, BGM_71, BGM_72, BGM_67, BGM_67, BGM_67
	db BGM_67, BGM_67, BGM_67, BGM_72, BGM_6e, BGM_6f, BGM_6f, BGM_6f
	db BGM_6f, BGM_6f, BGM_69, BGM_66, BGM_66, BGM_66, BGM_66, BGM_66
	db BGM_5b, BGM_5a, BGM_65, BGM_66, BGM_64, BGM_60, BGM_60, BGM_60
	db BGM_60, BGM_60, BGM_60, BGM_60, BGM_71, BGM_72

.group_1
	db SFX_00, BGM_5b, BGM_65, BGM_65, BGM_5b, BGM_5b, BGM_5b, BGM_5b
	db BGM_59, BGM_65, BGM_65, BGM_65, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_5e, BGM_71, BGM_72, BGM_67, BGM_67, BGM_67
	db BGM_67, BGM_67, BGM_67, BGM_72, BGM_6e, BGM_6f, BGM_6f, BGM_6f
	db BGM_6f, BGM_6f, BGM_69, BGM_66, BGM_66, BGM_66, BGM_66, BGM_66
	db BGM_63, BGM_5a, BGM_65, BGM_66, BGM_64, BGM_60, BGM_60, BGM_60
	db BGM_60, BGM_60, BGM_60, BGM_60, BGM_71, BGM_72

.group_2
	db SFX_00, BGM_5e, BGM_59, BGM_66, BGM_66, BGM_66, BGM_61, BGM_61
	db BGM_60, BGM_69, BGM_69, BGM_69, BGM_69, BGM_69, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_59, BGM_59, BGM_59, BGM_59, BGM_59, BGM_61
	db BGM_6d, BGM_72, BGM_71, BGM_5e, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_5e, BGM_72, BGM_71, BGM_5b

.group_3
	db SFX_00, BGM_5d, BGM_5d, BGM_5d, BGM_5f, BGM_5f, BGM_5f, BGM_67
	db BGM_67, BGM_59, BGM_5e, BGM_68, BGM_68, BGM_68, BGM_68, BGM_72
	db BGM_70, BGM_70, BGM_5b, BGM_5b, BGM_5b, BGM_60, BGM_61, BGM_67
	db BGM_67, BGM_67, BGM_67, BGM_67, BGM_67, BGM_72, BGM_71, BGM_5d
	db BGM_5f, BGM_5b, BGM_5b, BGM_5b

.group_4
	db SFX_00, BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_5b, BGM_5b
	db BGM_5b, BGM_5b, BGM_5b, BGM_6e, BGM_59, BGM_59, BGM_63, BGM_64
	db BGM_63, BGM_59, BGM_59, BGM_59, BGM_5e, BGM_60, BGM_5b, BGM_5c
	db BGM_5c, BGM_5c, BGM_60, BGM_60, BGM_60, BGM_60, BGM_63, BGM_5e
	db BGM_63, BGM_66, BGM_66, BGM_66, BGM_66, BGM_6e, BGM_5e, BGM_5e
	db BGM_6d, BGM_6d, BGM_62, BGM_67, BGM_6e, BGM_6e, BGM_6e, BGM_6e
	db BGM_6e, BGM_72, BGM_71, BGM_6e, BGM_5e, BGM_5e, BGM_5e, BGM_5e
	db BGM_71, BGM_72, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e
	db BGM_72, BGM_71, BGM_65, BGM_65, BGM_59, BGM_6e, BGM_6e, BGM_6e
	db BGM_6e, BGM_6e, BGM_6e, BGM_72, BGM_71, BGM_6e, BGM_5a, BGM_63
	db BGM_5c, BGM_5c, BGM_5c, BGM_69, BGM_69, BGM_6d, BGM_5e, BGM_5e
	db BGM_5e, BGM_5e, BGM_5e, BGM_5e, BGM_72, BGM_71, BGM_62, BGM_67
	db BGM_5a, BGM_5a, BGM_5a, BGM_5a, BGM_70, BGM_70

.group_5
	db SFX_00, BGM_5a, BGM_5a, BGM_66, BGM_66, BGM_66, BGM_66, BGM_5c
	db BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_64, BGM_5c
	db BGM_5c, BGM_5c, BGM_5c, BGM_5c, BGM_5c, BGM_5c, BGM_63, BGM_63
	db BGM_63, BGM_66, BGM_66, BGM_5c, BGM_5b, BGM_5c, BGM_5c, BGM_5c
	db BGM_5c, BGM_72, BGM_71, BGM_65, BGM_65, BGM_65, BGM_65, BGM_5c

.group_6
	db SFX_00, BGM_68, BGM_68, BGM_61, BGM_61, BGM_61, BGM_61, BGM_61
	db BGM_5b, BGM_64, BGM_60, BGM_5a, BGM_6e, BGM_63, BGM_5b, BGM_60
	db BGM_60, BGM_60, BGM_60, BGM_60, BGM_60, BGM_60, BGM_60, BGM_60
	db BGM_70, BGM_70, BGM_70, BGM_70, BGM_72, BGM_71, BGM_63, BGM_63
	db BGM_62, BGM_5f, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e, BGM_6e
	db BGM_71, BGM_72, BGM_5f, BGM_61, BGM_69

.group_7
	db SFX_00, BGM_5f, BGM_59, BGM_6e, BGM_5c, BGM_6d, BGM_63, BGM_67
	db BGM_59, BGM_60, BGM_5e, BGM_5e, BGM_5e

Func_15a8::
	push hl

.copy:
	ld a, e
	push bc
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written
	ld a, [hl]
	cp c
	jr nz, .copy

; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or b
	ld l, a

	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	pop bc
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, Func_15a8

	ld a, 0
	ldh [rVBK], a
	ret

LoadMapAndScriptPredef::
	ld de, .Predefs
	ld a, [hFFBA]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Predefs
	dw MapPredef_BallotsHouseIntro ; $00
	dw Func_1730 ; $01
	dw Func_1730 ; $02
	dw Func_1900 ; $03
	dw MapPredef_AfterMeteorShower ; $04
	dw Func_1712 ; $05
	dw Func_1730 ; $06
	dw Func_1730 ; $07
	dw Func_1730 ; $08
	dw Func_1730 ; $09
	dw Func_1730 ; $0a
	dw Func_1730 ; $0b
	dw Func_1730 ; $0c
	dw Func_1730 ; $0d
	dw Func_1730 ; $0e
	dw Func_1730 ; $0f
	dw Func_1730 ; $10
	dw Func_1730 ; $11
	dw Func_1730 ; $12
	dw Func_1730 ; $13
	dw Func_1730 ; $14

MapPredef_BallotsHouseIntro::
	ld hl, wdd00
	ld [hl], $01
	ld a, MAP_BALLOTS_HOUSE_1
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(Script_008_4000)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_008_4000)
	inc hl
	ld [hl], HIGH(Script_008_4000)
	call Func_1642
	ret

Func_1642::
	ld a, [wdcb0]
	and a
	jr z, Func_1661

	cp 1
	jp z, Func_1674
	cp 2
	jp z, Func_168c
	cp 3
	jp z, Func_16b6
	cp 4
	jp z, Func_16c0
	cp 5
	jp z, Func_16ea

Func_1661::
; 1000 money
	ld a, $03
	ld [wMoney + 1], a
	ld a, $e8
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	ret

Func_1674::
; 99999 money
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $9f
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	ret

Func_168c::
; 99999 money
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $9f
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $27
	inc hl
	ld [hl], 99
	ret

Func_16b6::
; @bug: SRAM is not enabled
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp Func_1661

Func_16c0::
; 99999 money
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $9f
	ld [wMoney + 2], a

; Init items
	ld hl, wd300
	ld [hl], $05
	inc hl
	ld [hl], 2
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], $27
	inc hl
	ld [hl], 99
	ret

Func_16ea::
; @bug: SRAM is not enabled
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp Func_1661

MapPredef_AfterMeteorShower::
	ld a, GROUP_BALLOTS_HOUSE_2
	ldh [hMapGroup], a
	ld a, MAP_BALLOTS_HOUSE_2
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(Script_00e_4005)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_00e_4005)
	inc hl
	ld [hl], HIGH(Script_00e_4005)
	ret

Func_1712::
	ld a, 4
	ldh [hMapGroup], a
	ld a, $43
	ldh [hMapNumber], a
	ld a, 1
	ldh [hWarpNumber], a
	ld a, 1
	ldh [hFFD6], a

	ld a, BANK(Script_055_53ef)
	ld [hScriptBank], a
	ld hl, wScriptPos
	ld [hl], LOW(Script_055_53ef)
	inc hl
	ld [hl], HIGH(Script_055_53ef)
	ret

Func_1730::
; Debug code
	ld bc, 7 * $16
	call Func_2e13
	ld bc, 7
	call Func_2e04

; wow...
	ld a, $ff
	ld [wdaa0], a
	ld a, $ff
	ld [wdaa1], a
	ld a, $ff
	ld [wdaa2], a
	ld a, $f7
	ld [wdaa3], a
	ld a, $ff
	ld [wdaa4], a
	ld a, $ff
	ld [wdaa5], a
	ld a, $77
	ld [wdaa6], a
	ld a, $ff
	ld [wdaa7], a
	ld a, $ff
	ld [wdaa8], a
	ld a, $1f
	ld [wdaa9], a
	ld a, $fc
	ld [wdaaa], a
	ld a, $ff
	ld [wdaab], a
	ld a, $fe
	ld [wdaac], a
	ld a, $ff
	ld [wdaad], a
	ld a, $3f
	ld [wdaae], a
	ld a, $ff
	ld [wdaaf], a
	ld a, $ff
	ld [wdab0], a
	ld a, $ff
	ld [wdab1], a
	ld a, $ff
	ld [wdab2], a
	ld a, $ff
	ld [wdab3], a
	ld a, $f7
	ld [wdab4], a
	ld a, $03
	ld [wdab5], a
	ld a, $00
	ld [wdab6], a
	ld a, $00
	ld [wdab7], a
	ld a, $00
	ld [wdab8], a

	ld a, $1a
	ld [hFFBA], a
	ld a, $0c
	ldh [hMapNumber], a
	ld a, 3
	ldh [hWarpNumber], a
	ld a, 6
	ldh [hMapGroup], a

	ld a, $01
	ld [wdcbb], a

; Money = 99990
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $96
	ld [wMoney + 2], a

	ld bc, $18
	call Func_2ca4
	call Func_2d08
	call Debug_GiveItems

; 2nd mon
	ld bc, wPartyMons
	ld hl, 1 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_138
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $05 ; $0005 (5)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $85
	inc hl ; MON_MOVE1PP
	ld [hl], 12
	inc hl ; MON_MOVE1MAXPP
	ld [hl], 12

; 3rd mon
	ld bc, wPartyMons
	ld hl, 2 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_114
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl ; MON_MOVE1PP
	ld [hl], 12
	inc hl ; MON_MOVE1MAXPP
	ld [hl], 12

; 4th mon
	ld bc, wPartyMons
	ld hl, 3 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_005
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], 12
	inc hl
	ld [hl], 12

; 5th mon
	ld bc, wPartyMons
	ld hl, 4 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_120
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], 12
	inc hl
	ld [hl], 12

; 6th mon
	ld bc, wPartyMons
	ld hl, 5 * PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
; species
	ld a, MON_049
	ld [bc], a
; level
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], 90
; exp
	ld hl, MON_EXP + 1
	add hl, bc
	ld [hl], $10 ; $001000 (4096)
; hp
	ld hl, MON_HP
	add hl, bc
	ld [hl], $55 ; $0055 (85)
; item
	ld hl, MON_ITEM
	add hl, bc
	ld [hl], $12
; unk22
	inc hl ; MON_UNK22
	ld [hl], $14
; moves
	ld hl, MON_MOVE1ID
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], 12
	inc hl
	ld [hl], 12
	ret

unk_18ea::
	ds $16, 0

Func_1900::
; Debug code
	ld bc, 1 * $16
	call Func_2e13
	ld bc, 1
	call Func_2e04

; wow...
	ld a, 0
	ld [wdaa0], a
	ld a, 0
	ld [wdaa1], a
	ld a, 0
	ld [wdaa2], a
	ld a, 0
	ld [wdaa3], a
	ld a, 0
	ld [wdaa4], a
	ld a, 0
	ld [wdaa5], a
	ld a, 0
	ld [wdaa6], a
	ld a, 0
	ld [wdaa7], a
	ld a, 0
	ld [wdaa8], a
	ld a, 0
	ld [wdaa9], a
	ld a, 0
	ld [wdaaa], a
	ld a, 0
	ld [wdaab], a
	ld a, 0
	ld [wdaac], a
	ld a, 0
	ld [wdaad], a
	ld a, 0
	ld [wdaae], a
	ld a, 0
	ld [wdaaf], a
	ld a, 0
	ld [wdab0], a
	ld a, 0
	ld [wdab1], a
	ld a, 0
	ld [wdab2], a
	ld a, 0
	ld [wdab3], a
	ld a, 0
	ld [wdab4], a
	ld a, 0
	ld [wdab5], a
	ld a, 0
	ld [wdab6], a
	ld a, 0
	ld [wdab7], a
	ld a, 0
	ld [wdab8], a

	ld a, 0
	ld [hFFBA], a
	ld a, $01
	ldh [hMapNumber], a
	ld a, 0
	ldh [hWarpNumber], a
	ld a, 0
	ldh [hMapGroup], a
	ld a, 1
	ld [wdcbb], a

	ld bc, 1
	call Func_2ca4
	call Func_2d08
	call Debug_GiveItems

; 5000 money
	ld a, $13
	ld [wMoney + 1], a
	ld a, $88
	ld [wMoney + 2], a
	ret

Func_19b6::
	ld a, [wd0ef]
	and a
	jr z, .asm_19c3

	farcall Func_00b_5273
	ret

.asm_19c3
	farcall Func_00d_4000
	ret

INCLUDE "home/text.asm"

Func_2433::
	ldh a, [hFFB2]
	rst Bankswitch
	ld a, [wd0cb]
	ld l, a
	ld a, [wd0cb + 1]
	ld h, a
	ld de, hFF98
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld de, wd0a0
	ld c, $12
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	ld a, $98
	ld [wd0ba + 1], a
	ld a, $00
	ld [wd0ba], a
	ldh a, [hFF98]
	add a
	sub 10
	ldh [hFFA8], a
	ldh a, [hFF99]
	add a
	sub 9
	ldh [hFFA9], a
	ld a, [wd9d2]
	and a
	jr z, .asm_2473

	ldh a, [hFFAA]
	jr .asm_2478

.asm_2473
	ldh a, [hFF96]
	add a
	ldh [hFFAA], a

.asm_2478
	ld l, a
	ld h, 0
REPT 4
	sla l
	rl h
ENDR
	ld a, l
	ld [wd0c6], a
	ld a, h
	ld [wd0c6 + 1], a
	ld a, [wd9d2]
	and a
	jr z, .asm_249d

	ldh a, [hFFAB]
	jr .asm_24a2

.asm_249d
	ldh a, [hFF97]
	add a
	ldh [hFFAB], a

.asm_24a2
	ld l, a
	ld h, 0
REPT 4
	sla l
	rl h
ENDR
	ld a, l
	ld [wd0c4], a
	ld a, h
	ld [wd0c4 + 1], a
	ret

Func_24be::
	call Func_257c
	call Func_24d1
	call Func_24e6
	call Func_2529
	call Func_26e1
	call Func_254a
	ret

Func_24d1::
	ld a, [wd0f4]
	and a
	ret z
	cp 5
	ret z

	homecall Func_01e_41bf
	ret

Func_24e6::
	ld a, [hMapGroup]
	cp 1
	ret nz

	ld a, [hMapNumber]
	cp $23
	jr z, .asm_2504
	cp $24
	jr z, .asm_2504
	cp $25
	jr z, .asm_2504
	cp $26
	jr z, .asm_2504
	cp $27
	jr z, .asm_2504
	ret

.asm_2504
	ld a, [wd0f4]
	cp 1
	jr z, .asm_251c
	cp 2
	jr z, .asm_251c
	cp 3
	jr z, .asm_251c
	cp 4
	jr z, .asm_251c
	cp 5
	jr z, .asm_251c
	ret

.asm_251c
	homecall Func_01e_4194
	ret

Func_2529::
	ld hl, wc100
	ldh a, [hFF97]
	ld b, a
	and a
	jr z, .skip

	ldh a, [hFF98]
	ld e, a
	ld d, 0
.asm_2537
	add hl, de
	dec b
	jr nz, .asm_2537

.skip
	ldh a, [hFF96]
	ld e, a
	ld d, 0
	add hl, de
	ld a, l
	ld [wd0a0], a
	ld a, h
	ld [wd0a0 + 1], a
	ret

Func_254a::
	ld a, [wd0a6]
	ld l, a
	ld a, [wd0a6 + 1]
	ld h, a
	ld de, wce00
.asm_2555
	ld a, [hli]
	cp $ff
	jr z, .asm_255e
	ld [de], a
	inc de
	jr .asm_2555

.asm_255e
	call Func_2c03
	ld a, [wd0b0]
	ld l, a
	ld a, [wd0b0 + 1]
	ld h, a
	ld de, wcf00
	ld a, e
	ld [wd0b0], a
	ld a, d
	ld [wd0b0 + 1], a
.asm_2574
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	jr .asm_2574

Func_257c::
	ld a, [wd0a0]
	ld l, a
	ld a, [wd0a0 + 1]
	ld h, a
	ld a, [hli]
	ld [wd0f4], a
	ld de, wc100
	ldh a, [hFF99]
	ld b, a
.asm_258e
	ldh a, [hFF98]
	ld c, a
.asm_2591
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2591
	dec b
	jr nz, .asm_258e
	ret

Func_259b::
	call Func_0a0a
	call Func_0b1b
	ret

Func_25a2::
	call Func_0a0a
	call Func_0a46
	ret

Func_25a9::
	ld a, $06
	rst Bankswitch
	ld a, [wd0ac]
	ld l, a
	ld a, [wd0ac + 1]
	ld h, a
.asm_25b4
	ld a, [hli]
	cp $ff
	ret z

	ld [wd9f9], a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	ld a, [wd9f9]
	rst Bankswitch
	call CopyBytesVRAM
	pop hl
	inc hl
	ld a, $06
	rst Bankswitch
	jp .asm_25b4 ; jr

Func_25d6::
	ld a, [wd08f]
	push af
	ld hl, wdae3
	ld e, [hl]
	inc hl
.asm_25df
	ld a, l
	cp e
	jr nc, .asm_25ed

	ld a, [hli]
	push hl
	push de
	call Func_263e
	pop de
	pop hl
	jr .asm_25df

.asm_25ed
	pop af
	rst Bankswitch

.asm_25ef
	ld a, $e4
	ld [wdae3], a
	ret

Func_25f5::
	xor a
	ld [wdae2], a
	jr Func_25d6.asm_25ef

Func_25fb::
	cp $7f
	ret nc
	or a
	jr nz, Func_2612

; SoundID == 0
	call Func_25f5
	xor a
	call Func_2612
	push hl
	push de
	push bc
	call Func_25d6
	pop bc
	pop de
	pop hl
	ret

Func_2612::
	push hl
	ld hl, wdae2
	bit 0, [hl]
	jr z, .asm_261e
	cp $53
	jr c, .exit

.asm_261e
	ld hl, wdae3
	ld l, [hl]
	ld [hl], a
	ld l, LOW(wdae3)
	ld a, [hl]
	cp LOW(wdaeb)
	jr nc, .exit
	inc [hl]

.exit
	pop hl
	ret

Func_262d::
	call Func_25f5
	ld a, [wd08f]
	push af
	ld a, [wd091]
	rst Bankswitch
	call $4006
	pop af
	rst Bankswitch
	ret

Func_263e::
; Load sound bank?
	ld e, a
	cp $53
	jr c, .asm_2677
	cp $65
	jr c, .asm_2657
	cp $6d
	jr c, .asm_265b
	cp $76
	jr c, .asm_2653

	ld a, $1d
	jr .asm_265d

.asm_2653
	ld a, $1d
	jr .asm_265d

.asm_2657
	ld a, $02
	jr c, .asm_265d ; jr

.asm_265b
	ld a, $03

.asm_265d
	ld hl, wd091
	cp [hl]
	jr z, .asm_2672

	ld d, a
	push de
	ld e, 0
	ld a, [wd091]
	call .asm_2672
	pop de
	ld a, d
	ld [wd091], a

.asm_2672
	rst Bankswitch
	ld a, e
	jp $4003

.asm_2677
	ld a, [wd091]
	jr .asm_2672

Func_267c::
	ldh a, [rLCDC]
	bit 7, a ; LCDCF_ON
	ret z
	call Func_25d6
	ei
	xor a
	ld [hVBlank], a
.asm_2689
	halt
	ld a, [hVBlank]
	or a
	jr z, .asm_2689
	ret

unk_2691::
	ds $40, 0

WaitVRAM_STAT2::
; Copy of WaitVRAM_STAT
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT2

CopyBytes2::
; Copy bc bytes from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

Func_26e1::
	ldh a, [hFFB2]
	rst Bankswitch
	ld hl, wc740
	ld a, l
	ld [wd0b2], a
	ld a, h
	ld [wd0b2 + 1], a
	ld a, [wd0a0]
	ld l, a
	ld a, [wd0a0 + 1]
	ld h, a
	ld b, 5
.asm_26f9
	ld c, 6
.asm_26fb
	push bc
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	ld a, [wd0a2]
	ld e, a
	ld a, [wd0a2 + 1]
	ld d, a
	add hl, hl
	add hl, hl
	add hl, de
	ld b, 2
.asm_270e
	ld c, 2
.asm_2710
	ld a, [hli]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld a, [wd0a4]
	ld e, a
	ld a, [wd0a4 + 1]
	ld d, a
	add hl, de
	ld a, [wd0b2]
	ld e, a
	ld a, [wd0b2 + 1]
	ld d, a
	call Func_278b
	ld a, [wd0b2]
	add 2
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	pop hl
	dec c
	jp nz, .asm_2710
	dec b
	jr z, .asm_2756

	ld a, [wd0b2]
	add $2c
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	jp .asm_270e

.asm_2756
	ld a, [wd0b2]
	sub $30
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	sbc 0
	ld [wd0b2 + 1], a
	pop hl
	pop bc
	dec c
	jp nz, .asm_26fb

	ldh a, [hFF98]
	sub 6
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [wd0b2]
	add $48
	ld [wd0b2], a
	ld a, [wd0b2 + 1]
	adc 0
	ld [wd0b2 + 1], a
	dec b
	jp nz, .asm_26f9
	ret

Func_278b::
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a

; add de, $17
	ld a, e
	add $17
	ld e, a
	ld a, d
	adc 0
	ld d, a

	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

INCLUDE "home/joypad.asm"

WaitLCD_STAT::
.wait
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait
; ???
.wait2
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait2
	ret

INCLUDE "home/load_oam.asm"
INCLUDE "home/clear_memory.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/lcd.asm"

Func_28d6::
; Clear or duplicate line of text in textbox
; Used in para and cont text commands
	ld a, [wcbf6]
	and a
	ret z

; Backup SP
	ld [hFFA2], sp

	ld hl, wBGMapBufferPointers
	ld sp, hl
	ld hl, wd128
.copy
	pop bc
	ld a, [hli]
	ld [bc], a
	ldh a, [hFFA5]
	dec a
	ldh [hFFA5], a
	jr nz, .copy

; Restore old SP
	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl

	xor a
	ld [wcbf6], a
	ret

PrintCharacter::
; Print one vertically arranged character using four tiles
	ld a, [wCharacterBGMapTransferStatus]
	and a
	ret z

; Backup SP
	ld [hFFA2], sp

; BG map addresses are held at wBGMapBufferPointers
	ld hl, wBGMapBufferPointers
	ld sp, hl
	ld a, [wcbf3]
; Each character occupies four tiles
REPT 3
	pop bc
	ld [bc], a
	inc a
ENDR
	pop bc
	ld [bc], a

; Restore old SP
	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl

	xor a
	ld [wCharacterBGMapTransferStatus], a
	ret

LoadCharacter::
	ld a, [wCharacterTileTransferStatus]
	and a
	ret z

; Save current ROM bank
	ld a, [_BANKNUM]
	push af
; Switch
	ldh a, [hTargetBank]
	rst Bankswitch

; Backup stack pointer
	ld [hFFA2], sp

	ld a, [wCharacterTileSrc]
	ld l, a
	ld a, [wCharacterTileSrc + 1]
	ld h, a
	ld sp, hl

	ld a, [wCharacterTileDest]
	ld l, a
	ld a, [wCharacterTileDest + 1]
	ld h, a
	ld a, [wCharacterTileCount]
	ld e, a

.load_tile
REPT 3
	pop bc
	ld [hl], c
	inc l
	ld [hl], c
	inc l
	ld [hl], b
	inc l
	ld [hl], b
	inc l
ENDR
	pop bc
	ld [hl], c
	inc l
	ld [hl], c
	inc l
	ld [hl], b
	inc l
	ld [hl], b

	inc hl
	dec e
	jr nz, .load_tile

; Restore old stack pointer
	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl

	xor a
	ld [wCharacterTileTransferStatus], a
	pop af
	rst Bankswitch
	ret

Func_297a::
	ldh a, [hFFA4]
	and a
	ret z

	ld [hFFA2], sp
	ld hl, wBGMapBufferPointers
	ld sp, hl
	ld hl, wd100
	ld de, wd128
.asm_298b
REPT 2
	pop bc
	ld a, 1
	ldh [rVBK], a
	ld a, [hli]
	ld [bc], a
	inc c
	ld a, [hli]
	ld [bc], a
	dec c
	xor a
	ldh [rVBK], a
	ld a, [de]
	inc de
	ld [bc], a
	inc c
	ld a, [de]
	inc de
	ld [bc], a
ENDR
	ldh a, [hFFA5]
	dec a
	dec a
	ldh [hFFA5], a
	jr nz, .asm_298b

	ldh a, [hFFA2]
	ld l, a
	ldh a, [hFFA2 + 1]
	ld h, a
	ld sp, hl
	xor a
	ldh [hFFA4], a
	ret

Func_29c8::
	ldh a, [hFFC4]
	cp 1
	jp z, .asm_29f1
	cp 2
	jp z, .ret

; wBGPals2 copy
	ld de, wBGPals2
	push bc
	ld c, $80
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy1

; wBGPals1 copy
	pop hl
	ld de, wBGPals1
	ld c, $80
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy2

	ld a, 1
	ldh [hFFC4], a
	ret

.asm_29f1:
	ld hl, wBGPals2
	ld bc, wBGPals1
	ld e, $40
	xor a
	ld [wd0b5], a

.asm_29fd:
	push de
	ld a, [hl]
	and $1f
	ld d, a
	ld a, [bc]
	and $1f
	cp d
	jr z, .asm_2a23

	push af
	ld a, [wd0b4]
	and a
	jr z, .asm_2a15

	pop af
	sub $01
	ld d, a
	jr .asm_2a19

.asm_2a15:
	pop af
	add $01
	ld d, a

.asm_2a19:
	ld a, $01
	ld [wd0b5], a
	ld a, [bc]
	and $e0
	or d
	ld [bc], a

.asm_2a23:
	ld a, [hl]
	and $f0
	swap a
	ld d, a
	inc hl
	ld a, [hl]
	and $03
	swap a
	or d
	srl a
	ld d, a
	ld a, [bc]
	and $f0
	swap a
	ld e, a
	inc bc
	ld a, [bc]
	and $03
	swap a
	or e
	srl a
	cp d
	jr z, .asm_2a76

	push af
	ld a, [wd0b4]
	and a
	jr z, .asm_2a52

	pop af
	sub $01
	ld d, a
	jr .asm_2a56

.asm_2a52:
	pop af
	add $01
	ld d, a

.asm_2a56:
	ld a, $01
	ld [wd0b5], a
	ld a, d
	sla a
	ld d, a
	and $f0
	swap a
	ld e, a
	ld a, d
	swap a
	and $f0
	ld d, a
	dec bc
	ld a, [bc]
	and $1f
	or d
	ld [bc], a
	inc bc
	ld a, [bc]
	and $fc
	or e
	ld [bc], a

.asm_2a76:
	ld a, [hl]
	srl a
	srl a
	ld d, a
	ld a, [bc]
	srl a
	srl a
	cp d
	jr z, .asm_2aa5

	push af
	ld a, [wd0b4]
	and a
	jr z, .asm_2a91

	pop af
	sub $01
	ld d, a
	jr .asm_2a95

.asm_2a91:
	pop af
	add $01
	ld d, a

.asm_2a95:
	ld a, $01
	ld [wd0b5], a
	ld a, d
	sla a
	sla a
	ld d, a
	ld a, [bc]
	and $03
	or d
	ld [bc], a

.asm_2aa5:
	inc hl
	inc bc
	pop de
	dec e
	jp nz, .asm_29fd

	ld a, [wd0b5]
	and a
	jr nz, .ret

	ld a, 0
	ldh [hFFC4], a
	ret

.ret
	ret

unk_2ab8::
REPT $40
	dw $0000
ENDR

unk_2b38::
REPT $40
	dw $7fff
ENDR

SRAMTest::
	call SRAMTest_Fast
	and a
	ret z

; Enable writing to SRAM
	ld a, SRAM_ENABLE
	ld [rRAMG], a

; SRAM bank 0
	xor a
	ld [rRAMB], a

	ld a, BANK(_SRAMTest)
	rst Bankswitch
	call _SRAMTest
	call ClearSRAM

; Finished writing to SRAM
	xor a ; SRAM_DISABLE
	ld [rRAMG], a
	ret

ClearSRAM::
	ld hl, _SRAM
	ld bc, $2000
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

PlaySound::
; Play music or sound effect indicated by a.
	push hl
	push de
	push bc
	ld d, a
	cp $53
	jr c, .play

; If the sound to be played is music (a >= $53),
; it won't replay it if it is already playing.
	ldh a, [hCurSound]
	cp d
	jr z, .done

.play
	ld a, d
	ldh [hCurSound], a
	ld a, [wd08f]
	push af
	ld a, d
	call Func_25fb
	call Func_25d6
	pop af
	rst Bankswitch

.done
	pop bc
	pop de
	pop hl
	ret

Func_2c03::
	ld hl, wce00
	ld de, $a0
	add hl, de
	ld de, .unk_2c1b
.get_length
	ld a, [de]
	cp $ff
	ret z
; Store length in b
	ld b, a
	inc de
	ld a, [de]
	inc de
.copy_byte
	ld [hli], a
	dec b
	jr nz, .copy_byte
	jr .get_length

.unk_2c1b
	db $01, $06
	db $07, $06
	db $48, $06
	db $10, $07
	db $ff

unk_2c24::
	db $b5, $56, $00, $00, $1d, $00, $bf, $67
	db $00, $00, $00, $00, $00, $00, $00, $00
	db $b5, $56, $00, $00, $d6, $6e, $de, $7b

unk_2c3c::
	ds 40, 0
