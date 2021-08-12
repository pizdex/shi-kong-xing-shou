Func_02d_4000:
	dr $b4000, $b507b

Func_02d_507b::
	ld a, [wMovementPointer]
	ld l, a
	ld a, [wMovementPointer + 1]
	ld h, a
	jp Func_02d_50b3

Func_02d_5086::
	dr $b5086, $b50b3

Func_02d_50b3:
	dr $b50b3, $b510c

Func_02d_510c:
	push hl
	push bc

	ld hl, wd876
	ld c, $84
	xor a
.clear
	ld [hli], a
	dec c
	jr nz, .clear

	pop bc
	pop hl
	ret

Func_02d_511b:
	dr $b511b, $b5147

Func_02d_5147:
; Load wild mon encounter data

; Get species and level
	ld hl, 0
	add hl, bc ; ld hl, bc
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR

	ld hl, 4
	add hl, bc
REPT 4
	ld a, [de]
	inc de
	ld [hli], a
ENDR

	ld hl, 10
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, 13
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, 16
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a

	ld hl, 19
	add hl, bc
	ld [hl], 0
	inc hl
REPT 2
	ld a, [de]
	inc de
	ld [hli], a
ENDR
	ret

Func_02d_5184:
	dr $b5184, $b51f1

Func_02d_51f1:
	ld hl, 2
	add hl, bc
	ldh a, [hFFCB]
	ld [hli], a
	ldh a, [hFFCC]
	ld [hli], a

	ld hl, 7
	add hl, bc
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, 8
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, 11
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, 14
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a
	ld a, [hl]
	ld [wd9bf], a
	push bc
	farcall Func_024_4053
	pop bc

	ld hl, 17
	add hl, bc
	ld a, [wd9bf]
	ld [hli], a
	ld [hli], a

	ld hl, 19
	add hl, bc
	ld [hl], 0
	ret

unk_02d_525a:
	dr $b525a, $b5294

unk_02d_5294:
	dr $b5294, $b64b0


SECTION "banknum2d", ROMX[$7fff], BANK[$2d]
	db $2d
