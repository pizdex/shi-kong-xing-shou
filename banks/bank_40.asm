SECTION "charset0_low", ROMX[$4000], BANK[$40]

unk_040_4000:
	INCBIN "gfx/character_set/image_40_4000.1bpp"


SECTION "charset0_high", ROMX[$6000], BANK[$40]

unk_040_6000:
	INCBIN "gfx/character_set/image_40_6000.1bpp"


SECTION "banknum40", ROMX[$7fff], BANK[$40]
	db $40
