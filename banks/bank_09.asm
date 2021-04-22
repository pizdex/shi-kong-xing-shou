Func_009_4000::
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	jr Func_009_4010

Func_009_4008::
; Only run on every other tick
	ldh a, [hFF9D]
	and 1
	ret nz

	ld bc, wcd40

Func_009_4010:
	dr $24010, $24193

unk_009_4193:
	dr $24193, $24330


SECTION "banknum9", ROMX[$7fff], BANK[$9]
	db $9
