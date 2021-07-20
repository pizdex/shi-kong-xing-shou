; Map headers
	map_attributes BellVillage1, BELL_VILLAGE_1, 0, unk_006_4000

unk_001_4014:
	db 6, 10
	dw $726f
	dw $73a8
	dw $72ac
	dw $7444
	dw $74e5
	dw $0000
	dw $400f
	dw $0000
	dw $752d

unk_001_4028:
	db 10, 6
	dw $6fd1
	dw $70ae
	dw $700e
	dw $715e
	dw $71ff
	dw $0000
	dw $4025
	dw $0000
	dw $7247

unk_001_403c:
	db 6, 5
	dw $6c6b
	dw $6c8a
	dw $6dc3
	dw $6ec7
	dw $6f58
	dw $0000
	dw $403b
	dw $0000
	dw $6fa0

unk_001_4050:
	db 6, 5
	dw $6cda
	dw $6cf9
	dw $6dc3
	dw $6ec7
	dw $6f58
	dw $0000
	dw $403b
	dw $0000
	dw $6fa0

unk_001_4064:
	dr $4064, $4294

unk_001_4294:
	dr $4294, $756c

BellVillage1_Blocks:
	dr $756c, $75e5

BellVillage1_Tiles:
	dr $75e5, $76d1

BellVillage1_Metatiles:
	dr $76d1, $7815

BellVillage1_AttrMap:
	dr $7815, $7896

BellVillage1_Palettes:
	dr $7896, $78de

BellVillage1_Collision:
	dr $78de, $79d0


SECTION "banknum1", ROMX[$7fff], BANK[$1]
	db $1
