Func_003_4000:
	jp SoundEngine2_Play

Func_003_4003:
	jp SoundEngine2_Load

Func_003_4006:
	jp SoundEngine2_Init

Func_003_4009:
	jp SoundEngine2_Unknown

SoundEngine2_Unknown:
	ret

SoundEngine2_HeaderPointers:
; sound effects
	dw unk_003_40eb
	dw unk_003_40ef
	dw unk_003_40f3
	dw unk_003_40f7
	dw unk_003_40fb
	dw unk_003_4101
	dw unk_003_4105
	dw unk_003_410b
	dw unk_003_4111
	dw unk_003_4117
	dw unk_003_40eb
	dw unk_003_418b
	dw unk_003_4195
	dw unk_003_411d
	dw unk_003_4121
	dw unk_003_4125
	dw unk_003_4129
	dw unk_003_412d
	dw unk_003_4131
	dw unk_003_4135
	dw unk_003_413b
	dw unk_003_413f
	dw unk_003_4143
	dw unk_003_4147
	dw unk_003_414b
	dw unk_003_4151
	dw unk_003_4155
	dw unk_003_4159
	dw unk_003_415d
	dw unk_003_4161
	dw unk_003_4165
	dw unk_003_4169
	dw unk_003_416d
	dw unk_003_4171
	dw unk_003_4175
	dw unk_003_417b
	dw unk_003_4181
	dw unk_003_4185
	dw unk_003_419f
	dw unk_003_41a7
	dw unk_003_41ab
	dw unk_003_41af
	dw unk_003_41b5
	dw unk_003_41b9
	dw unk_003_41bf
	dw unk_003_41c5
	dw unk_003_41cf
	dw unk_003_41d3
	dw unk_003_41d7
	dw unk_003_41db
	dw unk_003_41df
	dw unk_003_41e9
	dw unk_003_41e3
	dw unk_003_41fd
	dw unk_003_4201
	dw unk_003_41f9
	dw unk_003_4209
	dw unk_003_420d
	dw unk_003_41a3
	dw unk_003_4225
	dw unk_003_4211
	dw unk_003_4215
	dw unk_003_4219
	dw unk_003_421d
	dw unk_003_4221
	dw unk_003_4245
	dw unk_003_424b
	dw unk_003_4253
	dw unk_003_425b
	dw unk_003_4261
	dw unk_003_4265
	dw unk_003_4257
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4229
	dw unk_003_422d
	dw unk_003_4231
	dw unk_003_4235
	dw unk_003_4239
	dw unk_003_423d
	dw unk_003_4241
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4105
	dw unk_003_4105
	dw 0
	dw unk_003_4105
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
	dw 0
; music
	dw Music_Academy
	dw Music_UnsettlingPlace
	dw Music_Town2
	dw Music_Racing
	dw Music_Meteor
	dw Music_LevelUpJingle
	dw Music_ExpJingle
	dw Music_EnemyFainted
	dw 0
	dw 0

unk_003_40eb:
	db 0
	db 0
	dw unk_003_4e6a

unk_003_40ef:
	db $80
	db 0
	dw unk_003_4e6b

unk_003_40f3:
	db $80
	db 0
	dw unk_003_4e74

unk_003_40f7:
	db $80
	db 0
	dw unk_003_4e7d

unk_003_40fb:
	db $c0
	db 0
	dw unk_003_4e86
	dw unk_003_4e7d

unk_003_4101:
	db $80
	db 0
	dw unk_003_4e95

unk_003_4105:
	db $c0
	db 0
	dw unk_003_4ea2
	dw unk_003_4e6b

unk_003_410b:
	db $c0
	db 0
	dw unk_003_4ebf
	dw unk_003_4e6b

unk_003_4111:
	db $c0
	db 0
	dw unk_003_4eda
	dw unk_003_4e6b

unk_003_4117:
	db $c0
	db 0
	dw unk_003_4ef2
	dw unk_003_4e6b

unk_003_411d:
	db $10
	db $4
	dw unk_003_50fc

unk_003_4121:
	db $80
	db $4
	dw unk_003_510a

unk_003_4125:
	db $80
	db $4
	dw unk_003_5126

unk_003_4129:
	db $10
	db $3
	dw unk_003_514b

unk_003_412d:
	db $10
	db $3
	dw unk_003_515c

unk_003_4131:
	db $10
	db $a
	dw unk_003_516e

unk_003_4135:
	db $90
	db $b
	dw unk_003_5183
	dw unk_003_5195

unk_003_413b:
	db $10
	db $c
	dw unk_003_51b0

unk_003_413f:
	db $80
	db $5
	dw unk_003_51cc

unk_003_4143:
	db $80
	db $9
	dw unk_003_51db

unk_003_4147:
	db $10
	db $a
	dw unk_003_51fd

unk_003_414b:
	db $30
	db $a
	dw unk_003_520c
	dw unk_003_5218

unk_003_4151:
	db $10
	db $a
	dw unk_003_5226

unk_003_4155:
	db $10
	db $a
	dw unk_003_5231

unk_003_4159:
	db $10
	db $3
	dw unk_003_5249

unk_003_415d:
	db $10
	db $7
	dw unk_003_525a

unk_003_4161:
	db $80
	db $4
	dw unk_003_5285

unk_003_4165:
	db $80
	db $a
	dw unk_003_5291

unk_003_4169:
	db $80
	db $7
	dw unk_003_52a6

unk_003_416d:
	db $80
	db $4
	dw unk_003_52cf

unk_003_4171:
	db $10
	db $4
	dw unk_003_52e5

unk_003_4175:
	db $30
	db $a
	dw unk_003_52fb
	dw unk_003_52f0

unk_003_417b:
	db $30
	db $a
	dw unk_003_5325
	dw unk_003_5306

unk_003_4181:
	db $80
	db $8
	dw unk_003_5349

unk_003_4185:
	db $90
	db $9
	dw unk_003_535f
	dw unk_003_537b

unk_003_418b:
	db $f
	db $2
	dw unk_003_4e6a
	dw unk_003_4e6a
	dw unk_003_4e6a
	dw unk_003_4e6a

unk_003_4195:
	db $f0
	db $f
	dw unk_003_4e6a
	dw unk_003_4e6a
	dw unk_003_4e6a
	dw unk_003_4e6a

unk_003_419f:
	db $80
	db $4
	dw unk_003_5481

unk_003_41a3:
	db $80
	db $4
	dw unk_003_548d

unk_003_41a7:
	db $80
	db $1
	dw unk_003_54b9

unk_003_41ab:
	db $10
	db $2
	dw unk_003_54d9

unk_003_41af:
	db $30
	db $4
	dw unk_003_5c94
	dw unk_003_5cd6

unk_003_41b5:
	db $10
	db $7
	dw unk_003_54e6

unk_003_41b9:
	db $90
	db $9
	dw unk_003_54fb
	dw unk_003_5515

unk_003_41bf:
	db $90
	db $9
	dw unk_003_5544
	dw unk_003_5565

unk_003_41c5:
	db $f
	db 0
	dw unk_003_54b8
	dw unk_003_54a1
	dw unk_003_54b8
	dw unk_003_54b8

unk_003_41cf:
	db $80
	db $4
	dw unk_003_55a1

unk_003_41d3:
	db $80
	db $4
	dw unk_003_55bd

unk_003_41d7:
	db $10
	db $4
	dw unk_003_55e2

unk_003_41db:
	db $10
	db $3
	dw unk_003_55f0

unk_003_41df:
	db $10
	db $3
	dw unk_003_5634

