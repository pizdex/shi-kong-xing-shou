farcall: MACRO ; bank, address
	ld hl, \1
	ld b, BANK(\1)
	rst FarCall
ENDM
