Func_030_4000::
	ld a, [wd986]
	and a
	jr z, .asm_4018
	ld a, [wd9ea]
	and a
	jr z, .asm_4018

	xor a
	ld [wd9ea], a
	ld de, unk_030_4335
	ld a, [wd9f3]
	jr .asm_401e

.asm_4018
	ld de, MoveEffectPointers
	ld a, [wd988]

.asm_401e
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Func_030_4027::
	dr $c0027, $c02ab

Func_030_42ab:
	dr $c02ab, $c02db

unk_030_42db:
	dr $c02db, $c0335

unk_030_4335:
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_542e
	dw Func_030_541a
	dw Func_030_5141
	dw Func_030_4fd4
	dw Func_030_4fef
	dw Func_030_51c2
	dw Func_030_505d
	dw Func_030_442a
	dw Func_030_5448
	dw Func_030_4bcb
	dw Func_030_4442
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385
	dw Func_030_4385

Func_030_4385:
	ld a, [wd993]
	and a
	jr nz, .asm_4395

	ld a, $52
	ld [wd3ff], a
	xor a
	ld [wd98b], a
	ret

.asm_4395:
	ld a, [wd984]
	ld e, a
	ld a, [wd984 + 1]
	ld d, a
	call SetCaughtMon
	ld a, $ff
	ld [wd9ea], a
	ld bc, wPartyMons
.room_in_party
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .next_slot

; Copy wild mon data into empty slot
	ld a, [wd984]
	ld e, a
	ld a, [wd984 + 1]
	ld d, a
	ld b, PARTYMON_STRUCT_LENGTH
.copy
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .copy

	ld a, $01
	ld [wd9b5], a
	ld a, $51
	ld [wd3ff], a
	ld a, $05
	ld [wd98b], a
	ret

.next_slot
	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp LOW($d280)
	jr c, .room_in_party

; No free slot
	ld a, $01
	ld [wd9b5], a
	ld a, $53
	ld [wd3ff], a
	ld a, $05
	ld [wd98b], a
	call Func_030_43ee
	ret

Func_030_43ee:
	dr $c03ee, $c0416

SetCaughtMon:
	push de
	push hl
	ld hl, wd7cb
; check if species is valid
	ld a, [de]
	cp NUM_MONS
	jr nc, .exit

; @bug: $00 is considered valid, however 'dec a' causes this to become $ff
	dec a
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], $02
.exit
	pop de
	pop hl
	ret

Func_030_442a:
	dr $c042a, $c0442

Func_030_4442:
	dr $c0442, $c04ab

