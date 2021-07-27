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
	scr_48 2, 1
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
	scr_setmap $2d, $00 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_54aa
	scr_1f $05 ; TEMP
	scr_end

Script_00e_40c8:
	db $66 ; TEMP
	scr_delay $40, $0f ; TEMP
	scr_end

Script_00e_40cd:
	db $66 ; TEMP
	scr_06 $40, $0f ; TEMP
	scr_end

Script_00e_40d2:
	scr_checkbit wdaa0, $06, Script_00e_40dc
	scr_setmap $2d, $08 ; TEMP
	scr_end

Script_00e_40dc:
	scr_checkbit wdaa0, $07, Script_00e_40e6
	scr_setmap $2d, $0d ; TEMP
	scr_end

Script_00e_40e6:
	scr_checkbit wdaa1, $04, Script_00e_40f0
	scr_setmap $2d, $08 ; TEMP
	scr_end

Script_00e_40f0:
	scr_checkbit wdaa1, $05, Script_00e_40fa
	scr_setmap $2d, $0e ; TEMP
	scr_end

Script_00e_40fa:
	scr_setmap $2d, $08 ; TEMP
	scr_end

Script_00e_40fe:
	scr_checkbit wdaa1, $01, Script_00e_4105
	scr_end

Script_00e_4105:
	scr_face $01 ; TEMP
	db $5f ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_662c
	scr_text text_0e_6647
	db $63 ; TEMP
	scr_01 $1f, $41 ; TEMP
	scr_text text_0e_665b
	scr_end

Script_00e_411f:
	scr_text text_0e_66b8
	scr_text text_0e_66eb
	scr_setmap $22, $00 ; TEMP
	scr_end

Script_00e_4129:
	scr_checkbit wdaa2, $01, Script_00e_4130
Script_00e_412f:
	scr_end

Script_00e_4130:
	scr_checkbit wdaa2, $02, Script_00e_412f
	scr_text text_0e_71b4
	scr_48 $02, $04
	scr_setbit $daa2, $02 ; TEMP
	scr_end

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
	object_event $12, 14,  6, 0, $00, $00, $09, $00, Script_00e_424f
	object_event $1d, 10,  8, 0, $00, $00, $00, $01, Script_00e_4253
	object_event $1e,  6,  6, 0, $00, $00, $06, $02, Script_00e_4257
	objects_end

Script_00e_424f:
	scr_04 text_0e_5347
	scr_end

Script_00e_4253:
	scr_04 text_0e_53c0
	scr_end

Script_00e_4257:
	scr_04 text_0e_5437
	scr_3b $4ab4
	scr_checkbit wdaa3, $03, .script_00e_4267
	scr_text text_0e_547a
	scr_end

.script_00e_4267
	scr_text text_0e_54a2
	scr_end

unk_00e_426b:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	object_event $27, 17, 11, 0, $00, $00, $00, $03, Script_00e_42da
	object_event $28, 18, 11, 0, $00, $00, $00, $04, Script_00e_42da
	objects_end

Script_00e_42da:
	scr_65 $00 ; TEMP
	scr_setmap $2d, $0b ; TEMP
	scr_face $01 ; TEMP
	scr_01 $04, $01 ; TEMP
	scr_01 $05, $01 ; TEMP
	scr_01 $06, $01 ; TEMP
	scr_text text_0e_6ab3
	scr_text text_0e_6acf
	scr_emote $00, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_7e60
	scr_text text_0e_6b0b

Script_00e_42fc:
	scr_34 $0c, $2d, $0b ; TEMP
	scr_face $01 ; TEMP
	scr_01 $04, $01 ; TEMP
	scr_01 $05, $01 ; TEMP
	scr_01 $06, $01 ; TEMP
	scr_checkbit wdaa4, $01, Script_00e_431c
	scr_text text_0e_6b3f
	scr_text text_0e_6b6f
	scr_farjump Script_00e_42fc
	scr_end

Script_00e_431c:
	scr_emote $02, $00 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6ba5
	scr_text text_0e_6bbd
	scr_text text_0e_6c02
	scr_text text_0e_6c29
	scr_emote $02, $01 ; TEMP
	scr_emote $03, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6c51
	scr_emote $00, $00 ; TEMP
	scr_emote $04, $00 ; TEMP
	scr_emote $05, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6c92
	scr_text text_0e_6cc8
	scr_01 $02, $03 ; TEMP
	scr_01 $03, $03 ; TEMP
	scr_1a $02, $03, $00, $f0 ; TEMP
	scr_4e $03, unk_0e_7e69
	scr_setbit $daa1, $05 ; TEMP
	scr_setmap $2d, $0c ; TEMP
	scr_end

