unk_00c_4000:
	dr $30000, $32cee

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

; Load tilemap into BG map bank 0
	hlbgcoord 3, 9
	ld de, SRAMErrorTilemap
	lb bc, 14, 1
	ld a, 14
	ld [hFF92], a
	ld a, 1
	ld [hFF93], a
	call PlaceTilemap_Bank0

; CGB only
; Load empty tilemap into BG map bank 1
	hlbgcoord 3, 9
	ld de, SRAMErrorEmptyTilemap
	lb bc, 14, 1
	ld a, 14
	ld [hFF92], a
	ld a, 1
	ld [hFF93], a
	call PlaceTilemap_Bank1

; CGB only
	ld hl, SRAMErrorPalette
	ld c, BCPSF_AUTOINC
	ld b, 8
	call LoadPalettes

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

SRAMErrorEmptyTilemap:
	ds 14, $00

SRAMErrorTilemap:
	INCBIN "gfx/sram_error.tilemap"

SRAMErrorPalette:
	INCLUDE "gfx/sram_error.pal"

unk_00c_6ea5:
	dr $32ea5, $32ebe

unk_00c_6ebe:
	dr $32ebe, $32ed7

unk_00c_6ed7:
	dr $32ed7, $32f22

unk_00c_6f22:
	dr $32f22, $33230


SECTION "banknumc", ROMX[$7fff], BANK[$c]
	db $c
