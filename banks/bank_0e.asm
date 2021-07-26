Script_00e_4000:
	scr_end

Script_00e_4001:
	scr_setmap $2d, $01 ; TEMP
	scr_end

Script_00e_4005::
	scr_face FACE_DOWN
	scr_text text_0e_4abe
	scr_end

unk_00e_400b:
	xor a
	ld [wTargetMode], a
	jp JumpToGameMode

Script_00e_4012:
	scr_checkbit $daa0, $04, Script_00e_4049 ; TEMP
	scr_face $01 ; TEMP
	scr_text text_0e_4b34 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_4b4d ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_4bc0 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_4bfb ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_4c6a ; TEMP
	db $48, 2, 1
	scr_setbit wdaa0, 4
	scr_end

Script_00e_4049:
	scr_end

Script_00e_404a:
	scr_checkbit $daa0, $04, Script_00e_4059 ; TEMP
	scr_text text_0e_4af9 ; TEMP
	scr_face $01 ; TEMP
	scr_move $4193 ; TEMP
	scr_end

Script_00e_4059:
	scr_5e $02 ; TEMP
	scr_face $02 ; TEMP
	scr_setmap $01, $08 ; TEMP
	scr_face $03 ; TEMP
	scr_text text_0e_4cdd ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_move $413c ; TEMP
	scr_text text_0e_4cec ; TEMP
	scr_06 $01, $03 ; TEMP
	scr_text text_0e_4cfd ; TEMP
	scr_emote $00, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_4d10 ; TEMP
	scr_text text_0e_4d42 ; TEMP
	scr_text text_0e_4d50 ; TEMP
	scr_face $02 ; TEMP
	scr_text text_0e_4d81 ; TEMP
	db $61
	scr_cont
	db $64
	scr_end

Script_00e_408f:
	scr_text text_0e_5333 ; TEMP
	scr_face $00 ; TEMP
	scr_move $4191 ; TEMP
	scr_44
	scr_06 $01, $02 ; TEMP
	scr_01 $01, $00 ; TEMP
	scr_end

Script_00e_409f:
	scr_checkbit $daa0, $05, Script_00e_40b5 ; TEMP
	scr_text text_0e_7dff ; TEMP
	scr_face $01 ; TEMP
	scr_move $4193 ; TEMP
	scr_44
	scr_06 $01, $01 ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_end

Script_00e_40b5:
	scr_setmap $28, $00 ; TEMP
	scr_end

unk_00e_40b9:
	dr $380b9, $38141

BellSchoolNorthClassroom_ObjectEvents::
BellObservatory2_ObjectEvents::
BellSchool2_ObjectEvents::
BallotsHouse2_ObjectEvents::
BellSchoolOutside2_ObjectEvents::
	objects_end

BellVillage2_ObjectEvents:
	object_event $1b, 16,  9, 0, $00, $00, $09, $00, Script_00e_4185
	object_event $13,  8, 14, 0, $00, $00, $05, $01, Script_00e_4189
	object_event $20, 14, 13, 0, $00, $00, $07, $02, Script_00e_418d
	object_event $1d,  5,  9, 0, $00, $00, $06, $03, Script_00e_4191
	object_event $16, 11,  4, 0, $00, $00, $00, $04, Script_00e_4195
	object_event $19,  6,  5, 0, $00, $00, $08, $00, Script_00e_4199
	objects_end

Script_00e_4185:
	scr_04 text_0e_4d99
	scr_end

Script_00e_4189:
	scr_04 text_0e_4e05
	scr_end

Script_00e_418d:
	scr_04 text_0e_4e82
	scr_end

Script_00e_4191:
	scr_04 text_0e_4eb4
	scr_end

Script_00e_4195:
	scr_04 text_0e_4efa
	scr_end

Script_00e_4199:
	scr_04 text_0e_4f2f
	scr_end

HayatosHouse2_ObjectEvents:
	object_event $22,  5,  6, 0, $00, $00, $06, $00, Script_00e_41b4
	object_event $26,  8,  3, 0, $00, $00, $00, $01, Script_00e_41b8
	objects_end

Script_00e_41b4:
	scr_04 text_0e_4fa5
	scr_end

Script_00e_41b8:
	scr_checkbit $daa0, $05, .script_00e_41c6
	scr_04 text_0e_5023
	scr_setbit $daa0, $05
	scr_end

.script_00e_41c6
	scr_04 text_0e_50f6
	scr_end

CarpetWomansHouse2_ObjectEvents:
	object_event $1f,  4,  6, 0, $00, $00, $06, $00, Script_00e_41e1
	object_event $15,  7,  4, 0, $00, $00, $06, $01, Script_00e_41eb
	objects_end

Script_00e_41e1:
	scr_04 text_0e_5154
	scr_text text_0e_519f
	scr_text text_0e_51b1
	scr_end

Script_00e_41eb:
	scr_04 text_0e_528c
	scr_end

FangfangsHouse2_ObjectEvents:
	object_event $15,  5,  6, 0, $00, $00, $06, $00, Script_00e_4211
	object_event $18,  8,  3, 0, $00, $00, $0a, $01, Script_00e_4215
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00e_4219
	objects_end

Script_00e_4211:
	scr_04 text_0e_51dd
	scr_end

Script_00e_4215:
	scr_04 text_0e_520e
	scr_end

Script_00e_4219:
	scr_04 text_0e_5267
	scr_end

BellHealingCenter2_ObjectEvents:
	object_event $25,  5,  2, 0, $00, $00, $00, $00, Script_00e_4229
	objects_end

Script_00e_4229:
	scr_text text_0e_52d0 ; TEMP
	scr_end

unk_00e_422d:
	dr $3822d, $38235

unk_00e_4235:
	dr $38235, $38683

Script_00e_4683:
	dr $38683, $38abe

INCLUDE "data/text/bank0e_misc.asm"

text_0e_5b91:
	dr $39b91, $39bdd

text_0e_5bdd:
	text_init $14, $25 ; TEMP
	db $f3, $0c
	db $f1, $58
	db $f4, $29
	db $f1, $c8
	db $f5, $0e
	db $f0, $2a
	db $f1, $5c
	line
	text "?", 1
	line
	getchoice $1cc5 ; TEMP

text_0e_5bf5:
	text_init $1a, $25 ; TEMP
	dr $39bf8, $39c24

INCLUDE "data/text/bank0e_misc2.asm"

unk_0e_7e69:
	dr $3be69, $3bf30


SECTION "banknume", ROMX[$7fff], BANK[$e]
	db $e
