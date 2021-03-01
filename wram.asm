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

wd000:: ds $f6

wCharacterTileDest:: ds 2

wd0f8:: ds $8c8

wCharacterTileSrc:: ds 2

wd9c2:: ds $63e

INCLUDE "hram.asm"
