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
	map_const	G0_0D,                        0,  0 ; 0D TODO
	map_const	G0_0E,                        0,  0 ; 0E TODO
	map_const	G0_0F,                        0,  0 ; 0F TODO
	map_const	G0_10,                        0,  0 ; 10 TODO
	map_const	G0_11,                        0,  0 ; 11 TODO
	map_const	G0_12,                        0,  0 ; 12 TODO
	map_const	G0_13,                        0,  0 ; 13 TODO
	map_const	G0_14,                        0,  0 ; 14 TODO
	map_const	G0_15,                        0,  0 ; 15 TODO
	map_const	G0_16,                        0,  0 ; 16 TODO
	map_const	G0_17,                        0,  0 ; 17 TODO
	map_const	G0_18,                        0,  0 ; 18 TODO
	map_const	G0_19,                        0,  0 ; 19 TODO
	map_const	G0_1A,                        0,  0 ; 1A TODO
	map_const	G0_1B,                        0,  0 ; 1B TODO
	map_const	G0_1C,                        0,  0 ; 1C TODO
	map_const	G0_1D,                        0,  0 ; 1D TODO
	map_const	G0_1E,                        0,  0 ; 1E TODO
	map_const	G0_1F,                        0,  0 ; 1F TODO
	map_const	G0_20,                        0,  0 ; 20 TODO
	map_const	G0_21,                        0,  0 ; 21 TODO
	map_const	G0_22,                        0,  0 ; 22 TODO
	map_const	G0_23,                        0,  0 ; 23 TODO
	map_const	G0_24,                        0,  0 ; 24 TODO
	map_const	G0_25,                        0,  0 ; 25 TODO
	map_const	G0_26,                        0,  0 ; 26 TODO
	map_const	G0_27,                        0,  0 ; 27 TODO
	map_const	G0_28,                        0,  0 ; 28 TODO
	map_const	G0_29,                        0,  0 ; 29 TODO
	map_const	G0_2A,                        0,  0 ; 2A TODO
	map_const	G0_2B,                        0,  0 ; 2B TODO
	map_const	G0_2C,                        0,  0 ; 2C TODO
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
	map_const	G1_0D,                        0,  0 ; 0D TODO
	map_const	G1_0E,                        0,  0 ; 0E TODO
	map_const	G1_0F,                        0,  0 ; 0F TODO
	map_const	G1_10,                        0,  0 ; 10 TODO
	map_const	G1_11,                        0,  0 ; 11 TODO
	map_const	G1_12,                        0,  0 ; 12 TODO
	map_const	G1_13,                        0,  0 ; 13 TODO
	map_const	G1_14,                        0,  0 ; 14 TODO
	map_const	G1_15,                        0,  0 ; 15 TODO
	map_const	G1_16,                        0,  0 ; 16 TODO
	map_const	G1_17,                        0,  0 ; 17 TODO
	map_const	G1_18,                        0,  0 ; 18 TODO
	map_const	G1_19,                        0,  0 ; 19 TODO
	map_const	G1_1A,                        0,  0 ; 1A TODO
	map_const	G1_1B,                        0,  0 ; 1B TODO
	map_const	G1_1C,                        0,  0 ; 1C TODO
	map_const	G1_1D,                        0,  0 ; 1D TODO
	map_const	G1_1E,                        0,  0 ; 1E TODO
	map_const	G1_1F,                        0,  0 ; 1F TODO
	map_const	G1_20,                        0,  0 ; 20 TODO
	map_const	G1_21,                        0,  0 ; 21 TODO
	map_const	G1_22,                        0,  0 ; 22 TODO
	map_const	G1_23,                        0,  0 ; 23 TODO
	map_const	G1_24,                        0,  0 ; 24 TODO
	map_const	G1_25,                        0,  0 ; 25 TODO
	map_const	G1_26,                        0,  0 ; 26 TODO
	map_const	G1_27,                        0,  0 ; 27 TODO
	map_const	G1_28,                        0,  0 ; 28 TODO
	map_const	G1_29,                        0,  0 ; 29 TODO
	map_const	G1_2A,                        0,  0 ; 2A TODO
	map_const	G1_2B,                        0,  0 ; 2B TODO
	map_const	G1_2C,                        0,  0 ; 2C TODO
	map_const	G1_2D,                        0,  0 ; 2D TODO
	map_const	G1_2E,                        0,  0 ; 2E TODO
	map_const	G1_2F,                        0,  0 ; 2F TODO
	map_const	G1_30,                        0,  0 ; 30 TODO
	map_const	G1_31,                        0,  0 ; 31 TODO
	map_const	G1_32,                        0,  0 ; 32 TODO
	map_const	G1_33,                        0,  0 ; 33 TODO
	map_const	G1_34,                        0,  0 ; 34 TODO
	map_const	G1_35,                        0,  0 ; 35 TODO
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
