unk_00f_4000:
	dr $3c000, $3c00a

Script_00f_400a:
	dr $3c00a, $3c01a

unk_00f_401a::
	dr $3c01a, $3c039

unk_00f_4039::
	dr $3c039, $3c0ab

unk_00f_40ab::
	dr $3c0ab, $3c0c2

unk_00f_40c2::
	dr $3c0c2, $3c160

unk_00f_4160::
	dr $3c160, $3c18d

unk_00f_418d::
	dr $3c18d, $3c1af

unk_00f_41af::
	dr $3c1af, $3c1dc

unk_00f_41dc::
	dr $3c1dc, $3c21c

Script_00f_421c::
	dr $3c21c, $3c2b0

unk_00f_42b0::
	dr $3c2b0, $3c329

unk_00f_4329::
	dr $3c329, $3c348

unk_00f_4348::
	dr $3c348, $3c375

unk_00f_4375::
	dr $3c375, $3c385

Script_00f_4385::
	dr $3c385, $3c397

unk_00f_4397::
	dr $3c397, $3c3b6

Script_00f_43b6::
	dr $3c3b6, $3c3bc

Script_00f_43bc::
	dr $3c3bc, $3c3c4

Script_00f_43c4::
	dr $3c3c4, $3c3d2

unk_00f_43d2::
	dr $3c3d2, $3c3e9

unk_00f_43e9::
	dr $3c3e9, $3c416

unk_00f_4416::
	dr $3c416, $3c4df

Script_00f_44df::
	dr $3c4df, $3c592

Script_00f_4592::
	dr $3c592, $3c5af

Script_00f_45af::
	dr $3c5af, $3c5bd

Script_00f_45bd::
	dr $3c5bd, $3c691

INCLUDE "data/text/bank0f_misc.asm"

unkText_00f_48f3:
	dr $3c8f3, $3d94f

unk_00f_594f:
	dr $3d94f, $3da80

SECTION "banknumf", ROMX[$7fff], BANK[$f]
	db $f
