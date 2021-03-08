SECTION "charset3_low", ROMX[$4000], BANK[$43]

unk_043_4000:
	INCBIN "gfx/character_set/image_43_4000.1bpp"


SECTION "charset3_high", ROMX[$6000], BANK[$43]

unk_043_6000:
	INCBIN "gfx/character_set/image_43_6000.1bpp"


SECTION "banknum43", ROMX[$7fff], BANK[$43]
	db $43