MoveEffectPointers:
	dw Func_030_55a5 ; $00
	dw Func_030_555c ; $01
	dw Func_030_5603 ; $02
	dw Func_030_564a ; $03
	dw Func_030_54de ; $04
	dw Func_030_5486 ; $05
	dw Func_030_5465 ; $06
	dw Func_030_55a5 ; $07
	dw Func_030_5441 ; $08
	dw Func_030_564a ; $09
	dw Func_030_564a ; $0a
	dw Func_030_542e ; $0b
	dw Func_030_541a ; $0c
	dw Func_030_53ba ; $0d
	dw Func_030_52c3 ; $0e
	dw Func_030_564a ; $0f
	dw Func_030_5249 ; $10
	dw Func_030_5231 ; $11
	dw Func_030_51da ; $12
	dw Func_030_51bb ; $13
	dw Func_030_5190 ; $14
	dw Func_030_5249 ; $15
	dw Func_030_5155 ; $16
	dw Func_030_5441 ; $17
	dw Func_030_542e ; $18
	dw Func_030_564a ; $19
	dw Func_030_564a ; $1a
	dw Func_030_513a ; $1b
	dw Func_030_564a ; $1c
	dw Func_030_50f8 ; $1d
	dw Func_030_564a ; $1e
	dw Func_030_564a ; $1f
	dw Func_030_564a ; $20
	dw Func_030_564a ; $21
	dw Func_030_50cc ; $22
	dw Func_030_50a4 ; $23
	dw Func_030_5074 ; $24
	dw Func_030_5056 ; $25
	dw Func_030_5003 ; $26
	dw Func_030_4fe8 ; $27
	dw Func_030_541a ; $28
	dw Func_030_4fd4 ; $29
	dw Func_030_564a ; $2a
	dw Func_030_564a ; $2b
	dw Func_030_564a ; $2c
	dw Func_030_564a ; $2d
	dw Func_030_564a ; $2e
	dw Func_030_4f9f ; $2f
	dw Func_030_541a ; $30
	dw Func_030_5155 ; $31
	dw Func_030_564a ; $32
	dw Func_030_564a ; $33
	dw Func_030_4f5f ; $34
	dw Func_030_564a ; $35
	dw Func_030_4f10 ; $36
	dw Func_030_564a ; $37
	dw Func_030_564a ; $38
	dw Func_030_4eca ; $39
	dw Func_030_4eca ; $3a
	dw Func_030_4e79 ; $3b
	dw Func_030_4e28 ; $3c
	dw Func_030_4e0b ; $3d
	dw Func_030_4d64 ; $3e
	dw Func_030_564a ; $3f
	dw Func_030_4d13 ; $40
	dw Func_030_564a ; $41
	dw Func_030_4d13 ; $42
	dw Func_030_564a ; $43
	dw Func_030_564a ; $44
	dw Func_030_5190 ; $45
	dw Func_030_4cca ; $46
	dw Func_030_4c50 ; $47
	dw Func_030_564a ; $48
	dw Func_030_564a ; $49
	dw Func_030_4c12 ; $4a
	dw Func_030_564a ; $4b
	dw Func_030_564a ; $4c
	dw Func_030_4be3 ; $4d
	dw Func_030_4bb1 ; $4e
	dw Func_030_4b94 ; $4f
	dw Func_030_564a ; $50
	dw Func_030_564a ; $51
	dw Func_030_564a ; $52
	dw Func_030_4b4d ; $53
	dw Func_030_564a ; $54
	dw Func_030_564a ; $55
	dw Func_030_50cc ; $56
	dw Func_030_4e79 ; $57
	dw Func_030_564a ; $58
	dw Func_030_4b30 ; $59
	dw Func_030_4e79 ; $5a
	dw Func_030_4b30 ; $5b
	dw Func_030_4e93 ; $5c
	dw Func_030_4b1b ; $5d
	dw Func_030_564a ; $5e
	dw Func_030_4aec ; $5f
	dw Func_030_564a ; $60
	dw Func_030_4aa5 ; $61
	dw Func_030_564a ; $62
	dw Func_030_4a89 ; $63
	dw Func_030_55a5 ; $64
	dw Func_030_4b2d ; $65
	dw Func_030_4a3d ; $66
	dw Func_030_4b30 ; $67
	dw Func_030_4a20 ; $68
	dw Func_030_4a20 ; $69
	dw Func_030_4a03 ; $6a
	dw Func_030_49d2 ; $6b
	dw Func_030_564a ; $6c
	dw Func_030_55a5 ; $6d
	dw Func_030_50f8 ; $6e
	dw Func_030_5441 ; $6f
	dw Func_030_498e ; $70
	dw Func_030_53ba ; $71
	dw Func_030_4aec ; $72
	dw Func_030_4aec ; $73
	dw Func_030_4aec ; $74
	dw Func_030_564a ; $75
	dw Func_030_564a ; $76
	dw Func_030_4973 ; $77
	dw Func_030_4950 ; $78
	dw Func_030_4950 ; $79
	dw Func_030_4919 ; $7a
	dw Func_030_48c5 ; $7b
	dw Func_030_48bb ; $7c
	dw Func_030_4873 ; $7d
	dw Func_030_485d ; $7e
	dw Func_030_480b ; $7f
	dw Func_030_4a3d ; $80
	dw Func_030_47ee ; $81
	dw Func_030_51da ; $82
	dw Func_030_564a ; $83
	dw Func_030_4793 ; $84
	dw Func_030_470d ; $85
	dw Func_030_46ed ; $86
	dw Func_030_46ce ; $87
	dw Func_030_4689 ; $88
	dw Func_030_4641 ; $89
	dw Func_030_462d ; $8a
	dw Func_030_4619 ; $8b
	dw Func_030_4605 ; $8c
	dw Func_030_45fb ; $8d
	dw Func_030_564a ; $8e

