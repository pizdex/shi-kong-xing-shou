unk_00b_4000:
	dr $2c000, $2c17b

Func_00b_417b::
	call Func_00b_606f
	ld de, unk_00b_4250
	ld a, [wScriptByte]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
	ret ; ?

unk_00b_418e:
	dr $2c18e, $2c250

unk_00b_4250:
	dw Func_00b_4340 ; $00
	dw Func_00b_4344 ; $01
	dw Func_00b_4391 ; $02
	dw Func_00b_43a9 ; $03
	dw Func_00b_43bd ; $04
	dw Func_00b_440c ; $05
	dw Func_00b_442f ; $06
	dw Func_00b_4454 ; $07
	dw Func_00b_4480 ; $08
	dw Func_00b_449c ; $09
	dw Func_00b_44ab ; $0a
	dw Func_00b_4505 ; $0b
	dw Func_00b_451d ; $0c
	dw Func_00b_4537 ; $0d
	dw Func_00b_455f ; $0e
	dw Func_00b_456c ; $0f
	dw Func_00b_4587 ; $10
	dw Func_00b_4591 ; $11
	dw Func_00b_45a9 ; $12
	dw Func_00b_45b0 ; $13
	dw Func_00b_45e1 ; $14
	dw Func_00b_45ff ; $15
	dw Func_00b_4683 ; $16
	dw Func_00b_46a1 ; $17
	dw Func_00b_46c3 ; $18
	dw Func_00b_46ff ; $19
	dw Func_00b_4750 ; $1a
	dw Func_00b_4781 ; $1b
	dw Func_00b_4796 ; $1c
	dw Func_00b_47aa ; $1d
	dw Func_00b_47f1 ; $1e
	dw Func_00b_4811 ; $1f
	dw Func_00b_481e ; $20
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
	dw Func_00b_6004

Func_00b_4340:
	call GetScriptByte
	ret

Func_00b_4344:
	dr $2c344, $2c391

Func_00b_4391:
	dr $2c391, $2c3a9

Func_00b_43a9:
	dr $2c3a9, $2c3bd

Func_00b_43bd:
	dr $2c3bd, $2c3fc

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
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcd03], a
	ld a, 0
	ld [wcd05], a
	ld a, 1
	ld [hFFAC], a
	ld [wdcd0], a
	ld a, 6
	ld [hFFAD], a
	xor a
	ld [wScriptByte], a
	call Func_0426
	ret

Func_00b_442f:
	dr $2c42f, $2c454

Func_00b_4454:
	dr $2c454, $2c480

Func_00b_4480:
	dr $2c480, $2c49c

Func_00b_449c:
	xor a
	ldh [hFFD6], a
	ldh [hFFA7], a
	ld [wd0f0], a
	call Func_0817
	call Func_19b6
	ret

Func_00b_44ab:
	dr $2c4ab, $2c505

Func_00b_4505:
	dr $2c505, $2c51d

Func_00b_451d:
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFF9B], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFF9C], a
; Enable map switch
	ld a, 1
	ld [hFFBF], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4537:
	dr $2c537, $2c55f

Func_00b_455f:
	dr $2c55f, $2c56c

Func_00b_456c:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcc8], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcc8 + 1], a
; Next command
	ld a, $10
	ld [wScriptByte], a
	xor a
	ldh [hFFA7], a
	ret

Func_00b_4587:
	call Func_00b_60dd
	call Func_00b_61d6
	call Func_0426
	ret

Func_00b_4591:
	dr $2c591, $2c5a9

Func_00b_45a9:
	dr $2c5a9, $2c5b0

Func_00b_45b0:
	dr $2c5b0, $2c5e1

Func_00b_45e1:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfe], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfe + 1], a

	call Func_00b_43fc

; Display text
	ld a, 1
	ldh [hFFBC], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_45ff:
	dr $2c5ff, $2c683

Func_00b_4683:
	dr $2c683, $2c6a1

Func_00b_46a1:
	dr $2c6a1, $2c6c3

Func_00b_46c3:
	dr $2c6c3, $2c6ff

Func_00b_46ff:
	dr $2c6ff, $2c750

Func_00b_4750:
	dr $2c750, $2c781

Func_00b_4781:
	dr $2c781, $2c796

Func_00b_4796:
	dr $2c796, $2c7aa

Func_00b_47aa:
	dr $2c7aa, $2c7f1

Func_00b_47f1:
	dr $2c7f1, $2c811

Func_00b_4811:
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFFBA], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_481e:
	dr $2c81e, $2d273

Func_00b_5273::
	dr $2d273, $2e004

Func_00b_6004:
	dr $2e004, $2e06f

Func_00b_606f:
	dr $2e06f, $2e0dd

Func_00b_60dd:
	dr $2e0dd, $2e1d6

Func_00b_61d6:
	dr $2e1d6, $2f1e0


SECTION "banknumb", ROMX[$7fff], BANK[$b]
	db $b
