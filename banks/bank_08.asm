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
	db $11
	db $05, $03 ; coords
	db $00, $00, $00, $00, $00, $00
	dw Script_008_4123
	db $88

Script_008_4123:
	scr_04 text_08_4cf4
	scr_end

unk_008_4127:
	db $11
	db $05, $03
	db $00, $00, $00, $00, $00, $00
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
	db $88

BellVillage1_ObjectEvents:
	; 11 bytes
	object_event $1b, $10, $09,     0, 0, 0, 9, 0, Script_008_42ed
	object_event $13, $08, $0E,     0, 0, 0, 5, 1, Script_008_42fb
	object_event $20, $0E, $0D,     0, 0, 0, 7, 2, Script_008_4309
	object_event $1D, $05, $09,     0, 0, 0, 6, 3, Script_008_430d
	object_event $16, $0B, $04,     0, 0, 0, 0, 4, Script_008_4311
	object_event $19, $06, $05,     0, 0, 0, 8, 0, Script_008_4315
	object_event $01, $05, $10, wdaa0, 1, 1, 0, 0, Script_008_4319
	objects_end

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
	scr_04 text_08_4e15
	scr_end

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

MeteorCutscene_ApplyTextPals:
	ld hl, MeteorCutscene_TextPalette
	call CopyBackgroundPalettes
	ld hl, MeteorCutscene_TextPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3
	ret

MeteorCutscene_ApplyBlackPal:
	ld hl, MeteorCutscene_BlackPalette
	call CopyBackgroundPalettes
	ld hl, MeteorCutscene_BlackPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3
	ret

Func_008_55f7:
.loop
	call DelayFrame
	dec c
	jr nz, .loop
	ret

MeteorCutscene_ClearSpriteBuffer:
	ld hl, wcd00
	ld bc, $100
.clear
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .clear
	ret

MeteorCutscene::
	ld a, BGM_69
	call PlaySound

	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf5], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_Text1_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_TextAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_TextPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_TextGFX_1
	ld de, vTiles2
	ld bc, $520
	call CopyBytesVRAM

	call MeteorCutscene_ClearSpriteBuffer
	call MeteorCutscene_HideAllSprites
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette

.SceneLoop:
	call DelayFrame
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ldh a, [hFFBF]
	and a
	jr nz, .done

	ld a, [wdcf5]
	and a
	jr z, .Text2_WaitBlack
	cp 1
	jr z, .FadeToMeteors
	cp 2
	jr z, .DoMeteorAnimation
	cp 3
	jr z, .FadeFromMeteors ; to text 4
	cp 4
	jr z, .Text4_WaitBlack ; texts 4 - 9
	cp 5
	jr z, .Text2_Load ; texts 2 and 3
	cp 6
	jr z, .Text2_WaitShow ; texts 2 and 3
	cp 7
	jr z, .Text4_Load ; texts 4 - 9
	cp 8
	jr z, .Text4_WaitShow ; texts 4 - 9
	jp .SceneLoop

.done
	xor a
	ldh [hFFBF], a
	ld [wd0fa], a
	ld a, 4
	ld [hFFBA], a
	jp Func_0257

.Text2_WaitBlack:
	call MeteorCutscene_WaitAndBlackOut
	jp .SceneLoop

.FadeToMeteors:
	call MeteorCutscene_DoFadeToMeteors
	jp .SceneLoop

.DoMeteorAnimation:
	call MeteorCutscene_AnimateStormBG
	call MeteorCutscene_InitMeteor
	call MeteorCutscene_PlaceMeteor
	call MeteorCutscene_AnimateMeteor
	call MeteorCutscene_MoveMeteor
	jp .SceneLoop

.FadeFromMeteors:
	call MeteorCutscene_DoFadeFromMeteors
	jp .SceneLoop

.Text4_WaitBlack:
	call MeteorCutscene_WaitAndBlackOut2
	jp .SceneLoop

.Text2_Load:
	call MeteorCutscene_LoadTexts
	jp .SceneLoop

.Text2_WaitShow:
	call MeteorCutscene_WaitAndShowText
	jp .SceneLoop

.Text4_Load:
	call MeteorCutscene_LoadTexts2
	jp .SceneLoop

.Text4_WaitShow:
	call MeteorCutscene_WaitAndShowText2
	jp .SceneLoop