unk_003_41e3:
	db $30
	db $4
	dw unk_003_56ed
	dw unk_003_571a

unk_003_41e9:
	db $10
	db $3
	dw unk_003_5664
	db $10
	db $3
	dw unk_003_5726
	db $b0
	db $3
	dw unk_003_57cb
	dw unk_003_57f3
	dw unk_003_57fd

unk_003_41f9:
	db $1
	db $3
	dw unk_003_584e

unk_003_41fd:
	db $1
	db $3
	dw unk_003_585c

unk_003_4201:
	db $b0
	db $3
	dw unk_003_58bd
	dw unk_003_5923
	dw unk_003_592d

unk_003_4209:
	db $80
	db $4
	dw unk_003_5ce2

unk_003_420d:
	db $10
	db $4
	dw unk_003_5cf0

unk_003_4211:
	db $80
	db $4
	dw unk_003_5d2f

unk_003_4215:
	db $80
	db $4
	dw unk_003_5d50

unk_003_4219:
	db $80
	db $4
	dw unk_003_5d7d

unk_003_421d:
	db $80
	db $4
	dw unk_003_5da9

unk_003_4221:
	db $10
	db $4
	dw unk_003_5dbf

unk_003_4225:
	db $80
	db $4
	dw unk_003_5dd9

unk_003_4229:
	db $80
	db $2
	dw unk_003_53d7

unk_003_422d:
	db $80
	db $2
	dw unk_003_5403

unk_003_4231:
	db $80
	db $1
	dw unk_003_5420

unk_003_4235:
	db $80
	db $1
	dw unk_003_542c

unk_003_4239:
	db $80
	db $1
	dw unk_003_543c

unk_003_423d:
	db $10
	db $c
	dw unk_003_544a

unk_003_4241:
	db $80
	db $2
	dw unk_003_5471

unk_003_4245:
	db $a0
	db $3
	dw unk_003_5b6f
	dw unk_003_5b53

unk_003_424b:
	db $b0
	db $9
	dw unk_003_5b99
	dw unk_003_5bce
	dw unk_003_5c0b

unk_003_4253:
	db $10
	db $2
	dw unk_003_5c36

unk_003_4257:
	db $10
	db $1
	dw unk_003_5c8c

unk_003_425b:
	db $30
	db $2
	dw unk_003_5c40
	dw unk_003_5c4c

unk_003_4261:
	db $10
	db $1
	dw unk_003_5c5a

unk_003_4265:
	db $10
	db $1
	dw unk_003_5c79

Music_Academy:
	db $f ; how many channels [in bits]
	db 0  ; starting channel?
	dw Music_Academy_Ch1
	dw Music_Academy_Ch2
	dw Music_Academy_Ch3
	dw Music_Academy_Ch4

Music_UnsettlingPlace:
	db $f
	db 0
	dw Music_UnsettlingPlace_Ch1
	dw Music_UnsettlingPlace_Ch2
	dw Music_UnsettlingPlace_Ch3
	dw Music_UnsettlingPlace_Ch4

Music_Town2:
	db $f
	db 0
	dw Music_Town2_Ch1
	dw Music_Town2_Ch2
	dw Music_Town2_Ch3
	dw Music_Town2_Ch4

Music_Racing:
	db $f
	db 0
	dw Music_Racing_Ch1
	dw Music_Racing_Ch2
	dw Music_Racing_Ch3
	dw Music_Racing_Ch4

Music_Meteor:
	db $f
	db 0
	dw Music_Meteor_Ch1
	dw Music_Meteor_Ch2
	dw Music_Meteor_Ch3
	dw Music_Meteor_Ch4

Music_LevelUpJingle:
	db $f
	db 0
	dw Music_LevelUpJingle_Ch1
	dw Music_LevelUpJingle_Ch2
	dw Music_LevelUpJingle_Ch3
	dw Music_LevelUpJingle_Ch4

Music_ExpJingle:
	db $f
	db 0
	dw Music_ExpJingle_Ch1
	dw Music_ExpJingle_Ch2
	dw Music_ExpJingle_Ch3
	dw Music_ExpJingle_Ch4

Music_EnemyFainted:
	db $f
	db 0
	dw Music_EnemyFainted_Ch1
	dw Music_EnemyFainted_Ch2
	dw Music_EnemyFainted_Ch3
	dw Music_EnemyFainted_Ch4

	ds 132

SoundEngine2_Load:
	or a
	jp z, SoundEngine2_ResetSoundRegisters
	cp $a
	jp z, SoundEngine2_Fade
	push bc
	push de
	ld [wCurrentSongID], a

; Calculate song header location.
	push af
	add a
	add LOW(SoundEngine2_HeaderPointers)
	ld l, a
	ld a, HIGH(SoundEngine2_HeaderPointers)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .done
	ld a, [hli]
	ld [wSoundNumChannels], a
	ld a, [hli]
	ld [wd406], a
	ld b, h
	ld c, l
	xor a
	ld [wd402], a
	ld de, wChannels
.loop
	ld hl, wSoundNumChannels
	srl [hl]
	jr c, .skip
	jr z, .done
.loop2
	ld hl, wd402
	inc [hl]
	ld hl, CHANNEL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	jr .loop

.done
	pop de
	pop bc
	ret

.skip
	ld hl, CHANNEL_SONG_ID
	add hl, de
	ld a, [hli]
	or a
	jr z, .load_channel_pointers
	ld a, [wd406]
	cp [hl]
	jr nc, .load_channel_pointers
	inc bc
	inc bc
	jr .loop2

.load_channel_pointers
	ld h, b
	ld l, c
	ld a, [hli]
	ld b, [hl]
	inc hl
	push hl
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	ld [hli], a
	ld [hl], b
; CHANNEL_LOOP_POINT_1
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
; CHANNEL_LOAD_POINT
	ld [hli], a
	ld [hl], b

; Set default instrument parameters?
	ld hl, CHANNEL_VIBRATO_TABLE_POINTER
	add hl, de
	ld a, LOW(SoundEngine2_VibratoTables.vibrato1)
	ld [hli], a
	ld a, HIGH(SoundEngine2_VibratoTables.vibrato1)
	ld [hl], a
	pop bc
	ld a, [wd402]
	push af
	add LOW(unk_003_4a49)
	ld l, a
	ld a, HIGH(unk_003_4a49)
	adc 0
	ld h, a
	pop af
	ld a, [wd607]
	or [hl]
	ld [wd607], a
	ld h, d
	ld l, e
	ld a, [wCurrentSongID]
	ld [hli], a
	ld a, [wd406]
	ld [hli], a
	ld a, 8
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld a, 3
	ld [hli], a
	ld [hli], a
	ld a, 1
	ld [hl], a
	jr .loop2

.asm_003_43e1
	push bc
	push de
	ld [wCurrentSongID], a
	push af
	add a
	add LOW(SoundEngine2_HeaderPointers)
	ld l, a
	ld a, HIGH(SoundEngine2_HeaderPointers)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and $f0
	swap a
	ld [wSoundNumChannels], a
	ld a, [hli]
	ld [wd406], a
	ld b, h
	ld c, l
	ld a, 4
	ld [wd402], a
	ld de, wd6be
	jp .loop

SoundEngine2_Fade:
	ld a, 7
	ld [wSoundFadeEnabled], a
	ld [wSoundFadeTimer], a
	ret

SoundEngine2_Play:
	ld a, [wSoundFadeEnabled]
	or a
	jr z, .run_audio
	ld hl, wSoundFadeTimer
	dec [hl]
	jr nz, .run_audio

