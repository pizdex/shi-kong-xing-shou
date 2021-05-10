LoadSpritePalette::
	push bc
	ld a, [_BANKNUM]
	push af

; Get palette address
	ld a, BANK(unk_004_4337)
	rst Bankswitch
	ld hl, 4
	add hl, bc
	ld a, [hl]
	ld de, unk_004_4337
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	push de

; Get palette index?
	ld hl, $0a
	add hl, bc
	ld a, [hl]
; a = (a + 3) * 8
	add 3
	add a
	add a
	add a
	ld [wd9ff], a

; Copy palette into WRAM
	ld l, a
	ld h, 0
	ld bc, wcaf0
	add hl, bc
	ld b, 1 palettes
.copy_palette
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .copy_palette

; Copy palette into OCPD
	pop de
	ld a, [wd9ff]
	add OCPSF_AUTOINC
	ld c, a
	ld b, 1 palettes
	ld l, e
	ld h, d
	call LoadPalettes_OCPD

	pop af
	rst Bankswitch
	pop bc
	ret

LoadPalettes_OCPD::
; Load b palettes from hl into rOCPD
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	di
	call WaitVRAM_STAT
	ld a, c
	ldh [rOCPS], a
	ei
.load_palette
	di
	call WaitVRAM_STAT
	ld a, [hli]
	ldh [rOCPD], a
	ei
	dec b
	jr nz, .load_palette
	ret

LoadPalettes_BCPD::
; Load b palettes from hl into rBCPD
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	di
	call WaitVRAM_STAT
	ld a, c
	ldh [rBCPS], a
	ei
.load_palette
	di
	call WaitVRAM_STAT
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .load_palette
	ret
