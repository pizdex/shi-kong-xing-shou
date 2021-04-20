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

unk_017f:
; Alternate header?
	dr $017f, $0200

Func_0200:
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

	ld a, 3
	ldh [hFF9B], a
	ld a, 0
	ldh [hFF9C], a
	ld [wd0ff], a
	ld [wd0df], a
	ld [wd0ef], a
	ld a, 0
	ld [hFFBA], a
	call Func_15e7
	ld a, $12
	ld [wd0fa], a

Func_023b:
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call Func_092e
	ld de, unkTable_025c
	ld a, [wd0fa]
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

Func_0257:
	call Func_15e7
	jr Func_023b

unkTable_025c:
; Seems to load on each map entry
	dba Func_005_41fb   ; $00
	dba Func_008_560c   ; $01
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
	dba Func_077_4000   ; $12
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

FarCopyBytes_vTiles0:
; Copy bc bytes from [wTempBank]:[wd98f] to vTiles0
	ld a, [_BANKNUM]
	push af

; Source bank
	ld a, [wTempBank]
	rst Bankswitch
; Source address
	ld a, [wd98f]
	ld l, a
	ld a, [wd98f + 1]
	ld h, a
; Size of image
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; Destination
	ld de, vTiles0
	call CopyBytesVRAM

	pop af
	rst Bankswitch
	ret

FarCopyBytesVRAM:
; Copy bc bytes from [wTempBank]:hl to de
	ld a, [_BANKNUM]
	push af

; Switch to source bank
	ld a, [wTempBank]
	rst Bankswitch
	call CopyBytesVRAM

	pop af
	rst Bankswitch
	ret

CopyBytesVRAM::
; Copy bc bytes from hl to de, making sure that the LCD isn't being used
.copy
	ld a, [hli]
	push bc
	ld c, a

.waitLCD
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .waitLCD

; Copy byte
	ld a, c
	ld [de], a
	inc de
	pop bc
	dec bc
	ld a, c
	or b
	jr nz, .copy
	ret

CopyBytesVRAM_Mirror:
; Mirror the bits in `[hl]` and write to VRAM
; i.e. 11110100 -> 00101111
	ld a, [hli]
	push bc
; Skip if 0 or $ff
	and a
	jr z, .store
	cp $ff
	jr z, .store

	ld c, 0
REPT 8
	srl a ; rra is better
	rl c
ENDR
	jr .waitLCD

.store
	ld c, a

.waitLCD
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .waitLCD

; Write byte to de
	ld a, c
	ld [de], a
	inc de
	pop bc
	dec bc
	ld a, c
	or b
	jr nz, CopyBytesVRAM_Mirror
	ret

PlaceAttrmap::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a
	jp PlaceTilemap

PlaceTilemap_Bank0::
	ld a, 0
	ldh [rVBK], a

PlaceTilemap::
; Copy b*c tilemap from de to hl
	push hl

.copy:
; load byte
	ld a, [de]
	push bc ; potential stack issue?
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
; Verify that byte was written (if fail, messes up the stack)
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
	jr nz, PlaceTilemap

	ld a, 0
	ldh [rVBK], a
	ret

Func_0398::
; Map/intro fade in

; Load default background palette
	ld a, %11100100
	ldh [rBGP], a
; Load default object palette
	ld a, %00011100
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a

	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

; CGB only from here
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld bc, unk_2b38
	ld a, 1
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	ret z

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jp Func_0398

PartialCopyBackgroundPalettes:
; Copy data from [hl] to [hl+$30] to the first 24 background palettes
	di
	call WaitVRAM_STAT2
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ei
	ld b, 6 palettes
.copy
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .copy
	jr .ret ; ???

.ret
	ret

CopyBackgroundPalettes::
; Copy data from [hl] to [hl+$40] to all 32 background palettes
	di
	call WaitVRAM_STAT2
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ei
	ld b, 8 palettes
.copy
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .copy
	jr .ret

.ret
	ret

CopyObjectPalettes:
; Copy data from [hl] to [hl+$40] to all 32 object palettes
	di
	call WaitVRAM_STAT2
	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ei
	ld b, 8 palettes
.copy
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rOCPD], a
	ei
	dec b
	jr nz, .copy
	ret

