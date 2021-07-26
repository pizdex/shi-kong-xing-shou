Group00_Maps::
	dw BellVillage1_Header
	dw BellVillage1_Header
	dw BellSchoolOutside1_Header
	dw BellObservatoryOutside1_Header
	dw BallotsHouse1_Header
	dw HayatosHouse1_Header
	dw CarpetWomansHouse1_Header
	dw FangfangsHouse1_Header
	dw BellHealingCenter1_Header
	dw BellSchool1_Header
	dw BellObservatory1_Header
	dw BellSchoolSouthClassroom_Header

	dw unk_007_44ef
	dw unk_007_4579
	dw unk_007_458b
	dw unk_007_459d
	dw unk_007_45af
	dw unk_007_45c1
	dw unk_007_45d3
	dw unk_007_45fd
	dw unk_007_460f
	dw unk_007_4621
	dw unk_007_4687
	dw unk_007_4699
	dw unk_007_46ab
	dw unk_007_46bd
	dw unk_007_46cf
	dw unk_007_46ed
	dw unk_007_46ff
	dw unk_007_4711
	dw unk_007_4747
	dw unk_007_4765
	dw unk_007_4783
	dw unk_007_47a1
	dw unk_007_47b3
	dw unk_007_47c5
	dw unk_007_47fb
	dw unk_007_480d
	dw unk_007_484f
	dw unk_007_4861
	dw unk_007_487f
	dw unk_007_489d
	dw unk_007_41ec
	dw unk_007_48d3
	dw unk_007_420a

; BellVillage1
	map  BellVillage1
	warp 6, 5, $9048    ; 0
	warp 1, 0, $2048    ; 1
	warp 7, 1, $7088    ; 2
	warp 0, 1, $7038    ; 3
	warp 7, 0, $7058    ; 4
	warp 7, 5, $7068    ; 5
	warp 0, 5, $7048    ; 6
	warp 4, 4, $5048    ; 7
	warp 0, 5, $7048    ; 8
	end_map

; BellSchoolOutside1
	map  BellSchoolOutside1
	warp 0, 5, $9058    ; 0
	warp 0, 0, $6058    ; 1
	end_map

; BellObservatoryOutside1
	map  BellObservatoryOutside1
	warp 0, 1, $8018
	warp 5, 0, $7058
	end_map

; BallotsHouse1
	map  BallotsHouse1
	warp 0, 0, $8038
	warp 1, 0, $4078
	warp 0, 0, $4038, BallotsHouse1_ObjectEvents2, BallotsHouse1_MapEvents2
	warp 0, 0, $8038, BallotsHouse1_ObjectEvents3
	warp 0, 0, $8038, BallotsHouse1_ObjectEvents4
	end_map

; HayatosHouse1
	map  HayatosHouse1
	warp 0, 0, $8078
	end_map

; CarpetWomansHouse1
	map  CarpetWomansHouse1
	warp 0, 0, $8038
	end_map

; FangfangsHouse1
	map  FangfangsHouse1
	warp 0, 0, $8078
	end_map

; BellHealingCenter1
	map  BellHealingCenter1
	warp 0, 0, $8068
	end_map

; BellSchool1
	map  BellSchool1
	warp 0, 5, $8068
	warp 0, 5, $6028
	warp 0, 0, $7028
	end_map

; BellObservatory1
	map  BellObservatory1
	warp 1, 1, $8068
	warp 0, 1, $b088, BellObservatory1_ObjectEvents2
	end_map

; BellSchoolSouthClassroom
	map  BellSchoolSouthClassroom
	warp 1, 0, $4078
	end_map

unk_007_41ec::
	dr $1c1ec, $1c20a

unk_007_420a::
	dr $1c20a, $1c21c

