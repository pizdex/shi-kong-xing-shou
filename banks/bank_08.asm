Script_008_4000::
	scr_face FACE_UP
	scr_text House_CutsceneText1
	scr_face FACE_LEFT
	scr_move unk_00b_413c
	scr_face FACE_UP
	scr_face FACE_RIGHT
	scr_move unk_00b_413e
	scr_face FACE_UP
	scr_text House_CutsceneText2
	scr_emote 0, EMOTE_HEART
	scr_delay 3, 32
	scr_face FACE_DOWN
	scr_text text_08_456d
	scr_text text_08_458a
	scr_text text_08_45a5
	scr_face FACE_LEFT
	scr_move unk_00b_413c
	scr_move unk_00b_413c
	scr_face FACE_DOWN
	scr_move unk_00b_4191
	scr_text text_08_45cc
	scr_delay 3, 7
	scr_emote 0, EMOTE_EXCLAMATION
	scr_delay 3, 32
	scr_face FACE_LEFT
	scr_move unk_00b_413c
	scr_move unk_00b_413c
	scr_move unk_00b_413c
	scr_face FACE_DOWN
	scr_move unk_00b_4191
	scr_text text_08_45db
	scr_delay 3, 7
	scr_emote 0, EMOTE_QUESTION
	scr_delay 3, 32
	scr_text text_08_45f0
	scr_move unk_00b_4191
	scr_move unk_00b_4191
	scr_move unk_00b_4191
	scr_move unk_00b_4191
	scr_5e $01 ; follower
	scr_face FACE_LEFT
	scr_setmap $01, $08 ; map switch
; outside
	scr_face FACE_RIGHT
	scr_text text_08_4651
	scr_text text_08_465e
	scr_text text_08_46a4
	scr_face FACE_LEFT
	scr_1f $01 ; story flags?
	scr_end

Func_008_4082:
	xor a
	ld [wd0fa], a
	jp Func_023b

Script_008_4089:
	scr_end

Script_008_408a:
	scr_checkbit wdaa0, 0, .script_4113 ; check bit 0
	scr_setmap $0a, $01
	scr_face FACE_UP
	scr_01 2, FACE_LEFT
	scr_move unk_00b_4193
	scr_move unk_00b_4193
	scr_text text_08_4b8b
	scr_delay 3, 7
	scr_move unk_00b_4193
	scr_move unk_00b_4193
	scr_face FACE_LEFT
	scr_move unk_00b_413c
	scr_text text_08_4b9f
	scr_delay 3, 7
	scr_emote 0, EMOTE_ANGER
	scr_delay 3, 32
	scr_move unk_00b_413c
	scr_move unk_00b_413c
	scr_text text_08_4baf
	scr_emote 2, EMOTE_EXCLAMATION
	scr_delay 3, 32
	scr_01 2, FACE_DOWN
	scr_text text_08_4bbb
	scr_text text_08_4bd2
	scr_text text_08_4bdc
	scr_move unk_00b_413c
	scr_move unk_00b_413c
	scr_face FACE_UP
	scr_06 2, $00
	scr_text text_08_4bf3
	scr_text text_08_4c1d
	scr_text text_08_4c2e
	scr_face FACE_LEFT
; Cutscene
	scr_01 2, FACE_LEFT
	scr_setmap $2c, $00
	scr_0d $454f
	scr_text text_08_4c4c
	scr_text text_08_4c8c
	scr_text text_08_4cb5
	scr_text text_08_4cbd
	scr_5e $00
	scr_setmap $04, $02
	scr_face FACE_DOWN
	scr_01 2, FACE_UP
	scr_text text_08_4cc6
	scr_setbit wdaa0, 0 ; set bit 0
	scr_end

.script_4113
	scr_setmap $0a, $00
	scr_end

unk_008_4117:
	db $11, $05, $03, $00, $00, $00, $00, $00, $00
	dw Script_008_4123
	db $88

Script_008_4123:
	scr_04 text_08_4cf4
	scr_end

unk_008_4127:
	db $11, $05, $03, $00, $00, $00, $00, $00, $00
	dw Script_008_4133
	db $88

Script_008_4133:
	scr_04 text_08_4e04
	scr_end

Script_008_4137:
	scr_checkbit wdaa0, 0, .script_414d
