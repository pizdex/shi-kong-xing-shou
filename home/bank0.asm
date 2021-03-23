_Start::
; Save console type (DMG or CGB)
	ldh [hConsoleType], a

; Set stack
	ld sp, $dfff

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
	ld [$d091], a
	call Func_262d

; Check SRAM
	call SRAMTest

	ld a, 3
	ldh [hFF9B], a
	ld a, 0
	ldh [hFF9C], a
	ld [$d0ff], a
	ld [$d0df], a
	ld [$d0ef], a
	ld a, 0
	ld [hFFBA], a
	call Func_15e7
	ld a, $12
	ld [wd0fa], a

asm_023b:
	ld bc, $cab0
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
	jr asm_023b

unkTable_025c:
; Seems to load on each map entry
	dba Func_005_41fb
	dba Func_008_560c
	dba Func_03c_40d2
	dba Func_03c_4343
	dba Func_01b_4000
	dba Func_05d_4000
	dba Func_04e_4943
	dba Func_055_4000
	dba Func_01a_4000
	dba Func_061_4000
	dba Func_05c_55e7
	dba Func_061_5d22
	dba Func_05e_401c
	dba Func_05f_4000
	dba Func_05b_4000
	dba Func_04e_46e5
	dba Func_062_4000
	dba Func_04e_4637
	dba Func_077_4000
	dba Func_067_4000
	dba Func_067_506e
	dba Func_067_51f5
	dba Func_062_5df3
	dba Func_03c_40d2
	dba Func_03c_40d2
	dba Func_062_5f9c
	dba Func_03c_4c74
	dba Func_07a_401f
	dba Func_07a_4188
	dba Func_06f_4000
	dba Func_070_4000
	dba Func_071_4000
	dba Func_071_5a49

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

Func_02cc:
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

.wait
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .wait

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

PlaceTilemap_Bank1::
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

Func_0398:
	ld a, %11100100
	ldh [rBGP], a
	ld a, %00011100
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a

; CGB only from here
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

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

	ld hl, wcc00
	call FillPalettes_BCPD
	ld hl, wcc40
	call FillPalettes_OCPD

	call DelayFrame
	jp Func_0398

PartialFillPalettes_BCPD:
; Fill 24 background palettes with data from [hl] to [hl+$30]
	di
	call WaitVRAM_STAT2
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ei
	ld b, 6 * 8
.asm_03f4
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .asm_03f4
	jr .ret

.ret
	ret

FillPalettes_BCPD::
; Fill all 32 background palettes with data from [hl] to [hl+$40]
	di
	call WaitVRAM_STAT2
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ei
	ld b, 8 * 8
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

FillPalettes_OCPD:
; Fill all 32 object palettes with data from [hl] to [hl+$40]
	di
	call WaitVRAM_STAT2
	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ei
	ld b, 8 * 8
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
	ld a, [_BANKNUM]
	push af
	ld a, BANK(Func_004_4000)
	rst Bankswitch
	call Func_004_4000
	pop af
	rst Bankswitch
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
	dec c
	ld a, c
	or b
	jr nz, .copy1

	pop de
	ld bc, unk_04d0
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
	dec c
	ld a, c
	or b
	jr nz, .copy2
	ret

unk_04d0:
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
	ld a, [$dcf3]
	ld de, $dd00
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [$dcf4]
	ld [hl], a
	and a
	ret nz
	ret

Func_0506:
	ld a, [$dcf3]
	ld de, unk_0521
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
	dec c
	ld a, c
	or b
	jr nz, .asm_0517
	ret

unk_0521:
	dr $0521, $062c

Func_062c:
	dr $062c, $068d

LoadPalettes_OCPD:
; Load b palettes from hl into rOCPD
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	di
	call WaitVRAM_STAT
	ld a, c
	ldh [rOCPS], a
	ei
.load_palette
	di
	call WaitVRAM_STAT
	ld a, [hli]
	ldh [rOCPD], a
	ei
	dec b
	jr nz, .load_palette
	ret

LoadPalettes_BCPD::
; Load b palettes from hl into rBCPD
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	di
	call WaitVRAM_STAT
	ld a, c
	ldh [rBCPS], a
	ei
.load_palette
	di
	call WaitVRAM_STAT
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .load_palette
	ret

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
	dr $06d0, $07b1

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
	dr $07e2, $0868

Func_0868::
	dr $0868, $0885

Func_0885::
	dr $0885, $092e

Func_092e:
	dr $092e, $096a

Func_096a::
; Switch intro scene?
	dr $096a, $09d2

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
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear_bank0

	ei
	ret

Func_0a0a:
	dr $0a0a, $0b30

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

Func_0b39:
	dr $0b39, $0b46

Func_0b46:
	dr $0b46, $0b69

Func_0b69:
	dr $0b69, $0c17

Func_0c17:
	ld a, [$d986]
	and a
	jr nz, .asm_0c22
	ld a, [$d9e2]
	jr .asm_0c25

.asm_0c22
	ld a, [$d9e3]

.asm_0c25
	ld [$d9d8], a
	farcall unk_026_4000
	pop hl
	push hl
	jp Func_0b69

Func_0c33:
	dr $0c33, $0d52

Func_0d52:
	dr $0d52, $0d76

Func_0d76:
	cp 28
	jr c, .asm_0d8e
	cp 56
	jr c, .asm_0d92
	cp 84
	jr c, .asm_0d96
	cp 112
	jr c, .asm_0d9a
	cp 140
	jr c, .asm_0d9e

	ld a, $4c
	rst Bankswitch
	ret

.asm_0d8e
	ld a, $27
	rst Bankswitch
	ret

.asm_0d92
	ld a, $28
	rst Bankswitch
	ret

.asm_0d96
	ld a, $29
	rst Bankswitch
	ret

.asm_0d9a
	ld a, $2a
	rst Bankswitch
	ret

.asm_0d9e
	ld a, $4b
	rst Bankswitch
	ret

Func_0da2::
	ld a, [_BANKNUM]
	push af
	ld a, [wd9e4]
	call Func_0d76
	ld a, [wd9e4]
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, unkTable_0dc6
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $240
	ld de, $9310
	call CopyBytesVRAM_Mirror
	pop af
	rst Bankswitch
	ret

INCLUDE "data/pic_pointers.asm"

unk_0f06:
	dr $0f06, $105a

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
	ld a, [$d9de]
	ldh [rSCX], a
	ld a, [$d9df]
	ldh [rSCY], a
	jp Func_28d0

Func_107f:
	dr $107f, $109a

Func_109a:
	dr $109a, $10b5

Func_10b5:
	dr $10b5, $12fd

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
	dr $132b, $15e7

Func_15e7:
	dr $15e7, $19ca

INCLUDE "home/text.asm"

Func_262d:
	dr $262d, $26d1

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
	dr $26e1, $279e

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

	ld de, wcc80
	push bc
	ld c, $80
.asm_29da:
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_29da

	pop hl
	ld de, wcc00
	ld c, $80
.asm_29e6
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_29e6

	ld a, 1
	ldh [hFFC4], a
	ret

.asm_29f1:
	dr $29f1, $2ab7

.ret
	ret

unk_2ab8:
	dr $2ab8, $2b38

unk_2b38:
	dr $2b38, $2bb8

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

Func_2be2:
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
	dr $2c03, $2ff0
