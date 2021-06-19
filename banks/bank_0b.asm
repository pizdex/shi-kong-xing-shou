unk_00b_4000:
	dr $2c000, $2c13c

unk_00b_413c::
	db LEFT, $ff

unk_00b_413e::
	db RIGHT, $ff

unk_00b_4140::
	db RIGHT, RIGHT, $ff

unk_00b_4143::
	db LEFT, DOWN, DOWN, RIGHT, $ff

unk_00b_4148::
	db DOWN, RIGHT, $ff

unk_00b_414b::
	db DOWN, LEFT, $ff

unk_00b_414e::
	db LEFT, DOWN, $ff

unk_00b_4151::
	db LEFT, UP, $ff

unk_00b_4154::
	db DOWN, LEFT, UP, $ff

unk_00b_4158::
	db RIGHT, DOWN, DOWN, LEFT, $ff

unk_00b_415d:
	dr $2c15d, $2c17b

Func_00b_417b::
	call Func_00b_606f
	ld de, ScriptCommandTable
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
	dr $2c18e, $2c191

unk_00b_4191::
	db DOWN, $ff

unk_00b_4193::
	db UP, $ff

unk_00b_4195::
	dr $2c195, $2c250

ScriptCommandTable:
; Entries correspond to script_* constants (see macros/script.asm)
	dw Script_continue ; $00
	dw Func_00b_4344   ; $01
	dw Func_00b_4391   ; $02
	dw Func_00b_43a9   ; $03
	dw Func_00b_43bd   ; $04
	dw Func_00b_440c   ; $05
	dw Func_00b_442f   ; $06
	dw Func_00b_4454   ; $07
	dw Func_00b_4480   ; $08
	dw Func_00b_449c   ; $09
	dw Script_checkbit ; $0a
	dw Script_setbit   ; $0b
	dw Func_00b_451d   ; $0c
	dw Func_00b_4537   ; $0d
	dw Func_00b_455f   ; $0e
	dw Func_00b_456c   ; $0f
	dw Func_00b_4587   ; $10
	dw Func_00b_4591   ; $11
	dw Func_00b_45a9   ; $12
	dw Func_00b_45b0   ; $13
	dw Func_00b_45e1   ; $14
	dw Func_00b_45ff   ; $15
	dw Func_00b_4683   ; $16
	dw Func_00b_46a1   ; $17
	dw Func_00b_46c3   ; $18
	dw Func_00b_46ff   ; $19
	dw Func_00b_4750   ; $1a
	dw Func_00b_4781   ; $1b
	dw Func_00b_4796   ; $1c
	dw Func_00b_47aa   ; $1d
	dw Func_00b_47f1   ; $1e
	dw Func_00b_4811   ; $1f
	dw Func_00b_481e   ; $20
	dw Func_00b_496f   ; $21
	dw Func_00b_498c   ; $22
	dw Func_00b_49a7   ; $23
	dw Func_00b_49db   ; $24
	dw Func_00b_4a48   ; $25
	dw Func_00b_4a55   ; $26
	dw Func_00b_4a6e   ; $27
	dw Func_00b_4a86   ; $28
	dw Func_00b_4a9a   ; $29
	dw Func_00b_4aaa   ; $2a
	dw Func_00b_4acb   ; $2b
	dw Func_00b_4afc   ; $2c
	dw Func_00b_4b2f   ; $2d
	dw Func_00b_4b73   ; $2e
	dw Func_00b_4b91   ; $2f
	dw Func_00b_4bc4   ; $30
	dw Func_00b_4bef   ; $31
	dw Func_00b_4c1b   ; $32
	dw Func_00b_4c5f   ; $33
	dw Func_00b_4ca3   ; $34
	dw Func_00b_4cc5   ; $35
	dw Func_00b_4cde   ; $36
	dw Func_00b_4cee   ; $37
	dw Func_00b_4dea   ; $38
	dw Func_00b_4df5   ; $39
	dw Func_00b_4e0d   ; $3a
	dw Func_00b_4e39   ; $3b
	dw Func_00b_4ea0   ; $3c
	dw Func_00b_4ede   ; $3d
	dw Func_00b_4f2f   ; $3e
	dw Func_00b_4f48   ; $3f
	dw Func_00b_4f99   ; $40
	dw Func_00b_4fb4   ; $41
	dw Func_00b_4fe7   ; $42
	dw Func_00b_502c   ; $43
	dw Func_00b_50cd   ; $44
	dw Func_00b_50d8   ; $45
	dw Func_00b_5118   ; $46
	dw Func_00b_5141   ; $47
	dw Func_00b_516b   ; $48
	dw Func_00b_5198   ; $49
	dw Func_00b_5235   ; $4a
	dw Func_00b_52c1   ; $4b
	dw Func_00b_52e1   ; $4c
	dw Func_00b_52f0   ; $4d
	dw Func_00b_5332   ; $4e
	dw Func_00b_536a   ; $4f
	dw Func_00b_53ad   ; $50
	dw Func_00b_5415   ; $51
	dw Func_00b_545e   ; $52
	dw Func_00b_546a   ; $53
	dw Func_00b_548c   ; $54
	dw Func_00b_54c8   ; $55
	dw Func_00b_5506   ; $56
	dw Func_00b_552d   ; $57
	dw Func_00b_5537   ; $58
	dw Func_00b_5562   ; $59
	dw Func_00b_55b7   ; $5a
	dw Func_00b_55fe   ; $5b
	dw Func_00b_5630   ; $5c
	dw Func_00b_566a   ; $5d
	dw Func_00b_569a   ; $5e
	dw Func_00b_56a8   ; $5f
	dw Func_00b_5895   ; $60
	dw Func_00b_58a2   ; $61
	dw Func_00b_58ad   ; $62
	dw Func_00b_58cd   ; $63
	dw Func_00b_590a   ; $64
	dw Func_00b_5929   ; $65
	dw Func_00b_593a   ; $66
	dw Func_00b_595e   ; $67
	dw Func_00b_5999   ; $68
	dw Func_00b_5a09   ; $69
	dw Func_00b_5a18   ; $6a
	dw Func_00b_5abd   ; $6b
	dw Func_00b_5ae1   ; $6c
	dw Func_00b_5af7   ; $6d
	dw Func_00b_5b76   ; $6e
	dw Func_00b_5db7   ; $6f
	dw Func_00b_5e8d   ; $70
	dw Func_00b_5e9b   ; $71
	dw Func_00b_5ea9   ; $72
	dw Func_00b_5ee7   ; $73
	dw Func_00b_5f5e   ; $74
	dw Func_00b_5f69   ; $75
	dw Func_00b_5ff6   ; $76
	dw Func_00b_6004   ; $77