; finished fading
	ld [hl], a
	ld hl, wd580
	ld a, [hl]
	or a
	jp z, SoundEngine2_ResetSoundRegisters
	sub $11
	ld [hl], a
.run_audio
	call .ProcessAudio
	jp asm_003_4bc7

.ProcessAudio
	xor a
	ld [wSoundCurChannel], a
	ld de, wChannels
.loop1
	ld hl, CHANNEL_SONG_ID
	add hl, de
	ld a, [hl]
	or a
	jr z, .skip
	call SoundEngine2_UpdateChannels
	call Func_003_4a51
.skip
	ld hl, CHANNEL_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	ld hl, wSoundCurChannel
	inc [hl]
	ld a, 8
	cp [hl]
	jr nz, .loop1
	ld hl, wChannels
	ld de, CHANNEL_STRUCT_LENGTH
	ld a, [hl]
	add hl, de
	or [hl]
	add hl, de
	or [hl]
	add hl, de
	or [hl]
	ld [wd60d], a
	ret

SoundEngine2_UpdateChannels:
	ld hl, CHANNEL_FIELD08
	add hl, de
	inc [hl]
	dec hl
	dec [hl]
	call z, SoundEngine2_LoadNote
	ld a, [wSoundCurChannel]
	cp CHAN4
	ret z
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	ret z
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld a, [hl]
	add a
	jp nc, asm_003_45fa
	ld a, [wSoundCurChannel]
	and 3
	cp CHAN3
	jp z, asm_003_459c
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	jp nz, asm_003_4635
	ld hl, CHANNEL_FIELD18
	add hl, de
	ld a, [hl]
	push af
	add a
	add LOW(Pointer_03_44af)
	ld l, a
	ld a, HIGH(Pointer_03_44af)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointer_03_44af:
	dw asm_003_44bf
	dw asm_003_44ee
	dw asm_003_4524
	dw asm_003_454b
	dw asm_003_4584
	dw asm_003_4635
	dw asm_003_4635
	dw asm_003_4635

asm_003_44bf:
	push bc
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld a, [hl]
	and $f
	ld b, a
	ld a, [hl]
	swap a
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	and 7
	ld c, a
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	swap a
	and $f
	sub b
	jr c, asm_003_44ef
	call Func_003_47d7
	or a
	jr z, asm_003_44ef
	pop bc
	jp asm_003_4630

asm_003_44ee:
	push bc

asm_003_44ef:
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	and $f0
	ld b, a
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	swap a
	and 7
	ld c, a
	or b
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	and $f
	swap b
	ld l, a
	ld a, b
	sub l
	jr c, asm_003_4525
	call Func_003_47d7
	or a
	jr z, asm_003_4525
	pop bc
	jp asm_003_4630

asm_003_4524:
	push bc

asm_003_4525:
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	swap a
	and $f0
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD0A
	add hl, de
	ld a, [hl]
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld b, [hl]
	sub b
	jr c, asm_003_454c
	jr z, asm_003_454c
	pop bc
	jp asm_003_4630

asm_003_454b:
	push bc

asm_003_454c:
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD12
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld b, a
	ld hl, CHANNEL_FIELD13
	add hl, de
	ld a, [hl]
	and 7
	ld c, a
	or b
	ld hl,CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld a, b
	swap a
	push af
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	and $f
	ld b, a
	pop af
	sub b
	jr c, asm_003_4583
	call Func_003_47d7
	or a
	jr z, asm_003_4583
	pop bc
	jp asm_003_4630

asm_003_4583:
	pop bc

asm_003_4584:
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld a, $ff
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	jp asm_003_4630

asm_003_459c:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	ret nz
	ld hl, CHANNEL_FIELD18
	add hl, de
	ld a, [hl]
	cp 1
	jr c, asm_003_45b8
	cp 2
	jr c, asm_003_45d0
	cp 3
	jr c, asm_003_45e9
	cp 4
	jr c, asm_003_45ed
	ret

asm_003_45b8:
	ld a, $f0
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD0A
	add hl, de
	ld a, [hl]
	inc a
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	ret

asm_003_45d0:
	ld a, $50

asm_003_45d2:
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld a, [hl]
	and $7f
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	ret

asm_003_45e9:
	ld a, $10
	jr asm_003_45d2

asm_003_45ed:
	ld a, 0
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD18
	add hl, de
	inc [hl]
	ret

asm_003_45fa:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	dec [hl]
	jr nz, asm_003_4635
	ld hl, CHANNEL_INSTRUMENT_VOLUME_OFFSET
	add hl, de
	inc [hl]
	ld a, [hl]
	ld hl, CHANNEL_INSTRUMENT_POINTER
	add hl, de
	push bc
	add [hl]
	ld c, a
	inc hl
	ld a, [hl]
	adc 0
	ld b, a
	ld a, [bc]
	pop bc
	cp $ff
	jr nz, asm_003_4625
	ld hl, CHANNEL_INSTRUMENT_VOLUME_OFFSET
	add hl, de
	dec [hl]
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a
	jr asm_003_4635

asm_003_4625:
	ld hl, CHANNEL_FIELD1F
	add hl, de
	push af
	and $f0
	ld [hl], a
	pop af
	and $f

asm_003_4630:
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG
	add hl, de
	ld [hl], a

asm_003_4635:
	ld a, [wSoundCurChannel]
	and 2
	jr nz, asm_003_467c
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN_OFFSET
	add hl, de
	dec [hl]
	jp nz, asm_003_467c
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	inc [hl]
	ld a, [hl]

asm_003_464a:
	ld hl, CHANNEL_VIBRATO_TABLE_POINTER
	add hl, de
	push bc
	add [hl]
	ld c, a
	inc hl
	ld a, [hl]
	adc 0
	ld b, a
	ld a, [bc]
	pop bc
	cp $ff
	jr nz, asm_003_4664
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	xor a
	ld [hl], a
	jr asm_003_464a

asm_003_4664:
	push af
	swap a
	and $f
	cp 8
	jr c, asm_003_466f
	or $f0

asm_003_466f:
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	ld [hl], a
	pop af
	and $f
	ld hl, CHANNEL_INSTRUMENT_UNKNOWN_OFFSET
	add hl, de
	ld [hl], a

asm_003_467c:
	ret

SoundEngine2_LoadNote:
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]

SoundEngine2_ReadMusic:
	ld a, [bc]
	cp $d0
	jr c, .notes_and_rests
	call SoundEngine2_CommandProcessor
	jr SoundEngine2_ReadMusic

.notes_and_rests
	ld a, [wSoundCurChannel]
	cp CHAN4
	jp z, .channel4
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [bc]
	cp $c0
	jr c, .is_note
	ld [hl], 0
	jp .set_length

.is_note
	ld [hl], $ff
	push bc
	push af
	ld a, [wSoundCurChannel]
	cp CHAN8
	jr z, .sfxchannel4
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	ld a, [hl]
	add a
	add a
	ld b, a
	add a
	add b
	ld b, a
	pop af
	swap a
	and $f
	add b
	ld hl, CHANNEL_GLOBAL_TRANSPOSE
	add hl, de
	add [hl]
	push af
	add a
	add LOW(SoundEngine2_NoteFrequencies)
	ld c, a
	ld a, HIGH(SoundEngine2_NoteFrequencies)
	adc 0
	ld b, a
	pop af
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	pop bc
	jr .asm_003_46f3

