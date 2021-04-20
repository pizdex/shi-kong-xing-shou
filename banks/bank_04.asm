Func_004_4000::
	ld hl, wVirtualOAM
	ld bc, 40
	ld de, 4
.asm_4009
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_4009

	xor a
	ld [wd1fb], a
	call Func_004_4088
	call Func_004_4170
	call Func_004_41e6
	call Func_004_40cb
	call Func_004_426d
	ret

Func_004_4024::
	dr $10024, $10045

Func_004_4045::
	dr $10045, $10088

Func_004_4088:
	dr $10088, $100cb

Func_004_40cb:
	dr $100cb, $10170

Func_004_4170:
	dr $10170, $101e6

Func_004_41e6:
	dr $101e6, $1026d

Func_004_426d:
	dr $1026d, $10337

unk_004_4337::
	dr $10337, $108e7

unk_004_48e7::
	dr $108e7, $13ac0


SECTION "banknum4", ROMX[$7fff], BANK[$4]
	db $4
