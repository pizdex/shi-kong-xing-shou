unk_00b_4000:
	dr $2c000, $2c17b

Func_00b_417b::
	call Func_00b_606f
	ld de, unk_00b_4250
	ld a, [wFarByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Func_00b_418d:
	ret

unk_00b_418e:
	dr $2c18e, $2c250

unk_00b_4250:
	dw Func_00b_4340
	dw Func_00b_4344
	dw Func_00b_4391
	dw $43a9
	dw $43bd
	dw $440c
	dw $442f
	dw $4454
	dw $4480
	dw $449c
	dw $44ab
	dw $4505
	dw $451d
	dw $4537
	dw $455f
	dw $456c
	dw $4587
	dw $4591
	dw $45a9
	dw $45b0
	dw Func_00b_45e1
	dw Func_00b_45ff
	dw $4683
	dw $46a1
	dw $46c3
	dw $46ff
	dw $4750
	dw $4781
	dw $4796
	dw $47aa
	dw $47f1
	dw $4811
	dw $481e
	dw $496f
	dw $498c
	dw $49a7
	dw $49db
	dw $4a48
	dw $4a55
	dw $4a6e
	dw $4a86
	dw $4a9a
	dw $4aaa
	dw $4acb
	dw $4afc
	dw $4b2f
	dw $4b73
	dw $4b91
	dw $4bc4
	dw $4bef
	dw $4c1b
	dw $4c5f
	dw $4ca3
	dw $4cc5
	dw $4cde
	dw $4cee
	dw $4dea
	dw $4df5
	dw $4e0d
	dw $4e39
	dw $4ea0
	dw $4ede
	dw $4f2f
	dw $4f48
	dw $4f99
	dw $4fb4
	dw $4fe7
	dw $502c
	dw $50cd
	dw $50d8
	dw $5118
	dw $5141
	dw $516b
	dw $5198
	dw $5235
	dw $52c1
	dw $52e1
	dw $52f0
	dw $5332
	dw $536a
	dw $53ad
	dw $5415
	dw $545e
	dw $546a
	dw $548c
	dw $54c8
	dw $5506
	dw $552d
	dw $5537
	dw $5562
	dw $55b7
	dw $55fe
	dw $5630
	dw $566a
	dw $569a
	dw $56a8
	dw $5895
	dw $58a2
	dw $58ad
	dw $58cd
	dw $590a
	dw $5929
	dw $593a
	dw $595e
	dw $5999
	dw $5a09
	dw $5a18
	dw $5abd
	dw $5ae1
	dw $5af7
	dw $5b76
	dw $5db7
	dw $5e8d
	dw $5e9b
	dw $5ea9
	dw $5ee7
	dw $5f5e
	dw $5f69
	dw $5ff6
	dw $6004

Func_00b_4340:
	call GetFarByte
	ret

Func_00b_4344:
	dr $2c344, $2c391

Func_00b_4391:
	dr $2c391, $2c3fc

Func_00b_43fc:
	ld a, TEXTBOX_TOP
	ld [wTextboxPos], a
; Check y coord
	ld a, [wcd00]
	cp $60
	ret nc

	xor a ; TEXTBOX_BOTTOM
	ld [wTextboxPos], a
	ret

Func_00b_440c:
	dr $2c40c, $2c5e1

Func_00b_45e1:
	call GetFarByte
	ld a, [wFarByte]
	ld [wcbfe], a
	call GetFarByte
	ld a, [wFarByte]
	ld [wcbfe + 1], a

	call Func_00b_43fc

; Display text
	ld a, 1
	ldh [hFFBC], a
	xor a
	ld [wFarByte], a
	ret

Func_00b_45ff:
	dr $2c5ff, $2e06f

Func_00b_606f:
	dr $2e06f, $2f1e0


SECTION "banknumb", ROMX[$7fff], BANK[$b]
	db $b
