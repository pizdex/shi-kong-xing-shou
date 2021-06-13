unk_025_4000:
	dr $94000, $94101

Func_025_4101::
	dr $94101, $94110

Func_025_4110::
	dr $94110, $9424e

Func_025_424e::
	dr $9424e, $942b3

unk_025_42b3::
	dr $942b3, $94efe

Func_025_4efe:
	ld a, [wd9d8]
	inc a
	ld [wd9d9], a
	ld hl, $4c89
	ld b, $26
	rst $30
	xor a
	ld [wd08a], a
	ret

Func_025_4f10:
	dr $94f10, $95044

Func_025_5044:
; Used in dex
	ld bc, $40
	ld hl, $93c0
	xor a
	call ByteFillVRAM
	call DelayFrame
	ld a, [wd9d8]
	inc a
	ld d, a
	farcall Func_01e_4290
	xor a
	ld [wd08a], a
	ret

Func_025_5061:
	dr $95061, $9585a

Func_025_585a:
	push bc

; Get starting address for each "icon box"
	ld a, [wd0c3]
	ld l, a
	ld h, 0
	ld de, .coords
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [wd1f2], a
	ld a, h
	ld [wd1f2 + 1], a
	call GetTextBGMapPointer

; Place tilemap
	lb bc, $06, $04
	ld a, $06
	ld [hFF92], a
	ld a, $04
	ld [hFF93], a
	ld de, unk_025_645c
	call PlaceTilemap

; Place attribute map
	ld a, [wTextBGMapPointer]
	ld l, a
	ld a, [wTextBGMapPointer + 1]
	ld h, a
	lb bc, $06, $04
	ld a, $06
	ld [hFF92], a
	ld a, $04
	ld [hFF93], a
	ld de, unk_025_6444
	call PlaceAttrmap

	pop bc
	push bc
	ld a, [bc]
	ld d, a
	farcall Func_01e_431f

; Add [1, 1] to point to where icons should load
	ld a, [wd1f2]
	ld l, a
	ld a, [wd1f2 + 1]
	ld h, a
	lb bc, $01, $01
	add hl, bc
	call GetTextBGMapPointer

; Load mon icon tilemap
	ld a, [wd0c3]
	sla a
	sla a ; 4 tiles
	add $80 ; start at tile $80
	ld e, a
	lb bc, $02, $02
	ld a, $02
	ld [hFF92], a
	ld [hFF93], a
	call IncFillBoxVRAM

	pop bc
	push bc
	call Func_025_5dcb
	pop bc
	push bc

	call DelayFrame
	call Func_025_58ed
	pop bc
	ret

.coords
	db $00, $00
	db $00, $07
	db $00, $0e
	db $04, $00
	db $04, $07
	db $04, $0e

Func_025_58ed:
	dr $958ed, $95dcb

Func_025_5dcb:
	dr $95dcb, $95df5

Func_025_5df5::
	dr $95df5, $96444

unk_025_6444:
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $02, $01, $01, $01, $01, $02 ; HP Bar

unk_025_645c:
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $17, $0a, $0b ; Lv01
	db $6e, $78, $78, $78, $78, $6f ; HP Bar


SECTION "banknum25", ROMX[$7fff], BANK[$25]
	db $25