Func_0419:
	homecall Func_004_4000
	ret

Func_0426:
	ld a, [_BANKNUM]
	push af
	call Func_2108
	pop af
	rst Bankswitch
	ret

Func_0430:
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

Func_0453:
	ld hl, wd200
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
	dec c ; dec bc
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
	dec c ; dec bc
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

Func_04f2:
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

Func_0506:
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
	dec c ; dec bc
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

Func_0531:
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

Func_055b:
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
	jp .asm_05e9

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

Func_05f2:
	ld a, [_BANKNUM]
	push af
	call Func_2108
	call Func_22a4
	pop af
	rst Bankswitch
	ret

Func_05ff:
	ld a, [_BANKNUM]
	push af
	call Func_2011
	call Func_2433
	call Func_0f6e
	call Func_24be
	call Func_1fee
	call Func_19b6
	pop af
	rst Bankswitch
	ret

Func_0618:
	ld a, [_BANKNUM]
	push af
	call Func_26e1
	pop af
	rst Bankswitch
	ret

Func_0622:
	ld a, [_BANKNUM]
	push af
	call Func_20b9
	pop af
	rst Bankswitch
	ret

Func_062c:
	homecall Func_009_4008
	ret

Func_0639:
	homecall Func_009_4000
	ret

INCLUDE "home/palettes.asm"

WaitVRAM_STAT:
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT

Func_06c6:
	ld a, [_BANKNUM]
	push af
	call Func_19ca
	pop af
	rst Bankswitch
	ret

Func_06d0:
	ld a, BANK(Func_00b_417b)
	rst Bankswitch
	call Func_00b_417b
	ld a, $05
	rst Bankswitch
	ret

GetFarByte::
; Get byte from [hFFB6]:[wcbf8] and store it in [wFarByte]
	ld a, [_BANKNUM]
	push af

; Get bank and address
	ldh a, [hFFB6]
	rst Bankswitch
	ld a, [wcbf8]
	ld l, a
	ld a, [wcbf8 + 1]
	ld h, a

; Get byte
	ld a, [hli]
	ld [wFarByte], a
; Store new address
	ld a, l
	ld [wcbf8], a
	ld a, h
	ld [wcbf8 + 1], a

	pop af
	rst Bankswitch
	ret

Func_06f8:
	dr $06f8, $0733

Func_0733:
	homecall Func_00c_6ed7
	ret

Func_0740:
	homecall Func_00c_4056
	ret

Func_074d:
	homecall Func_00d_4019
	ret

RequestLoadCharacter_PaperScroll:
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

GetTextBGMapPointer:
; Calculate pointer to the next character or textbox on the BG map and return it
	push bc
	push de
	ld bc, vBGMap0
	ld e, h
	ld a, l
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

Func_07e2:
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

Func_080a:
	homecall Func_005_4000
	ret

Func_0817:
	ld a, [_BANKNUM]
	push af
	ld a, BANK(Func_005_4000)
	rst Bankswitch
	call Func_005_4000
	call Func_005_4093
	pop af
	rst Bankswitch
	ret

Func_0827:
	homecall Func_01e_41e8
	ret

Func_0834:
	homecall Func_01e_4083
	ret

Func_0841:
	homecall Func_01e_4194
	ret

Func_084e:
	homecall Func_01e_4125
	ret

Func_085b:
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
	dr $0885, $08a2

Func_08a2::
	dr $08a2, $08ae

Func_08ae::
	dr $08ae, $0925

Func_0925::
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	jp Func_08ae

Func_092e:
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
	jr Func_092e

.exit
	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

Func_096a::
; Switch intro scene?
	dr $096a, $09a6

Func_09a6::
.loop
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
	jr .loop

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

Func_0a0a:
	dr $0a0a, $0a3e

unk_0a3e:
	dr $0a3e, $0a46

Func_0a46:
	dr $0a46, $0a8b

unk_0a8b:
	dr $0a8b, $0b1b

Func_0b1b:
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

Func_0b65:
	call DelayFrame
	push hl

Menu_CheckCharacter:
; Text routine used for menus, battles and other things
	pop hl
	ld a, [hli]
	push hl
	cp $f0
	jp nc, Menu_GetCharacterSetBase
	cp $e0
	jp nc, Menu_CheckCharacter_Commands
	jp Menu_CheckCharacter_Continue