; No entry
	scr_text text_08_4b77
	scr_face FACE_DOWN
	scr_move unk_00b_4191
	scr_44
	scr_06 1, $02
	scr_01 1, FACE_DOWN ; snowy faces down
	scr_end

.script_414d
	scr_setmap $09, $00
	scr_end

Script_008_4151:
	scr_checkbit wdaa0, 1, .script_41a3
	scr_text text_08_4d0b
	scr_face FACE_UP
	scr_01 2, FACE_DOWN
	scr_06 2, $01 ; TEMP
	scr_06 2, $01 ; TEMP
	scr_move unk_00b_4193
	scr_emote 0, EMOTE_QUESTION
	scr_delay 3, 32
	scr_text text_08_4d1a
	scr_text text_08_4d2d
	scr_text text_08_4d3e
	scr_emote 2, EMOTE_EXCLAMATION
	scr_delay 3, 32
	scr_text text_08_4d56
	scr_text text_08_4d70
	scr_delay 3, 7
	scr_text text_08_4d77
	scr_emote 0, EMOTE_ANGER
	scr_delay 3, 32
	scr_text text_08_4d8f
	scr_face FACE_DOWN
	scr_move unk_00b_4191
	scr_move unk_00b_4191
	scr_move unk_00b_4191
	scr_setbit wdaa0, 1
	scr_1f $02 ; TEMP

.script_41a3
	scr_setmap $01, $06 ; TEMP
	scr_end

Script_008_41a7:
	scr_checkbit wdaa0, 1, .script_41b1
	scr_setmap $04, $00
	scr_end

.script_41b1
	scr_setmap $04, $03
	scr_end

Script_008_41b5:
	scr_checkbit wdaa0, 2, .script_41bf
	scr_setmap $09, $02 ; TEMP
	scr_end

.script_41bf
	scr_text text_08_522e
	scr_face FACE_LEFT
	scr_move unk_00b_413c
	scr_end

Script_008_41c8:
	scr_face FACE_UP
	scr_01 6, FACE_RIGHT
	scr_06 6, $04 ; TEMP
	scr_01 6, FACE_DOWN
	scr_06 6, $01 ; TEMP
	scr_06 6, $01 ; TEMP
	scr_01 6, FACE_LEFT
	scr_06 6, $03 ; TEMP
	scr_01 6, FACE_DOWN
	scr_06 6, $01 ; TEMP
	scr_text text_08_5306
	scr_text text_08_5346
	scr_emote 6, EMOTE_TEAR
	scr_delay 3, 32
	scr_text text_08_5387
	scr_text text_08_53af
	scr_text text_08_53ef
	scr_01 6, FACE_UP
	scr_06 6, $02 ; TEMP
	scr_01 6, FACE_DOWN
	scr_emote 6, EMOTE_HEART
	scr_delay 3, 32
	scr_text text_08_5592
	scr_setmap $2a, $01 ; TEMP
	scr_setbit wdaa0, 3
	scr_end

Script_008_4214:
	scr_setmap $04, $04 ; TEMP
	scr_face FACE_UP
	scr_01 2, FACE_RIGHT
	scr_01 3, FACE_LEFT
	scr_text text_08_5468
	scr_text text_08_547e
	scr_text text_08_54d2
	scr_emote 3, EMOTE_ANGER
	scr_delay 3, 32
	scr_text text_08_54eb
	scr_01 3, FACE_DOWN
	scr_01 2, FACE_DOWN
	scr_06 3, $01 ; TEMP
	scr_06 3, $01 ; TEMP
	scr_06 3, $01 ; TEMP
	scr_06 3, $01 ; TEMP
	scr_06 3, $01 ; TEMP
	scr_06 3, $01 ; TEMP
	scr_1c $03
	scr_move unk_00b_4193
	scr_move unk_00b_4193
	scr_emote 0, EMOTE_QUESTION
	scr_delay 3, 32
	scr_text text_08_5500
	scr_text text_08_550e
	scr_emote 0, EMOTE_QUESTION
	scr_delay 3, 32
	scr_text text_08_557d
	scr_text text_08_558a
	scr_34 $01, $04, $00 ; TEMP
	scr_end

unk_008_426e:
	db $11, $03, $04, $00, $00, $00, $00, $00, $00
	dw Script_008_4089
	db $24, $04, $04, $00, $00, $00, $00, $00, $01
	dw Script_008_4089
	db $88