Script_continue:
	call GetScriptByte
	ret

Func_00b_4344:
	call Func_00b_4369
	call GetScriptByte
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	ld hl, 3
	add hl, bc
	ld a, [wScriptByte]
	ld [hli], a
	inc hl
	ld [hl], 0
	ld hl, $0d
	add hl, bc
	ld [hl], 1
	xor a
	ld [wScriptByte], a
	call Func_06f8
	ret

Func_00b_4369:
	call GetScriptByte
	ld a, [wScriptByte]
	cp $88
	jr z, .asm_437f
	cp $99
	jr z, .asm_4386
	swap a
	sla a
	ld [wcbfb], a
	ret

.asm_437f
	ld a, [wcd0b]
	ld [wcbfb], a
	ret

.asm_4386
	ld a, [wdce5]
	swap a
	sla a
	ld [wcbfb], a
	ret

Func_00b_4391:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfc], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfd], a
	ld a, 3
	ld [wScriptByte], a
	ret

Func_00b_43a9:
; Delay?
	ld hl, wcbfc
	ldh a, [hFF9D]
	and [hl]
	ret nz
	ld a, [wcbfd]
	dec a
	ld [wcbfd], a
	ret nz

	xor a
	ld [wScriptByte], a
	ret

Func_00b_43bd:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfe], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wcbfe + 1], a
	ld a, 1
	ldh [hFFBC], a
	call Func_00b_43fc
	xor a
	ld [wScriptByte], a
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	ld hl, 3
	add hl, bc
	ld a, [wcd03]
	srl a
	ld a, 0
	rla
	ld e, a
	ld a, 1
	sub e
	ld e, a
	ld a, [wcd03]
	and $0e
	add e
	ld [hl], a
	call Func_06f8
	ret

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
	call Func_00b_4369
	call GetScriptByte
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	ld hl, $08
	add hl, bc
	ld a, [wScriptByte]
	ld [hl], a
	ld hl, $10
	add hl, bc
	ld [hl], a
	ld hl, $0f
	add hl, bc
	ld [hl], $02
	ld a, $07
	ld [wScriptByte], a
	ret

