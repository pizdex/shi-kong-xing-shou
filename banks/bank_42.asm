SECTION "charset2_low", ROMX[$4000], BANK[$42]

unk_042_4000:
	INCBIN "gfx/character_set/image_42_4000.1bpp"


SECTION "charset2_high", ROMX[$6000], BANK[$42]

unk_042_6000:
	INCBIN "gfx/character_set/image_42_6000.1bpp"


SECTION "banknum42", ROMX[$7fff], BANK[$42]
	db $42
