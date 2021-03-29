Func_005_4000::
	dr $14000, $14093

Func_005_4093::
	dr $14093, $141fb

Func_005_41fb::
	dr $141fb, $14275

Func_005_4275:
	dr $14275, $142f5

Func_005_42f5:
	call Func_0b39
	jp Func_005_4275

Func_005_42fb:
	dr $142fb, $14bc1

Func_005_4bc1:
	dr $14bc1, $14bfa

.asm_4bfa:
	ld de, 6
	ldh a, [hJoypadPressed]
	bit START_F, a
	jp nz, Func_005_4f2e

	ldh a, [hJoypadDown]
	bit D_DOWN_F, a
	jr nz, .asm_4c18
	bit D_UP_F, a
	jr nz, .asm_4c19
	bit D_LEFT_F, a
	jr nz, .asm_4c1a
	bit D_RIGHT_F, a
	jr nz, .asm_4c1b

	jr .asm_4c1c

.asm_4c18:
	add hl, de

.asm_4c19:
	add hl, de

.asm_4c1a:
	add hl, de

.asm_4c1b:
	add hl, de

.asm_4c1c:
	ld a, [hli]
	ldh [hFF9E], a
	ld a, [hli]
	ldh [hFFA7], a
	ld a, [hli]
	ld [$d1f9], a
	ld a, [hli]
	ld [$d1fa], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ldh [hFFA1], a
	ldh a, [hFF9E]
	cp $ff
	jr nz, .asm_4c3a
	call Func_005_4e4e
	ret

.asm_4c3a:
	dr $14c3a, $14e4e

Func_005_4e4e:
	dr $14e4e, $14f2e

Func_005_4f2e:
; Init Start Menu
	ld a, 1
	ldh [hFFC5], a
	ld [wd087], a
	xor a
	ld [wd08a], a
	call Func_005_4f3d
	ret

Func_005_4f3d:
	ld hl, wcde0
	ld c, $20
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear
	ret

Func_005_4f48:
	dr $14f48, $15cf0


SECTION "banknum5", ROMX[$7fff], BANK[$5]
	db $5