unk_00e_4366:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	object_event $27, 17, 11, 0, $00, $00, $00, $03, Script_00e_4480
	object_event $28, 18, 11, 0, $00, $00, $00, $04, Script_00e_4480
	objects_end

unk_00e_43d5:
	object_event $1f, 27, 20, 0, $00, $00, $09, $00, Script_00e_442e
	object_event $1b, 16, 18, 0, $00, $00, $0b, $01, Script_00e_4432
	object_event $16, 11, 17, 0, $00, $00, $05, $02, Script_00e_444a
	object_event $19, 24, 10, 0, $00, $00, $00, $03, Script_00e_444e
	object_event $17,  7, 10, 0, $00, $00, $00, $04, Script_00e_445c
	object_event $1c, 30, 10, 0, $00, $00, $0b, $00, Script_00e_446a
	object_event $21, 24,  6, 0, $00, $00, $00, $01, Script_00e_446e
	object_event $1f,  7,  4, 0, $00, $00, $00, $02, Script_00e_4472
	objects_end

Script_00e_442e:
	scr_04 text_0e_54ce
	scr_end

Script_00e_4432:
	scr_checkbit wdaa0, $07, unk_00e_443c
	scr_04 text_0e_5518
	scr_end

unk_00e_443c:
	scr_checkbit wdaa1, $05, unk_00e_4446
	scr_04 text_0e_6188
	scr_end

unk_00e_4446:
	scr_04 text_0e_6dc7
	scr_end

Script_00e_444a:
	scr_04 text_0e_5555
	scr_end

Script_00e_444e:
	scr_checkbit wdaa1, $05, unk_00e_4458
	scr_04 text_0e_5592
	scr_end

unk_00e_4458:
	scr_04 text_0e_6d1a
	scr_end

Script_00e_445c:
	scr_checkbit wdaa1, $05, unk_00e_4466
	scr_04 text_0e_5666
	scr_end

unk_00e_4466:
	scr_04 text_0e_6d47
	scr_end

Script_00e_446a:
	scr_04 text_0e_56f4
	scr_end

Script_00e_446e:
	scr_04 text_0e_5740
	scr_end

Script_00e_4472:
	scr_checkbit wdaa1, $05, unk_00e_447c
	scr_04 text_0e_576d
	scr_end

unk_00e_447c:
	scr_04 text_0e_6d70
	scr_end

Script_00e_4480:
	scr_setmap $2d, $0b ; TEMP
	scr_face $01 ; TEMP
	scr_01 $04, $01 ; TEMP
	scr_01 $05, $01 ; TEMP
	scr_01 $06, $01 ; TEMP
	scr_text text_0e_5ebb
	scr_01 $04, $02 ; TEMP
	scr_01 $05, $03 ; TEMP
	scr_text text_0e_5ee0
	scr_emote $02, $00 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_5ef5
	scr_01 $04, $01 ; TEMP
	scr_01 $05, $01 ; TEMP
	scr_emote $02, $02 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_5f1f
	scr_text text_0e_5f4b
	scr_text text_0e_5f67
	scr_text text_0e_5f7e
	scr_text text_0e_5f99
	scr_text text_0e_5fa2
	scr_text text_0e_5fab
	scr_emote $00, $00 ; TEMP
	scr_emote $04, $00 ; TEMP
	scr_emote $05, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_5fc0
	scr_text text_0e_6015
	scr_text text_0e_6055
	scr_text text_0e_6068
	scr_text text_0e_60a4
	scr_text text_0e_60d9
	scr_text text_0e_60f7
	scr_01 $02, $03 ; TEMP
	scr_01 $03, $03 ; TEMP
	scr_1a $02, $03, $00, $f0 ; TEMP
	scr_4e $03, unk_0e_7e69
	scr_setbit $daa0, $07 ; TEMP
	scr_setmap $2d, $0c ; TEMP
	scr_end

