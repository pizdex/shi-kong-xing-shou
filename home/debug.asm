SECTION "Debug", ROM0[$2ca4]

Func_2ca4::
	ld de, wd284
	ld hl, .unk_2cb8
.asm_2caa
REPT 2
	ld a, [hl]
	ld [de], a
	inc hl
	inc de
ENDR
	dec c ; should be dec bc
	ld a, c
	or b
	jr nz, .asm_2caa
	ret

.unk_2cb8
	db $01, $01
	db $02, $01
	db $03, $01
	db $04, $01
	db $05, $01
	db $06, $01
	db $07, $01
	db $08, $01
	db $09, $01
	db $0a, $01
	db $0b, $01
	db $0c, $01
	db $0d, $01
	db $0e, $01
	db $0f, $01
	db $10, $01
	db $11, $01
	db $12, $01
	db $13, $01
	db $14, $01
	db $15, $01
	db $16, $01
	db $17, $01
	db $18, $01
	db $19, $01
	db $1a, $01
	db $1b, $01
	db $1c, $01
	db $1d, $01
	db $1e, $01
	db $1f, $01
	db $20, $01
	db $21, $01
	db $22, $01
	db $23, $01
	db $24, $01
	db $25, $01
	db $26, $01
	db $27, $01
	db $28, $01

Func_2d08::
	ld de, wddb0
	ld hl, .unk_2d16
.copy
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	jr .copy

.unk_2d16
	db $01, $01
	db $02, $01
	db $03, $01
	db $04, $01
	db $05, $01
	db $06, $01
	db $07, $01
	db $08, $01
	db $09, $01
	db $0a, $01
	db $0f, $01
	db $ff, $ff

.unk_2d2e ; unused
	db $0d, $03
	db $0e, $03
	db $0f, $03
	db $10, $03
	db $11, $03
	db $12, $03
	db $13, $03
	db $14, $03
	db $15, $03
	db $ff, $ff

Debug_GiveItems::
	ld de, wd300
	ld hl, .item_data
.copy
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	jr .copy

.item_data
	db ITEM_04, 99
	db ITEM_26, 50
	db ITEM_26, 99
	db ITEM_27, 99
	db TM13, 1
	db TM33, 1
	db $ff, $ff

.item_data2 ; unused
	db ITEM_08, 12
	db ITEM_09, 12
	db ITEM_0a, 12
	db ITEM_0b, 12
	db ITEM_0c, 12
	db ITEM_0d, 12
	db ITEM_0e, 12
	db ITEM_0f, 12
	db ITEM_10, 12
	db ITEM_11, 12
	db ITEM_12, 12
	db ITEM_13, 12
	db ITEM_14, 12
	db ITEM_15, 12
	db ITEM_16, 12
	db ITEM_17, 12
	db ITEM_18, 12
	db ITEM_19, 12
	db ITEM_1a, 12
	db ITEM_1b, 12
	db ITEM_1c, 12
	db ITEM_1d, 12
	db ITEM_1e, 12
	db ITEM_1f, 12
	db ITEM_20, 12
	db ITEM_21, 12
	db ITEM_22, 12
	db ITEM_23, 12
	db ITEM_24, 12
	db ITEM_25, 12
	db ITEM_26, 12
	db ITEM_27, 12
	db TM01, 12
	db TM02, 12
	db TM03, 12
	db TM04, 12
	db TM05, 12
	db TM06, 12
	db TM07, 12
	db TM08, 12
	db TM09, 12
	db TM10, 12
	db TM11, 12
	db TM12, 12
	db TM13, 12
	db TM14, 12
	db TM15, 12
	db TM16, 12
	db TM17, 12
	db TM18, 12
	db TM19, 12
	db TM20, 12
	db TM21, 12
	db TM22, 12
	db TM23, 12
	db TM24, 12
	db TM25, 12
	db TM26, 12
	db TM27, 12
	db TM28, 12
	db TM29, 12
	db TM30, 12
	db TM31, 12
	db TM32, 12
	db TM33, 12
	db TM34, 12
	db TM35, 12
	db TM36, 12
	db TM37, 12
	db TM38, 12
	db TM39, 12
	db TM40, 12
	db TM41, 12
	db TM42, 12
	db TM43, 12
	db TM44, 12
	db TM45, 12
	db TM46, 12
	db TM47, 12
	db TM48, 12
	db TM49, 12
	db TM50, 12
	db $ff, $ff

Func_2e04::
	ld hl, wdd00
.asm_2e07
	ld [hl], $01
	dec c ; @bad: use dec bc
	ld a, c
	or b
	ret z

	ld de, 8
	add hl, de
	jr .asm_2e07

Func_2e13::
	ld de, wde00
	ld hl, unk_2f40
.copy1
	ld a, [hli]
	ld [de], a
	inc de
	dec c ; @bad: use dec bc
	ld a, c
	or b
	jr nz, .copy1

	ld de, wPartyMon1
	ld hl, wde00
	ld bc, $16
