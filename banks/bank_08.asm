unk_008_4000:
	scr_face FACE_UP
	scr_text House_CutsceneText1
	scr_face FACE_LEFT
	db $0f, $3c, $41
	scr_face FACE_UP
	scr_face FACE_RIGHT
	db $0f, $3e, $41
	scr_face FACE_UP
	scr_text House_CutsceneText2
	db $15, $00, $02, $02, $03, $20
	scr_face FACE_DOWN
	scr_text text_08_456d
	scr_text text_08_458a
	scr_text text_08_45a5
	scr_face FACE_LEFT
	db $0f, $3c, $41
	db $0f, $3c, $41
	scr_face FACE_DOWN
	db $0f, $91, $41
	scr_text text_08_45cc
	db $02, $03, $07
	db $15, $00, $00, $02, $03, $20
	scr_face FACE_LEFT
	db $0f, $3c, $41
	db $0f, $3c, $41
	db $0f, $3c, $41
	scr_face FACE_DOWN
	db $0f, $91, $41
	scr_text text_08_45db
	db $02, $03, $07, $15, $00, $03, $02, $03, $20
	scr_text text_08_45f0
	db $0f, $91, $41
	db $0f, $91, $41
	db $0f, $91, $41
	db $0f, $91, $41
; outside
	db $5e, $01
	scr_face FACE_LEFT
	db $0c, $01, $08
	scr_face FACE_RIGHT
	scr_text text_08_4651
	scr_text text_08_465e
	scr_text text_08_46a4
	scr_face FACE_LEFT
	db $1f, $01
	db $09

unk_008_4082:
	dr $20082, $20542

INCLUDE "data/text/ballots_house_intro.asm"

INCLUDE "data/text/bank08_misc.asm"

Func_008_55d1:
	ld hl, $5afe
	call CopyBackgroundPalettes
	ld hl, $5afe
	ld de, $cab0
	ld bc, $40
	call CopyBytes3
	ret

Func_008_55e4:
	dr $215e4, $215f7

Func_008_55f7:
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ret

Func_008_55fe:
	ld hl, $cd00
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

Func_008_560c::
	dr $2160c, $2167a

Func_008_567a:
	dr $2167a, $21ab2

; Cutscene graphics?
unk_008_5ab2:
	dr $21ab2, $23fff

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
