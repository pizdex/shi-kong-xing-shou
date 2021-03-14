unk_008_4000:
	dr $20000, $20542

INCLUDE "data/text/ballots_house_intro.asm"

unk_008_4651:
	dr $20651, $23fff

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
