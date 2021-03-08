SECTION "charset4_low", ROMX[$4000], BANK[$44]

unk_044_4000:
	INCBIN "gfx/character_set/image_44_4000.1bpp"


SECTION "charset4_high", ROMX[$6000], BANK[$44]

unk_044_6000:
	INCBIN "gfx/character_set/image_44_6000.1bpp"


SECTION "banknum44", ROMX[$7fff], BANK[$44]
	db $44
