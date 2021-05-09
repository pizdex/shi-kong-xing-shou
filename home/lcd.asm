LCD::
	di
	push af
	push bc
	push de
	push hl

; run LCD routine pointer
	ld a, [wd9e0]
	ld l, a
	ld a, [wd9e0 + 1]
	ld h, a
	or l
	and a
	jr z, Finish_LCD
	jp hl

Finish_LCD::
	pop hl
	pop de
	pop bc
	pop af
	ei
	reti
