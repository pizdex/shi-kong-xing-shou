unk_026_4000::
	dr $98000, $98888

INCLUDE "data/text/mon_names.asm"

Func_026_4c89:
	ld a, [wd9d9]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, MonsterPalettePointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call Func_0b46
	ld a, [wd08a]
	sla a
	sla a
	sla a
	ld bc, wcab0
	ld l, a
	ld h, 0
	add hl, bc
	push de
	ld e, l
	ld d, h
	pop hl
	ld bc, 8
	call CopyBytes3
	ret

Func_026_4cb6:
	dr $98cb6, $98d47

Func_026_4d47:
	dr $98d47, $98d73

INCLUDE "data/monsters/palettes.asm"

unk_026_53ab:
	dr $993ab, $9b140


SECTION "banknum26", ROMX[$7fff], BANK[$26]
	db $26