Func_0b79:
	ret

MenuText_Done:
	ld a, [wd9d6]
	and a
	jr z, .asm_0b94

	xor a
	ld [wd9d6], a
	pop hl
	ld a, [wdcd3]
	ld l, a
	ld a, [wdcd3 + 1]
	ld h, a
	ldh a, [hFFD4]
	rst Bankswitch
	push hl
	jp Menu_CheckCharacter

.asm_0b94
	pop hl
	ret

Menu_CheckCharacter_Commands:
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
	dw MenuText_Skip ; $e0
	dw Func_0bc7     ; $e1
	dw Func_0bec     ; $e2
	dw MenuText_Skip ; $e3
	dw MenuText_Done ; $e4
	dw Func_0c33     ; $e5
	dw Func_0c17     ; $e6
	dw Func_0c6a     ; $e7
	dw Func_0c42     ; $e8
	dw Func_0c51     ; $e9
	dw MenuText_Skip ; $ea
	dw MenuText_Skip ; $eb
	dw Func_0bfe     ; $ec
	dw MenuText_Done ; $ed
	dw MenuText_Skip ; $ee
	dw MenuText_Skip ; $ef

MenuText_Skip:
	jp Menu_CheckCharacter

Func_0bc7:
	ld a, [wd9d0]
	ld l, a
	ld a, [wd9d0 + 1]
	ld h, a
	ld de, wd9ce
	ld bc, $0204
	ld a, $77
	ld [wd8fe], a
	ld a, 1
	ld [wd1fc], a
	ld a, 1
	ld [wd0fd], a
	call Func_113f
	pop hl
	push hl
	jp Menu_CheckCharacter

Func_0bec:
	pop hl
	call Func_1fb9
	ret

Func_0bf1:
	ld bc, $480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame

Func_0bfe:
	call Func_1fb9
	ld bc, $480
	ld hl, $8b60
	xor a
	call ByteFillVRAM
	call DelayFrame
	xor a
	ld [wCharacterTilePos], a
	pop hl
	push hl
	jp Menu_CheckCharacter

Func_0c17:
	ld a, [wd986]
	and a
	jr nz, .asm_0c22
	ld a, [wd9e2]
	jr .asm_0c25

.asm_0c22
	ld a, [wd9e3]

.asm_0c25
	ld [wd9d8], a
	farcall Func_026_4000
	pop hl
	push hl
	jp Menu_CheckCharacter

Func_0c33:
	ld a, [wd9e9]
	ld d, a
	farcall Func_01e_4266
	pop hl
	push hl
	jp Menu_CheckCharacter

Func_0c42:
	ld a, [wd9f3]
	ld d, a
	farcall Func_01e_4275
	pop hl
	push hl
	jp Menu_CheckCharacter

Func_0c51:
	dr $0c51, $0c6a

Func_0c6a:
	dr $0c6a, $0c8d

Menu_GetCharacterSetBase:
	dr $0c8d, $0c93

Menu_CheckCharacter_Continue:
	dr $0c93, $0d52

Func_0d52:
	dr $0d52, $0d76

LoadMonPicBank:
	cp 28
	jr c, .pics1
	cp 56
	jr c, .pics2
	cp 84
	jr c, .pics3
	cp 112
	jr c, .pics4
	cp 140
	jr c, .pics5

; mon >= 140
	ld a, BANK("Pics 6")
	rst Bankswitch
	ret

.pics1
	ld a, BANK("Pics 1")
	rst Bankswitch
	ret

.pics2
	ld a, BANK("Pics 2")
	rst Bankswitch
	ret

.pics3
	ld a, BANK("Pics 3")
	rst Bankswitch
	ret

.pics4
	ld a, BANK("Pics 4")
	rst Bankswitch
	ret

.pics5
	ld a, BANK("Pics 5")
	rst Bankswitch
	ret

Func_0da2::
	ld a, [_BANKNUM]
	push af

; Switch bank
	ld a, [wEnemyMonSpecies]
	call LoadMonPicBank