Func_00b_4454:
	call Func_0639
	call Func_00b_445e
	call Func_0426
	ret

Func_00b_445e:
	ld a, [wd1e2]
	and a
	ret z

	ld hl, wcd00
	ld a, [wcd08]
	cp [hl]
	jr z, .asm_4472
	jr c, .asm_4471

	inc [hl]
	jr .asm_4472

.asm_4471
	dec [hl]

.asm_4472
	ld hl, wcd01
	ld a, [wcd09]
	cp [hl]
	ret z
	jr c, .asm_447e
	inc [hl]
	ret

.asm_447e
	dec [hl]
	ret

Func_00b_4480:
	call Func_00b_4369
	ld a, [wcbfb]
	ld c, a
	ld b, $cd
	ld a, [bc]
	ld [wcd08], a
	inc bc
	ld a, [bc]
	ld [wcd09], a
	ld a, 1
	ld [wd1e2], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_449c:
	xor a
	ldh [hFFD6], a
	ldh [hFFA7], a
	ld [wd0f0], a
	call Func_0817
	call Func_19b6
	ret

Script_checkbit:
	call Func_00b_44e2
	bit 0, b
	jr nz, .asm_44c9

	ld hl, wScriptPos
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, 2
	add hl, de
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a
	xor a
	ld [wScriptByte], a
	ret

.asm_44c9
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wScriptPos + 1], a
	pop af
	ld [wScriptPos], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_44e2:
	call GetScriptByte
	ld a, [wScriptByte]
	push af
	call GetScriptByte
	ld a, [wScriptByte]
	ld h, a
	pop af
	ld l, a
	push hl
	call GetScriptByte
	pop hl
	ld a, [hl]
	ld b, a
	ld a, [wScriptByte]
	ld c, a
	and a
	ret z
.asm_44ff
	rrc b
	dec c
	jr nz, .asm_44ff
	ret

Script_setbit:
	call Func_00b_44e2
	set 0, b
	ld a, [wScriptByte]
	ld c, a
	and a
	jr z, .asm_4516
.asm_4511
	rlc b
	dec c
	jr nz, .asm_4511

.asm_4516
	ld a, b
	ld [hl], a
	xor a
	ld [wScriptByte], a
	ret

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
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcc8], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcc8 + 1], a
	ld a, $0e
	ld [wScriptByte], a
	ret

unk_00b_454f:
	dr $2c54f, $2c55f

Func_00b_455f:
	call DelayFrame
	call Func_00b_653d
	call Func_00b_6229
	call Func_00b_625c
	ret

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
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcca], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdccb], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdccd], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcce], a

	xor a
	ld [wScriptByte], a
	ld [wdccc], a
	ld a, 1
	ld [wdccf], a
	ret

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
; Display emote
	ld a, SFX_44
	call PlaySound
	call Func_00b_4369
	call GetScriptByte
	ld bc, wd1a0
.asm_460d
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_461d

	ld hl, 8
	add hl, bc
	ld c, l
	ld b, h
	jr .asm_460d

.asm_461d
	ld hl, 3
	add hl, bc
	ld a, [wScriptByte]
	ld [hli], a
	ld a, [wcbfb]
	ld e, a
	ld [hl], a
	ld d, $cd
	ld hl, unk_00b_466b
	ld a, [wScriptByte]
	cp $06
	jr z, .asm_4650

.asm_4636
	add a
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [de]
	add [hl]
	ld [bc], a
	inc hl
	inc de
	inc bc
	ld a, [de]
	add [hl]
	ld [bc], a
	inc bc
	inc hl
	ld a, [hl]
	ld [bc], a
	xor a
	ld [wScriptByte], a
	ret

.asm_4650
	ld hl, unk_00b_465b
	ld a, [wcd03]
	sub $0e
	jr .asm_4636
	ret ; ?

unk_00b_465b:
	dr $2c65b, $2c66b

unk_00b_466b:
	dr $2c66b, $2c683

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
	call Func_00b_4369

Func_00b_4799:
	ld a, [wcbfb]
	ld l, a
	ld h, $cd
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ld [wScriptByte], a
	ret

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
	dr $2c81e, $2c96f
	
Func_00b_496f:
	dr $2c96f, $2c98c

Func_00b_498c:
	dr $2c98c, $2c9a7

Func_00b_49a7:
	dr $2c9a7, $2c9db

Func_00b_49db:
	dr $2c9db, $2ca48

