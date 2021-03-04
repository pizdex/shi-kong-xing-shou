Joypad::
	ld a, [wd082]
	and a
	ret nz

	push hl ; waste
	push de ; waste
	push bc
	push af

; Reset joypad (unnecessary)
	ld a, $30
	ldh [rP1], a

; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, R_DPAD
	ldh [rP1], a
; Read four times to give the request time to take.
REPT 4
	ldh a, [rP1]
ENDR
; The Joypad register output is in the lo nybble (inversed).
; We make the hi nybble of our new container d-pad input.
	cpl
	and $0f
	swap a
; We'll keep this in b for now.
	ld b, a

; Reset joypad (unnecessary)
	ld a, $30
	ldh [rP1], a

; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, R_BUTTONS
	ldh [rP1], a
; Wait for input to stabilize.
REPT 10
	ldh a, [rP1]
ENDR
; Buttons take the lo nybble.
	cpl
	and $0f
	or b
	ld c, a

; To get the delta we xor the last frame's input with the new one.
	ldh a, [hJoypadDown] ; last frame
	xor c
; Newly pressed this frame:
	and c
	ldh [hJoypadPressed], a

; Currently pressed:
	ld a, c
	ldh [hJoypadDown], a

; Reset the joypad register since we're done with it.
	ld a, $30
	ldh [rP1], a

	pop af
	pop bc
	pop de ; waste
	pop hl ; waste
	ret
