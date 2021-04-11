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
	dr $787fb, $797ed

PointerTable_01e_57ed:
	dw text_1e_5829
	dw text_1e_582a
	dw text_1e_5836
	dw text_1e_5841
	dw text_1e_584f
	dw text_1e_585f
	dw text_1e_586c
	dw text_1e_5875
	dw text_1e_587d
	dw text_1e_5888
	dw text_1e_5890
	dw text_1e_5898
	dw text_1e_58a5
	dw text_1e_58b1
	dw text_1e_58c1
	dw text_1e_58d4
	dw text_1e_58f0
	dw text_1e_58fb
	dw text_1e_5907
	dw text_1e_591f
	dw text_1e_592c
	dw text_1e_5947
	dw text_1e_595f
	dw text_1e_5971
	dw text_1e_597a
	dw text_1e_598b
	dw text_1e_599b
	dw text_1e_59a9
	dw text_1e_59b7
	dw text_1e_59c4

INCLUDE "data/text/bank1e_misc.asm"

PointerTable_01e_59cc:
	dr $799cc, $79aa0

INCLUDE "data/text/bank1e_misc2.asm"

text_01e_buffer2:
	dr $79c3f, $7af00


SECTION "banknum1e", ROMX[$7fff], BANK[$1e]
	db $1e
