Func_00a_4000::
	hlcoord 0, 0
	ld a, [wTextboxPos]
	and a
	jr nz, .backup_tilemap

	hlcoord 0, 10
.backup_tilemap
	ld a, l
	ld [wTextboxPointer], a
	ld a, h
	ld [wTextboxPointer + 1], a
	ld de, wcb30
	ld c, 8 * SCREEN_WIDTH
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

; Load textbox border tiles
	call DelayFrame
	ld hl, unk_00a_4523
	ld de, $8a00
	ld bc, $70
	call CopyBytesVRAM

	call DelayFrame
	farcall unk_00d_4000

; Inefficient
	ld hl, wd1a0
	call Func_00a_405b
	ld hl, wd1a8
	call Func_00a_405b

	call Func_0868
	call DelayFrame
	call Func_0885
	call DelayFrame
	ld hl, $42e3
	ld a, l
	ld [$dcd6], a
	ld a, h
	ld [$dcd6 + 1], a
	ret

Func_00a_405b:
	ld c, 8
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

unk_00a_4063::
	dr $28063, $280b3

Func_00a_40b3::
	dr $280b3, $280f9

unk_00a_40f9:
	dr $280f9, $28145

unk_00a_4145:
	dr $28145, $28178

Func_00a_4178::
	dr $28178, $282db

unk_00a_42db:
	dr $282db, $28523

unk_00a_4523:
	dr $28523, $285ce

Func_00a_45ce:
	ld a, [$d08e]
	cp $03
	jr nz, .asm_45e1

	ld hl, $dd18
	ld a, [hl]
	cp $80
	jr nz, .asm_45e1

	ld a, $2b
	jr .asm_45e4

.asm_45e1:
	ld a, [$d08e]

.asm_45e4:
	ld bc, $d86a
	ld de, NamePointers
	inc a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_45f3
	ld a, [hli]
	ld [bc], a
	inc bc
	cp TX_LINE
	jr nz, .asm_45f3
	ret

INCLUDE "data/name_pointers.asm"
INCLUDE "data/text/names.asm"


SECTION "banknum0a", ROMX[$7fff], BANK[$0a]
	db $0a
