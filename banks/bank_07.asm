unk_007_4000::
	dr $1c000, $1c30f

unk_007_430f::
	dr $1c30f, $1ce21

unk_007_4e21::
	warp $00, ABSOLUTE, $01, $02, $00
	signpost $08, $08, 4
	db -1

unk_007_4e2e::
	db -1

unk_007_4e2f::
	dr $1ce2f, $1cf00


SECTION "banknum7", ROMX[$7fff], BANK[$7]
	db $7
