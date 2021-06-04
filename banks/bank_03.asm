Func_003_4000:
	jp Func_003_4416

Func_003_4003:
	jp Func_003_433d

Func_003_4006:
	jp Func_003_4ccb

Func_003_4009:
	jp Func_003_400c

Func_003_400c:
	ret

unk_003_400d:
	dr $c00d, $c33d

Func_003_433d:
	dr $c33d, $c40d

Func_003_440d:
	ld a, $07
	ld [wd60b], a
	ld [wd60c], a
	ret

Func_003_4416:
	dr $c416, $cccb

Func_003_4ccb:
	dr $cccb, $f260


SECTION "banknum3", ROMX[$7fff], BANK[$3]
	db $3
