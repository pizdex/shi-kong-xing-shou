; Map headers
unk_001_4000:
	db 12, 10
	dw $756c
	dw $76d1
	dw $75e5
	dw $7815
	dw $7896
	dw $0000
	dw $4000
	dw $0000
	dw $78de

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
	dr $4294, $75e5

unk_001_75e5:
	dr $75e5, $79d0


SECTION "banknum1", ROMX[$7fff], BANK[$1]
	db $1
