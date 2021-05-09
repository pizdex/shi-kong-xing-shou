Func_077_4000::
	dr $1dc000, $1dc311

Func_077_4311:
	ld bc, $80
.asm_4314
	ld hl, $0000
.asm_4317
	inc hl
	ld a, h
	or l
	jr nz, .asm_4317
	dec bc
	cp 0
	jr nz, .asm_4314
	ret

Func_077_4322:
	ld hl, wd300
	ld [hl], ITEM_04
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_04
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_17
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_27
	inc hl
	ld [hl], 20

; 5000 money
	ld a, $13
	ld [wMoney + 1], a
	ld a, $88
	ld [wMoney + 2], a
	ret

Func_077_4359:
	dr $1dc359, $1dc3fc

CheatCode_InputList:
	db D_UP, A_BUTTON, A_BUTTON, D_UP, B_BUTTON, B_BUTTON, SELECT, SELECT          ; 1
	db D_DOWN, D_DOWN, D_LEFT, D_RIGHT, SELECT, A_BUTTON, SELECT, B_BUTTON         ; 2
	db D_LEFT, D_LEFT, D_RIGHT, D_RIGHT, D_UP, D_UP, D_DOWN, D_DOWN                ; 3
	db D_RIGHT, B_BUTTON, B_BUTTON, B_BUTTON, D_LEFT, A_BUTTON, A_BUTTON, A_BUTTON ; 4
	db D_LEFT, D_LEFT, D_RIGHT, D_RIGHT, D_UP, D_UP, D_DOWN, D_DOWN                ; 5

Func_077_4424:
	ldh a, [hJoypadPressed]
	and a
	ret z

	ld a, [wdcb2]
	ld c, a
.asm_442c:
; Find base address (c*8 + de)
	ld de, CheatCode_InputList
	ld l, c
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
; Add counter
	ld a, [wdcb1]
	ld e, a
	ld d, 0
	add hl, de
	ldh a, [hJoypadDown]
	cp [hl]
	jr nz, .asm_446f

	ld a, [wdcb1]
	inc a
	ld [wdcb1], a
	ld a, c
	ld [wdcb2], a
; Limit combo to 8 inputs
	ld a, [wdcb1]
	cp 8
	ret c

	ld a, c
	inc a
	ld [wdcb0], a
	ld a, $23
	call PlaySound
	xor a
	ld [wdcb1], a
	ld [wdcb2], a
	ld a, 1
	ld [$cd51], a
	ld [$dcf5], a
	jr Func_077_449c
	ret

.asm_446f
	ld a, [wdcb1]
	and a
	jr nz, .asm_447a
; Limit search to 5 cheat codes (broken)
	inc c
	cp 5
	jr c, .asm_442c

.asm_447a
	xor a
	ld [wdcb1], a
	ld [wdcb2], a
	ret

Func_077_4482:
	dr $1dc482, $1dc49c

Func_077_449c:
	dr $1dc49c, $1df177

unk_077_7177:
	INCBIN "gfx/title_screen/image_77_7177.2bpp"


SECTION "banknum77", ROMX[$7fff], BANK[$77]
	db $77
