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

unk_007_4b3d::
	dr $1cb3d, $1cb44

unk_007_4b44::
	dr $1cb44, $1cba5

unk_007_4ba5::
	dr $1cba5, $1cbb2

unk_007_4bb2::
	dr $1cbb2, $1cbbf

unk_007_4bbf::
	dr $1cbbf, $1cbcc

unk_007_4bcc::
	dr $1cbcc, $1cbd9

unk_007_4bd9::
	dr $1cbd9, $1cbe6

unk_007_4be6::
	dr $1cbe6, $1cbf3

unk_007_4bf3::
	dr $1cbf3, $1cc06

unk_007_4c06::
	dr $1cc06, $1cc13

unk_007_4c13::
	dr $1cc13, $1cc26

unk_007_4c26::
	dr $1cc26, $1cc63

unk_007_4c63::
	dr $1cc63, $1cc70

unk_007_4c70::
	dr $1cc70, $1cc7d

unk_007_4c7d::
	dr $1cc7d, $1cc8a

unk_007_4c8a::
	dr $1cc8a, $1cc97

unk_007_4c97::
	dr $1cc97, $1ccaa

unk_007_4caa::
	dr $1ccaa, $1ccbd

unk_007_4cbd::
	dr $1ccbd, $1ccd0

unk_007_4cd0::
	dr $1ccd0, $1cce3

unk_007_4ce3::
	dr $1cce3, $1ccf0

unk_007_4cf0::
	dr $1ccf0, $1ccfd

unk_007_4cfd::
	dr $1ccfd, $1cd0a

unk_007_4d0a::
	dr $1cd0a, $1cd17

unk_007_4d17::
	dr $1cd17, $1cd24

unk_007_4d24::
	dr $1cd24, $1cd49

unk_007_4d49::
	dr $1cd49, $1cd50

unk_007_4d50::
	dr $1cd50, $1cd87

unk_007_4d87::
	dr $1cd87, $1cd8e

unk_007_4d8e::
	dr $1cd8e, $1cda7

unk_007_4da7::
	dr $1cda7, $1cde4

unk_007_4de4::
	dr $1cde4, $1ce21

unk_007_4e21::
	dr $1ce21, $1ce2e

unk_007_4e2e::
	dr $1ce2e, $1ce2f

unk_007_4e2f::
	dr $1ce2f, $1ce90

unk_007_4e90::
	dr $1ce90, $1ce91

unk_007_4e91::
	dr $1ce91, $1ce9e

unk_007_4e9e::
	dr $1ce9e, $1ceab

unk_007_4eab::
	dr $1ceab, $1ceb8

unk_007_4eb8::
	dr $1ceb8, $1cec5

unk_007_4ec5::
	dr $1cec5, $1ced2

unk_007_4ed2::
	dr $1ced2, $1cedf

unk_007_4edf::
	dr $1cedf, $1ceec

unk_007_4eec::
	dr $1ceec, $1cf00

SECTION "banknum7", ROMX[$7fff], BANK[$7]
	db $7