.sfxchannel4
	pop af
	pop bc
	and $70
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	or [hl]
	swap a
	ld hl, CHANNEL_FIELD0C
	add hl, de
	or [hl]
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld [hli], a
	xor a
	ld [hl], a

.asm_003_46f3
	ld hl, CHANNEL_FIELD08
	add hl, de
	xor a
	ld [hl], a
	ld a, [bc]
	and $f
	call SoundEngine2_SetLengthCounter
	ld hl, CHANNEL_LENGTH_COUNTER
	add hl, de
	ld [hl], a
	call SoundEngine2_WriteToPlayhead
	ld hl, CHANNEL_FIELD11
	add hl, de
	bit 7, [hl]
	jr z, .asm_003_4735
	push af
	and $f
	ld c, a
	ld hl, CHANNEL_FIELD13
	add hl, de
	ld a, [hl]
	swap a
	and $f
	push af
	call Func_003_47d7
	swap a
	and $f
	ld hl, CHANNEL_FIELD0A
	add hl, de
	ld [hl], a
	pop af
	ld c, a
	pop af
	swap a
	and $f
	call Func_003_47d7
	add [hl]
	ld [hl], a

.asm_003_4735
	ld hl, CHANNEL_GLOBAL_STEREO_PANNING
	add hl, de
	ld a, [hli]
	or a
	jr nz, .asm_003_4746
	ld a, [hl]
	cp 3
	jr nz, .asm_003_4744
	ld a, 1
.asm_003_4744
	xor 3
.asm_003_4746
	and 3
	ld [hl], a
	ld hl, CHANNEL_INSTRUMENT_PITCH_OFFSET
	add hl, de
	ld a, $ff
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	push hl
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_VIBRATO_DELAY
	add hl, de
	ld a, [hl]
	pop hl
	inc a
	ld [hli], a
	ld a, 1
	ld [hl], a
	ret

.channel4
	ld a, [wChannel7]
	cp 6
	jr c, .asm_003_478e
	cp $c
	jr nc, .asm_003_478e
	ld a, LOW(unk_003_4e6a)
	ld [wChannel7Playhead], a
	ld a, HIGH(unk_003_4e6a)
	ld [wChannel7Playhead + 1], a
	ld a, [wd607]
	or $40
	ld [wd607], a
	ld a, 1
	ld [wChannel7LengthCounter], a
	ld [wChannel7], a
	xor a
	ld [wChannel7Field01], a
.asm_003_478e
	ld a, [bc]
	swap a
	and $f
	cp $c
	call nz, SoundEngine2_Load.asm_003_43e1

.set_length
	ld a, [bc]
	and $f
	call SoundEngine2_SetLengthCounter
	ld hl, CHANNEL_LENGTH_COUNTER
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD08
	add hl, de
	xor a
	ld [hl], a
	pop hl

SoundEngine2_WriteToPlayhead:
	ld hl, CHANNEL_PLAYHEAD
	add hl, de
	inc bc
	ld [hl], c
	inc hl
	ld [hl], b
	ret

SoundEngine2_SetLengthCounter:
	ld hl, CHANNEL_SPEED
	add hl, de
	or a
	jr z, asm_003_47d1

Func_003_47ba:
	cp [hl]
	jr nc, asm_003_47c7
	push bc
	ld c, a
	ld b, [hl]
	xor a

asm_003_47c1:
	add b
	dec c
	jr nz, asm_003_47c1
	pop bc
	ret

asm_003_47c7:
	push bc
	ld c, a
	ld b, [hl]
	xor a

asm_003_47cb:
	add b
	dec c
	jr nz, asm_003_47cb
	pop bc
	ret

asm_003_47d1:
	ld a, [hl]
	swap a
	and $f0
	ret

Func_003_47d7:
	or a
	ret z
	ld b, a
	xor a
	or c
	ret z
	cp b
	jr nc, asm_003_47e6
	xor a

asm_003_47e1:
	add b
	dec c
	jr nz, asm_003_47e1
	ret

asm_003_47e6:
	xor a

asm_003_47e7:
	add c
	dec b
	jr nz, asm_003_47e7
	ret

SoundEngine2_CommandProcessor:
	sub $e0
	jr c, .is_dx_command
	push af
	add a
	add LOW(SoundEngine2_Commands)
	ld l, a
	ld a, HIGH(SoundEngine2_Commands)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.is_dx_command
; D0 - D9 sets the song speed
	ld hl, CHANNEL_SPEED
	add hl, de
	and $f
	ld [hli], a
	inc bc
	ld a, [wSoundCurChannel]
	cp CHAN4
	ret z
	cp CHAN8
	jr z, .asm_03_4826
	and 3
	cp 2
	jr z, .asm_03_4833
	ld a, [bc]
	and $33
	add a
	add a
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	call SoundEngine2_CommandEB
	jp asm_003_490e

.asm_03_4826:
	ld a, [bc]
	or a
	jr z, .asm_03_482c
	ld a, 8

.asm_03_482c:
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	jp SoundEngine2_CommandEE

.asm_03_4833:
	dec bc
	call SoundEngine2_CommandED
	ld a, [bc]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld [hli], a
	add a
	jp nc, asm_003_4917
	inc bc
	inc hl
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_Commands:
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE0toE7
	dw SoundEngine2_CommandE8
	dw SoundEngine2_CommandE9
	dw SoundEngine2_CommandEA
	dw SoundEngine2_CommandEB
	dw SoundEngine2_CommandEC
	dw SoundEngine2_CommandED
	dw SoundEngine2_CommandEE
	dw SoundEngine2_CommandEF
	dw SoundEngine2_CommandF0
	dw SoundEngine2_CommandF1
	dw SoundEngine2_CommandF2
	dw SoundEngine2_CommandF3
	dw SoundEngine2_CommandF4
	dw SoundEngine2_CommandSkip
	dw SoundEngine2_CommandF6
	dw SoundEngine2_CommandF7
	dw SoundEngine2_CommandF8
	dw SoundEngine2_CommandF9
	dw SoundEngine2_CommandFA
	dw SoundEngine2_CommandFB
	dw SoundEngine2_CommandFC
	dw SoundEngine2_CommandFD
	dw SoundEngine2_CommandFE
	dw SoundEngine2_CommandFF

; Ex (0-7) : set the current octave
SoundEngine2_CommandE0toE7:
	ld a, [bc]
	and 7
	ld hl, CHANNEL_CUR_OCTAVE
	add hl, de
	jr SoundEngine2_SetVariable

; E8 xy : Set instrument duty cycle pattern
SoundEngine2_CommandE8:
	inc bc
	ld a, [wSoundCurChannel]
	cp CHAN8
	jr z, .noise
	ld a, [bc]
	and $33
	add a
	add a
	ld hl, CHANNEL_FIELD0C
	add hl, de
	jr SoundEngine2_SetVariable
.noise
; always set the duty pattern to $08 if on noise channel
	ld a, [bc]
	or a
	jr z, .no_params
	ld a, 8
.no_params
	ld hl, CHANNEL_FIELD0C
	add hl, de
	jr SoundEngine2_SetVariable

SoundEngine2_CommandE9:
	ld hl, CHANNEL_FIELD0D
	add hl, de
	inc bc
	ld a, [bc]

SoundEngine2_SetVariable:
	ld [hl], a

; F5 : does nothing, essentially the sound engine's "nop" instruction
SoundEngine2_CommandSkip:
	inc bc
	ret

