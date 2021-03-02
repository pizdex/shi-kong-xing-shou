_Start::
	ldh [hFF91], a
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

DelayFrame:
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
	dr $02cc, $096a

Func_096a::
; Switch intro scene?
	dr $096a, $09d2

Func_09d2::
	dr $09d2, $0b69

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

ByteFill_VRAM:
; Fill bc bytes with the value of a, starting at hl
; Wait until VRAM is write-able first
	ld d, a
.loop
	call WaitVRAM_STAT
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
	dr $10b5, $19ca

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
	call ByteFill_VRAM
	call DelayFrame

	ld a, $0a
	rst Bankswitch
	xor a
	ld [$dce0], a
	ld de, $45fb
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
	dr $1c96, $26d1

WaitVRAM_STAT:
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	ret z
	jr WaitVRAM_STAT

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
	dr $28d6, $28fb

PrintCharacter:
; Print one vertically arranged character using four tiles
	ld a, [wCharacterBGMapTransferStatus]
	and a
	ret z

; Backup stack pointer
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

; Restore old stack pointer
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
	dr $29c8, $2ff0
