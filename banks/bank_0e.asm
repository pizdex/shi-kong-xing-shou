unk_00e_4000:
	dr $38000, $38abe

INCLUDE "data/text/bank0e_misc.asm"

unkText_00e_5023:
	dr $39023, $3be69

unk_00e_7e69:
	dr $3be69, $3bf30


SECTION "banknume", ROMX[$7fff], BANK[$e]
	db $e
