_Start::
	ldh [hConsoleType], a
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
	dr $017f, $0200

Func_0200:
	dr $0200, $0257

Func_0257:
	dr $0257, $02bf

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
	dr $0398, $06a6

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
	dr $06d0, $096a

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
	dr $0a0a, $0b69

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

Func_12fd:
	dr $12fd, $19ca

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
	ld a, [$dcb5]
	jr .select_bank

.select_bank
	rst Bankswitch
	push hl

Func_19f8:
	pop hl
	ld a, [hli]
	push hl

	cp $f0
	jp nc, Func_1a08
	cp $e0
	jp nc, Func_1b23
	jp Func_1a2b

Func_1a08:
	call Func_1a0e
	jp Func_19f8

Func_1a0e:
	and $0f
	push af
	srl a
	add $40
	ld [hTargetBank], a
	pop af
	bit 0, a
	jr nz, .asm_1a21
	ld a, $40
	jr .asm_1a23

.asm_1a21
	ld a, $60

.asm_1a23
	ld [$dcd2], a
	xor a
	ld [$dcd1], a
	ret

Func_1a2b:
	ld [$db1e], a
	call Func_1aa4

.asm_1a31
	ldh a, [hJoypadDown]
	bit 0, a
	jr z, .asm_1a3c

	ld a, $01
	ld [$d085], a

.asm_1a3c
	call DelayFrame
	ld a, [$d085]
	dec a
	ld [$d085], a
	jr nz, .asm_1a31

	call Func_1a5f
	ld a, 1
	ld [wCharacterBGMapTransferStatus], a
	call DelayFrame
	ld hl, $cbf0
	inc [hl]
	ld a, $03
	ld [$d085], a
	jp Func_19f8

Func_1a5f:
	dr $1a5f, $1aa4

Func_1aa4:
	dr $1aa4, $1b23

Func_1b23:
	ld de, table_1b31
	sub $e0
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

table_1b31:
	dw Func_1b51
	dw Func_1c2c
	dw Func_1c6e
	dw Func_1c96
	dw $1ca9
	dw $1cb6
	dw $1cde
	dw $1d41
	dw $1d67
	dw Func_1b51
	dw $1e0a
	dw $1e1a
	dw $1e2a
	dw $1e5b
	dw $1f6a
	dw $1fe9

Func_1b51:
	dr $1b51, $1ba0

Func_1ba0:
; Clear old name buffer
	ld bc, $100
	ld hl, $8e00
	xor a
	call ByteFillVRAM
	call DelayFrame

	ld a, BANK(unk_00a_45fb)
	rst Bankswitch
	xor a
	ld [$dce0], a
	ld de, unk_00a_45fb
	ld a, [$cbf7]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

Func_1bc2:
; Used for names on textboxes
	ld a, $0a
	rst Bankswitch
	ld a, [hli]
	push hl
	cp $f0
	jr nc, .asm_1c20
	cp $ed
	jr z, .end_of_name

	ld [$db1e], a
	ld a, [$dce0]
	add $e0
	ld c, a
	ld [$cbf3], a
	swap a
	ld b, a
	and $0f
	or $80
	ld [wCharacterTileDest + 1], a
	ld a, b
	and $f0
	ld [wCharacterTileDest], a

	ld a, [$dcd1]
	ld e, a
	ld a, [$dcd1 + 1]
	ld d, a
; hl = a * 32
	ld a, [$db1e]
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
	ld a, [$dce0]
	add 4
	ld [$dce0], a
	pop hl
	jp Func_1bc2

.asm_1c20
	call Func_1a0e
	pop hl
	jp Func_1bc2

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
	ld a, $0a
	rst Bankswitch
	call unk_00a_4063
	call DelayFrame
	call unk_00a_40b3
; Switch
	ld a, BANK(unk_004_4024)
	rst Bankswitch
	call unk_004_4024
; Restore old bank
	pop af
	rst Bankswitch

	xor a
	ld [$dce0], a
	ld a, $01
	ld [$d085], a
	ld a, [$d0cf]
	ld e, a
	ld a, [$d0d0]
	ld d, a
	ld hl, $003d
	add hl, de
	ld a, l
	ld [$d0d1], a
	ld a, h
	ld [$d0d2], a
	xor a
	ld [$cbf0], a
	ld [$cbf1], a
	ld [$dce0], a
	jp Func_19f8

Func_1c6e:
	dr $1c6e, $1c96

Func_1c96:
	dr $1c96, $1e6e

Func_1e6e:
	dr $1e6e, $1e7b

Func_1e7b:
	dr $1e7b, $26d1

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
; Clear line of text in textbox
	ld a, [wcbf6]
	and a
	ret z

; Backup SP
	ld [hFFA2], sp

	ld hl, wc0b0
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

; BG map addresses are held at wc0b0
	ld hl, wc0b0
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

Func_2bb8:
	call Func_12fd
	and a
	ret z

; Enable writing to SRAM
	ld a, SRAM_ENABLE
	ld [rRAMG], a

; SRAM bank 0
	xor a
	ld [rRAMB], a

	ld a, BANK(DebugSRAMTester)
	rst Bankswitch
	call DebugSRAMTester
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
	dr $2be2, $2ff0