unk_00e_44ff:
	object_event $27, 17, 11, 0, $00, $00, $00, $00, Script_00e_4000
	object_event $28, 18, 11, 0, $00, $00, $00, $01, Script_00e_4000
	object_event $1a, 16, 13, 0, $00, $00, $00, $02, Script_00e_4000
	object_event $1b, 15, 13, 0, $00, $00, $00, $03, Script_00e_4000
	object_event $02, 20, 12, 0, $00, $00, $00, $04, Script_00e_4000
	objects_end

unk_00e_4537:
	object_event $16,  8,  7, 0, $00, $00, $00, $00, Script_00e_4543
	objects_end

Script_00e_4543:
	scr_checkbit wdaa2, $00, unk_00e_454d
	scr_04 text_0e_5806
	scr_end

unk_00e_454d:
	scr_checkbit wdaa2, $01, unk_00e_456a
	scr_04 text_0e_70c0
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_7136
	scr_setbit $daa2, $01 ; TEMP
	scr_end

unk_00e_456a:
	scr_checkbit wdaa2, $02, unk_00e_4574
	scr_04 text_0e_717b
	scr_end

unk_00e_4574:
	scr_04 text_0e_765d
	scr_end

unk_00e_4578:
	object_event $19,  7,  3, 0, $00, $00, $00, $00, Script_00e_458f
	object_event $16,  6,  6, 0, $00, $00, $06, $01, Script_00e_4593
	objects_end

Script_00e_458f:
	scr_04 text_0e_584c
	scr_end

Script_00e_4593:
	scr_04 text_0e_58bd
	scr_end

unk_00e_4597:
	object_event $12,  6,  5, 0, $00, $00, $0b, $00, Script_00e_45ae
	object_event $1d,  6,  3, 0, $00, $00, $00, $01, Script_00e_45bc
	objects_end

Script_00e_45ae:
	scr_checkbit wdaa1, $05, unk_00e_45b8
	scr_04 text_0e_592f
	scr_end

unk_00e_45b8:
	scr_04 text_0e_6dc7
	scr_end

Script_00e_45bc:
	scr_04 text_0e_5992
	scr_end

unk_00e_45c0:
	object_event $13,  4,  3, 0, $00, $00, $00, $00, Script_00e_45e2
	object_event $1b,  6,  6, 0, $00, $00, $06, $01, Script_00e_45f0
	object_event $1a,  5,  3, 0, $00, $00, $00, $02, Script_00e_45f4
	objects_end

Script_00e_45e2:
	scr_checkbit wdaa1, $05, unk_00e_45ec
	scr_04 text_0e_59f6
	scr_end

unk_00e_45ec:
	scr_04 text_0e_6dec
	scr_end

Script_00e_45f0:
	scr_04 text_0e_5a5a
	scr_end

Script_00e_45f4:
	scr_checkbit wdaa1, $05, unk_00e_461c
	scr_01 $04, $03 ; TEMP
	scr_emote $04, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_01 $04, $02 ; TEMP
	scr_01 $02, $03 ; TEMP
	scr_text text_0e_5ac1
	scr_text text_0e_5b18
	scr_01 $02, $00 ; TEMP
	scr_text text_0e_5b22
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

unk_00e_461c:
	scr_04 text_0e_6e16
	scr_01 $02, $03 ; TEMP
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6e80
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

unk_00e_4632:
	object_event $16,  4,  5, 0, $00, $00, $08, $00, Script_00e_463e
	objects_end

Script_00e_463e:
	scr_04 text_0e_5b43
	scr_end

unk_00e_4642:
	object_event $22,  2,  3, 0, $00, $00, $00, $00, Script_00e_464e
	objects_end

Script_00e_464e:
	scr_text text_0e_5b91
	scr_end

unk_00e_4651:
	scr_face $02 ; TEMP
	scr_01 $02, $03 ; TEMP
	scr_text text_0e_5b91
	scr_checkbit wdaa4, $01, unk_00e_4663
	scr_35 $00 ; TEMP
	scr_end

unk_00e_4663:
	scr_end

unk_00e_4664:
	object_event $25,  4,  2, 0, $00, $00, $00, $00, Script_00e_467b
	object_event $25,  8,  2, 0, $00, $00, $00, $01, Script_00e_467f
	objects_end

Script_00e_467b:
	scr_text text_0e_5bdd
	scr_end

Script_00e_467f:
	scr_text text_0e_5bf5
	scr_end

Script_00e_4683:
	scr_face $01 ; TEMP
	scr_text text_0e_5bdd
	scr_checkbit wdaa3, $03, unk_00e_4690
	scr_37
	scr_end

