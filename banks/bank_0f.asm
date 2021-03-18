unk_00f_4000:
	dr $3c000, $3c691

INCLUDE "data/text/bank0f_misc.asm"

unkText_00f_48f3:
	dr $3c8f3, $3d94f

unk_00f_594f:
	dr $3d94f, $3da80

SECTION "banknumf", ROMX[$7fff], BANK[$f]
	db $f