Func_00b_4a48:
	dr $2ca48, $2ca55

Func_00b_4a55:
	dr $2ca55, $2ca6e

Func_00b_4a6e:
	dr $2ca6e, $2ca86

Func_00b_4a86:
	dr $2ca86, $2ca9a

Func_00b_4a9a:
	dr $2ca9a, $2caaa

Func_00b_4aaa:
	dr $2caaa, $2cacb

Func_00b_4acb:
	dr $2cacb, $2cafc

Func_00b_4afc:
	dr $2cafc, $2cb2f

Func_00b_4b2f:
	dr $2cb2f, $2cb73

Func_00b_4b73:
	dr $2cb73, $2cb91

Func_00b_4b91:
	dr $2cb91, $2cbc4

Func_00b_4bc4:
	dr $2cbc4, $2cbef

Func_00b_4bef:
	dr $2cbef, $2cc1b

Func_00b_4c1b:
	dr $2cc1b, $2cc5f

Func_00b_4c5f:
	dr $2cc5f, $2cca3

Func_00b_4ca3:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wd0fa], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFF9B], a
	call GetScriptByte
	ld a, [wScriptByte]
	ldh [hFF9C], a
	ld a, $01
	ldh [hFFBF], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4cc5:
	dr $2ccc5, $2ccde

Func_00b_4cde:
	ld a, BGM_59
	call PlaySound
	farcall Func_039_4892
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4cee:
	ld a, SFX_29
	call PlaySound
	call Func_00b_4dc5
	call Func_00b_4dc5
	call Func_00b_4dc5
	call Func_00b_4d04
	xor a
	ld [wScriptByte], a
	ret

Func_00b_4d04:
	dr $2cd04, $2cdc5

Func_00b_4dc5:
	dr $2cdc5, $2cdea

Func_00b_4dea:
	dr $2cdea, $2cdf5

Func_00b_4df5:
	dr $2cdf5, $2ce0d

Func_00b_4e0d:
	dr $2ce0d, $2ce39

Func_00b_4e39:
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcc8], a
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcc8 + 1], a
	farcall Func_02d_507b
	ld a, $01
	ld [hFFD3], a
	xor a
	ld [wd3fe], a
	ld [wScriptByte], a
	ld a, $0c
	ld [wd3ff], a
	xor a
	ld [wd987], a
	ld hl, wd876
	ld a, l
	ld [wd984], a
	ld a, h
	ld [wd984 + 1], a
	ld a, [hl]
	ld [wEnemyMonSpecies], a
	ld bc, wPartyMons
	ld e, 0
.asm_4e7a:
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_4e90

	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc e
	ld a, l
	cp $80
	jr nc, .asm_4e90

	ld c, l
	ld b, h
	jr .asm_4e7a

.asm_4e90
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd981 + 1], a
	ld a, e
	ld [wd983], a
	call DelayFrame
	ret

Func_00b_4ea0:
	dr $2cea0, $2cede

Func_00b_4ede:
	dr $2cede, $2cf2f

Func_00b_4f2f:
	dr $2cf2f, $2cf48

Func_00b_4f48:
	dr $2cf48, $2cf99

Func_00b_4f99:
	dr $2cf99, $2cfb4

Func_00b_4fb4:
	dr $2cfb4, $2cfe7

Func_00b_4fe7:
	dr $2cfe7, $2d02c

Func_00b_502c:
	dr $2d02c, $2d0cd

Func_00b_50cd:
	xor a
	ld [wcd13], a
	ld [wcd12], a
	ld [wScriptByte], a
	ret

Func_00b_50d8:
	dr $2d0d8, $2d118

Func_00b_5118:
	dr $2d118, $2d141

Func_00b_5141:
	dr $2d141, $2d16b

Func_00b_516b:
	dr $2d16b, $2d198

Func_00b_5198:
	dr $2d198, $2d235

Func_00b_5235:
	dr $2d235, $2d273

Func_00b_5273::
	dr $2d273, $2d2c1

Func_00b_52c1:
	dr $2d2c1, $2d2e1

Func_00b_52e1:
	dr $2d2e1, $2d2f0

Func_00b_52f0:
	dr $2d2f0, $2d332

Func_00b_5332:
	dr $2d332, $2d36a

Func_00b_536a:
	dr $2d36a, $2d3ad

Func_00b_53ad:
	dr $2d3ad, $2d415

Func_00b_5415:
	dr $2d415, $2d45e