unk_00e_4690:
	scr_end

unk_00e_4691:
	scr_face $01 ; TEMP
	scr_text text_0e_5bf5
	scr_checkbit wdaa3, $03, unk_00e_469e
	scr_36
	scr_end

unk_00e_469e:
	scr_end

unk_00e_469f:
	object_event $2d,  8,  6, 0, $00, $00, $00, $00, Script_00e_4849
	object_event $29,  5,  5, 0, $00, $00, $00, $01, Script_00e_46c4
	objects_end

unk_00e_46b6:
	scr_checkbit wdaa1, $00, unk_00e_46c0
	scr_setmap $33, $00 ; TEMP
	scr_end

unk_00e_46c0:
	scr_setmap $33, $01 ; TEMP
	scr_end

Script_00e_46c4:
	scr_checkbit wdaa1, $03, unk_00e_46ce
	scr_04 text_0e_7e33
	scr_end

unk_00e_46ce:
	scr_checkbit wdaa1, $04, unk_00e_472e
	db $24 ; TEMP
	scr_face $01 ; TEMP
	db $5f ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6967
	scr_01 $03, $02 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_01 $03, $01 ; TEMP
	scr_06 $03, $02 ; TEMP
	scr_06 $03, $02 ; TEMP
	scr_text text_0e_69a6
	scr_01 $03, $03 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_01 $03, $01 ; TEMP
	scr_text text_0e_69ae
	scr_01 $03, $00 ; TEMP
	scr_06 $03, $01 ; TEMP
	scr_06 $03, $01 ; TEMP
	scr_emote $03, $02 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_69b6
	scr_text text_0e_69ef
	scr_emote $03, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6a00
	scr_text text_0e_6a52
	scr_4d $02, $02
	scr_48 $02, $03
	scr_setbit $daa1, $04 ; TEMP
	scr_end

unk_00e_472e:
	scr_checkbit wdaa1, $05, unk_00e_4738
	scr_04 text_0e_6a61
	scr_end

unk_00e_4738:
	scr_checkbit wdaa1, $07, unk_00e_4746
	scr_04 text_0e_6e99
	scr_setbit $daa1, $06 ; TEMP
	scr_end

unk_00e_4746:
	scr_checkbit wdaa2, $00, unk_00e_47e5
	db $24 ; TEMP
	scr_face $01 ; TEMP
	db $5f ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_emote $03, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6f6b
	scr_01 $03, $02 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_01 $03, $00 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_01 $03, $03 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_01 $03, $00 ; TEMP
	scr_text text_0e_6f86
	scr_emote $03, $04 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6fc3
	scr_01 $03, $01 ; TEMP
	scr_06 $03, $02 ; TEMP
	scr_06 $03, $02 ; TEMP
	scr_emote $03, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_01 $03, $03 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_01 $03, $01 ; TEMP
	scr_emote $03, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_01 $03, $02 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_06 $03, $03 ; TEMP
	scr_01 $03, $01 ; TEMP
	scr_emote $03, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_01 $03, $00 ; TEMP
	scr_06 $03, $01 ; TEMP
	scr_06 $03, $01 ; TEMP
	scr_01 $03, $03 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_06 $03, $04 ; TEMP
	scr_01 $03, $00 ; TEMP
	scr_text text_0e_7026
	scr_text text_0e_7090
	scr_setbit $daa2, $00 ; TEMP
	scr_end

unk_00e_47e5:
	scr_checkbit wdaa2, $02, unk_00e_47ef
	scr_04 text_0e_709b
	scr_end

unk_00e_47ef:
	scr_checkbit wdaa2, $03, unk_00e_4812
	db $24 ; TEMP
	scr_face $01 ; TEMP
	db $5f ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_text text_0e_71c3
	db $28 ; TEMP
	db $29 ; TEMP
	scr_text text_0e_7217
	scr_text text_0e_726f
	scr_4d $02, $04
	scr_48 $02, $05
	scr_setbit $daa2, $03 ; TEMP
	scr_end

unk_00e_4812:
	scr_04 text_0e_7283
	scr_emote $00, $01 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_end

