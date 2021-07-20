map: MACRO
; \1 = map name
	db BANK(\1_MapAttributes)
	ds 3
	dw \1_MapAttributes
__current_map__ equs "\1"
ENDM

warp: MACRO
; \1 = warp X?
; \2 = warp Y?
; \3 = OAM location
	db \1, \2
	dw \3
	db BANK({__current_map__}_ObjectEvents)
	ds 3
	dw {__current_map__}_ObjectEvents ; different bank
	dw {__current_map__}_MapEvents ; same bank
ENDM

end_map: MACRO
PURGE __current_map__
ENDM

map_attributes: MACRO
; \1 = map name
; \2 = map ID
; \3 = tileset 1
; \4 = tileset 2
\1_MapAttributes::
	db \2_WIDTH, \2_HEIGHT
	dw \1_Blocks
	dw \1_Metatiles
	dw \1_Tiles
	dw \1_AttrMap
	dw \1_Palettes
	dw \3, \4
	dw 0 ; ??
	dw \1_Collision
ENDM