Func_00b_545e:
	dr $2d45e, $2d46a

Func_00b_546a:
	dr $2d46a, $2d48c

Func_00b_548c:
	dr $2d48c, $2d4c8

Func_00b_54c8:
	dr $2d4c8, $2d506

Func_00b_5506:
	dr $2d506, $2d52d

Func_00b_552d:
	dr $2d52d, $2d537

Func_00b_5537:
	dr $2d537, $2d562

Func_00b_5562:
	dr $2d562, $2d5b7

Func_00b_55b7:
	dr $2d5b7, $2d5fe

Func_00b_55fe:
	dr $2d5fe, $2d630

Func_00b_5630:
	dr $2d630, $2d66a

Func_00b_566a:
	dr $2d66a, $2d69a

Func_00b_569a:
; Follower
	call GetScriptByte
	ld a, [wScriptByte]
	ld [wdcea], a
	xor a
	ld [wScriptByte], a
	ret

Func_00b_56a8:
	dr $2d6a8, $2d895

Func_00b_5895:
	dr $2d895, $2d8a2

Func_00b_58a2:
	dr $2d8a2, $2d8ad

Func_00b_58ad:
	dr $2d8ad, $2d8cd

Func_00b_58cd:
	dr $2d8cd, $2d90a

Func_00b_590a:
	dr $2d90a, $2d929

Func_00b_5929:
	dr $2d929, $2d93a

Func_00b_593a:
	dr $2d93a, $2d95e

Func_00b_595e:
	dr $2d95e, $2d999

Func_00b_5999:
	dr $2d999, $2da09

Func_00b_5a09:
	dr $2da09, $2da18

Func_00b_5a18:
	dr $2da18, $2dabd

Func_00b_5abd:
	dr $2dabd, $2dae1

Func_00b_5ae1:
	dr $2dae1, $2daf7

Func_00b_5af7:
	dr $2daf7, $2db76

Func_00b_5b76:
	dr $2db76, $2ddb7

Func_00b_5db7:
	dr $2ddb7, $2de8d

Func_00b_5e8d:
	dr $2de8d, $2de9b

Func_00b_5e9b:
	dr $2de9b, $2dea9

Func_00b_5ea9:
	dr $2dea9, $2dee7

Func_00b_5ee7:
	dr $2dee7, $2df5e

Func_00b_5f5e:
	dr $2df5e, $2df69

Func_00b_5f69:
	dr $2df69, $2dff6

Func_00b_5ff6:
	dr $2dff6, $2e004

Func_00b_6004:
	dr $2e004, $2e06f

Func_00b_606f:
	ld a, [wdccf]
	and a
	ret z
	ldh a, [hFF9D]
	and $07
	ret nz

	ld a, [wdccd]
	ld l, a
	ld a, [wdcce]
	ld h, a
	ld a, [wdccc]
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wdcca]
	ld l, a
	ld a, [wdccb]
	ld h, a
	ld a, [de]
	cp $ff
	jr z, .asm_60ad

	ld b, a
	ldh [hFF92], a
	inc de
	ld a, [de]
	ld c, a
	ldh [hFF93], a
	inc de
	call Func_00b_65f6
	ld a, [wdccc]
	inc a
	ld [wdccc], a
	ret

.asm_60ad
	xor a
	ld [wdccf], a
	ret

Func_00b_60b2:
	dr $2e0b2, $2e0dd

Func_00b_60dd:
	ldh a, [hFFA7]
	and a
	ret nz

	ld a, [wdcc8]
	ld l, a
	ld a, [wdcc8 + 1]
	ld h, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_60f5

	xor a
	ld [wScriptByte], a
	ldh [hFFA7], a
	ret

.asm_60f5
	inc a
	ld [hFFA7], a
	ld a, l
	ld [wdcc8], a
	ld a, h
	ld [wdcc8 + 1], a
	ld a, $10
	ld [hFFA6], a
	ld a, 1
	ldh [hFFAC], a
	ret

Func_00b_610b:
	dr $2e10b, $2e1d6

Func_00b_61d6:
	dr $2e1d6, $2e229

Func_00b_6229:
	dr $2e229, $2e25c

Func_00b_625c:
	dr $2e25c, $2e53d

Func_00b_653d:
	dr $2e53d, $2e5f6

Func_00b_65f6:
	dr $2e5f6, $2f1e0

SECTION "banknumb", ROMX[$7fff], BANK[$b]
	db $b
