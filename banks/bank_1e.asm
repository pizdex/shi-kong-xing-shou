Func_01e_4000::
	dr $78000, $78083

Func_01e_4083::
	dr $78083, $78125

Func_01e_4125::
	dr $78125, $78194

Func_01e_4194::
	dr $78194, $781e8

Func_01e_41e8::
	dr $781e8, $78266

Func_01e_4266::
	dr $78266, $78275

Func_01e_4275::
	dr $78275, $787fb

Func_01e_47fb:
	dr $787fb, $799cc

unk_01e_59cc:
	dr $799cc, $79aa0

INCLUDE "data/text/bank1e_misc.asm"

text_01e_buffer:
	dr $79c3f, $7af00


SECTION "banknum1e", ROMX[$7fff], BANK[$1e]
	db $1e
