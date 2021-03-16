unk_008_4000:
	dr $20000, $20542

INCLUDE "data/text/ballots_house_intro.asm"

INCLUDE "data/text/bank08_misc.asm"

unk_008_5001:
	dr $21001, $23fff

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
