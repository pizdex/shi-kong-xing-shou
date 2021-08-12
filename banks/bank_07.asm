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
	; map XXXXX
	db BANK(BellSchoolNorthClassroom_MapAttributes)
	ds 3 ; 0 0 0
	dw BellSchoolNorthClassroom_MapAttributes
	; warp 1, 0, $4078, unk_008_4414, unk_007_42fa
	db 1, 0
	dw $4078
	db BANK(unk_008_4414)
	ds 3 ; 0 0 0
	dw unk_008_4414
	dw unk_007_42fa
	; warp 0, 1, $5078, BellObservatory1_ObjectEvents, unk_007_4307
	db 0, 1
	dw $5078
	db BANK(BellObservatory1_ObjectEvents)
	ds 3 ; 0 0 0
	dw BellObservatory1_ObjectEvents
	dw unk_007_4307


unk_007_420a::
	; map XXXXX
	db BANK(unk_017_4cae)
	ds 3 ; 0 0 0
	dw unk_017_4cae
	; warp 0, 5, $20b0, BellObservatory1_ObjectEvents, unk_007_430e
	db 0, 5
	dw $20b0
	db BANK(BellObservatory1_ObjectEvents)
	ds 3 ; 0 0 0
	dw BellObservatory1_ObjectEvents
	dw unk_007_430e


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
	warp_event ABSOLUTE, 8, $01, $04, $00 ; TEMP
	events_end

FangfangsHouse1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $05, $00 ; TEMP
	events_end

BellHealingCenter1_MapEvents::
	warp_event ABSOLUTE, 8, $01, $07, $00 ; TEMP
	event 5, 4, $04, $00, $c4, $43
	events_end

BellSchool1_MapEvents::
	warp_event ABSOLUTE, 18, $02, $01, $00 ; TEMP
	warp_event 1, 14, $0b, $00, $00 ; TEMP
	warp_event 1, 15, $0b, $00, $00 ; TEMP
	warp_event 1, 5, $2a, $00, $00 ; TEMP
	warp_event 1, 6, $2a, $00, $00 ; TEMP
	events_end

BellObservatory1_MapEvents::
	warp_event ABSOLUTE, 10, $03, $01, $00 ; TEMP
	events_end

BellSchoolSouthClassroom_MapEvents::
	warp_event 10, ABSOLUTE, $09, $01, $00 ; TEMP
	events_end

unk_007_42fa::
	event 10, ABSOLUTE, $01, $00, $b5, $41
	event 7, 6, $01, $03, $c8, $41
	events_end

unk_007_4307::
	event 10, ABSOLUTE, $01, $00, $14, $42
	events_end

unk_007_430e::
	events_end

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
	warp  1, 0, $4078, BellSchoolOutside2_ObjectEvents, unk_007_4b3d

unk_007_44ef::
	; map XXXXX
	db BANK(unk_001_40dc)
	ds 3 ; 0 0 0
	dw unk_001_40dc
	warp  6, 7, $9068, unk_00f_42b0, unk_007_4b44
	warp  0, 0, $2058, unk_00f_42b0, unk_007_4b44
	warp  13, 0, $2058, unk_00f_42b0, unk_007_4b44
	warp  0, 2, $7028, unk_00f_42b0, unk_007_4b44
	warp  0, 6, $7028, unk_00f_42b0, unk_007_4b44
	warp  1, 6, $7058, unk_00f_42b0, unk_007_4b44
	warp  10, 7, $7038, unk_00f_42b0, unk_007_4b44
	warp  13, 6, $7048, unk_00f_42b0, unk_007_4b44
	warp  13, 1, $7068, unk_00f_42b0, unk_007_4b44
	warp  8, 0, $7048, unk_00f_42b0, unk_007_4b44
	warp  4, 0, $7058, unk_00f_42b0, unk_007_4b44

unk_007_4579::
	; map XXXXX
	db BANK(unk_001_40f0)
	ds 3 ; 0 0 0
	dw unk_001_40f0
	warp  0, 0, $8048, unk_00f_401a, unk_007_4ba5

unk_007_458b::
	; map XXXXX
	db BANK(unk_001_4104)
	ds 3 ; 0 0 0
	dw unk_001_4104
	warp  0, 0, $8048, unk_00f_4329, unk_007_4bb2

