newgroup: MACRO
;\1: group id
MAPGROUP_\1 EQU const_value
CURRENT_NUM_MAPGROUP_MAPS EQUS "NUM_\1_MAPS"
__map_value__ = 1
	const_skip
ENDM

map_const: MACRO
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
MAP_\1 EQU __map_value__
__map_value__ = __map_value__ + 1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

endgroup: MACRO
{CURRENT_NUM_MAPGROUP_MAPS} EQU __map_value__ - 1
PURGE CURRENT_NUM_MAPGROUP_MAPS
ENDM

	const_def   -1

; Map IDs
	newgroup    GROUP_00,                           ; 00
	map_const	BELL_VILLAGE_1,              12, 10 ; 01
	map_const	BELL_SCHOOL_OUTSIDE_1,        6, 10 ; 02
	map_const	BELL_OBSERVATORY_OUTSIDE_1,  10,  6 ; 03
	map_const	BALLOTS_HOUSE_1,              6,  5 ; 04
	map_const	HAYATOS_HOUSE_1,              6,  5 ; 05
	map_const	CARPET_WOMANS_HOUSE_1,        6,  5 ; 06
	map_const	FANGFANGS_HOUSE_1,            6,  5 ; 07
	map_const	BELL_HEALING_CENTER_1,        6,  5 ; 08
	map_const	BELL_SCHOOL_1,                6, 10 ; 09
	map_const	BELL_OBSERVATORY_1,           6,  6 ; 0A
	map_const	BELL_SCHOOL_SOUTH_CLASSROOM,  6,  6 ; 0B
	map_const	TECH_CITY_1,                 18, 12 ; 0C
	; TODO
	endgroup

	newgroup    GROUP_01                    ; 01
	map_const	BELL_VILLAGE_2,              12, 10 ; 01 TODO
	map_const	BELL_SCHOOL_OUTSIDE_2,        0,  0 ; 02 TODO
	map_const	BELL_OBSERVATORY_OUTSIDE_2,   0,  0 ; 03 TODO
	map_const	BALLOTS_HOUSE_2,              0,  0 ; 04 TODO
	map_const	HAYATOS_HOUSE_2,              0,  0 ; 05 TODO
	map_const	CARPET_WOMANS_HOUSE_2,        0,  0 ; 06 TODO
	map_const	FANGFANGS_HOUSE_2,            0,  0 ; 07 TODO
	map_const	BELL_HEALING_CENTER_2,        0,  0 ; 08 TODO
	map_const	BELL_SCHOOL_2,                0,  0 ; 09 TODO
	map_const	BELL_OBSERVATORY_2,           0,  0 ; 0A TODO
	map_const	BELL_SCHOOL_NORTH_CLASSROOM,  0,  0 ; 0B TODO
	map_const	TECH_CITY_2,                  0,  0 ; 0C TODO
	; TODO
	endgroup

	newgroup    GROUP_02                    ; 02
	map_const	DUOLU_CITY_2,                 0,  0 ; 01 TODO
	map_const	SHANDA_FARM,                  0,  0 ; 02 TODO
	map_const	COFFEE_FOREST_PART_1,         0,  0 ; 03 TODO
	map_const	COFFEE_FOREST_PART_2,         0,  0 ; 04 TODO
	map_const	COFFEE_FOREST_PART_3,         0,  0 ; 05 TODO
	map_const	SKY_ROCK_PART_1,              0,  0 ; 06 TODO
	map_const	SKY_ROCK_PART_2,              0,  0 ; 07 TODO
	map_const	CLOCK_TOWER_OUTSIDE,          0,  0 ; 08 TODO
	map_const	CLOCK_TOWER_1F,               0,  0 ; 09 TODO
	map_const	CLOCK_TOWER_2F,               0,  0 ; 0A TODO
	map_const	CLOCK_TOWER_3F,               0,  0 ; 0B TODO
	map_const	CLOCK_TOWER_4F,               0,  0 ; 0C TODO
	map_const	CLOCK_TOWER_5F,               0,  0 ; 0D TODO
	; TODO
	endgroup

	newgroup    GROUP_03                    ; 02
	map_const	GREEN_FOREST_PART_1_2,        0,  0 ; 01 TODO
	map_const	GREEN_FOREST_PART_2_1,        0,  0 ; 02 TODO
	map_const	GREEN_FOREST_PART_3_1,        0,  0 ; 03 TODO
	map_const	GREEN_FOREST_PART_1_3,        0,  0 ; 04 TODO
	map_const	GREEN_FOREST_PART_2_2,        0,  0 ; 05 TODO
	map_const	GREEN_FOREST_PART_3_2,        0,  0 ; 06 TODO
	map_const	SKY_CITY,                     0,  0 ; 07 TODO
	map_const	BANGLIN_CO_1F,                0,  0 ; 08 TODO
	map_const	BANGLIN_CO_2,                 0,  0 ; 09 TODO
	map_const	CONTEST_HALL,                 0,  0 ; 0A TODO
	map_const	BANGLIN_CO_2F,                0,  0 ; 0B TODO
	map_const	BANGLIN_CO_3F,                0,  0 ; 0C TODO
	map_const	BANGLIN_CO_4F,                0,  0 ; 0D TODO
	map_const	BANGLIN_CO_5F,                0,  0 ; 0E TODO
	map_const	FASHION_STORE,                0,  0 ; 0F TODO
	map_const	AIRPORT_OUTSIDE,              0,  0 ; 10 TODO
	map_const	AIRPORT,                      0,  0 ; 11 TODO
	map_const	GREEN_FOREST_PART_4,          0,  0 ; 12 TODO
	map_const	GREEN_FOREST_PART_5,          0,  0 ; 13 TODO
	map_const	GREEN_FOREST_PART_6,          0,  0 ; 14 TODO
	; TODO
	endgroup

	newgroup    GROUP_04                            ; 04
	map_const	G4_01,                        0,  0 ; 01 TODO
	; TODO
	endgroup

	newgroup    GROUP_05                            ; 05
	map_const	G5_01,                        0,  0 ; 01 TODO
	; TODO
	endgroup

	newgroup    GROUP_06                            ; 06
	map_const	G6_01,                        0,  0 ; 01 TODO
	; TODO
	endgroup

	newgroup    GROUP_07                            ; 07
	map_const	G7_01,                        0,  0 ; 01 TODO
	; TODO
	endgroup

	newgroup    GROUP_08                            ; 08
	map_const	G8_01,                        0,  0 ; 01 TODO
	; TODO
	endgroup