MeteorCutscene_DoFadeToMeteors:
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call FadeOutPalette
	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf6], a
	ld [wdce8], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_StormTilemap_1
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_StormAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_MeteorPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_OBJPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_StormGFX
	ld de, vTiles2
	ld bc, $760
	call CopyBytesVRAM

	ld hl, MeteorCutscene_MeteorGFX
	ld de, vTiles0
	ld bc, $80
	call CopyBytesVRAM
	call MeteorCutscene_ClearSpriteBuffer
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette
	ld a, 2
	ld [wdcf5], a
	ret

MeteorCutscene_PlaceMeteor:
	ld a, [wdcf6]
	and a
	jr z, .shoot
	dec a
	ld [wdcf6], a
	ret

.shoot
	ld bc, wdd50
.loop
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .play_sfx
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .loop
	ret

.play_sfx
	ld a, SFX_2c
	call PlaySound

	ld de, unk_008_57e2
	ld a, [wdce8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
REPT 3
	ld a, [hli]
	ld [bc], a
	inc bc
ENDR
	ld a, 1
	ld [bc], a
	ld a, [hli]
	ld [wdcf6], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 7
	ret c
	xor a
	ld [wdce8], a
	ret

unk_008_57e2:
	dw $30f0, $1004
	dw $5000, $1004
	dw $70f0, $1004
	dw $9000, $1004
	dw $40f0, $1004
	dw $6000, $1004
	dw $80f0, $1004

MeteorCutscene_AnimateMeteor:
	ld bc, wdd50
.asm_5801
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5815
.asm_5809
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .asm_5801
	ret

.asm_5815
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_5820
	dec [hl]
	jr .asm_5809

.asm_5820
	ld [hl], 4
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld d, a
	ld a, 3
	sub d
	ld [hl], a
	jr .asm_5809

MeteorCutscene_MoveMeteor:
	ld bc, wdd50
.asm_5831
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_5845
.asm_5839
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4f
	jr c, .asm_5831
	ret

.asm_5845
	ld hl, 1
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	cp $a0
	jr nz, .asm_5839
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	inc hl
	ld [hl], 0
	jr .asm_5839

MeteorCutscene_InitMeteor:
; clears the OAM each time
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [wd1fb], a
	call MeteorCutscene_InitMeteor2
	ret

MeteorCutscene_HideAllSprites:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.loop
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

MeteorCutscene_InitMeteor2:
	ld bc, wdd50
.asm_5890
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_58a4
.asm_5898
	ld hl, 4
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $4f
	jr c, .asm_5890
	ret

.asm_58a4
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld [wdcf7], a
	ld hl, 1
	add hl, bc
	ld a, [hl]
	ld [wdcf8], a
	ld hl, 3
	add hl, bc
	ld a, [hl]
	ld de, .Frames
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.asm_58ca
	ld a, [hli]
	cp -1
	jr z, .asm_58ea
	push bc
	ld b, a
	ld a, [wdcf7]
	add b
	pop bc
	ld [de], a
	inc de
	ld a, [hli]
	push bc
	ld b, a
	ld a, [wdcf8]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop bc
	jr .asm_58ca

.asm_58ea
	ld a, e
	ld [wd1fb], a
	jp .asm_5898

.Frames:
	dw .Frame1
	dw .Frame1
	dw .Frame2

.Frame1:
	db 0
	db 0
	db 0
	db 0
	db 0
	db 8
	db 2
	db 0
	db -1

.Frame2:
	db 0
	db 0
	db 4
	db 0
	db 0
	db 8
	db 6
	db 0
	db -1

MeteorCutscene_AnimateStormBG:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $40
	ret nz
	xor a
	ld [wdcf3], a
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 0
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 3
	ret c
	ld a, 3
	ld [wdcf5], a
	ret

.Tilemaps:
	dw MeteorCutscene_StormTilemap_2
	dw MeteorCutscene_StormTilemap_3
	dw MeteorCutscene_StormTilemap_3

MeteorCutscene_DoFadeFromMeteors:
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call FadeOutPalette
	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdcf3], a
	ld [wdcf4], a

	hlbgcoord 0, 0
	ld de, MeteorCutscene_Text4_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	hlbgcoord 0, 0
	ld de, MeteorCutscene_TextAttr
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, MeteorCutscene_TextPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, MeteorCutscene_TextGFX_2
	ld de, vTiles2
	ld bc, $800
	call CopyBytesVRAM

	ld hl, MeteorCutscene_TextGFX_3
	ld de, vTiles1
	ld bc, $210
	call CopyBytesVRAM

	call MeteorCutscene_ClearSpriteBuffer
	call MeteorCutscene_HideAllSprites
	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a
	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette
	ld a, 4
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndBlackOut:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyBlackPal
	ld a, 5
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndShowText:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $20
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyTextPals
	ld a, 0
	ld [wdcf5], a
	ret

