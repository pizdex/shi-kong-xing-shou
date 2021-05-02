Func_01f_4000::
; 2bpp
	ld de, unk_01f_4347
	ld a, [wTextFaceID]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8f00
	ld bc, $100
	call CopyBytesVRAM

; palette
	ld de, unk_01f_4139
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 1 palettes
	ld c, BCPSF_AUTOINC | $38
	call LoadPalettes_BCPD
	ret

Func_01f_4028:
; 2bpp
	ld de, unk_01f_4335
	ld a, [wd9dd]
	ld l, a
	ld h, 0
	add hl, hl
	push hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8d00
	ld bc, $100
	call CopyBytesVRAM

; palette
	ld bc, wcab0
	ld hl, 7
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, bc
	ld c, l
	ld b, h
	; ld bc, wcab0 + $38
	ld de, unk_01f_4139
	pop hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	pop de
	ld bc, 1 palettes
	call CopyBytes3
	ret

Func_01f_405d:
	dr $7c05d, $7c139

unk_01f_4139:
	dr $7c139, $7c335

unk_01f_4335:
	dr $7c335, $7c347

unk_01f_4347:
	dw face0
	dw face1
	dw $45bb
	dw $46bb
	dw $47bb
	dw $48bb
	dw $49bb
	dw $4abb
	dw $4bbb
	dw $4cbb
	dw $4dbb
	dw $4ebb
	dw $4fbb
	dw $50bb
	dw $51bb
	dw $52bb
	dw $53bb
	dw $54bb
	dw $55bb
	dw $56bb
	dw $57bb
	dw $58bb
	dw $59bb
	dw $5abb
	dw $5bbb
	dw $5cbb
	dw $5dbb
	dw $5ebb
	dw $5fbb
	dw $60bb
	dw $61bb
	dw $62bb
	dw $63bb
	dw $64bb
	dw $65bb
	dw $66bb
	dw $67bb
	dw $68bb
	dw $69bb
	dw $6abb
	dw $6bbb
	dw $6cbb
	dw $6dbb
	dw $6ebb
	dw $6fbb
	dw $70bb
	dw $71bb
	dw $72bb
	dw $73bb
	dw $74bb
	dw $75bb
	dw $76bb
	dw $77bb
	dw $78bb
	dw $79bb
	dw $7abb
	dw $7bbb
	dw face39

face0:
	dr $7c3bb, $7c4bb

face1:
	dr $7c4bb, $7fcbb

face39:
	dr $7fcbb, $7fdbb

unk_01f_7dbb:
	dr $7fdbb, $7fec0


SECTION "banknum1f", ROMX[$7fff], BANK[$1f]
	db $1f
