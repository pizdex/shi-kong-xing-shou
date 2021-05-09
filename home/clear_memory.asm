ClearMemory::
	push hl
	push de
	push bc

; Clear VRAM
	xor a
	ld bc, $2000
	ld hl, vTiles0
	call ByteFill

; Clear most of RAM
	ld bc, $1f00
	ld hl, _RAM
	xor a
	call ByteFill

; Clear HRAM
	ld bc, $7f
	ldh a, [hConsoleType]
	push af
	xor a
	ld hl, _HRAM
	call ByteFill
	pop af
	ldh [hConsoleType], a

	pop bc
	pop de
	pop hl
	ret
