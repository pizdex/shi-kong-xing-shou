VBlank::
	di
	push af
	push bc
	push de
	push hl

; Count frame (should be last priority, not first)
	call GameTimer

; Currently in VBlank
	ld a, 1
	ldh [hVBlank], a

; Update scroll and window positions
	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a
	ld a, [wWX]
	ldh [rWX], a
	ld a, [wWY]
	ldh [rWY], a

	call Func_297a
	call hTransferVirtualOAM
	call Func_279e

	call LoadCharacter
	call PrintCharacter
	call Func_28d6

	ld a, [_BANKNUM]
	push af
	ld a, [$d091]
	rst Bankswitch
	call $4000
	pop af
	rst Bankswitch
	ei
	pop hl
	pop de
	pop bc
	pop af
	reti

GameTimer:
; Increment the game timer by one frame.
; Doesn't work properly due to: 
; 1. Frame counter capped to 26, even though the gameboy is 60 fps
; 2. A typo which means it thinks there are 96 second in a minute ($60 = 96)
; This causes each in game minute to take around 41 seconds.

; +1 frame
	ld a, [hGameTimeFrames]
	inc a
	ld [hGameTimeFrames], a
	cp 26 ; 26 frames/second
	ret c

	xor a
	ld [hGameTimeFrames], a
; +1 second
	ld a, [wGameTimeSeconds]
	inc a
	ld [wGameTimeSeconds], a
	ld a, [wGameTimeSeconds] ; waste
	cp $60 ; 96 seconds/minute
	ret nz

	xor a
	ld [wGameTimeSeconds], a
; +1 minute
	ld a, [wGameTimeMinutes]
	inc a
	ld [wGameTimeMinutes], a
	cp 60 ; minutes/hour
	ret c

	xor a
	ld [wGameTimeMinutes], a
; +1 hour
	ld a, [wGameTimeHours]
	cp 99
	ret z ; cap the timer after 99 hours

	inc a
	ld [wGameTimeHours], a
	ret
