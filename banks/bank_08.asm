unk_008_4000:
	dr $20000, $20545

unk_008_4545:
; 嗯~
; 放入這個~
; $f1, $32, $f2, $1f, $ed, $f0, $33, $f2, $30, $57, $4f, $1f, $e2
	textset "嗯", 1
	textset "~", 2
	db TX_LINE
	textset "放", 0
	textset "入", 2
	textset "這個~"
	text_end

unk_008_4552:
	db $e0, $01, $00

unk_008_4555:
	textset "⋯", 2
	textset "在", 3
	textset "這個時", 2
	textset "候", 3
	textset "~", 2
	db TX_LINE
	textset "再加", 2
	textset "調味料", 3
	textset "⋯⋯", 2
	text_end

unk_008_456d:
	dr $2056d, $23fff

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