unk_007_459d::
	; map XXXXX
	db BANK(unk_001_4118)
	ds 3 ; 0 0 0
	dw unk_001_4118
	warp  0, 0, $8058, unk_00f_4000, unk_007_4bbf

unk_007_45af::
	; map XXXXX
	db BANK(unk_001_412c)
	ds 3 ; 0 0 0
	dw unk_001_412c
	warp  0, 0, $8038, unk_00f_4039, unk_007_4bcc

unk_007_45c1::
	; map XXXXX
	db BANK(unk_001_4140)
	ds 3 ; 0 0 0
	dw unk_001_4140
	warp  0, 0, $8058, unk_00f_4348, unk_007_4bd9

unk_007_45d3::
	; map XXXXX
	db BANK(unk_001_4154)
	ds 3 ; 0 0 0
	dw unk_001_4154
	warp  0, 0, $8048, unk_00f_43d2, unk_007_4be6
	warp  0, 0, $7058, unk_00f_43e9, unk_007_4bf3
	warp  0, 0, $8048, unk_00f_4416, unk_007_4be6

unk_007_45fd::
	; map XXXXX
	db BANK(unk_001_4168)
	ds 3 ; 0 0 0
	dw unk_001_4168
	warp  0, 0, $8058, unk_00f_4375, unk_007_4c06

unk_007_460f::
	; map XXXXX
	db BANK(unk_001_417c)
	ds 3 ; 0 0 0
	dw unk_001_417c
	warp  0, 0, $8058, unk_00f_4397, unk_007_4c13

unk_007_4621::
	; map XXXXX
	db BANK(unk_001_4190)
	ds 3 ; 0 0 0
	dw unk_001_4190
	warp  4, 5, $9048, unk_00e_4903, unk_007_4c26
	warp  3, 0, $2058, unk_00e_4903, unk_007_4c26
	warp  5, 0, $5058, unk_00e_4903, unk_007_4c26
	warp  7, 0, $6068, unk_00e_4903, unk_007_4c26
	warp  0, 5, $8058, unk_00e_4903, unk_007_4c26
	warp  7, 5, $6068, unk_00e_4903, unk_007_4c26
	warp  4, 3, $7058, unk_00e_4903, unk_007_4c26
	warp  0, 0, $6038, unk_00e_4903, unk_007_4c26

unk_007_4687::
	; map XXXXX
	db BANK(unk_001_41a4)
	ds 3 ; 0 0 0
	dw unk_001_41a4
	warp  0, 0, $8058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4c63

unk_007_4699::
	; map XXXXX
	db BANK(unk_001_41b8)
	ds 3 ; 0 0 0
	dw unk_001_41b8
	warp  0, 0, $8048, unk_00e_49c5, unk_007_4c70

unk_007_46ab::
	; map XXXXX
	db BANK(unk_001_41cc)
	ds 3 ; 0 0 0
	dw unk_001_41cc
	warp  0, 0, $8068, unk_00e_49df, unk_007_4c7d

unk_007_46bd::
	; map XXXXX
	db BANK(unk_001_41e0)
	ds 3 ; 0 0 0
	dw unk_001_41e0
	warp  0, 0, $8058, unk_00e_49ef, unk_007_4c8a

unk_007_46cf::
	; map XXXXX
	db BANK(unk_001_41f4)
	ds 3 ; 0 0 0
	dw unk_001_41f4
	warp  0, 0, $8058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4c97
	warp  1, 0, $4088, BellSchoolNorthClassroom_ObjectEvents, unk_007_4c97

unk_007_46ed::
	; map XXXXX
	db BANK(unk_001_4208)
	ds 3 ; 0 0 0
	dw unk_001_4208
	warp  0, 0, $8068, unk_00e_4664, unk_007_4caa

unk_007_46ff::
	; map XXXXX
	db BANK(unk_001_421c)
	ds 3 ; 0 0 0
	dw unk_001_421c
	warp  0, 0, $8068, unk_00e_4537, unk_007_4cbd

unk_007_4711::
	; map XXXXX
	db BANK(unk_001_4230)
	ds 3 ; 0 0 0
	dw unk_001_4230
	warp  7, 0, $2068, unk_00f_40c2, unk_007_4cd0
	warp  0, 0, $7058, unk_00f_40c2, unk_007_4cd0
	warp  0, 0, $8088, unk_00f_40ab, unk_007_4cd0
	warp  0, 0, $8088, unk_00f_40c2, unk_007_4cd0

