INCLUDE "constants.asm"

SECTION "WRAM", WRAM0

wc000:: ds $b0
wc0b0:: ds $b42

wCharacterTileCount:: ds 1
wcbf3:: ds 1
wCharacterBGMapTransferStatus:: ds 1
wCharacterTileTransferStatus:: ds 1
wcbf6:: ds $40a


SECTION "WRAM1", WRAMX

wd000:: ds $db

wGameTimeHours:: ds 1
wGameTimeMinutes:: ds 1
wd0dd:: ds $19

wCharacterTileDest:: ds 2
wd0f8:: ds $8c8
wCharacterTileSrc:: ds 2
wd9c2:: ds $1c

wWX:: ds 1
wWY:: ds 1

wd9e0:: ds 2
wd9e2:: ds $139

wGameTimeSeconds:: ds 1
wdb1c:: ds $4e4

INCLUDE "hram.asm"