BellVillage1_MapEvents::
	script_event ABSOLUTE, 19, 1, Script_008_4285
	script_event ABSOLUTE, 19, 2, Script_008_4295
	warp_event ABSOLUTE, 0, MAP_BELL_SCHOOL_OUTSIDE_1, 0
	warp_event 23, ABSOLUTE, MAP_BELL_OBSERVATORY_OUTSIDE_1, 0
	warp_event 3, 7, MAP_HAYATOS_HOUSE_1, 0
	warp_event 19, 5, MAP_CARPET_WOMANS_HOUSE_1, 0
	warp_event 20, 15, MAP_FANGFANGS_HOUSE_1, 0
	script_event 4, 15, 0, Script_008_41a7
	warp_event 12, 11, MAP_BELL_HEALING_CENTER_1, 0
	signpost_event  8,  3, 1
	signpost_event 22,  7, 2
	signpost_event 15, 17, 3
	events_end

BellSchoolOutside1_MapEvents::
	warp_event ABSOLUTE, 19, MAP_BELL_VILLAGE_1, 1
	script_event 4, 4, 0, Script_008_4137
	script_event 5, 4, 0, Script_008_4137
	script_event 6, 4, 0, Script_008_4137
	events_end

BellObservatoryOutside1_MapEvents::
	warp_event     0, ABSOLUTE, MAP_BELL_VILLAGE_1, 2
	script_event   14, 5, 0, Script_008_408a
	script_event   15, 5, 0, Script_008_408a
	script_event   16, 5, 0, Script_008_408a
	signpost_event  8, 8, 4
	events_end

BallotsHouse1_MapEvents:
	warp_event ABSOLUTE, 8, MAP_BELL_VILLAGE_1, 6, 0
	events_end

BallotsHouse1_MapEvents2:
	script_event ABSOLUTE, 8, 0, Script_008_4151
	events_end

HayatosHouse1_MapEvents::
	warp_event ABSOLUTE, 8, MAP_BELL_VILLAGE_1, 3, 0
	events_end

CarpetWomansHouse1_MapEvents::
	dr $1c2b2, $1c2b9

FangfangsHouse1_MapEvents::
	dr $1c2b9, $1c2c0

BellHealingCenter1_MapEvents::
	dr $1c2c0, $1c2cd

BellSchool1_MapEvents::
	dr $1c2cd, $1c2ec

BellObservatory1_MapEvents::
	dr $1c2ec, $1c2f3

BellSchoolSouthClassroom_MapEvents::
	dr $1c2f3, $1c30f

Group01_Maps::
	dw BellVillage2_Header
	dw BellVillage2_Header
	dw BellSchoolOutside2_Header
	dw BellObservatoryOutside2_Header
	dw BallotsHouse2_Header
	dw HayatosHouse2_Header
	dw CarpetWomansHouse2_Header
	dw FangfangsHouse2_Header
	dw BellHealingCenter2_Header
	dw BellSchool2_Header
	dw BellObservatory2_Header
	dw BellSchoolNorthClassroom_Header

	dw unk_007_44ef
	dw unk_007_4579
	dw unk_007_458b
	dw unk_007_459d
	dw unk_007_45af
	dw unk_007_45c1
	dw unk_007_45d3
	dw unk_007_45fd
	dw unk_007_460f
	dw unk_007_4621
	dw unk_007_4687
	dw unk_007_4699
	dw unk_007_46ab
	dw unk_007_46bd
	dw unk_007_46cf
	dw unk_007_46ed
	dw unk_007_46ff
	dw unk_007_4711
	dw unk_007_4747
	dw unk_007_4765
	dw unk_007_4783
	dw unk_007_47a1
	dw unk_007_47b3
	dw unk_007_47c5
	dw unk_007_47fb
	dw unk_007_480d
	dw unk_007_484f
	dw unk_007_4861
	dw unk_007_487f
	dw unk_007_489d
	dw unk_007_44dd
	dw unk_007_48d3
	dw unk_007_48e5
	dw unk_007_48f7
	dw unk_007_49b1
	dw unk_007_49c3
	dw unk_007_49d5
	dw unk_007_49e7
	dw unk_007_49f9
	dw unk_007_4a0b
	dw unk_007_4a29
	dw unk_007_4a3b