unk_007_4747::
	; map XXXXX
	db BANK(unk_001_4244)
	ds 3 ; 0 0 0
	dw unk_001_4244
	warp  1, 0, $9038, unk_00f_4160, unk_007_4ce3
	warp  0, 0, $9028, unk_00f_4160, unk_007_4ce3

unk_007_4765::
	; map XXXXX
	db BANK(unk_001_4258)
	ds 3 ; 0 0 0
	dw unk_001_4258
	warp  0, 0, $9028, unk_00f_418d, unk_007_4cf0
	warp  1, 0, $2078, unk_00f_418d, unk_007_4cf0

unk_007_4783::
	; map XXXXX
	db BANK(unk_001_426c)
	ds 3 ; 0 0 0
	dw unk_001_426c
	warp  1, 0, $2078, unk_00f_41af, unk_007_4cfd
	warp  0, 0, $9028, unk_00f_41af, unk_007_4cfd

unk_007_47a1::
	; map XXXXX
	db BANK(unk_001_4280)
	ds 3 ; 0 0 0
	dw unk_001_4280
	warp  0, 0, $9028, unk_00f_41dc, unk_007_4d0a

unk_007_47b3::
	; map XXXXX
	db BANK(unk_001_4294)
	ds 3 ; 0 0 0
	dw unk_001_4294
	warp  13, 7, $9088, unk_00e_4a1a, unk_007_4d17

unk_007_47c5::
	; map XXXXX
	db BANK(unk_017_4000)
	ds 3 ; 0 0 0
	dw unk_017_4000
	warp  0, 3, $9038, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d24
	warp  0, 0, $5048, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d24
	warp  5, 0, $3088, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d24
	warp  5, 3, $7088, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d24

unk_007_47fb::
	; map XXXXX
	db BANK(unk_017_4014)
	ds 3 ; 0 0 0
	dw unk_017_4014
	warp  0, 0, $9058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d49

unk_007_480d::
	; map XXXXX
	db BANK(unk_017_4028)
	ds 3 ; 0 0 0
	dw unk_017_4028
	warp  5, 3, $5038, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d50
	warp  0, 0, $3018, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d50
	warp  0, 3, $7018, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d50
	warp  4, 0, $2038, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d50
	warp  5, 0, $2078, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d50

unk_007_484f::
	; map XXXXX
	db BANK(unk_017_403c)
	ds 3 ; 0 0 0
	dw unk_017_403c
	warp  0, 0, $9058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d87

unk_007_4861::
	; map XXXXX
	db BANK(unk_017_4050)
	ds 3 ; 0 0 0
	dw unk_017_4050
	warp  5, 5, $9058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4d8e
	warp  7, 5, $9078, unk_00e_4a75, unk_007_4d8e

unk_007_487f::
	; map XXXXX
	db BANK(unk_017_474b)
	ds 3 ; 0 0 0
	dw unk_017_474b
	warp  3, 0, $2078, unk_00e_422d, unk_007_4da7
	warp  0, 0, $2028, unk_00e_422d, unk_007_4da7

unk_007_489d::
	; map XXXXX
	db BANK(unk_017_475f)
	ds 3 ; 0 0 0
	dw unk_017_475f
	warp  5, 3, $9068, unk_00f_4000, unk_007_4de4
	warp  0, 3, $9058, unk_00f_4000, unk_007_4de4
	warp  5, 0, $2068, unk_00f_4000, unk_007_4de4
	warp  0, 0, $4028, unk_00f_4000, unk_007_4de4

unk_007_48d3::
	; map XXXXX
	db BANK(unk_017_4a09)
	ds 3 ; 0 0 0
	dw unk_017_4a09
	warp  0, 1, $8018, BellSchoolNorthClassroom_ObjectEvents, unk_007_4e21

unk_007_48e5::
	; map XXXXX
	db BANK(unk_017_4cae)
	ds 3 ; 0 0 0
	dw unk_017_4cae
	warp  0, 5, $20b0, BellSchoolNorthClassroom_ObjectEvents, unk_007_4e2e

