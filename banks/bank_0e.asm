unk_00e_4000:
	dr $38000, $38abe

INCLUDE "data/text/bank0e_misc.asm"

unkText_00e_5023:
	dr $39023, $39bdd

unkText_00e_5bdd:
	text_init $14, $25 ; TEMP
	db $f3, $0c
	db $f1, $58
	db $f4, $29
	db $f1, $c8
	db $f5, $0e
	db $f0, $2a
	db $f1, $5c
	line
	text "?", 1
	line
	db $e5

unkText_00e_5bf3:
	dr $39bf3, $3be69

unk_00e_7e69:
	dr $3be69, $3bf30


SECTION "banknume", ROMX[$7fff], BANK[$e]
	db $e