; Get address
	ld a, [wEnemyMonSpecies]
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, MonsterPicPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Load mon pic into VRAM
	ld bc, $240
	ld de, $9310
	call CopyBytesVRAM_Mirror

	pop af
	rst Bankswitch
	ret

INCLUDE "data/monsters/pic_pointers.asm"

unk_0f06:
	dr $0f06, $0f36

Func_0f36:
	dr $0f36, $0f6e

Func_0f6e:
	dr $0f6e, $0fac

Func_0fac:
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

Func_0fc4:
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

Func_0fdc:
	dr $0fdc, $0fef

Func_0fef:
	dr $0fef, $1022

Func_1022:
	dr $1022, $105a

ByteFill:
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

ByteFillVRAM:
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

Func_106f:
	jp Func_28d0

Func_1072:
	ld a, [wWX]
	ldh [rSCX], a
	ld a, [wWY]
	ldh [rSCY], a
	jp Func_28d0

Func_107f:
	dr $107f, $109a

Func_109a:
	dr $109a, $10b5

Func_10b5:
	dr $10b5, $113f

Func_113f:
	dr $113f, $12fd

SRAMTest_Fast:
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

Func_132b:
	call Func_05ff
	ret

Func_132f:
	push hl
	push de
	ld hl, wd200
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

Func_134c:
	ld a, [_BANKNUM]
	push af
	ld a, [wd0f1]
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_135a:
	ld a, [_BANKNUM]
	push af
	ld a, $0c
	rst Bankswitch
	call CopyBytesVRAM
	pop af
	rst Bankswitch
	ret

Func_1367:
	dr $1367, $13fe

Func_13fe:
	ld de, .unk_141c
	ldh a, [hFF9A]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ldh a, [hFF9B]
	ld l, a
	ld h, 0
	add hl, de
	ldh a, [hFFDA]
	cp [hl]
	ret z

	ld a, [hl]
	and a
	ret z

	call Func_2be2
	ret

.unk_141c
	dw .unk_142c
	dw .unk_1462
	dw .unk_1498
	dw .unk_14bc
	dw .unk_14e0
	dw .unk_1546
	dw .unk_156e
	dw .unk_159b

.unk_142c
	dr $142c, $1462

.unk_1462
	dr $1462, $1498

.unk_1498
	dr $1498, $14bc

.unk_14bc
	dr $14bc, $14e0

.unk_14e0
	dr $14e0, $1546

.unk_1546
	dr $1546, $156e

.unk_156e
	dr $156e, $159b

.unk_159b
	dr $159b, $15a8

Func_15a8:
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

Func_15e7:
	ld de, .unk_15f6
	ld a, [hFFBA]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.unk_15f6
	dw Func_1620
	dw Func_1730
	dw Func_1730
	dw Func_1900
	dw Func_16f4
	dw Func_1712
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730
	dw Func_1730

Func_1620:
	ld hl, wdd00
	ld [hl], $01
	ld a, $04
	ldh [hFF9B], a
	ld a, $01
	ldh [hFF9C], a
	ld a, $01
	ldh [hFFD6], a
	ld a, $08
	ld [hFFB6], a
	ld hl, wcbf8
	ld [hl], $00
	inc hl
	ld [hl], $40
	call Func_1642
	ret

Func_1642:
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

Func_1661:
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

Func_1674:
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

Func_168c:
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

Func_16b6:
; Broken
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp Func_1661

Func_16c0:
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

Func_16ea:
; Broken
	call ClearSRAM
	xor a
	ld [rRAMG], a
	jp Func_1661

Func_16f4:
	ld a, $01
	ldh [hFF9A], a
	ld a, $04
	ldh [hFF9B], a
	ld a, $01
	ldh [hFF9C], a
	ld a, $01
	ldh [hFFD6], a
	ld a, $0e
	ld [hFFB6], a
	ld hl, wcbf8
	ld [hl], $05
	inc hl
	ld [hl], $40
	ret

Func_1712:
	ld a, $04
	ldh [hFF9A], a
	ld a, $43
	ldh [hFF9B], a
	ld a, $01
	ldh [hFF9C], a
	ld a, $01
	ldh [hFFD6], a
	ld a, $55
	ld [hFFB6], a
	ld hl, wcbf8
	ld [hl], $ef
	inc hl
	ld [hl], $53
	ret