SoundEngine2_CommandEA:
	ld hl, CHANNEL_FIELD02
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; EB xx ? : Set speed and vibrato
SoundEngine2_CommandEB:
	inc bc
	ld a, [bc]
	swap a
	and $f
	ld hl, CHANNEL_SPEED
	add hl, de
	call Func_003_47ba
	ld hl, CHANNEL_VIBRATO_DELAY
	add hl, de
	inc a
	ld [hli], a
	ld a, [bc]
	and $f
	push bc
	push af
	add a
	add LOW(SoundEngine2_VibratoTables)
	ld c, a
	ld a, HIGH(SoundEngine2_VibratoTables)
	adc 0
	ld b, a
	pop af

asm_003_48e3:
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	pop bc
	inc bc
	ret

; EC xx : set channel transpose
SoundEngine2_CommandEC:
	ld hl, CHANNEL_GLOBAL_TRANSPOSE
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandED:
	ld a, [wSoundCurChannel]
	cp CHAN3
	jr z, .asm_003_4906
	cp CHAN7
	jr nz, SoundEngine2_CommandSkip
	inc bc
	ld a, [bc]
	ld [wd609], a
	inc bc
	ret

.asm_003_4906
	inc bc
	ld a, [bc]
	ld [wd608], a
	inc bc
	ret

SoundEngine2_CommandEE:
	inc bc

asm_003_490e:
	ld a, [bc]
	ld hl, CHANNEL_FIELD11
	add hl, de
	ld [hli], a
	add a
	jr c, asm_003_492a

asm_003_4917:
	ld a, [bc]

asm_003_4918:
	push bc
	push af
	add a
	add LOW(unk_003_4f17)
	ld c, a
	ld a, HIGH(unk_003_4f17)
	adc 0
	ld b, a
	pop af
	ld hl, CHANNEL_INSTRUMENT_POINTER
	add hl, de
	jr asm_003_48e3

asm_003_492a:
	inc bc
	ld a, [bc]
	ld [hli], a
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; EF xx : set channel fine pitch
SoundEngine2_CommandEF:
	ld hl, CHANNEL_GLOBAL_FINE_PITCH
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandF0:
	ld hl, CHANNEL_FIELD11
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandF1:
	ld hl, CHANNEL_FIELD12
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

SoundEngine2_CommandF2:
	ld hl, CHANNEL_FIELD13
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F3 xx : set stereo panning
SoundEngine2_CommandF3:
	ld hl, CHANNEL_GLOBAL_STEREO_PANNING
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F6 xx : set speed only
SoundEngine2_CommandF6:
	ld hl, CHANNEL_SPEED
	add hl, de
	inc bc
	ld a, [bc]
	ld [hl], a
	inc bc
	ret

; F7 xx yy : call a subpart
SoundEngine2_CommandF7:
	inc bc
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	push hl
	ld hl, CHANNEL_LOOP_POINT_2
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

; F8 xx yy : same as above but uses a different variable
SoundEngine2_CommandF8:
	inc bc
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	push hl
	ld hl, CHANNEL_FIELD28
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ret

; F9 : return from F7 xx yy call
SoundEngine2_CommandF9:
	ld hl, CHANNEL_LOOP_POINT_2
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

; FA : return from F8 xx yy call
SoundEngine2_CommandFA:
	ld hl, CHANNEL_FIELD28
	add hl, de
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ret

; FB : begin a repeating phrase
SoundEngine2_CommandFB:
	inc bc
	ld hl, CHANNEL_LOOP_POINT_1
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, CHANNEL_FIELD2A
	add hl, de
	ld [hl], 0
	ret

SoundEngine2_CommandFC:
	inc bc
	ld hl, CHANNEL_LOAD_POINT
	add hl, de
	ld a, c
	ld [hli], a
	ld [hl], b
	ld hl, CHANNEL_FIELD2B
	add hl, de
	ld [hl], 0
	ret

; FD xx : end repeating phrase after xx repetitions
;         if xx is 0, then loop forever
SoundEngine2_CommandFD:
	inc bc
	ld a, [bc]
	or a
	jr z, .goto_loop
	ld hl, CHANNEL_FIELD2A
	add hl, de
	push hl
	ld h, [hl]
	cp h
	pop hl
	jr z, SoundEngine2_DoneRepeating
	inc [hl]
.goto_loop
	ld hl, CHANNEL_LOOP_POINT_1
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

SoundEngine2_DoneRepeating:
	ld [hl], 0
	jp SoundEngine2_CommandSkip

; FE xx : same as above but uses a different variable
SoundEngine2_CommandFE:
	inc bc
	ld a, [bc]
	or a
	jr z, .goto_loop
	ld hl, CHANNEL_FIELD2B
	add hl, de
	push hl
	ld h, [hl]
	cp h
	pop hl
	jr z, SoundEngine2_DoneRepeating
	inc [hl]
.goto_loop
	ld hl, CHANNEL_LOAD_POINT
	add hl, de
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

SoundEngine2_CommandFF:
	ld a, [wSoundCurChannel]
	push af
	add LOW(unk_003_4a41)
	ld c, a
	ld a, HIGH(unk_003_4a41)
	adc 0
	ld b, a
	pop af
	ld a, [bc]
	ld hl, wd607
	and [hl]
	ld [hl], a
	ld a, [wSoundCurChannel]
	cp CHAN5
	jr z, .asm_003_4a38
	and 3
	jr z, .asm_003_4a0f
	cp CHAN4
	jr nz, .asm_003_4a13
.asm_003_4a0f
	ld a, 8
	jr .asm_003_4a14

.asm_003_4a13
	xor a
.asm_003_4a14
	ld hl, CHANNEL_FIELD0D
	add hl, de
	ld [hl], a
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld [hl], a
	xor a
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld [hli], a
	ld [hl], a
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld [hl], a
	ld h, d
	ld l, e
	ld [hli], a
	ld [hli], a
	ld a, 8
	ld [hl], a
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld [hl], a
	pop hl
	ret

.asm_003_4a38
	ld a, 8
	ldh [rNR10], a
	ld [wd56e], a
	jr .asm_003_4a0f

unk_003_4a41:
	db $fe
	db $fd
	db $fb
	db $f7
	db $ef
	db $df
	db $bf
	db $7f

unk_003_4a49:
	db $1
	db $2
	db $4
	db $8
	db $10
	db $20
	db $40
	db $80

Func_003_4a51:
	ld a, [wSoundCurChannel]
	push af
	add a
	add LOW(Pointer_03_4a63)
	ld l, a
	ld a, HIGH(Pointer_03_4a63)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointer_03_4a63:
; music channels
	dw .Ch1
	dw .Ch2
	dw .Ch3
	dw .Ch4
; sfx channels
	dw .Ch5
	dw .Ch6
	dw .Ch7
	dw .Ch8

.Ch1:
	ld hl, wd6be
	ld a, [hl]
	or a
	ret nz

.Ch5:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bb7)
	ld l, a
	ld a, HIGH(unk_003_4bb7)
	adc 0
	ld h, a
	pop af
	ld bc, wd581
	ld a, [bc]
	and $ee
	or [hl]
	ld [bc], a
	ld bc, wd56e
	ld hl, CHANNEL_FIELD02
	add hl, de
	ld a, [hl]
	ld [bc], a
	inc bc
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wd598], a

.asm_003_4aa4
	or a
	jr z, .asm_003_4ab0
	ld hl, CHANNEL_FIELD0C
	add hl, de
	ld a, [hl]
	swap a
	jr .asm_003_4ab5

.asm_003_4ab0
	ld hl, CHANNEL_FIELD0C
	add hl, de
	ld a, [hl]

