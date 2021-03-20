unk_008_4000:
	dr $20000, $20542

INCLUDE "data/text/ballots_house_intro.asm"

INCLUDE "data/text/bank08_misc.asm"

Func_008_55d1:
	ld hl, $5afe
	call Func_03e9
	ld hl, $5afe
	ld de, $cab0
	ld bc, $40
	call Func_0b30
	ret

Func_008_55e4:
	dr $215e4, $2160c

Func_008_560c::
	dr $2160c, $21ab2

; Cutscene graphics?
unk_008_5ab2:
	dr $21ab2, $23fff

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
