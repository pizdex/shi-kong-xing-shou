Func_005_4000::
	dr $14000, $1401d

Func_005_401d::
	dr $1401d, $1406b

Func_005_406b::
	dr $1406b, $14093

Func_005_4093::
	dr $14093, $141fb

Func_005_41fb::
	dr $141fb, $14275

Func_005_4275:
	dr $14275, $142d3

Func_005_42d3:
	dr $142d3, $142f5

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
	jr nz, .down
	bit D_UP_F, a
	jr nz, .up
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	jr nz, .right

	jr .asm_4c1c

.down:
	add hl, de

.up:
	add hl, de

.left:
	add hl, de

.right:
	add hl, de

.asm_4c1c:
	ld a, [hli]
	ldh [hFF9E], a
	ld a, [hli]
	ldh [hSimulatedJoypadState], a
	ld a, [hli]
	ld [wd1f9], a
	ld a, [hli]
	ld [wd1fa], a
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
	dr $14c3a, $14c69

Func_005_4c69:
	dr $14c69, $14e4e

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
	dr $14f48, $150a5

Func_005_50a5:
	farcall Func_02d_5086
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
.asm_50c3:
	ld hl, 2
	add hl, bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_50d8

	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	inc e
	ld a, l
	cp $80
	ret nc

	ld c, l
	ld b, h
	jr .asm_50c3

.asm_50d8:
	ld a, e
	ld [wd983], a
	ld a, c
	ld [wd981], a
	ld a, b
	ld [wd981 + 1], a
	ret

Func_005_50e5:
	dr $150e5, $151db

Func_005_51db:
	xor a
	ld [wdcea], a
	ld hl, wcd20
	ld bc, 3
; ???
	xor a
.asm_51e6
	ld [hli], a
	dec c
	ld a, c
	or b
	jr nz, .asm_51e6
	ret

Func_005_51ed:
	dr $151ed, $15a8e

Func_005_5a8e:
	ld hl, wcd00
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

Func_005_5a9c:
	dr $15a9c, $15cf0


SECTION "banknum5", ROMX[$7fff], BANK[$5]
	db $5
