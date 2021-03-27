farcall: MACRO ; bank, address
	ld hl, \1
	ld b, BANK(\1)
	rst FarCall
ENDM

homecall: MACRO
	ld a, [_BANKNUM]
	push af
	ld a, BANK(\1)
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
ENDM