Script_008_4285:
	scr_text text_08_55a7
	scr_face FACE_UP
	scr_move unk_00b_4193
	scr_44
	scr_06 1, $01
	scr_01 1, FACE_UP
	scr_end

Script_008_4295:
	scr_text text_08_4f82
	scr_face FACE_UP
	scr_move unk_00b_4193
	scr_end

Script_008_429e:
	dr $2029e, $202ed

Script_008_42ed:
	scr_checkbit wdaa0, 1, .script_42f7
	scr_04 text_08_46b1
	scr_end

.script_42f7
	scr_04 text_08_4e23
	scr_end

Script_008_42fb:
	scr_checkbit wdaa0, 1, .script_4305
	scr_04 text_08_46fe
	scr_end

.script_4305
	scr_04 text_08_4e55
	scr_end

Script_008_4309:
	scr_04 text_08_4768
	scr_end

Script_008_430d:
	scr_04 text_08_47af
	scr_end

Script_008_4311:
	scr_04 text_08_47fb
	scr_end

Script_008_4315:
	scr_04 text_08_4837
	scr_end

Script_008_4319:
	dr $20319, $2031d

Script_008_431d:
	dr $2031d, $20334

Script_008_4334:
	scr_checkbit wdaa0, 1, .script_433e
	scr_04 text_08_48d0
	scr_end

.script_433e
	scr_04 text_08_4eb0
	scr_end

Script_008_4342:
	scr_04 text_08_4911
	scr_end

unk_008_4346:
	dr $20346, $2035d

Script_008_435d:
	scr_checkbit wdaa0, 1, .script_436a
	scr_04 text_08_497a
	scr_text text_08_49cc
	scr_end

.script_436a
	scr_04 text_08_4ecc
	scr_end

Script_008_436e:
	scr_checkbit wdaa0, 1, .script_4378
	scr_04 text_08_4aac
	scr_end

.script_4378
	scr_04 text_08_4f1a
	scr_end

unk_008_437c:
	dr $2037c, $2039e

Script_008_439e:
	scr_checkbit wdaa0, 1, .script_43a8
	scr_04 text_08_49db
	scr_end

.script_43a8
	scr_04 text_08_4ef4
	scr_end

Script_008_43ac:
	scr_04 text_08_4a2e
	scr_end

Script_008_43b0:
	scr_04 text_08_4a87
	scr_end

unk_008_43b4:
	dr $203b4, $203c4

Script_008_43c4:
	scr_face FACE_UP
	scr_text text_08_4b14
	scr_end

unk_008_43ca:
	dr $203ca, $203ed

Script_008_43ed:
	scr_04 text_08_4fa8
	scr_end

Script_008_43f1:
	scr_04 text_08_5001
	scr_end

Script_008_43f5:
	dr $203f5, $2040c

Script_008_440c:
	scr_04 text_08_5039
	scr_end

Script_008_4410:
	scr_04 text_08_506b
	scr_end

unk_008_4414:
	dr $20414, $20462

Script_008_4462:
	scr_end

Script_008_4463:
	dr $20463, $204d3

Script_008_44d3:
	scr_04 text_08_5291
	scr_01 2, FACE_UP
	scr_end

Script_008_44da:
	scr_04 text_08_52d0
	scr_01 4, FACE_UP
	scr_end

Script_008_44e1:
	scr_04 text_08_5267
	scr_01 5, FACE_UP
	scr_end

Script_008_44e8:
	scr_04 text_08_522e
	scr_01 6, FACE_DOWN
	scr_end

Script_008_44ef:
	scr_04 text_08_4519
	db $3b, $6b, $50, $61
	scr_end

Script_008_44f7:
	scr_04 text_08_4519
	db $3b, $6b, $50, $61
	scr_end

Script_008_44ff:
	dr $204ff, $2050c

Script_008_450c:
	scr_04 text_08_4537
	scr_checkbit wdaa3, 3, .script_4517
	scr_37
	scr_end

.script_4517
	scr_36
	scr_end

text_08_4519:
	dr $20519, $20526

text_08_4526:
	dr $20526, $2052d

text_08_452d:
	dr $2052d, $20537

text_08_4537:
	dr $20537, $20542

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