Func_1730:
	ld bc, $009a
	call Func_2e13
	ld bc, $0007
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
	ldh [hFF9B], a
	ld a, $03
	ldh [hFF9C], a
	ld a, $06
	ldh [hFF9A], a

	ld a, $01
	ld [wdcbb], a

; Money = 99990
	ld a, $01
	ld [wMoney], a
	ld a, $86
	ld [wMoney + 1], a
	ld a, $96
	ld [wMoney + 2], a

	ld bc, $0018
	call Func_2ca4
	call Func_2d08
	call Debug_GiveItems

	ld bc, wd200
	ld hl, $0016
	add hl, bc
	push hl
	pop bc
	ld a, $8a
	ld [bc], a
	ld hl, $0001
	add hl, bc
	ld [hl], $5a
	ld hl, $0005
	add hl, bc
	ld [hl], $10
	ld hl, $0002
	add hl, bc
	ld [hl], $05
	ld hl, $0014
	add hl, bc
	ld [hl], $12
	inc hl
	ld [hl], $14
	ld hl, $0007
	add hl, bc
	ld [hl], $85
	inc hl
	ld [hl], $0c
	inc hl
	ld [hl], $0c

	ld bc, wd200
	ld hl, $002c
	add hl, bc
	push hl
	pop bc
	ld a, $72
	ld [bc], a
	ld hl, $0001
	add hl, bc
	ld [hl], $5a
	ld hl, $0005
	add hl, bc
	ld [hl], $10
	ld hl, $0002
	add hl, bc
	ld [hl], $55
	ld hl, $0014
	add hl, bc
	ld [hl], $12
	inc hl
	ld [hl], $14
	ld hl, $0007
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], $0c
	inc hl
	ld [hl], $0c

	ld bc, wd200
	ld hl, $0042
	add hl, bc
	push hl
	pop bc
	ld a, $05
	ld [bc], a
	ld hl, $0001
	add hl, bc
	ld [hl], $5a
	ld hl, $0005
	add hl, bc
	ld [hl], $10
	ld hl, $0002
	add hl, bc
	ld [hl], $55
	ld hl, $0014
	add hl, bc
	ld [hl], $12
	inc hl
	ld [hl], $14
	ld hl, $0007
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], $0c
	inc hl
	ld [hl], $0c

	ld bc, wd200
	ld hl, $0058
	add hl, bc
	push hl
	pop bc
	ld a, $78
	ld [bc], a
	ld hl, $0001
	add hl, bc
	ld [hl], $5a
	ld hl, $0005
	add hl, bc
	ld [hl], $10
	ld hl, $0002
	add hl, bc
	ld [hl], $55
	ld hl, $0014
	add hl, bc
	ld [hl], $12
	inc hl
	ld [hl], $14
	ld hl, $0007
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], $0c
	inc hl
	ld [hl], $0c

	ld bc, wd200
	ld hl, $006e
	add hl, bc
	push hl
	pop bc
	ld a, $31
	ld [bc], a
	ld hl, $0001
	add hl, bc
	ld [hl], $5a
	ld hl, $0005
	add hl, bc
	ld [hl], $10
	ld hl, $0002
	add hl, bc
	ld [hl], $55
	ld hl, $0014
	add hl, bc
	ld [hl], $12
	inc hl
	ld [hl], $14
	ld hl, $0007
	add hl, bc
	ld [hl], $2c
	inc hl
	ld [hl], $0c
	inc hl
	ld [hl], $0c
	ret

unk_18ea:
	ds $16, 0

Func_1900:
; Debug code?
	dr $1900, $19b6

Func_19b6:
	ld a, [wd0ef]
	and a
	jr z, .asm_19c3

	farcall Func_00b_5273
	ret

.asm_19c3
	farcall Func_00d_4000
	ret

INCLUDE "home/text.asm"

Func_2433:
	dr $2433, $24be

Func_24be:
	call Func_257c
	call Func_24d1
	call Func_24e6
	call Func_2529
	call Func_26e1
	call Func_254a
	ret

Func_24d1:
	ld a, [wd0f4]
	and a
	ret z
	cp 5
	ret z

	homecall Func_01e_41bf
	ret

Func_24e6:
	ld a, [hFF9A]
	cp 1
	ret nz

	ld a, [hFF9B]
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

