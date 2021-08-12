unk_00c_4000:
	dr $30000, $30056

Func_00c_4056::
	ld de, .SignpostGroups

; map group
	ld a, [hMapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a

; signpost number
	ld a, [wd1e3]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de

; store to text buffer
	ld a, [hli]
	ld [wcbfe], a
	ld a, [hli]
	ld [wcbfe + 1], a
	ret

.SignpostGroups:
	dw Group00_Signposts
	dw Group00_Signposts
	dw Group02_Signposts
	dw Group03_Signposts
	dw Group04_Signposts
	dw Group05_Signposts
	dw Group06_Signposts
	dw Group00_Signposts

Group00_Signposts:
	dw text_0c_40a7
	dw text_0c_40a7
	dw text_0c_40af
	dw text_0c_40b8
	dw text_0c_40c0
	dw text_0c_40c7
	dw text_0c_40d1
	dw text_0c_40db
	dw text_0c_40e6
	dw text_0c_40ed
	dw text_0c_40f5
	dw text_0c_4103
	dw text_0c_410d
	dw text_0c_4116
	dw text_0c_4120
	dw text_0c_412a
	dw text_0c_4133

INCLUDE "data/text/signposts_1.asm"

Group02_Signposts:
	dw text_0c_4152
	dw text_0c_4152
	dw text_0c_415a
	dw text_0c_4162
	dw text_0c_416d
	dw text_0c_4176
	dw text_0c_417f
	dw text_0c_4189
	dw text_0c_4194
	dw text_0c_41af
	dw text_0c_41b6

INCLUDE "data/text/signposts_2.asm"

Group03_Signposts:
	dw text_0c_41cb
	dw text_0c_41cb
	dw text_0c_41d3
	dw text_0c_41da
	dw text_0c_41e5
	dw text_0c_41ee
	dw text_0c_41f7

INCLUDE "data/text/signposts_3.asm"

Group04_Signposts:
	dw text_0c_4216
	dw text_0c_4216
	dw text_0c_421e
	dw text_0c_4229
	dw text_0c_4233
	dw text_0c_423d
	dw text_0c_4250
	dw text_0c_4258
	dw text_0c_4260
	dw text_0c_426a
	dw text_0c_4272
	dw text_0c_4283

INCLUDE "data/text/signposts_4.asm"

Group05_Signposts:
	dw text_0c_42a5
	dw text_0c_42a5
	dw text_0c_42ad
	dw text_0c_42b5
	dw text_0c_42bd
	dw text_0c_42c7
	dw text_0c_42d3
	dw text_0c_42db

INCLUDE "data/text/signposts_5.asm"

Group06_Signposts:
	dw text_0c_42f9
	dw text_0c_42f9
	dw text_0c_4303
	dw text_0c_430e
	dw text_0c_431a
	dw text_0c_4322

INCLUDE "data/text/signposts_6.asm"

unk_00c_432a::
	dr $3032a, $32cee

_SRAMTest::
; Write pattern of decreasing bytes into SRAM and verify that they were written correctly
; If check succeeds, exit silently; otherwise display error screen
	ld hl, _SRAM
	ld bc, $2000
.write_pattern
	ld a, c
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .write_pattern

	ld hl, _SRAM
	ld bc, $2000
.check_pattern
	ld a, [hli]
	cp c
	jr nz, .failed_check
	dec bc
	ld a, c
	or b
	jr nz, .check_pattern
	ret

.failed_check:
	xor a ; SRAM_DISABLE
	ld [rRAMG], a

	ei
	call ClearBGMap0

; Load tiles into vTiles2
	ld de, vTiles2
	ld hl, SRAMErrorGFX
	ld bc, 14 tiles
	call CopyBytesVRAM

; Place tilemap
	hlbgcoord 3, 9
	ld de, SRAMErrorTilemap
	lb bc, 14, 1
	ld a, 14
	ld [hFF92], a
	ld a, 1
	ld [hFF93], a
	call PlaceTilemap_Bank0

; CGB only
; Place attrmap
	hlbgcoord 3, 9
	ld de, SRAMErrorAttrmap
	lb bc, 14, 1
	ld a, 14
	ld [hFF92], a
	ld a, 1
	ld [hFF93], a
	call PlaceAttrmap

; CGB only
	ld hl, SRAMErrorPalette
	ld c, BCPSF_AUTOINC
	ld b, 1 palettes
	call LoadPalettes_BCPD

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld a, $a0
	ldh [rWY], a

; After displaying message, wait for any input before exiting
.wait_input
	call DelayFrame
	ldh a, [hJoypadPressed]
	and a
	jr z, .wait_input

	xor a ; LCDCF_OFF
	ldh [rLCDC], a
	ret

SRAMErrorGFX:
	INCBIN "gfx/sram_error.2bpp"

SRAMErrorAttrmap:
	ds 14, $00

SRAMErrorTilemap:
	;  "T"  "E"  "S"  "T"  " "               "SRAM ERROR"
	db $01, $02, $03, $04, $00, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d

SRAMErrorPalette:
REPT 8
	RGB 31, 31, 31
	RGB 31, 23, 14
	RGB 24, 13, 0
	RGB 0, 0, 0
ENDR

unk_00c_6ea5:
	dr $32ea5, $32ebe

unk_00c_6ebe:
	dr $32ebe, $32ed7

Func_00c_6ed7::
	dr $32ed7, $32f22

unk_00c_6f22:
	dr $32f22, $33230


SECTION "banknumc", ROMX[$7fff], BANK[$c]
	db $c
