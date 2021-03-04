INCLUDE "constants.asm"

SECTION "WRAM", WRAM0

wc000:: ds $b0
wc0b0:: ds $38

wc0e8:: ds $b0a

wCharacterTileCount:: ds 1
wcbf3:: ds 1
wCharacterBGMapTransferStatus:: ds 1
wCharacterTileTransferStatus:: ds 1
wcbf6:: ds 1
wcbf7:: ds $409


SECTION "WRAM1", WRAMX

wd000:: ds $82

wd082:: ds 1
wd083:: ds $e

wd091:: ds 1
wd092:: ds $49

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
wd9f1:: ds $12a

wGameTimeSeconds:: ds 1
wdb1c:: ds $4e4

INCLUDE "hram.asm"
