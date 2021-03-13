Func_00a_4000::
	dr $28000, $2805b

unk_00a_405b:
	ld c, 8
	xor a
.asm_405e
	ld [hli], a
	dec c
	jr nz, .asm_405e
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
	dr $282db, $285ce

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
