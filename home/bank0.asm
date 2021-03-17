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
	ld [$dce7], a
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
	ld hl, $106f
	ld a, l
	ld [$d9e0], a
	ld a, h
	ld [$d9e1], a
	ei
	ld a, 2
	ld [$d091], a
	call Func_262d
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
	ld [$d0fa], a

	ld bc, $cab0
	xor a
	ldh [hFFC4], a
	call Func_092e
	ld de, unk_025c
	ld a, [$d0fa]
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
	dr $0257, $025c

unk_025c:
	dr $025c, $02bf

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

Func_030a:
	dr $030a, $0348

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
	dr $0398, $03e9

Func_03e9::
	dr $03e9, $0419

Func_0419:
	dr $0419, $062c

Func_062c:
	dr $062c, $06a6

LoadPalettes::
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

Func_0b30::
	dr $0b30, $0b69

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

Func_0c33::
	dr $0c33, $105a

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
; copy bc bytes from hl to de
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
	dr $29c8, $29f1

Func_29f1:
	dr $29f1, $2ab8

unk_2ab8:
	dr $2ab8, $2bb8

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
	dr $2be2, $2c03

Func_2c03:
	dr $2c03, $2ff0
