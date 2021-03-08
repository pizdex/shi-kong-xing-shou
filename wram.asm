INCLUDE "constants.asm"


SECTION "WRAM", WRAM0

wc000:: ds $b0

wBGMapBufferPointers:: ds $38

wc0e8:: ds $838

; c920
wTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::

wca88:: ds $168

wCharacterTilemapPos:: ds 1
wTextLine:: ds 1
wCharacterTileCount:: ds 1
wcbf3:: ds 1
wCharacterBGMapTransferStatus:: ds 1
wCharacterTileTransferStatus:: ds 1
wcbf6:: ds 1
wcbf7:: ds $409


SECTION "WRAM1", WRAMX

wd000:: ds $82

wd082:: ds 1
wd083:: ds 1
wd084:: ds 1
wTextDelayFrames:: ds 1
wd086:: ds 11

wd091:: ds 1
wd092:: ds $3d

wTextboxPointer:: ds 2
wd0d1:: ds 2
wd0d3:: ds 8

wGameTimeHours:: ds 1
wGameTimeMinutes:: ds 1
wd0dd:: ds $19

wCharacterTileDest:: ds 2
wd0f8:: ds $30

wd128:: ds $867

wd98f:: ds 2
wd991:: ds $2f

wCharacterTileSrc:: ds 2
wd9c2:: ds $1c

wWX:: ds 1
wWY:: ds 1

wd9e0:: ds 2
wd9e2:: ds $e

wTempBank:: ds 1
wd9f1:: ds $dd

wTextBGMapPointer:: ds 2
wdad0:: ds $4b

wGameTimeSeconds:: ds 1
wdb1c:: ds 1
wdb1d:: ds 1
wCurrentCharacterByte:: ds $197

wdcb5:: ds 1
wdcb6:: ds $1b

wdcd1:: ds 2
wdcd3:: ds 13

wCharacterTilePos:: ds 1
wdce1:: ds 1
wdce2:: ds 1

; 0 = bottom half, 1 = top half
wTextboxPos:: ds 1

INCLUDE "hram.asm"
