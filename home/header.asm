; rst vectors (called through the rst instruction)

SECTION "rst08", ROM0[$0008]
	jp hl

SECTION "rst20", ROM0[$0020]
	ld [$d08f], a
	ld [$2000], a
	ret

SECTION "rst30", ROM0[$0030]
	ld a, [$7fff]
	push af
	ld a, b
	rst $20
	rst $08
	pop af
; SECTION "rst38", ROM0[$0038]
	rst $20
	ret


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp $2843
	ret

SECTION "lcd", ROM0[$0048]
	jp $28be
	ret


SECTION "Header Code", ROM0[$00b0]
Func_00b0:
	push af
	di
	ld de, $00ca
	ld hl, $c000
	ld bc, $0020
	call Func_00c1
	jp $c000

Func_00c1:
.asm_00c1
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_00c1
	ret

Func_00ca:
	ld a, $aa
	ld [$5180], a
	ld a, $3a
	ld [$7180], a
	ld a, $07
	ld [$7180], a
	pop af
	jp _Start


SECTION "Header", ROM0[$0100]

Start::
	jp Func_00b0

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00
