SECTION "charset1_low", ROMX[$4000], BANK[$41]

unk_041_4000:
	INCBIN "gfx/character_set/image_41_4000.1bpp"


SECTION "charset1_high", ROMX[$6000], BANK[$41]

unk_041_6000:
	INCBIN "gfx/character_set/image_41_6000.1bpp"


SECTION "banknum41", ROMX[$7fff], BANK[$41]
	db $42 ; ???
