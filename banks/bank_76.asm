unk_076_4000:
	dr $1d8000, $1d8800

unk_076_4800:
	dr $1d8800, $1d8fa0

unk_076_4fa0:
	dr $1d8fa0, $1d92a0

unk_076_52a0:
	INCBIN "gfx/title_screen/characters.2bpp"

SECTION "banknum76", ROMX[$7fff], BANK[$76]
	db $76