MeteorCutscene_LoadTexts:
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 8
	lb bc, $14, 2
	ld a, 2
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 3
	jr nc, .asm_5a2f
	ld a, 6
	ld [wdcf5], a
	ret

.asm_5a2f
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld a, 1
	ld [wdcf5], a
	ret

.Tilemaps:	; texts 2 and 3
	dw MeteorCutscene_Text2_Tilemap
	dw MeteorCutscene_Text3_Tilemap
	dw MeteorCutscene_Text3_Tilemap

MeteorCutscene_WaitAndBlackOut2:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $60
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyBlackPal
	ld a, 7
	ld [wdcf5], a
	ret

MeteorCutscene_WaitAndShowText2:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp $20
	ret nz
	xor a
	ld [wdcf3], a
	call MeteorCutscene_ApplyTextPals
	ld a, 4
	ld [wdcf5], a
	ret

MeteorCutscene_LoadTexts2:
	ld de, .Tilemaps
	ld a, [wdcf4]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	hlbgcoord 0, 8
	lb bc, $14, 2
	ld a, 2
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0
	ld a, [wdcf4]
	inc a
	ld [wdcf4], a
	cp 6
	jr nc, .asm_5aa2
	ld a, 8
	ld [wdcf5], a
	ret

.asm_5aa2
	xor a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcf5], a
	ld a, 1
	ld [hFFBF], a
	ret

.Tilemaps:	; texts 5 to 10
	dw MeteorCutscene_Text5_Tilemap
	dw MeteorCutscene_Text6_Tilemap
	dw MeteorCutscene_Text7_Tilemap
	dw MeteorCutscene_Text8_Tilemap
	dw MeteorCutscene_Text9_Tilemap
	dw MeteorCutscene_Text9_Tilemap

MeteorCutscene_BlackPalette:
INCBIN "gfx/cutscenes/cutscene_black.pal"

MeteorCutscene_TextPalette:
INCBIN "gfx/cutscenes/cutscene_text.pal"

MeteorCutscene_Text1_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_1.tilemap"

MeteorCutscene_Text4_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_4.tilemap"

MeteorCutscene_TextAttr:
INCBIN "gfx/cutscenes/cutscene_text.attr"

MeteorCutscene_TextGFX_1:
INCBIN "gfx/cutscenes/meteor/text_gfx_1.2bpp"

MeteorCutscene_TextGFX_2:
INCBIN "gfx/cutscenes/meteor/text_gfx_2.2bpp"

MeteorCutscene_TextGFX_3:
INCBIN "gfx/cutscenes/meteor/text_gfx_3.2bpp"

unk_008_6eae:
INCBIN "data/unk_008_6eae.bin"

MeteorCutscene_Text2_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_2.tilemap"

MeteorCutscene_Text3_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_3.tilemap"

unk_008_6f26:
INCBIN "data/unk_008_6f26.bin"

MeteorCutscene_Text5_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_5.tilemap"

MeteorCutscene_Text6_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_6.tilemap"

MeteorCutscene_Text7_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_7.tilemap"

MeteorCutscene_Text8_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_8.tilemap"

MeteorCutscene_Text9_Tilemap:
INCBIN "gfx/cutscenes/meteor/text_9.tilemap"

MeteorCutscene_StormTilemap_1:
INCBIN "gfx/cutscenes/meteor/storm_bg_1.tilemap"

MeteorCutscene_StormAttr:
INCBIN "gfx/cutscenes/meteor/storm.gbcattr"

MeteorCutscene_MeteorPalette:
INCBIN "gfx/cutscenes/meteor/meteor_bg.pal"

MeteorCutscene_OBJPalette:
INCBIN "gfx/cutscenes/meteor/meteor_obj.pal"

MeteorCutscene_StormGFX:
INCBIN "gfx/cutscenes/meteor/storm.2bpp"

MeteorCutscene_MeteorGFX:
INCBIN "gfx/cutscenes/meteor/meteor.2bpp"

MeteorCutscene_StormTilemap_2:
INCBIN "gfx/cutscenes/meteor/storm_bg_2.tilemap"

MeteorCutscene_StormTilemap_3:
INCBIN "gfx/cutscenes/meteor/storm_bg_3.tilemap"

SECTION "banknum8", ROMX[$7fff], BANK[$8]
	db $8
