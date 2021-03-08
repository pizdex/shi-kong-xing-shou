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
	dr $28145, $282db

unk_00a_42db:
	dr $282db, $285fb

unk_00a_45fb::
	dr $285fb, $286b8

unk_00a_46b8::
	; $f0, $16, $f4, $23, $f1, $c6, $ed
	textset "巴", 0
    textset "洛", 4
    textset "特", 1
    db TX_LINE

unk_00a_46bf::
	dr $286bf, $28923


SECTION "banknum0a", ROMX[$7fff], BANK[$0a]
	db $0a