.copy2
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	jr nz, .copy2

	ld a, 2
	ld [wdcea], a
	ret

Func_2e38::
	ld de, wdb20
.asm_2e3b
	ld hl, unk_2f40
	ld bc, $13
.copy
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	and a
	jr nz, .copy

	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $14
	ret nc
	jr .asm_2e3b

Func_2e56::
	ld de, wd7cb
	ld hl, .unk_2ea0
	ld bc, $9e
.copy1
	ld a, [hli]
	ld [de], a
	inc de
; @bad
	dec c
	ld a, c
	or b
	jr nz, .copy1

	ld bc, $0000
.asm_2e6a
	ld de, wdd00
	ld l, c
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld [hl], 1
	inc bc
	ld a, c
	cp 8
	jr c, .asm_2e6a

	ld de, wde00
	ld hl, unk_2f40
	ld bc, $b0
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy2

	ld a, $9f
	ld [wd0d6], a
	ld a, $89
	ld [wd0d5], a
	ld a, $06
	ld [wd0da], a
	ld a, $02
	ld [wdcea], a
	ret

.unk_2ea0
; Dex values (1 is seen, 2 is caught)
	db $01, $01, $01, $01, $01, $02, $02, $02 ; 01
	db $02, $02, $02, $01, $01, $01, $01, $01 ; 02
	db $02, $02, $02, $02, $02, $01, $01, $01 ; 03
	db $01, $01, $02, $02, $02, $02, $02, $01 ; 04
	db $01, $01, $01, $01, $02, $02, $02, $02 ; 05
	db $02, $01, $01, $01, $01, $01, $02, $02 ; 06
	db $02, $02, $02, $01, $01, $01, $01, $01 ; 07
	db $02, $02, $02, $02, $02, $01, $01, $01 ; 08
	db $01, $01, $02, $02, $02, $02, $02, $01 ; 09
	db $01, $01, $01, $01, $02, $02, $02, $02 ; 10
	db $02, $01, $01, $01, $01, $01, $02, $02 ; 11
	db $02, $02, $02, $01, $01, $01, $01, $01 ; 12
	db $02, $02, $02, $02, $02, $01, $01, $01 ; 13
	db $01, $01, $02, $02, $02, $02, $02, $01 ; 14
	db $01, $01, $01, $01, $02, $02, $02, $02 ; 15
	db $02, $01, $01, $01, $01, $01, $02, $02 ; 16
	db $02, $02, $02, $01, $01, $01, $01, $01 ; 17
	db $02, $02, $02, $02, $02, $01, $01, $01 ; 18
	db $01, $01, $02, $02, $02, $02, $02, $02 ; 19
	db $02, $02, $01, $01, $01, $01, $01, $01 ; 20?

unk_2f40::
; Partner 1 mon data
	db MON_081 ; species
	db 90 ; level
	dw $005a ; HP
	db $05, $00, $00 ; exp
	db $02, 20, 20 ; move 1
	db $77, 20, 20 ; move 2
	db $89, 20, 20 ; move 3
	db $88, 20, 20 ; move 4
	db $00 ; status
	db $00 ; item
	db 0

; Partner 2 mon data
	db MON_117
	db 90
	dw $005a
	db $00, $00, $00
	db $09, 12, 12
	db $86, 12, 12
	db $00, 12, 12
	db $00, 12, 12
	db $00
	db $00
	db 0

; Partner 3 mon data
	db MON_108
	db 90
	dw $005a
	db $20, $cb, $00
	db $03, 12, 12
	db $04, 12, 12
	db $05, 12, 12
	db $06, 12, 12
	db $00
	db $00
	db 0

; Partner 4 mon data
	db MON_091
	db 90
	dw $005a
	db $20, $cb, $00
	db $04, 12, 12
	db $05, 12, 12
	db $06, 12, 12
	db $07, 12, 12
	db $00
	db $00
	db 0

; Partner 5 mon data
	db MON_099
	db 90
	dw $005a
	db $00, $00, $00
	db $05, 12, 12
	db $06, 12, 12
	db $07, 12, 12
	db $08, 12, 12
	db $00
	db $05
	db 0

; Partner 6 mon data
	db MON_145
	db 90
	dw $005a
	db $00, $00, $00
	db $06, 12, 12
	db $07, 12, 12
	db $08, 12, 12
	db $09, 12, 12
	db $00
	db $06
	db 0

; Partner 7 mon data
	db MON_144
	db 90
	dw $005a
	db $00, $00, $00
	db $07, 12, 12
	db $08, 12, 12
	db $09, 12, 12
	db $0a, 12, 12
	db $00
	db $07
	db 0

; Partner 8 mon data
	db MON_126
	db 90
	dw $005a
	db $00, $00, $00
	db $08, 12, 12
	db $09, 12, 12
	db $0a, 12, 12
	db $0b, 12, 12
	db $00
	db $08
	db 0
