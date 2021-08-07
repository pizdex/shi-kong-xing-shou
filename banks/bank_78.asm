IntroBG_GFX_1::
	dr $1e0000, $1e0800

IntroWin_GFX_1::
	dr $1e0800, $1e0a80

IntroBG_GFX_2::
	dr $1e0a80, $1e1280

IntroWin_GFX_2::
	dr $1e1280, $1e1470

IntroBG_GFX_3::
	dr $1e1470, $1e1c70

IntroWin_GFX_3::
	dr $1e1c70, $1e1ee0

IntroBG_GFX_4::
	dr $1e1ee0, $1e26e0

IntroWin_GFX_4::
	dr $1e26e0, $1e28b0

IntroBG_GFX_5::
	dr $1e28b0, $1e30b0

IntroWin_GFX_5::
	dr $1e30b0, $1e31b0

IntroBG_GFX_6::
	dr $1e31b0, $1e39b0

IntroWin_GFX_6::
	dr $1e39b0, $1e3ab0

SECTION "banknum78", ROMX[$7fff], BANK[$78]
	db $78