Func_2529:
	dr $2529, $254a

Func_254a:
	dr $254a, $257c

Func_257c:
	dr $257c, $259b

Func_259b:
	call Func_0a0a
	call Func_0b1b
	ret

Func_25a2:
	call Func_0a0a
	call Func_0a46
	ret

Func_25a9:
	dr $25a9, $25d6

Func_25d6:
	dr $25d6, $25f5

Func_25f5:
	dr $25f5, $25fb

Func_25fb:
	dr $25fb, $2612

Func_2612:
jr_000_2612:
	push hl
	ld hl, wdae2
	bit 0, [hl]
	jr z, .asm_261e

	cp $53
	jr c, .asm_262b

.asm_261e
	ld hl, wdae3
	ld l, [hl]
	ld [hl], a
	ld l, $e3
	ld a, [hl]
	cp $eb
	jr nc, .asm_262b

	inc [hl]

.asm_262b
	pop hl
	ret

Func_262d:
	call Func_25f5
	ld a, [wd08f]
	push af
	ld a, [wd091]
	rst Bankswitch
	call $4006
	pop af
	rst Bankswitch
	ret

Func_263e:
	dr $263e, $2691

unk_2691:
	ds $40, 0

WaitVRAM_STAT2:
; Copy of WaitVRAM_STAT
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT2

CopyBytes2:
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

Func_26e1:
	dr $26e1, $278b

Func_278b:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
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

WaitLCD_STAT:
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

Func_28d6:
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

PrintCharacter:
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

LoadCharacter:
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

Func_297a:
	dr $297a, $29c8

Func_29c8:
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
	dr $29f1, $2ab7

.ret
	ret

unk_2ab8:
REPT $40
	dw $0000
ENDR

unk_2b38:
REPT $40
	dw $7fff
ENDR

SRAMTest:
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

ClearSRAM:
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

Func_2be2::
	push hl
	push de
	push bc
	ld d, a
	cp $53
	jr c, .asm_2bef

	ldh a, [hFFDA]
	cp d
	jr z, .asm_2bff

.asm_2bef
	ld a, d
	ldh [hFFDA], a
	ld a, [wd08f]
	push af
	ld a, d
	call Func_25fb
	call Func_25d6
	pop af
	rst Bankswitch

.asm_2bff
	pop bc
	pop de
	pop hl
	ret

Func_2c03:
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

unk_2c24:
	dr $2c24, $2c3c

unk_2c3c:
	dr $2c3c, $2ca4

Func_2ca4:
	ld de, wd284
	ld hl, .unk_2cb8
.asm_2caa
REPT 2
	ld a, [hl]
	ld [de], a
	inc hl
	inc de
ENDR
	dec c ; should be dec bc
	ld a, c
	or b
	jr nz, .asm_2caa
	ret

.unk_2cb8
	db $01, $01
	db $02, $01
	db $03, $01
	db $04, $01
	db $05, $01
	db $06, $01
	db $07, $01
	db $08, $01
	db $09, $01
	db $0a, $01
	db $0b, $01
	db $0c, $01
	db $0d, $01
	db $0e, $01
	db $0f, $01
	db $10, $01
	db $11, $01
	db $12, $01
	db $13, $01
	db $14, $01
	db $15, $01
	db $16, $01
	db $17, $01
	db $18, $01
	db $19, $01
	db $1a, $01
	db $1b, $01
	db $1c, $01
	db $1d, $01
	db $1e, $01
	db $1f, $01
	db $20, $01
	db $21, $01
	db $22, $01
	db $23, $01
	db $24, $01
	db $25, $01
	db $26, $01
	db $27, $01
	db $28, $01

Func_2d08:
	ld de, wddb0
	ld hl, .unk_2d16
.copy
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	jr .copy

.unk_2d16
	db $01, $01
	db $02, $01
	db $03, $01
	db $04, $01
	db $05, $01
	db $06, $01
	db $07, $01
	db $08, $01
	db $09, $01
	db $0a, $01
	db $0f, $01
	db $ff, $ff

.unk_2d2e ; unused
	db $0d, $03
	db $0e, $03
	db $0f, $03
	db $10, $03
	db $11, $03
	db $12, $03
	db $13, $03
	db $14, $03
	db $15, $03
	db $ff, $ff