unk_007_48f7::
	; map XXXXX
	db BANK(unk_018_4000)
	ds 3 ; 0 0 0
	dw unk_018_4000
	warp  6, 7, $9068, unk_00e_43d5, unk_007_4e2f
	warp  0, 0, $2058, unk_00e_43d5, unk_007_4e2f
	warp  13, 0, $2058, unk_00e_43d5, unk_007_4e2f
	warp  0, 2, $7028, unk_00e_43d5, unk_007_4e2f
	warp  0, 6, $7028, unk_00e_43d5, unk_007_4e2f
	warp  1, 6, $7058, unk_00e_43d5, unk_007_4e2f
	warp  10, 7, $7038, unk_00e_43d5, unk_007_4e2f
	warp  13, 6, $7048, unk_00e_43d5, unk_007_4e2f
	warp  13, 1, $7068, unk_00e_43d5, unk_007_4e2f
	warp  8, 0, $7048, unk_00e_43d5, unk_007_4e2f
	warp  4, 0, $7058, unk_00e_43d5, unk_007_4e2f
	warp  6, 3, $8078, unk_00e_44ff, unk_007_4e90
	warp  6, 3, $8078, unk_00e_43d5, unk_007_4e2f
	warp  13, 1, $7068, unk_00e_4366, unk_007_4e2f
	warp  13, 1, $7068, unk_00e_426b, unk_007_4e2f

unk_007_49b1::
	; map XXXXX
	db BANK(unk_018_4014)
	ds 3 ; 0 0 0
	dw unk_018_4014
	warp  0, 0, $8048, unk_00e_4578, unk_007_4e91

unk_007_49c3::
	; map XXXXX
	db BANK(unk_018_4028)
	ds 3 ; 0 0 0
	dw unk_018_4028
	warp  0, 0, $8048, unk_00e_4597, unk_007_4e9e

unk_007_49d5::
	; map XXXXX
	db BANK(unk_018_403c)
	ds 3 ; 0 0 0
	dw unk_018_403c
	warp  0, 0, $8058, BellSchoolNorthClassroom_ObjectEvents, unk_007_4eab

unk_007_49e7::
	; map XXXXX
	db BANK(unk_018_4050)
	ds 3 ; 0 0 0
	dw unk_018_4050
	warp  0, 0, $8038, unk_00e_45c0, unk_007_4eb8

unk_007_49f9::
	; map XXXXX
	db BANK(unk_018_4064)
	ds 3 ; 0 0 0
	dw unk_018_4064
	warp  0, 0, $8058, unk_00e_4632, unk_007_4ec5

unk_007_4a0b::
	; map XXXXX
	db BANK(unk_018_4078)
	ds 3 ; 0 0 0
	dw unk_018_4078
	warp  0, 0, $8048, unk_00e_481c, unk_007_4ed2
	warp  0, 0, $8048, unk_00e_469f, unk_007_4ed2

unk_007_4a29::
	; map XXXXX
	db BANK(unk_018_408c)
	ds 3 ; 0 0 0
	dw unk_018_408c
	warp  0, 0, $8058, unk_00e_4642, unk_007_4edf

unk_007_4a3b::
	; map XXXXX
	db BANK(unk_018_40a0)
	ds 3 ; 0 0 0
	dw unk_018_40a0
	warp  0, 0, $8058, unk_00e_4664, unk_007_4eec

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

unk_007_4b3d:
	warp_event 10, ABSOLUTE, $09, $02, $00
	events_end

unk_007_4b44:
	warp_event ABSOLUTE, 23, $28, $01, $00
	warp_event  4,  0, $29, $00, $00
	warp_event  5,  0, $29, $00, $00
	warp_event 30,  0, $1c, $00, $00
	warp_event 31,  0, $1c, $00, $00
	warp_event  2,  9, $0d, $00, $00
	warp_event  2, 17, $0e, $00, $00
	warp_event  7, 17, $0f, $00, $00
	warp_event 23, 19, $10, $00, $00
	warp_event 30, 17, $11, $00, $00
	script_event 32,  7,  0, Script_00f_45af
	warp_event 20,  5, $14, $00, $00
	warp_event 13,  5, $13, $00, $00
	signpost_event 29,  3, $05
	signpost_event  6,  3, $06
	signpost_event 16, 16, $07
	events_end

unk_007_4ba5:
	warp_event ABSOLUTE,  8, $0c, $03, $00
	event_07  2,  3, $07
	events_end

unk_007_4bb2:
	warp_event ABSOLUTE,  8, $0c, $04, $00
	event_07  3,  3, $08
	events_end

