Func_002_4000:
	jp Func_002_4478

Func_002_4003:
	jp Func_002_439f

Func_002_4006:
	jp Func_002_4d2d

Func_002_4009:
	jp Func_002_4035

unk_002_400c:
	dr $800c, $8035

Func_002_4035:
	dr $8035, $839f

Func_002_439f:
	dr $839f, $8478

Func_002_4478:
	dr $8478, $8d2d

Func_002_4d2d:
	dr $8d2d, $bec0


SECTION "banknum2", ROMX[$7fff], BANK[$2]
	db $2
