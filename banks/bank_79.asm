IntroBG_GFX_7:
	dr $1e4000, $1e4800

IntroWin_GFX_7::
	dr $1e4800, $1e4b80

IntroBG_GFX_8::
	dr $1e4b80, $1e5380

IntroWin_GFX_8::
	dr $1e5380, $1e5680

IntroSprite_GFX_1::
INCBIN "gfx/title_screen/intro/sprites/1.2bpp"

IntroSprite_GFX_2::
INCBIN "gfx/title_screen/intro/sprites/2.2bpp"

IntroSprite_GFX_3::
INCBIN "gfx/title_screen/intro/sprites/3.2bpp"

IntroSprite_GFX_4::
INCBIN "gfx/title_screen/intro/sprites/4.2bpp"

IntroSprite_GFX_5::
INCBIN "gfx/title_screen/intro/sprites/5.2bpp"

IntroSprite_GFX_6::
INCBIN "gfx/title_screen/intro/sprites/6.2bpp"

IntroSprite_GFX_7::
INCBIN "gfx/title_screen/intro/sprites/7.2bpp"

IntroSprite_GFX_8::
INCBIN "gfx/title_screen/intro/sprites/8.2bpp"

SECTION "banknum79", ROMX[$7fff], BANK[$79]
	db $79