; BellVillage2
	map BellVillage2
	warp 6, 5, $9048
	warp 1, 0, $2048
	warp 7, 1, $7088
	warp 0, 1, $7038
	warp 7, 0, $7058
	warp 7, 5, $7068
	warp 0, 5, $7048
	warp 4, 4, $5048
	warp 0, 5, $7048
	end_map

; BellSchoolOutside2
	map BellSchoolOutside2
	warp 0, 5, $9058
	warp 0, 0, $6058
	end_map

; BellObservatoryOutside2
	map BellObservatoryOutside2
	warp 0, 1, $8018, BellSchoolOutside2_ObjectEvents, BellObservatoryOutside2_MapEvents
	warp 5, 0, $7058, BellSchoolOutside2_ObjectEvents, BellObservatoryOutside2_MapEvents
	end_map

; BallotsHouse2
	map BallotsHouse2
	warp 0, 0, $8038
	warp 0, 0, $5078, BallotsHouse2_ObjectEvents, BallotsHouse2_MapEvents2
	end_map

; HayatosHouse2
	map HayatosHouse2
	warp 0, 0, $8078
	end_map

; CarpetWomansHouse2
	map CarpetWomansHouse2
	warp 0, 0, $8038
	end_map

; FangfangsHouse2
	map FangfangsHouse2
	warp 0, 0, $8078
	end_map

; BellHealingCenter2
	map BellHealingCenter2
	warp 0, 0, $8068
	end_map

; BellSchool2
	map BellSchool2
	warp 0, 5, $8068
	warp 0, 5, $6028
	warp 0, 0, $7028
	end_map

; BellObservatory2
	map BellObservatory2
	warp 1, 1, $8068
	end_map

; BellSchoolNorthClassroom
	map BellSchoolNorthClassroom
	warp 1, 0, $4078
	end_map

unk_007_44dd::
	; map XXXXX
	db BANK(BellSchoolSouthClassroom_MapAttributes)
	ds 3 ; 0 0 0
	dw BellSchoolSouthClassroom_MapAttributes

	; warp 1, 0, $4078, BellSchoolOutside2_ObjectEvents, unk_007_4b3d
	db 1, 0
	dw $4078
	db BANK(BellSchoolOutside2_ObjectEvents)
	ds 3 ; 0 0 0
	dw BellSchoolOutside2_ObjectEvents
	dw unk_007_4b3d

unk_007_44ef::
	dr $1c4ef, $1c579

unk_007_4579::
	dr $1c579, $1c58b

unk_007_458b::
	dr $1c58b, $1c59d

unk_007_459d::
	dr $1c59d, $1c5af

unk_007_45af::
	dr $1c5af, $1c5c1

unk_007_45c1::
	dr $1c5c1, $1c5d3

unk_007_45d3::
	dr $1c5d3, $1c5fd

unk_007_45fd::
	dr $1c5fd, $1c60f

unk_007_460f::
	dr $1c60f, $1c621

unk_007_4621::
	dr $1c621, $1c687

unk_007_4687::
	dr $1c687, $1c699

unk_007_4699::
	dr $1c699, $1c6ab

unk_007_46ab::
	dr $1c6ab, $1c6bd

unk_007_46bd::
	dr $1c6bd, $1c6cf

unk_007_46cf::
	dr $1c6cf, $1c6ed

unk_007_46ed::
	dr $1c6ed, $1c6ff

unk_007_46ff::
	dr $1c6ff, $1c711

unk_007_4711::
	dr $1c711, $1c747

unk_007_4747::
	dr $1c747, $1c765

unk_007_4765::
	dr $1c765, $1c783

unk_007_4783::
	dr $1c783, $1c7a1

unk_007_47a1::
	dr $1c7a1, $1c7b3

unk_007_47b3::
	dr $1c7b3, $1c7c5

unk_007_47c5::
	dr $1c7c5, $1c7fb

unk_007_47fb::
	dr $1c7fb, $1c80d

unk_007_480d::
	dr $1c80d, $1c84f

unk_007_484f::
	dr $1c84f, $1c861