Debug_GiveItems:
	ld de, wd300
	ld hl, .item_data
.copy
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	jr .copy

.item_data
	db ITEM_04, 99
	db ITEM_26, 50
	db ITEM_26, 99
	db ITEM_27, 99
	db TM13, 1
	db TM33, 1
	db $ff, $ff

.item_data2 ; unused
	db ITEM_08, 12
	db ITEM_09, 12
	db ITEM_0a, 12
	db ITEM_0b, 12
	db ITEM_0c, 12
	db ITEM_0d, 12
	db ITEM_0e, 12
	db ITEM_0f, 12
	db ITEM_10, 12
	db ITEM_11, 12
	db ITEM_12, 12
	db ITEM_13, 12
	db ITEM_14, 12
	db ITEM_15, 12
	db ITEM_16, 12
	db ITEM_17, 12
	db ITEM_18, 12
	db ITEM_19, 12
	db ITEM_1a, 12
	db ITEM_1b, 12
	db ITEM_1c, 12
	db ITEM_1d, 12
	db ITEM_1e, 12
	db ITEM_1f, 12
	db ITEM_20, 12
	db ITEM_21, 12
	db ITEM_22, 12
	db ITEM_23, 12
	db ITEM_24, 12
	db ITEM_25, 12
	db ITEM_26, 12
	db ITEM_27, 12
	db TM01, 12
	db TM02, 12
	db TM03, 12
	db TM04, 12
	db TM05, 12
	db TM06, 12
	db TM07, 12
	db TM08, 12
	db TM09, 12
	db TM10, 12
	db TM11, 12
	db TM12, 12
	db TM13, 12
	db TM14, 12
	db TM15, 12
	db TM16, 12
	db TM17, 12
	db TM18, 12
	db TM19, 12
	db TM20, 12
	db TM21, 12
	db TM22, 12
	db TM23, 12
	db TM24, 12
	db TM25, 12
	db TM26, 12
	db TM27, 12
	db TM28, 12
	db TM29, 12
	db TM30, 12
	db TM31, 12
	db TM32, 12
	db TM33, 12
	db TM34, 12
	db TM35, 12
	db TM36, 12
	db TM37, 12
	db TM38, 12
	db TM39, 12
	db TM40, 12
	db TM41, 12
	db TM42, 12
	db TM43, 12
	db TM44, 12
	db TM45, 12
	db TM46, 12
	db TM47, 12
	db TM48, 12
	db TM49, 12
	db TM50, 12
	db $ff, $ff

Func_2e04:
	ld hl, wdd00
.asm_2e07
	ld [hl], $01
	dec c ; dec bc
	ld a, c
	or b
	ret z

	ld de, 8
	add hl, de
	jr .asm_2e07

Func_2e13:
	ld de, wde00
	ld hl, unk_2f40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c ; dec bc
	ld a, c
	or b
	jr nz, .copy1

	ld de, wd200
	ld hl, wde00
	ld bc, $16
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c ; dec bc
	ld a, c
	or b
	jr nz, .copy2

	ld a, 2
	ld [wdcea], a
	ret

Func_2e38:
	ld de, wdb20
.asm_2e3b:
	ld hl, unk_2f40
	ld bc, $13
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c ; dec bc
	ld a, c
	or b
	and a
	jr nz, .copy

	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $14
	ret nc
	jr .asm_2e3b

Func_2e56:
	ld de, wd7cb
	ld hl, unk_2ea0
	ld bc, $9e
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c ; dec bc
	ld a, c
	or b
	jr nz, .copy1

	ld bc, $0000
.asm_2e6a
	ld de, wdd00
	ld l, c
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld [hl], $01
	inc bc
	ld a, c
	cp 8
	jr c, .asm_2e6a

	ld de, wde00
	ld hl, unk_2f40
	ld bc, $b0
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy2

	ld a, $9f
	ld [wd0d6], a
	ld a, $89
	ld [wd0d5], a
	ld a, $06
	ld [wd0da], a
	ld a, $02
	ld [wdcea], a
	ret

unk_2ea0:
	dr $2ea0, $2f40

unk_2f40:
	dr $2f40, $2ff0
