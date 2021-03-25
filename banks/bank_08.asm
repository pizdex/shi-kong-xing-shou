unk_008_4000:
	dr $20000, $20542

INCLUDE "data/text/ballots_house_intro.asm"

INCLUDE "data/text/bank08_misc.asm"

Func_008_55d1:
	ld hl, $5afe
	call FillPalettes_BCPD
	ld hl, $5afe
	ld de, $cab0
	ld bc, $40
	call CopyBytes3
	ret

Func_008_55e4:
	dr $215e4, $215f7

Func_008_55f7:
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ret

Func_008_55fe:
	ld hl, $cd00
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

Func_008_560c::
	dr $2160c, $2167a

Func_008_567a:
	dr $2167a, $21ab2

; Cutscene graphics?
unk_008_5ab2:
	dr $21ab2, $23fff

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
