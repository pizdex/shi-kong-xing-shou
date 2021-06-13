unk_02b_4000:
	dr $ac000, $ad547

Func_02b_5547:
	dr $ad547, $ad5cb

Func_02b_55cb:
	ld c, 32
.delay
	call DelayFrame
	dec c
	jr nz, .delay
	ret

Func_02b_55d4:
	dr $ad5d4, $af650


SECTION "banknum2b", ROMX[$7fff], BANK[$2b]
	db $2b
