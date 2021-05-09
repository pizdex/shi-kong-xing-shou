FarCopyBytes_vTiles0:
; Copy bc bytes from [wTempBank]:[wd98f] to vTiles0
	ld a, [_BANKNUM]
	push af

; Source bank
	ld a, [wTempBank]
	rst Bankswitch
; Source address
	ld a, [wd98f]
	ld l, a
	ld a, [wd98f + 1]
	ld h, a
; Size of image
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
; Destination
	ld de, vTiles0
	call CopyBytesVRAM

	pop af
	rst Bankswitch
	ret

FarCopyBytesVRAM:
; Copy bc bytes from [wTempBank]:hl to de
	ld a, [_BANKNUM]
	push af

; Switch to source bank
	ld a, [wTempBank]
	rst Bankswitch
	call CopyBytesVRAM

	pop af
	rst Bankswitch
	ret

CopyBytesVRAM::
; Copy bc bytes from hl to de, making sure that the LCD isn't being used
.copy
	ld a, [hli]
	push bc
	ld c, a

.waitLCD
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .waitLCD

; Copy byte
	ld a, c
	ld [de], a
	inc de
	pop bc
	dec bc
	ld a, c
	or b
	jr nz, .copy
	ret

CopyBytesVRAM_Mirror:
; Mirror the bits in `[hl]` and write to VRAM
; i.e. 11110100 -> 00101111
	ld a, [hli]
	push bc
; Skip if 0 or $ff
	and a
	jr z, .store
	cp $ff
	jr z, .store

	ld c, 0
REPT 8
	srl a ; rra is better
	rl c
ENDR
	jr .waitLCD

.store
	ld c, a

.waitLCD
	ldh a, [rSTAT]
	and STATF_LCD
	jr nz, .waitLCD

; Write byte to de
	ld a, c
	ld [de], a
	inc de
	pop bc
	dec bc
	ld a, c
	or b
	jr nz, CopyBytesVRAM_Mirror
	ret

PlaceAttrmap::
	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

	ld a, 1
	ldh [rVBK], a
	jp PlaceTilemap

PlaceTilemap_Bank0::
	ld a, 0
	ldh [rVBK], a

PlaceTilemap::
; Copy b*c tilemap from de to hl
	push hl

.copy:
; load byte
	ld a, [de]
	push bc ; potential stack issue?
	ld c, a
	di

.waitLCD1
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD1

; write byte
	ld a, c
	ld [hl], a

.waitLCD2
	ldh a, [rSTAT]
	bit 1, a ; STATF_BUSY
	jr nz, .waitLCD2

	ei
; Verify that byte was written (if fail, messes up the stack)
	ld a, [hl]
	cp c
	jr nz, .copy

; Keep x coordinate if we are still on the same row (x < BG_MAP_WIDTH)
; Zero if x = BG_MAP_WIDTH after increment
	ld a, l
	inc a
	and BG_MAP_WIDTH - 1
	ld b, a
; Make sure that the lower byte of the VRAM address becomes one of these in the event that x is BG_MAP_WIDTH
	ld a, l
	and $00 | $20 | $40 | $60 | $80 | $a0 | $c0 | $e0
	or b
	ld l, a
	inc de

	pop bc
	dec b
	jr nz, .copy

; Move to next row
	pop hl
	push bc
	ld bc, BG_MAP_WIDTH
	add hl, bc
; Still in BG map 0? ($9800 - $9c00)
	ld a, h
	cp HIGH(vBGMap1)
	jr c, .next_row
; If not, fix it
	ld h, HIGH(vBGMap0)

.next_row
	pop bc
	ldh a, [hFF92]
	ld b, a
	dec c
	jr nz, PlaceTilemap

	ld a, 0
	ldh [rVBK], a
	ret

FadeInPalette::
; Map/intro fade in

; Load default background palette
	ld a, %11100100
	ldh [rBGP], a
; Load default object palette
	ld a, %00011100
	ld [wdce7], a
	ldh [rOBP0], a
	ldh [rOBP1], a

	ldh a, [hConsoleType]
	cp BOOTUP_A_CGB
	ret nz

; CGB only from here
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ld bc, unk_2b38
	ld a, 1
	ld [wd0b4], a
	call Func_29c8
	ldh a, [hFFC4]
	and a
	ret z

	ld hl, wBGPals1
	call CopyBackgroundPalettes
	ld hl, wOBPals1
	call CopyObjectPalettes

	call DelayFrame
	jp FadeInPalette

PartialCopyBackgroundPalettes:
; Copy data from [hl] to [hl+$30] to the first 24 background palettes
	di
	call WaitVRAM_STAT2
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ei
	ld b, 6 palettes
.copy
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .copy
	jr .ret ; ???

.ret
	ret

CopyBackgroundPalettes::
; Copy data from [hl] to [hl+$40] to all 32 background palettes
	di
	call WaitVRAM_STAT2
	ld a, BCPSF_AUTOINC
	ldh [rBCPS], a
	ei
	ld b, 8 palettes
.copy
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rBCPD], a
	ei
	dec b
	jr nz, .copy
	jr .ret

.ret
	ret

CopyObjectPalettes:
; Copy data from [hl] to [hl+$40] to all 32 object palettes
	di
	call WaitVRAM_STAT2
	ld a, OCPSF_AUTOINC
	ldh [rOCPS], a
	ei
	ld b, 8 palettes
.copy
	di
	call WaitVRAM_STAT2
	ld a, [hli]
	ldh [rOCPD], a
	ei
	dec b
	jr nz, .copy
	ret
