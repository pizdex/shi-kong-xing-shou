LCD::
	di
	push af
	push bc
	push de
	push hl
	ld a, [wd9e0]
	ld l, a
	ld a, [wd9e0 + 1]
	ld h, a
	or l
	and a
	jr z, Func_28d0
	jp hl

Func_28d0:
	pop hl
	pop de
	pop bc
	pop af
	ei
	reti