unk_007_4bbf:
	warp_event ABSOLUTE,  8, $0c, $05, $00
	event_07  5,  3, $09
	events_end

unk_007_4bcc:
	warp_event ABSOLUTE,  8, $0c, $06, $00
	event_07  8,  3, $0a
	events_end

unk_007_4bd9:
	warp_event ABSOLUTE,  8, $0c, $07, $00
	event_07  2,  7, $0b
	events_end

unk_007_4be6:
	warp_event ABSOLUTE,  8, $0c, $08, $00
	event_07  2,  3, $0c
	events_end

unk_007_4bf3:
	script_event  3,  8,  0, Script_00f_44df
	script_event  4,  8,  0, Script_00f_4592
	event_07  2,  3, $0c
	events_end

unk_007_4c06:
	warp_event ABSOLUTE,  8, $0c, $0a, $00
	event_04  4,  3,  0, Script_00f_4385
	events_end

unk_007_4c13:
	warp_event ABSOLUTE,  8, $0c, $09, $00
	event_04  4,  4,  0, Script_00f_43b6
	event_04  8,  4,  0, Script_00f_43c4
	events_end

unk_007_4c26:
	warp_event ABSOLUTE, 19, $29, $02, $00
	script_event ABSOLUTE,  0,  0, unk_00e_49ab
	warp_event 15,  3, $16, $00, $00
	warp_event 20,  4, $17, $00, $00
	warp_event  5, 16, $18, $00, $00
	warp_event 20, 14, $19, $00, $00
	warp_event 13, 11, $1b, $00, $00
	warp_event  3,  4, $1a, $00, $00
	signpost_event 10,  3, $0a
	signpost_event 11, 15, $09
	events_end

unk_007_4c63:
	warp_event ABSOLUTE,  8, $15, $02, $00
	event_07  9,  3, $0d
	events_end

unk_007_4c70:
	warp_event ABSOLUTE,  8, $15, $03, $00
	event_07  9,  3, $0e
	events_end

unk_007_4c7d:
	warp_event ABSOLUTE,  8, $15, $04, $00
	event_07  4,  3, $0f
	events_end

unk_007_4c8a:
	warp_event ABSOLUTE,  8, $15, $05, $00
	event_07  2,  3, $10
	events_end

unk_007_4c97:
	warp_event ABSOLUTE,  8, $15, $07, $00
	event_04 10,  3,  0, Script_00e_40fe
	event_07  9,  3, $11
	events_end

unk_007_4caa:
	warp_event ABSOLUTE,  8, $15, $06, $00
	event_04  4,  4,  0, Script_00e_4683
	event_04  8,  4,  0, unk_00e_4691
	events_end

unk_007_4cbd:
	script_event ABSOLUTE,  9,  7, Script_00e_40cd
	warp_event ABSOLUTE,  9, $2d, $02, $00
	event_04  8,  3,  0, Script_00e_4129
	events_end

unk_007_4cd0:
	warp_event ABSOLUTE,  0, $29, $01, $00
	warp_event  5,  5, $1e, $00, $00
	signpost_event  9,  7, $08
	events_end

unk_007_4ce3:
	warp_event ABSOLUTE,  9, $1d, $01, $00
	warp_event  1,  8, $1f, $00, $00
	events_end

unk_007_4cf0:
	warp_event  1,  8, $1e, $01, $00
	warp_event 10,  1, $20, $00, $00
	events_end

unk_007_4cfd:
	warp_event 10,  1, $1f, $01, $00
	warp_event  1,  8, $21, $00, $00
	events_end

unk_007_4d0a:
	warp_event  1,  8, $20, $01, $00
	script_event  7,  5,  0, Script_00f_421c
	events_end

unk_007_4d17:
	warp_event ABSOLUTE, 23, $1a, $01, $00
	script_event 10,  5,  5, unk_00e_4a46
	events_end

unk_007_4d24:
	warp_event ABSOLUTE, 15, $15, $01, $00
	warp_event  4,  3, $24, $00, $00
	warp_event 19,  2, $25, $01, $00
	warp_event 19,  3, $25, $01, $00
	warp_event 19, 12, $25, $02, $00
	warp_event 19, 13, $25, $02, $00
	events_end

unk_007_4d49:
	warp_event ABSOLUTE,  9, $23, $01, $00
	events_end