.asm_003_4ab5
	and $c0
	ld [bc], a
	inc bc
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	jr nz, .asm_003_4ac5
	ld a, 8
	jr .asm_003_4aca

.asm_003_4ac5
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld a, [hl]

.asm_003_4aca
	ld [bc], a
	inc bc

.asm_003_4acc
	ld hl, CHANNEL_GLOBAL_FINE_PITCH
	add hl, de
	ld a, [hl]
	ld hl, CHANNEL_PITCH_OFFSET
	add hl, de
	add [hl]
	inc hl
	bit 7, a
	jr nz, .asm_003_4ae6
	add [hl]
	inc hl
	ld [bc], a
	ld a, [hl]
	adc 0

.asm_003_4ae1
	inc bc
	and 7
	ld [bc], a

.Ch4:
	ret

.asm_003_4ae6
	add [hl]
	push af
	inc hl
	ld [bc], a
	pop af
	ld a, [hl]
	adc $ff
	jr .asm_003_4ae1

.Ch2:
	ld hl, wd6ea
	ld a, [hl]
	or a
	ret nz

.Ch6:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bbb)
	ld l, a
	ld a, HIGH(unk_003_4bbb)
	adc 0
	ld h, a
	pop af
	ld bc, wd581
	ld a, [bc]
	and $dd
	or [hl]
	ld [bc], a
	ld bc, wd573
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wd599], a
	jr .asm_003_4aa4

.Ch3:
	ld hl, wChannel7
	ld a, [hl]
	or a
	ret nz

.Ch7:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bbf)
	ld l, a
	ld a, HIGH(unk_003_4bbf)
	adc 0
	ld h, a
	pop af
	ld bc, wd581
	ld a, [bc]
	and $bb
	or [hl]
	ld [bc], a
	ld bc, wd577
	ld a, $80
	ld [bc], a
	inc bc
	inc bc
	ld hl, CHANNEL_FIELD09
	add hl, de
	ld a, [hl]
	or a
	jr z, .asm_003_4b61
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld a, [hl]
	swap a
	and $f
	push bc
	push af
	add LOW(unk_003_4ba7)
	ld c, a
	ld a, HIGH(unk_003_4ba7)
	adc 0
	ld b, a
	pop af
	ld a, [bc]
	pop bc

.asm_003_4b61
	ld [bc], a
	inc bc
	jp .asm_003_4acc

.Ch8:
	ld hl, CHANNEL_CURRENT_STEREO
	add hl, de
	ld a, [hl]
	and 3
	push af
	add LOW(unk_003_4bc3)
	ld l, a
	ld a, HIGH(unk_003_4bc3)
	adc 0
	ld h, a
	pop af
	ld bc, wd581
	ld a, [bc]
	and $77
	or [hl]
	ld [bc], a
	ld bc, wd57d
	ld hl, CHANNEL_FIELD08
	add hl, de
	ld a, [hl]
	ld [wd59b], a
	ld hl, CHANNEL_FIELD09
	add hl, de
	xor a
	or [hl]
	jr nz, .asm_003_4b96
	ld a, 8
	jr .asm_003_4b9b

.asm_003_4b96
	ld hl, CHANNEL_FIELD1F
	add hl, de
	ld a, [hl]

.asm_003_4b9b
	ld [bc], a
	inc bc
	ld hl, CHANNEL_NOTE_FREQ
	add hl, de
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a
	ret

unk_003_4ba7:
	db 0
	db $60
	db $40
	db $40
	db $40
	db $40
	db $40
	db $40
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20
	db $20

unk_003_4bb7:
	db $11
	db $1
	db $10
	db $11

unk_003_4bbb:
	db $22
	db $2
	db $20
	db $22

unk_003_4bbf:
	db $44
	db $4
	db $40
	db $44

unk_003_4bc3:
	db $88
	db $8
	db $80
	db $88

asm_003_4bc7:
	ld hl, wd56e
	ld de, wd583
	ld c, $10
	ld a, [wd598]
	ld b, a
	or a
	jr z, asm_003_4bda
	ld a, [de]
	cp [hl]
	jr z, asm_003_4bde

asm_003_4bda:
	ld a, [hl]
	ld [de], a
	ldh [c], a
	ldh [c], a

asm_003_4bde:
	inc hl
	inc de
	inc c
	call Func_003_4ca0
	ld a, b
	call Func_003_4c8c
	ld a, b
	call Func_003_4c9d
	call Func_003_4cab
	inc c
	call Func_003_4ca0
	ld a, [wd599]
	call Func_003_4c8c
	call Func_003_4ca0
	call Func_003_4cab
	call Func_003_4ca0
	inc hl
	inc de
	inc c
	call Func_003_4ca0
	call Func_003_4ca0
	call Func_003_4cab
	inc c
	inc hl
	inc de
	inc c
	ld a, [wd59b]
	call Func_003_4c8c
	call Func_003_4ca0
	call Func_003_4cab
	ld hl, rNR50
	ld a, [wd580]
	ld [hli], a
	ld a, [wd581]
	ld [hli], a
	ld a, [wChannel7]
	or a
	jr nz, asm_003_4c34
	ld a, [wd608]
	jr SoundEngine2_UpdateWaveform

asm_003_4c34:
	ld a, [wd609]

SoundEngine2_UpdateWaveform:
	ld hl, wd60a
	cp [hl]
	ret z
	ld [hl], a
	push af
	add a
	add LOW(SoundEngine2_Waveforms)
	ld l, a
	ld a, HIGH(SoundEngine2_Waveforms)
	adc 0
	ld h, a
	pop af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld c, $30
	xor a
	ldh [rNR30], a
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, [hli]
	ldh [c], a
	inc c
	ld a, $80
	ldh [rNR30], a
	ld a, [wd57b]
	or $80
	ldh [rNR34], a
	ret

Func_003_4c8c:
	or a
	jr z, asm_003_4c93
	ld a, [de]
	cp [hl]
	jr z, asm_003_4ca7

asm_003_4c93:
	ld a, [hli]
	ld [de], a
	ldh [c], a
	inc hl
	set 7, [hl]
	dec hl
	inc de
	inc c
	ret

Func_003_4c9d:
	or a
	jr z, asm_003_4ca4

Func_003_4ca0:
	ld a, [de]
	cp [hl]
	jr z, asm_003_4ca7

asm_003_4ca4:
	ld a, [hl]
	ld [de], a
	ldh [c], a

asm_003_4ca7:
	inc hl
	inc de
	inc c
	ret

Func_003_4cab:
	ld a, [de]
	bit 7, a
	jr nz, asm_003_4cb3
	cp [hl]
	jr z, asm_003_4ca7

asm_003_4cb3:
	ld a, [hl]
	ldh [c], a
	and 7
	ld [de], a
	inc hl
	inc de
	inc c
	ret

SoundEngine2_ResetSoundRegisters:
	call .DoReset

.DoReset:
	push bc
	push de
	call SoundEngine2_TurnOffChannels
	ld a, $77
	ld [wd580], a
	jr SoundEngine2_ResetEngineVariables

SoundEngine2_Init:
	push bc
	push de
	call SoundEngine2_ResetHWVolumes
	ld a, $77
	ldh [rNR50], a
	ld [wd580], a

SoundEngine2_ResetEngineVariables:
	ld hl, wChannels
	ld de, CHANNEL_STRUCT_LENGTH
	ld a, 0
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	ld hl, wd616
	ld a, 1
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	add hl, de
	ld [hl], a
	ld a, 0
	ld [wd607], a
	ld [wSoundFadeEnabled], a
	ld [wSoundFadeTimer], a
	ld a, $ff
	ld [wd60a], a
	pop de
	pop bc
	ret