Func_030_45c9:
	ld de, unk_030_565c
	ld a, [wd98f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $8000
	call CopyBytesVRAM
	ret

Func_030_45e2:
	ld de, unk_030_58f8
	ld a, [wd98f]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; size
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, $8000
	call CopyBytesVRAM
	ret

Func_030_45fb:
	ld a, $02
	ld [wd98b], a
	xor a
	ld [wd9b5], a
	ret

Func_030_4605:
	dr $c0605, $c0619

Func_030_4619:
	dr $c0619, $c062d

Func_030_462d:
	dr $c062d, $c0641

Func_030_4641:
	dr $c0641, $c0689

Func_030_4689:
	dr $c0689, $c06ce

Func_030_46ce:
	dr $c06ce, $c06ed

Func_030_46ed:
	dr $c06ed, $c070d

Func_030_470d:
	dr $c070d, $c0793

Func_030_4793:
	dr $c0793, $c07ee

Func_030_47ee:
	dr $c07ee, $c080b

Func_030_480b:
	dr $c080b, $c085d

Func_030_485d:
	dr $c085d, $c0873

Func_030_4873:
	dr $c0873, $c08bb

Func_030_48bb:
	dr $c08bb, $c08c5

Func_030_48c5:
	dr $c08c5, $c0919

Func_030_4919:
	dr $c0919, $c0950

Func_030_4950:
	dr $c0950, $c0973

Func_030_4973:
	dr $c0973, $c098e

Func_030_498e:
	dr $c098e, $c09d2

Func_030_49d2:
	dr $c09d2, $c0a03

Func_030_4a03:
	dr $c0a03, $c0a20

Func_030_4a20:
	dr $c0a20, $c0a3d

Func_030_4a3d:
	dr $c0a3d, $c0a89

Func_030_4a89:
	dr $c0a89, $c0aa5

Func_030_4aa5:
	dr $c0aa5, $c0aec

Func_030_4aec:
	dr $c0aec, $c0b1b

Func_030_4b1b:
	dr $c0b1b, $c0b2d

Func_030_4b2d:
	dr $c0b2d, $c0b30

Func_030_4b30:
	dr $c0b30, $c0b4d

Func_030_4b4d:
	dr $c0b4d, $c0b94

Func_030_4b94:
	dr $c0b94, $c0bb1

Func_030_4bb1:
	dr $c0bb1, $c0bcb

Func_030_4bcb:
	dr $c0bcb, $c0be3

Func_030_4be3:
	dr $c0be3, $c0c12

Func_030_4c12:
	dr $c0c12, $c0c50

Func_030_4c50:
	dr $c0c50, $c0cca

Func_030_4cca:
	dr $c0cca, $c0d13

Func_030_4d13:
	dr $c0d13, $c0d64

Func_030_4d64:
	dr $c0d64, $c0e0b

Func_030_4e0b:
	dr $c0e0b, $c0e28

Func_030_4e28:
	dr $c0e28, $c0e79

Func_030_4e79:
	dr $c0e79, $c0e93

Func_030_4e93:
	dr $c0e93, $c0eca

Func_030_4eca:
	dr $c0eca, $c0f10

Func_030_4f10:
	dr $c0f10, $c0f5f

Func_030_4f5f:
	dr $c0f5f, $c0f9f

Func_030_4f9f:
	dr $c0f9f, $c0fd4

Func_030_4fd4:
	dr $c0fd4, $c0fe8

Func_030_4fe8:
	dr $c0fe8, $c0fef

Func_030_4fef:
	dr $c0fef, $c1003

Func_030_5003:
	dr $c1003, $c1056

Func_030_5056:
	dr $c1056, $c105d

Func_030_505d:
	dr $c105d, $c1074

Func_030_5074:
	dr $c1074, $c10a4

Func_030_50a4:
	dr $c10a4, $c10cc

Func_030_50cc:
	dr $c10cc, $c10f8

Func_030_50f8:
	dr $c10f8, $c113a

Func_030_513a:
	dr $c113a, $c1141

Func_030_5141:
	dr $c1141, $c1155

Func_030_5155:
	dr $c1155, $c1190

Func_030_5190:
	dr $c1190, $c11bb

Func_030_51bb:
	dr $c11bb, $c11c2

Func_030_51c2:
	dr $c11c2, $c11da

Func_030_51da:
	dr $c11da, $c1231

Func_030_5231:
	dr $c1231, $c1249

Func_030_5249:
	dr $c1249, $c12c3

Func_030_52c3:
	dr $c12c3, $c13ba

Func_030_53ba:
	ld a, [wd993]
	and a
	jp z, Func_030_55ab

.asm_53c1
	ld a, $01
	ld [wd9b5], a
	ld a, $3e
	ld [wd3ff], a
	call Func_1159
	call Func_030_53ee
	and a
	jr z, .asm_53c1

	ld a, [wd986]
	and a
	jr z, .asm_53df
	ld de, wd97c
	jr .asm_53e2

.asm_53df
	ld de, wd978
.asm_53e2
	ld a, [wd991]
	and $03
	ld l, a
	ld h, 0
	add hl, de
	ld [hl], $01
	ret

Func_030_53ee:
	ld a, [wd986]
	and a
	jr z, .asm_53fe

	ld a, [wd984]
	ld l, a
	ld a, [wd984 + 1]
	ld h, a
	jr .asm_5406

.asm_53fe
	ld a, [wd981]
	ld l, a
	ld a, [wd981 + 1]
	ld h, a

.asm_5406
	ld bc, 7
	add hl, bc
	ld a, [wd991]
	and $03
	jr z, .asm_5418

.asm_5411
	ld bc, 3
	add hl, bc
	dec a
	jr nz, .asm_5411

.asm_5418
	ld a, [hl]
	ret

Func_030_541a:
	dr $c141a, $c142e

Func_030_542e:
	dr $c142e, $c1441

Func_030_5441:
	dr $c1441, $c1448

Func_030_5448:
	dr $c1448, $c1465

Func_030_5465:
	dr $c1465, $c1486

Func_030_5486:
	dr $c1486, $c14de

Func_030_54de:
	dr $c14de, $c155c

Func_030_555c:
	dr $c155c, $c15a5

Func_030_55a5:
	dr $c15a5, $c15ab

Func_030_55ab:
	dr $c15ab, $c1603

Func_030_5603:
	dr $c1603, $c164a

Func_030_564a:
	dr $c164a, $c165c

unk_030_565c:
	dw .image_566a
	dw .image_572c
	dw .image_57ae
	dw .image_57f0
	dw .image_5832
	dw .image_5874
	dw .image_58b6

.image_566a
	dw $00c0
	INCBIN "gfx/battle/image_30_566c.interleave.w16.2bpp"

.image_572c
	dw $0080
	INCBIN "gfx/battle/image_30_572e.interleave.w16.2bpp"

.image_57ae
	dw $0040
	dr $c17b0, $c17f0

.image_57f0
	dw $0040
	dr $c17f2, $c1832

.image_5832
	dw $0040
	dr $c1834, $c1874

.image_5874
	dw $0040
	dr $c1876, $c18b6

.image_58b6
	dw $0040
	dr $c18b8, $c18f8

unk_030_58f8:
	dr $c18f8, $c39a0


SECTION "banknum30", ROMX[$7fff], BANK[$30]
	db $30