unk_007_4d50:
	warp_event 13,  9, $26, $00, $00
	warp_event  0,  2, $23, $02, $00
	warp_event  0,  3, $23, $02, $00
	warp_event  0, 12, $23, $03, $00
	warp_event  0, 13, $23, $03, $00
	warp_event 10,  0, $27, $00, $00
	warp_event 11,  0, $27, $00, $00
	warp_event 17,  0, $27, $01, $00
	warp_event 18,  0, $27, $01, $00
	events_end

unk_007_4d87:
	warp_event ABSOLUTE,  9, $25, $00, $00
	events_end

unk_007_4d8e:
	warp_event 14, 19, $25, $03, $00
	warp_event 15, 19, $25, $03, $00
	warp_event 21, 19, $25, $04, $00
	warp_event 22, 19, $25, $04, $00
	events_end

unk_007_4da7:
	warp_event 12,  0, $01, $00, $00
	warp_event 13,  0, $01, $00, $00
	script_event  1,  0,  4, unk_00e_40b9
	script_event  2,  0,  4, unk_00e_40b9
	script_event  1,  0,  7, Script_00e_40c8
	script_event  2,  0,  7, Script_00e_40c8
	warp_event  1,  0, $2d, $00, $00
	warp_event  2,  0, $2d, $00, $00
	signpost_event  3,  3, $0c
	signpost_event 14,  3, $0b
	events_end

unk_007_4de4:
	script_event 16, 15,  0, Script_00f_400a
	script_event 17, 15,  0, Script_00f_400a
	warp_event  4, 15, $1d, $00, $00
	warp_event  5, 15, $1d, $00, $00
	warp_event ABSOLUTE,  0, $15, $00, $00
	event_04  2, ABSOLUTE,  0, Script_00f_45bd
	signpost_event  6,  4, $0d
	signpost_event 17,  2, $0e
	signpost_event  5, 13, $10
	signpost_event 16, 13, $0f
	events_end

unk_007_4e21:
	warp_event  0, ABSOLUTE, $01, $02, $00
	signpost_event  8,  8, $04
	events_end

unk_007_4e2e:
	events_end

unk_007_4e2f:
	warp_event ABSOLUTE, 23, $28, $01, $00
	warp_event  4,  0, $29, $00, $00
	warp_event  5,  0, $29, $00, $00
	warp_event 30,  0, $1c, $00, $00
	warp_event 31,  0, $1c, $00, $00
	warp_event  2,  9, $2e, $00, $00
	warp_event  2, 17, $2f, $00, $00
	warp_event  7, 17, $30, $00, $00
	warp_event 23, 19, $31, $00, $00
	warp_event 30, 17, $32, $00, $00
	script_event 32,  7,  0, unk_00e_46b6
	warp_event 20,  5, $35, $00, $00
	warp_event 13,  5, $34, $00, $00
	signpost_event 29,  3, $05
	signpost_event  6,  3, $06
	signpost_event 16, 16, $07
	events_end

unk_007_4e90:
	events_end

unk_007_4e91:
	warp_event ABSOLUTE,  8, $2d, $03, $00
	event_07  2,  3, $07
	events_end

unk_007_4e9e:
	warp_event ABSOLUTE,  8, $2d, $04, $00
	event_07  3,  3, $08
	events_end

unk_007_4eab:
	warp_event ABSOLUTE,  8, $2d, $05, $00
	event_07  5,  3, $09
	events_end

unk_007_4eb8:
	warp_event ABSOLUTE,  8, $2d, $06, $00
	event_07  8,  3, $0a
	events_end

unk_007_4ec5:
	warp_event ABSOLUTE,  8, $2d, $07, $00
	event_07  2,  7, $0b
	events_end

unk_007_4ed2:
	script_event ABSOLUTE,  8,  0, Script_00e_40d2
	event_07  2,  3, $0c
	events_end

unk_007_4edf:
	warp_event ABSOLUTE,  8, $2d, $0a, $00
	event_04  4,  3,  0, unk_00e_4651
	events_end

unk_007_4eec:
	warp_event ABSOLUTE,  8, $2d, $09, $00
	event_04  4,  4,  0, Script_00e_4683
	event_04  8,  4,  0, unk_00e_4691
	events_end

SECTION "banknum7", ROMX[$7fff], BANK[$7]
	db $7
