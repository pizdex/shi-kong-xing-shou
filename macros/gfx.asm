assert_valid_rgb: MACRO
rept _NARG
	assert 0 <= (\1) && (\1) <= 31, "RGB channel must be 0-31"
	shift
endr
ENDM

RGB: MACRO
rept _NARG / 3
	assert_valid_rgb \1, \2, \3
	dw palred (\1) + palgreen (\2) + palblue (\3)
	shift 3
endr
ENDM

palred   EQUS "(1 << 0) *"
palgreen EQUS "(1 << 5) *"
palblue  EQUS "(1 << 10) *"

palettes EQUS "* PALETTE_SIZE"
palette  EQUS "+ PALETTE_SIZE *"
color    EQUS "+ PAL_COLOR_SIZE *"

tiles EQUS "* LEN_2BPP_TILE"
tile  EQUS "+ LEN_2BPP_TILE *"

hlcoord EQUS "coord hl,"
bccoord EQUS "coord bc,"
decoord EQUS "coord de,"

coord: MACRO
; register, x, y[, origin]
	if _NARG < 4
	ld \1, (\3) * SCREEN_WIDTH + (\2) + wTilemap
	else
	ld \1, (\3) * SCREEN_WIDTH + (\2) + \4
	endc
ENDM

hlbgcoord EQUS "bgcoord hl,"
bcbgcoord EQUS "bgcoord bc,"
debgcoord EQUS "bgcoord de,"

bgcoord: MACRO
; register, x, y[, origin]
	if _NARG < 4
	ld \1, (\3) * BG_MAP_WIDTH + (\2) + vBGMap0
	else
	ld \1, (\3) * BG_MAP_WIDTH + (\2) + \4
	endc
ENDM