SoundEngine2_ResetHWVolumes:
	xor a
	ldh [rNR50], a
	ld a, $80
	ldh [rNR52], a

SoundEngine2_TurnOffChannels:
	ld a, 8
	ldh [rNR10], a
	ld [wd56e], a
	ldh a, [rNR52]
	bit 0, a
	jr z, .ch1_is_off
	xor a
	ldh [rNR11], a
	ld [wd56f], a
	ld a, 8
	ldh [rNR12], a
	ld [wd570], a
	xor a
	ldh [rNR13], a
	ld [wd571], a
	ld [wd572], a
	ld a, $80
	ldh [rNR14], a
	xor a

.ch1_is_off:
	ldh a, [rNR52]
	bit 1, a
	jr z, .ch2_is_off
	xor a
	ldh [rNR21], a
	ld [wd573], a
	ldh [rNR22], a
	ld [wd574], a
	ldh [rNR23], a
	ld [wd575], a
	ld [wd576], a
	ld a, $80
	ldh [rNR24], a

.ch2_is_off:
	ldh a, [rNR52]
	bit 2, a
	jr z, .wave_is_off
	xor a
	ldh [rNR32], a
	ld [wd579], a
	ld [wd57b], a
	ld a, $80
	ldh [rNR34], a

.wave_is_off:
	ldh a, [rNR52]
	bit 3, a
	jr z, .done
	xor a
	ldh [rNR41], a
	ld [wd57c], a
	ld a, 8
	ldh [rNR42], a
	ld [wd57d], a
	xor a
	ldh [rNR43], a
	ld [wd57e], a
	ld [wd57f], a
	ld a, $80
	ldh [rNR44], a

.done:
	ret

SoundEngine2_CommandF4:
	inc bc
	ld a, [bc]
	push af
	ld l, a
	xor a
	ld h, a
	add hl, de
	inc bc
	ld a, [bc]
	add [hl]
	ld [hl], a
	pop af
	cp $11
	jr z, asm_003_4da8
	jp SoundEngine2_CommandSkip

asm_003_4da8:
	ld a, [hl]
	jp asm_003_4918

SoundEngine2_NoteFrequencies:
; octave 0
	dw 44
	dw 157
	dw 263
	dw 363
	dw 457
	dw 547
	dw 631
	dw 711
	dw 786
	dw 856
	dw 923
	dw 986
; octave 1
	dw 1046
	dw 1102
	dw 1155
	dw 1205
	dw 1253
	dw 1297
	dw 1339
	dw 1379
	dw 1417
	dw 1452
	dw 1486
	dw 1517
; octave 2
	dw 1547
	dw 1575
	dw 1602
	dw 1627
	dw 1650
	dw 1673
	dw 1694
	dw 1714
	dw 1732
	dw 1750
	dw 1767
	dw 1783
; octave 3
	dw 1798
	dw 1812
	dw 1825
	dw 1837
	dw 1849
	dw 1860
	dw 1871
	dw 1881
	dw 1890
	dw 1899
	dw 1907
	dw 1915
; octave 4
	dw 1923
	dw 1930
	dw 1936
	dw 1943
	dw 1949
	dw 1954
	dw 1959
	dw 1964
	dw 1969
	dw 1974
	dw 1978
	dw 1982
; octave 5
	dw 1985
	dw 1989
	dw 1992
	dw 1995
	dw 1998
	dw 2001
	dw 2004
	dw 2006
	dw 2009
	dw 2011
	dw 2013
	dw 2015
; octave 6
	dw 2017
	dw 2018
	dw 2020
	dw 2022
	dw 2023
	dw 2025
	dw 2026
	dw 2027
	dw 2028
	dw 2029
	dw 2030
	dw 2031
; octave 7
	dw 2032
	dw 2033
	dw 2034
	dw 2035
	dw 2036
; ???
	dw 479
	dw 483
	dw 579
	dw 583
	dw 579
	dw 599

unk_003_4e6a: db $ff
unk_003_4e6b: dr $ce6b, $ce74
unk_003_4e74: dr $ce74, $ce7d
unk_003_4e7d: dr $ce7d, $ce86
unk_003_4e86: dr $ce86, $ce95
unk_003_4e95: dr $ce95, $cea2
unk_003_4ea2: dr $cea2, $cebf
unk_003_4ebf: dr $cebf, $ceda
unk_003_4eda: dr $ceda, $cef2
unk_003_4ef2: dr $cef2, $cf17
unk_003_4f17: dr $cf17, $cf9f

SoundEngine2_VibratoTables:
	dw .vibrato1
	dw .vibrato2
	dw .vibrato3
	dw .vibrato4
	dw .vibrato5
	dw .vibrato6
	dw .vibrato7
	dw .vibrato8
	dw .vibrato9
	dw .vibrato10
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11
	dw .vibrato11

.vibrato1
	db $0f
	db -1

.vibrato2
	db $14, $03, $f4, $03
	db -1

.vibrato3
	db $11, $22, $11, $02, $f1, $e2, $f1, $02
	db -1

.vibrato4
	db $21, $32, $21, $02, $e1, $d2, $e1, $02
	db -1

.vibrato5
	db $21, $42, $21, $02, $e1, $c2, $e1, $02
	db -1

.vibrato6
	db $31, $52, $31, $02, $d1, $b2, $d1, $02
	db -1

.vibrato7
	db $31, $62, $31, $02, $d1, $a2, $d1, $02
	db -1

.vibrato8
	db $32, $72, $32, $02, $d2, $92, $d2, $02
	db -1

.vibrato9
	db $81, $91, $a1, $b1, $c1, $d1, $e1, $f1
	db $0f, $0f, $0f, $0f, $0f, $0f
	db -1

.vibrato10
	db $31, $21, $11, $0f, $0f, $0f, $0f, $0f, $0f
	db -1

.vibrato11
	db $03, $13, $23, $13
	db -1


SoundEngine2_Waveforms:
	dw .wave1
	dw .wave2
	dw .wave3
	dw .wave4
	dw .wave5
	dw .wave6
	dw .wave7
	dw .wave8
	dw .wave9
	dw .wave10
	dw .wave11
	dw .wave11
	dw .wave11
	dw .wave11
	dw .wave11
	dw .wave11
	dw .wave17

.wave1:
	dn 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0

.wave2:
	dn 0, 2, 4, 6, 8, 10, 12, 14, 15, 15, 15, 15, 15, 15, 15, 15, 14, 12, 10, 8, 6, 4, 2, 0, 0, 0, 4, 4, 8, 8, 4, 4

.wave3:
	dn 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15

.wave4:
	dn 3, 5, 2, 2, 4, 10, 0, 0, 0, 10, 3, 4, 0, 5, 0, 0, 15, 10, 15, 15, 0, 15, 15, 10, 15, 12, 15, 0, 0, 0, 15, 0

.wave5:
	dn 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 7, 6, 5, 4, 3, 2, 1, 0, 4, 4, 0, 0, 2, 2, 0, 0

.wave6:
	dn 7, 9, 8, 15, 15, 12, 12, 15, 15, 13, 11, 9, 7, 5, 3, 1, 7, 6, 5, 4, 3, 2, 1, 0, 4, 4, 0, 0, 2, 2, 0, 0