unk_00e_481c:
	object_event $2d,  8,  6, 0, $00, $00, $00, $00, Script_00e_4849
	object_event $29,  5,  5, 0, $00, $00, $00, $01, Script_00e_484d
	object_event $02,  4,  3, wdaa1, $00, $00, $00, $02, Script_00e_48f4
	object_event $03,  3,  3, wdaa1, $00, $00, $00, $03, Script_00e_48ff
	objects_end

Script_00e_4849:
	scr_04 text_0e_5c24
	scr_end

Script_00e_484d:
	scr_checkbit wdaa0, $06, unk_00e_488f
	db $24 ; TEMP
	scr_face $01 ; TEMP
	db $5f ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_text text_0e_5c9e
	scr_text text_0e_5ce0
	db $28 ; TEMP
	db $29 ; TEMP
	scr_text text_0e_5d33
	scr_delay $03, $07 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_5dae
	scr_text text_0e_5e40
	scr_text text_0e_5e5d
	scr_face $00 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_emote $03, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_face $01 ; TEMP
	scr_text text_0e_5e73
	scr_4d $02, $01
	scr_setbit $daa0, $06 ; TEMP
	scr_end

unk_00e_488f:
	scr_checkbit wdaa0, $07, unk_00e_4899
	scr_04 text_0e_5e73
	scr_end

unk_00e_4899:
	scr_checkbit wdaa1, $00, unk_00e_48f0
	db $24 ; TEMP
	scr_face $01 ; TEMP
	db $5f ; TEMP
	scr_01 $01, $01 ; TEMP
	scr_text text_0e_6205
	scr_01 $04, $00 ; TEMP
	scr_01 $05, $00 ; TEMP
	scr_1a $05, $04, $00, $f0 ; TEMP
	scr_4e $04, $7eca
	scr_1b $04 ; TEMP
	scr_01 $04, $01 ; TEMP
	scr_01 $05, $03 ; TEMP
	scr_text text_0e_6292
	scr_emote $00, $03 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_62aa
	scr_text text_0e_62c5
	scr_text text_0e_62ef
	scr_01 $04, $03 ; TEMP
	scr_text text_0e_6314
	scr_44
	scr_06 $04, $04 ; TEMP
	scr_1c $04 ; TEMP
	scr_06 $05, $04 ; TEMP
	scr_06 $05, $04 ; TEMP
	scr_1c $05 ; TEMP
	scr_61 $01 ; TEMP
	scr_62 $01, $01 ; TEMP
	scr_setbit $daa1, $00 ; TEMP
	scr_end

unk_00e_48f0:
	scr_04 text_0e_7e33
	scr_end

Script_00e_48f4:
	scr_checkbit wdaa0, $07, unk_00e_48fb
	scr_end

unk_00e_48fb:
	scr_04 text_0e_61da
	scr_end

Script_00e_48ff:
	scr_04 text_0e_61f6
	scr_end

unk_00e_4903:
	object_event $1e, 13, 16, 0, $00, $00, $0b, $01, Script_00e_495c
	object_event $12, 19,  8, 0, $00, $00, $06, $00, Script_00e_4960
	object_event $14, 16, 11, 0, $00, $00, $05, $02, Script_00e_496e
	object_event $1d,  8, 10, 0, $00, $00, $08, $03, Script_00e_497c
	object_event $19, 10, 15, 0, $00, $00, $07, $04, Script_00e_4980
	object_event $1c,  6,  5, 0, $00, $00, $06, $00, Script_00e_498e
	object_event $20,  1, 13, wdaa1, $00, $01, $00, $01, Script_00e_4992
	object_event $20, 12,  1, wdaa1, $02, $00, $00, $02, Script_00e_49a7
	objects_end

Script_00e_495c:
	scr_04 text_0e_6324
	scr_end

Script_00e_4960:
	scr_checkbit wdaa1, $03, unk_00e_496a
	scr_04 text_0e_6336
	scr_end

unk_00e_496a:
	scr_04 text_0e_6832
	scr_end

Script_00e_496e:
	scr_checkbit wdaa1, $03, unk_00e_4978
	scr_04 text_0e_638b
	scr_end

unk_00e_4978:
	scr_04 text_0e_6882
	scr_end

Script_00e_497c:
	scr_04 text_0e_63de
	scr_end

Script_00e_4980:
	scr_checkbit wdaa1, $03, unk_00e_498a
	scr_04 text_0e_6434
	scr_end

unk_00e_498a:
	scr_04 text_0e_68b3
	scr_end

Script_00e_498e:
	scr_04 text_0e_6466
	scr_end

