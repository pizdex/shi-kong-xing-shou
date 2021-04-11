Func_05e_4000:
	ld hl, wVirtualOAM
	ld bc, 40
	ld de, 4
.asm_4009
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4009
	ret

Func_05e_4011:
	ld hl, wcd50
	ld b, $52
.clear
	xor a
	ld [hli], a
	dec b
	jr nz, .clear
	ret

Func_05e_401c::
	dr $17801c, $17835f

unk_05e_435f:
	dr $17835f, $17b900


SECTION "banknum5e", ROMX[$7fff], BANK[$5e]
	db $5e
