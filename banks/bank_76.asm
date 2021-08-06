TitleScreenGFX_Part1:
	INCBIN "gfx/title_screen/title_screen.2bpp", 0, $800

TitleScreenGFX_Part2:
	INCBIN "gfx/title_screen/title_screen.2bpp", $800

TitleScreenGFX_Sprites:
	INCBIN "gfx/title_screen/title_screen_sprites.2bpp"

TitleScreen_MenuGFX:
	INCBIN "gfx/title_screen/characters.2bpp"

SECTION "banknum76", ROMX[$7fff], BANK[$76]
	db $76