unk_007_4861::
	dr $1c861, $1c87f

unk_007_487f::
	dr $1c87f, $1c89d

unk_007_489d::
	dr $1c89d, $1c8d3

unk_007_48d3::
	dr $1c8d3, $1c8e5

unk_007_48e5::
	dr $1c8e5, $1c8f7

unk_007_48f7::
	dr $1c8f7, $1c9b1

unk_007_49b1::
	dr $1c9b1, $1c9c3

unk_007_49c3::
	dr $1c9c3, $1c9d5

unk_007_49d5::
	dr $1c9d5, $1c9e7

unk_007_49e7::
	dr $1c9e7, $1c9f9

unk_007_49f9::
	dr $1c9f9, $1ca0b

unk_007_4a0b::
	dr $1ca0b, $1ca29

unk_007_4a29::
	dr $1ca29, $1ca3b

unk_007_4a3b::
	dr $1ca3b, $1ca4d

BellVillage2_MapEvents::
	script_event ABSOLUTE, 19, $00, Script_00e_409f
	warp_event ABSOLUTE, 0, $02, $00, $00 ; TEMP
	warp_event 23, ABSOLUTE, $2b, $00, $00 ; TEMP
	warp_event 3, 7, $05, $00, $00 ; TEMP
	warp_event 19, 5, $06, $00, $00 ; TEMP
	warp_event 20, 15, $07, $00, $00 ; TEMP
	warp_event 4, 15, $04, $00, $00 ; TEMP
	warp_event 12, 11, $08, $00, $00 ; TEMP
	signpost_event 8, 3, $01
	signpost_event 22, 7, $02
	signpost_event 15, 17, $03
	events_end

BellSchoolOutside2_MapEvents::
	warp_event ABSOLUTE, 19, $01, $01, $00 ; TEMP
	script_event 4, 4, $00, Script_00e_408f
	script_event 5, 4, $00, Script_00e_408f
	script_event 6, 4, $00, Script_00e_408f
	events_end

BellObservatoryOutside2_MapEvents::
	warp_event 0, ABSOLUTE, $01, $02, $00 ; TEMP
	signpost_event 8, 8, $04
	events_end

BallotsHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $06, $00 ; TEMP
	event 9, 3, $07, $01, $00, $00
	events_end

BallotsHouse2_MapEvents2::
	script_event ABSOLUTE, 8, $00, Script_00e_404a
	event_04 5, 3, $00, Script_00e_4012
	event 9, 3, $07, $01, $00, $00
	events_end

HayatosHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $03, $00 ; TEMP
	event 9, 3, $07, $02, $00, $00
	events_end

CarpetWomansHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $04, $00 ; TEMP
	event 2, 3, $07, $03, $00, $00
	events_end

FangfangsHouse2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $05, $00 ; TEMP
	event 9, 3, $07, $04, $00, $00
	events_end

BellHealingCenter2_MapEvents::
	warp_event ABSOLUTE, 8, $01, $07, $00 ; TEMP
	event_04 5, 4, $00, Script_00e_4683
	events_end

BellSchool2_MapEvents::
	warp_event ABSOLUTE, 18, $02, $01, $00 ; TEMP
	warp_event 1, 14, $0b, $00, $00 ; TEMP
	warp_event 1, 15, $0b, $00, $00 ; TEMP
	warp_event 1, 5, $2a, $00, $00 ; TEMP
	warp_event 1, 6, $2a, $00, $00 ; TEMP
	event 7, 2, $07, $05, $00, $00
	events_end

BellObservatory2_MapEvents::
	events_end

BellSchoolNorthClassroom_MapEvents::
	warp_event 10, ABSOLUTE, $09, $01, $00 ; TEMP
	event 2, 3, $07, $06, $00, $00
	events_end

unk_007_4b3d::
	dr $1cb3d, $1ce2f

unk_007_4e2f::
	dr $1ce2f, $1cf00

SECTION "banknum7", ROMX[$7fff], BANK[$7]
	db $7