Script_00e_4992:
	scr_checkbit wdaa1, $01, unk_00e_49a3
	scr_04 text_0e_64ad
	scr_text text_0e_64f7
	scr_setbit $daa1, $01 ; TEMP
	scr_end

unk_00e_49a3:
	scr_04 text_0e_64f7
	scr_end

Script_00e_49a7:
	scr_04 text_0e_6607
	scr_end

unk_00e_49ab:
	scr_checkbit wdaa1, $02, unk_00e_49c1
	scr_04 text_0e_6607
	scr_face $00 ; TEMP
	scr_move $4191 ; TEMP
	scr_44
	scr_06 $01, $02 ; TEMP
	scr_01 $01, $00 ; TEMP
	scr_end

unk_00e_49c1:
	scr_setmap $23, $00 ; TEMP
	scr_end

unk_00e_49c5:
	object_event $15,  9,  3, 0, $00, $00, $06, $00, Script_00e_49d1
	objects_end

Script_00e_49d1:
	scr_checkbit wdaa1, $03, unk_00e_49db
	scr_04 text_0e_6515
	scr_end

unk_00e_49db:
	scr_04 text_0e_68f4
	scr_end

unk_00e_49df:
	object_event $1b,  5,  4, 0, $00, $00, $00, $00, Script_00e_49eb
	objects_end

Script_00e_49eb:
	scr_04 text_0e_6550
	scr_end

unk_00e_49ef:
	object_event $1e,  5,  5, 0, $00, $00, $09, $00, Script_00e_49fb
	objects_end

Script_00e_49fb:
	scr_checkbit wdaa1, $03, unk_00e_4a16
	scr_04 text_0e_65b8
	scr_63 $01 ; TEMP
	scr_end

unk_00e_4a07:
	scr_4a $09 ; TEMP
	scr_emote $00, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_65de
	scr_text text_0e_65fc
	scr_end

unk_00e_4a16:
	scr_04 text_0e_6923
	scr_end

unk_00e_4a1a:
	object_event $2a, 10,  4, wdaa1, $02, $00, $00, $00, Script_00e_4a26
	objects_end

Script_00e_4a26:
	scr_04 text_0e_66fa
	scr_3b $4ac4
	scr_checkbit wdaa3, $03, unk_00e_4a45
	scr_text text_0e_672d
	scr_01 $02, $03 ; TEMP
	scr_4e $02, unk_0e_7e69
	scr_1c $02 ; TEMP
	scr_setbit $daa1, $02 ; TEMP
	scr_1f $06 ; TEMP
	scr_end

unk_00e_4a45:
	scr_end

unk_00e_4a46:
	scr_01 $02, $00 ; TEMP
	scr_text text_0e_66fa
	scr_3b $4ac4
	scr_checkbit wdaa3, $03, unk_00e_4a68
	scr_text text_0e_672d
	scr_01 $02, $03 ; TEMP
	scr_4e $02, unk_0e_7e69
	scr_1c $02 ; TEMP
	scr_setbit $daa1, $02 ; TEMP
	scr_1f $06 ; TEMP
	scr_end

unk_00e_4a68:
	scr_face $03 ; TEMP
	scr_move $413e ; TEMP
	scr_44
	scr_06 $01, $03 ; TEMP
	scr_01 $01, $03 ; TEMP
	scr_end

unk_00e_4a75:
	object_event $2a,  2,  2, wdab8, $05, $00, $00, $00, Script_00e_4a81
	objects_end

Script_00e_4a81:
	scr_emote $02, $00 ; TEMP
	scr_delay $03, $20 ; TEMP
	scr_text text_0e_6784
	scr_3b $4af3
	scr_checkbit wdaa3, $03, unk_00e_4a45
	scr_text text_0e_67ae
	scr_01 $02, $03 ; TEMP
	scr_4e $02, unk_0e_7e69
	scr_1c $02 ; TEMP
	scr_move $4193 ; TEMP
	scr_44
	scr_01 $01, $01 ; TEMP
	scr_06 $01, $02 ; TEMP
	scr_face $03 ; TEMP
	scr_move $413e ; TEMP
	scr_face $01 ; TEMP
	scr_06 $01, $02 ; TEMP
	scr_01 $01, $03 ; TEMP
	scr_text text_0e_67e0
	scr_setbit $dab8, $05 ; TEMP
	scr_end

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