.wave7:
	dn 0, 3, 6, 9, 12, 15, 15, 12, 9, 6, 3, 0, 0, 3, 5, 6, 7, 7, 6, 5, 4, 4, 3, 3, 2, 0, 0, 0, 5, 2, 0, 0

.wave8:
	dn 0, 1, 2, 1, 4, 5, 6, 7, 0, 1, 2, 1, 4, 5, 6, 7, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

.wave9:
	dn 0, 1, 1, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 13, 13, 0

.wave10:
	dn 1, 3, 5, 7, 9, 11, 13, 15, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 5, 7, 9, 11, 13, 15, 0, 0, 0, 0, 0, 0, 0, 0

.wave11:
	dn 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 0

.wave17:
	dn 0, 2, 3, 4, 6, 7, 9, 10, 12, 13, 15, 15, 15, 15, 14, 14, 14, 14, 15, 15, 15, 15, 13, 12, 10, 9, 7, 6, 4, 3, 1, 0

unk_003_50fc: dr $d0fc, $d10a
unk_003_510a: dr $d10a, $d126
unk_003_5126: dr $d126, $d14b
unk_003_514b: dr $d14b, $d15c
unk_003_515c: dr $d15c, $d16e
unk_003_516e: dr $d16e, $d183
unk_003_5183: dr $d183, $d195
unk_003_5195: dr $d195, $d1b0
unk_003_51b0: dr $d1b0, $d1cc
unk_003_51cc: dr $d1cc, $d1db
unk_003_51db: dr $d1db, $d1fd
unk_003_51fd: dr $d1fd, $d20c
unk_003_520c: dr $d20c, $d218
unk_003_5218: dr $d218, $d226
unk_003_5226: dr $d226, $d231
unk_003_5231: dr $d231, $d249
unk_003_5249: dr $d249, $d25a
unk_003_525a: dr $d25a, $d285
unk_003_5285: dr $d285, $d291
unk_003_5291: dr $d291, $d2a6
unk_003_52a6: dr $d2a6, $d2cf
unk_003_52cf: dr $d2cf, $d2e5
unk_003_52e5: dr $d2e5, $d2f0
unk_003_52f0: dr $d2f0, $d2fb
unk_003_52fb: dr $d2fb, $d306
unk_003_5306: dr $d306, $d325
unk_003_5325: dr $d325, $d349
unk_003_5349: dr $d349, $d35f
unk_003_535f: dr $d35f, $d37b
unk_003_537b: dr $d37b, $d3d7
unk_003_53d7: dr $d3d7, $d403
unk_003_5403: dr $d403, $d420
unk_003_5420: dr $d420, $d42c
unk_003_542c: dr $d42c, $d43c
unk_003_543c: dr $d43c, $d44a
unk_003_544a: dr $d44a, $d471
unk_003_5471: dr $d471, $d481
unk_003_5481: dr $d481, $d48d
unk_003_548d: dr $d48d, $d4a1
unk_003_54a1: dr $d4a1, $d4b8
unk_003_54b8: db $ff
unk_003_54b9: dr $d4b9, $d4d9
unk_003_54d9: dr $d4d9, $d4e6
unk_003_54e6: dr $d4e6, $d4fb
unk_003_54fb: dr $d4fb, $d515
unk_003_5515: dr $d515, $d544
unk_003_5544: dr $d544, $d565
unk_003_5565: dr $d565, $d5a1
unk_003_55a1: dr $d5a1, $d5bd
unk_003_55bd: dr $d5bd, $d5e2
unk_003_55e2: dr $d5e2, $d5f0
unk_003_55f0: dr $d5f0, $d634
unk_003_5634: dr $d634, $d664
unk_003_5664: dr $d664, $d6ed
unk_003_56ed: dr $d6ed, $d71a
unk_003_571a: dr $d71a, $d726
unk_003_5726: dr $d726, $d7cb
unk_003_57cb: dr $d7cb, $d7f3
unk_003_57f3: dr $d7f3, $d7fd
unk_003_57fd: dr $d7fd, $d84e
unk_003_584e: dr $d84e, $d85c
unk_003_585c: dr $d85c, $d8bd
unk_003_58bd: dr $d8bd, $d923
unk_003_5923: dr $d923, $d92d
unk_003_592d: dr $d92d, $db53
unk_003_5b53: dr $db53, $db6f
unk_003_5b6f: dr $db6f, $db99
unk_003_5b99: dr $db99, $dbce
unk_003_5bce: dr $dbce, $dc0b
unk_003_5c0b: dr $dc0b, $dc36
unk_003_5c36: dr $dc36, $dc40
unk_003_5c40: dr $dc40, $dc4c
unk_003_5c4c: dr $dc4c, $dc5a
unk_003_5c5a: dr $dc5a, $dc79
unk_003_5c79: dr $dc79, $dc8c
unk_003_5c8c: dr $dc8c, $dc94
unk_003_5c94: dr $dc94, $dcd6
unk_003_5cd6: dr $dcd6, $dce2
unk_003_5ce2: dr $dce2, $dcf0
unk_003_5cf0: dr $dcf0, $dd2f
unk_003_5d2f: dr $dd2f, $dd50
unk_003_5d50: dr $dd50, $dd7d
unk_003_5d7d: dr $dd7d, $dda9
unk_003_5da9: dr $dda9, $ddbf
unk_003_5dbf: dr $ddbf, $ddd9
unk_003_5dd9: dr $ddd9, $e593

Music_Academy_Ch1: dr $e593, $e5ee
Music_Academy_Ch2: dr $e5ee, $e626
Music_Academy_Ch3: dr $e626, $e6bc
Music_Academy_Ch4: dr $e6bc, $e6ea

Music_UnsettlingPlace_Ch1: dr $e6ea, $e762
Music_UnsettlingPlace_Ch2: dr $e762, $e888
Music_UnsettlingPlace_Ch3: dr $e888, $e8f8
Music_UnsettlingPlace_Ch4: dr $e8f8, $e941

Music_Town2_Ch1: dr $e941, $e9c1
Music_Town2_Ch2: dr $e9c1, $eb01
Music_Town2_Ch3: dr $eb01, $eb76
Music_Town2_Ch4: dr $eb76, $eb80

Music_Racing_Ch1: dr $eb80, $ec1a
Music_Racing_Ch2: dr $ec1a, $eccd
Music_Racing_Ch3: dr $eccd, $edf7
Music_Racing_Ch4: dr $edf7, $ee02

Music_Meteor_Ch1: dr $ee02, $ee9d
Music_Meteor_Ch2: dr $ee9d, $efde
Music_Meteor_Ch3: dr $efde, $f0d1
Music_Meteor_Ch4: dr $f0d1, $f0d8

Music_LevelUpJingle_Ch1: dr $f0d8, $f114
Music_LevelUpJingle_Ch2: dr $f114, $f14b
Music_LevelUpJingle_Ch3: dr $f14b, $f16b
Music_LevelUpJingle_Ch4: dr $f16b, $f183

Music_ExpJingle_Ch1: dr $f183, $f1b0
Music_ExpJingle_Ch2: dr $f1b0, $f1df
Music_ExpJingle_Ch3: dr $f1df, $f1f6
Music_ExpJingle_Ch4: dr $f1f6, $f1fc

Music_EnemyFainted_Ch1: dr $f1fc, $f21c
Music_EnemyFainted_Ch2: dr $f21c, $f23c
Music_EnemyFainted_Ch3: dr $f23c, $f251
Music_EnemyFainted_Ch4: dr $f251, $f257

SECTION "banknum3", ROMX[$7fff], BANK[$3]
	db $3
