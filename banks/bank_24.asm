unk_024_4000:
	dr $90000, $90053

Func_024_4053::
	dr $90053, $90062

Func_024_4062:
	dr $90062, $900fd

Func_024_40fd::
; Start menu related
	ld a, [_BANKNUM]
	ld [wd9f1], a
	ld a, [wd087]
	cp 1
	jr z, .asm_4111
	cp 2
	jr z, .asm_4129
	jp Func_024_4804

.asm_4111:
	ld de, unk_024_4130
	ldh a, [hFFC5]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wd088], a
	ld a, [hli]
	ld [wd088 + 1], a
	ld a, 2
	ld [wd087], a
	ret

.asm_4129
	farcall Func_025_424e
	ret

unk_024_4130:
	dw unk_024_4162
	dw unk_024_4162
	dw unk_024_4181
	dw $41b7
	dw $41cb
	dw $41e3
	dw $41ec
	dw $420a
	dw $4208
	dw $42a5
	dw $42bb
	dw $42cb
	dw $42fa
	dw $430e
	dw $432e
	dw $4343
	dw $4355
	dw $438b
	dw $43af
	dw $4404
	dw $4421
	dw $449d
	dw $4509
	dw $453f
	dw $4304

unk_024_4162:
	dr $90162, $90181

unk_024_4181:
	dr $90181, $90804

Func_024_4804:
	dr $90804, $92ac8

Func_024_6ac8:
; Start menu main loop
.loop
	call Func_024_4062
	call DelayFrame
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ldh a, [hFFC6]
	and a
	jr nz, .asm_6ae0

	call StartMenu_BounceCursor
	call StartMenu_Input
	jr .loop

.asm_6ae0:
	xor a
	ldh [hFFC6], a
	ret

StartMenu_Input:
; Check down
	ldh a, [hJoypadPressed]
	bit D_DOWN_F, a
	jr z, .check_up

; Pressed down
	ld a, SFX_11
	call PlaySound
	ld a, [wd08e]
	inc a
	ld [wd08e], a
	cp 5
	jr c, .asm_6b1c

; reached bottom
	xor a
	ld [wd08e], a
	jr .asm_6b1c

.check_up
	ldh a, [hJoypadPressed]
	bit D_UP_F, a
	jr z, .check_a

; Pressed up
	ld a, SFX_11
	call PlaySound
	ld a, [wd08e]
	and a
	jr z, .reached_top

	dec a
	ld [wd08e], a
	jr .asm_6b1c

.reached_top
	ld a, 4
	ld [wd08e], a

.asm_6b1c
	ld a, [wd08e]
	add a
	add a
	add a
	add a
	add $18
	ld [wcde0], a
	jr .ret

.check_a
	ldh a, [hJoypadPressed]
	bit A_BUTTON_F, a
	jr z, .check_exit

; Pressed A
	ld a, [wd08e]
	and a
	jr z, .asm_6b3c
	cp 1
	jr z, .asm_6b3c
	jr .asm_6b42

.asm_6b3c
	ld a, [wdcbb]
	and a
	jr z, .check_exit

.asm_6b42
	ld a, [wd08e]
	cp 2
	jr nz, .asm_6b57

	ld a, [hFFBA]
	cp $11
	jr z, .check_exit

	ld a, [wcd04]
	cp 9
	jr z, .check_exit

.asm_6b57
	ld a, SFX_11
	call PlaySound
	call Func_024_6ba1
	ld a, 1
	ld [wd087], a
	ldh [hFFC6], a
	xor a
	ld [wd08a], a

	ld de, unk_024_6b9c
	ld a, [wd08e]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ldh [hFFC5], a

	xor a
	ld [wd9d8], a
	ld [wd08d], a
	jr .ret

.check_exit
	ldh a, [hJoypadPressed]
	and START | B_BUTTON
	jr z, .ret

; Close menu
	ld a, 2
	ld [wd087], a
	ld hl, wd088
	ld [hl], $4c
	inc hl
	ld [hl], $45
	xor a
	ld [wd08a], a
	ld a, 1
	ldh [hFFC6], a

.ret
	ret

unk_024_6b9c:
	dr $92b9c, $92ba1

Func_024_6ba1:
	dr $92ba1, $92bba

StartMenu_BounceCursor:
	ldh a, [hFF9D]
	and 7 ; 0 or 8
	ret nz

; x coord = 76 or 77
	ld bc, wcde0
	inc bc
	ld a, [bc]
	cp $76
	jr z, .move

	ld a, $76
	ld [bc], a
	ret

.move
	ld a, $77
	ld [bc], a
	ret

Func_024_6bd0:
	dr $92bd0, $93c10


SECTION "banknum24", ROMX[$7fff], BANK[$24]
	db $24
