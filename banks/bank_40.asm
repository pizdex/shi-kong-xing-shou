unk_040_4000:
	INCBIN "gfx/character_set/image_40_4000.1bpp"

unk_040_5c00:
	dr $101c00, $102000

unk_040_6000:
	INCBIN "gfx/character_set/image_40_6000.1bpp"


SECTION "banknum40", ROMX[$7fff], BANK[$40]
	db $40
