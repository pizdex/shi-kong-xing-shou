unk_03f_4000:
	dr $fc000, $fe84c

SECTION "EnglishCharacterSet", ROMX[$6930], BANK[$3f]
English_Character_Set::
	INCBIN "gfx/character_set/english.1bpp"


SECTION "banknum3f", ROMX[$7fff], BANK[$3f]
	db $3f
