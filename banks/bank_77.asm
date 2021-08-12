Intro_VastFame::
; Vast Fame logo screen
	call ClearBGMap0

	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wdcf6], a
	ld [wdcfc], a
	ld [wdcf5], a
	ld [wdcf7], a
	ld [wdcf8], a
	ld [wcd40], a
	ld [wcd41], a

	ld hl, vBGMap0
	ld de, VastFame_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, VastFame_Attrs
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, VastFame_Palette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, VastFameGFX
	ld de, vTiles2
	ld bc, $3e0
	call CopyBytesVRAM

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette

	call Intro_Delay

	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call FadeOutPalette

Intro:
	call ClearBGMap0

	ld a, BGM_6d
	call PlaySound

	ld hl, vBGMap0
	ld de, IntroStart_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, IntroStart_Attrs
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, IntroStart_BGPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, IntroStart_ObjPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld hl, IntroStart_GFX
	ld de, vTiles2
	ld bc, $170
	call CopyBytesVRAM

	ld hl, IntroStars_GFX
	ld de, vTiles0
	ld bc, $400
	call CopyBytesVRAM

	call Func_077_52a6

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette

Intro_StartingScreen:
	call DelayFrame
	call Func_077_4d06

; increase screen counter
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a

; screen skip
	ldh a, [hFFBF]
	and a
	jr nz, Intro_CharacterCastScreen

	call Intro_CheckButtonSkip
	call Intro_InitStars
	call Intro_MoveStars
	jp Intro_StartingScreen

Intro_CharacterCastScreen:
	ld bc, wcab0
	xor a
	ldh [hFFC4], a

	call FadeOutPalette
	call ClearBGMap0
	call Func_077_5289
	call Func_077_5297

	ld a, BGM_6d
	call PlaySound

	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdce8], a
	ld [wdcf5], a

.NewScreen:
	call Intro_SetupNewScreen
	call Func_077_52a6

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_WINON | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette

.Loop:
	call DelayFrame
	call Intro_LoadNewTextSprites

	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a

	ldh a, [hFFBF]
	and a
	jr nz, .SkipToTitle

	call Intro_CheckButtonSkip

; Intro state manager
	ld a, [wdcf5]
	cp 1
	jr z, .character_slide_up
	cp 2
	jr z, .goto_next_screen
	cp 3
	jr z, .begin_screen
	cp 4
	jr z, .slide_text_up

; slide character right (BG layer)
	call Func_077_4856
	jp .Loop

.SkipToTitle
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call Func_096a
	jp TitleScreen

.character_slide_up
; Window layer
	call Func_077_48d9
	jp .Loop

.slide_text_up
; Sprite layer
	call Func_077_48bc
	jp .Loop

.goto_next_screen
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 8
	jr c, .asm_41be
	xor a
	ld [wdce8], a
	ld a, 1
	ld [hFFBF], a
	ld c, $40
	call Func_077_5282
	jp .Loop

.asm_41be
	ld c, $40
	call Func_077_5282
	ld a, 0
	ld [wdcf5], a
	ld bc, wcab0
	xor a
	ldh [hFFC4], a
	call Func_096a
	call ClearBGMap0
	call Func_077_52a6

	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdcf5], a
	jp .NewScreen

.begin_screen
	call Intro_SetupNewScreen
	ld a, 1
	ld [wdcf5], a
	jp .Loop

TitleScreen:
	call ClearBGMap0

	ld a, BGM_6f
	call PlaySound

	xor a
	ldh [hFFBF], a
	ldh [hSCX], a
	ldh [hFFAF], a
	ldh [hSCY], a
	ldh [hFFB1], a
	ld [wdce8], a
	ld [wdcf3], a
	ld [wdcf4], a
	ld [wdcfb], a
	ld [wdcf5], a

	ld hl, vBGMap0
	ld de, TitleScreen_Tilemap
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, TitleScreen_Attrs
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, TitleScreen_BGPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, TitleScreen_ObjPalette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld a, BANK(TitleScreenGFX)
	ld [wTempBank], a
	ld hl, TitleScreenGFX
	ld de, $9000
	ld bc, $800
	call FarCopyBytesVRAM

	ld a, BANK(TitleScreenGFX)
	ld [wTempBank], a
	ld hl, TitleScreenGFX tile $80
	ld de, $8800
	ld bc, $800
	call FarCopyBytesVRAM

	ld a, BANK(TitleScreenGFX_Sprites)
	ld [wTempBank], a
	ld hl, TitleScreenGFX_Sprites
	ld de, $8000
	ld bc, $800
	call FarCopyBytesVRAM

	call Func_077_5289
	ld a, 8
	ld [wcd43], a
	ld a, $10
	ld [wcd42], a
	ld a, 1
	ld [wcd44], a
	ld a, $81
	ld [wcd45], a
	ld a, $40
	ld [wcd56], a
	ld a, $68
	ld [wcd55], a
	ld a, 2
	ld [wcd57], a
	ld a, $82
	ld [wcd58], a
	call TitleScreen_UpdateSprites

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette

.Loop:
	call DelayFrame
	call TitleScreen_UpdateSprites
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ldh a, [hFFBF]
	and a
	jr nz, .jump_to_game
	call TitleScreen_PaletteCycle
	call TitleScreen_DoSpriteAnimations
	call Func_077_45b4
	call Func_077_456e
	ld a, [wdcf5]
	cp 1
	jr z, .asm_42fb
	cp 2
	jr z, .asm_4301
	call TitleScreen_HandleStartInput
	jp .Loop

.asm_42fb
	call Func_077_43d6
	jp .Loop

.asm_4301
	call Func_077_4359
	jp .Loop

.jump_to_game
	xor a
	ldh [hFFBF], a
	ld [wd0fa], a
	jp Func_023b
	ret

Intro_Delay:
	ld bc, $80
.do_delay
	ld hl, 0
.loop
	inc hl
	ld a, h
	or l
	jr nz, .loop
	dec bc
	cp 0 ; ??
	jr nz, .do_delay
	ret

Func_077_4322:
	ld hl, wd300
	ld [hl], ITEM_04
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_04
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_17
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_26
	inc hl
	ld [hl], 99
	inc hl
	ld [hl], ITEM_27
	inc hl
	ld [hl], 20

; 5000 money
	ld a, HIGH(5000)
	ld [wMoney + 1], a
	ld a, LOW(5000)
	ld [wMoney + 2], a
	ret


Func_077_4359:
	ldh a, [hJoypadDown]
	bit 6, a
	jr z, asm_077_4373
	ld a, [wdcf4]
	and a
	ret z
	ld a, SFX_30
	call PlaySound
	xor a
	ld [wdcfb], a
	ld a, $60
	ld [wcd5d], a
	ret

asm_077_4373:
	ldh a, [hJoypadDown]
	bit 7, a
	jr z, asm_077_4394
	ld a, [wdcf4]
	and a
	ret z
	ld a, [wdcfb]
	cp 1
	ret z
	ld a, SFX_30
	call PlaySound
	ld a, 1
	ld [wdcfb], a
	ld a, $70
	ld [wcd5d], a
	ret

asm_077_4394:
	ldh a, [hJoypadDown]
	bit 0, a
	ret z
	ld a, SFX_34
	call PlaySound
	ld a, 1
	ld [hFFBF], a
	xor a
	ld [wd9d2], a
	ld a, [wdcfb]
	and a
	jr z, asm_077_43c2
	call SRAMTest_Fast
	and a
	ret nz
	ld a, 1
	ld [wd9d2], a
	ld hl, $4000
	ld b, $3c
	rst FarCall
	xor a
	ld [wd0fa], a
	ret

asm_077_43c2:
	ld a, 1
	ld [wdcb3], a
	xor a
	ldh [hFFBF], a
	ld [wd0fa], a
	ld a, 0
	ld [hFFBA], a
	jp Func_0257
	ret

Func_077_43d6:
	ld a, [wcd5d]
	dec a
	dec a
	ld [wcd5d], a
	ld a, [wcd59]
	dec a
	dec a
	ld [wcd59], a
	cp $60
	jr z, asm_077_43eb
	ret

asm_077_43eb:
	ld a, [wdcfb]
	and a
	jr z, asm_077_43f6
	ld a, $70
	ld [wcd5d], a

asm_077_43f6:
	ld a, 2
	ld [wdcf5], a
	ret

CheatCode_InputList:
	db D_UP, A_BUTTON, A_BUTTON, D_UP, B_BUTTON, B_BUTTON, SELECT, SELECT          ; 1
	db D_DOWN, D_DOWN, D_LEFT, D_RIGHT, SELECT, A_BUTTON, SELECT, B_BUTTON         ; 2
	db D_LEFT, D_LEFT, D_RIGHT, D_RIGHT, D_UP, D_UP, D_DOWN, D_DOWN                ; 3
	db D_RIGHT, B_BUTTON, B_BUTTON, B_BUTTON, D_LEFT, A_BUTTON, A_BUTTON, A_BUTTON ; 4
	db D_LEFT, D_LEFT, D_RIGHT, D_RIGHT, D_UP, D_UP, D_DOWN, D_DOWN                ; 5

TitleScreen_CheckCheatCodes:
	ldh a, [hJoypadPressed]
	and a
	ret z

	ld a, [wdcb2]
	ld c, a
.asm_442c:
; Find base address (c*8 + de)
	ld de, CheatCode_InputList
	ld l, c
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
; Add counter
	ld a, [wdcb1]
	ld e, a
	ld d, 0
	add hl, de
	ldh a, [hJoypadDown]
	cp [hl]
	jr nz, .asm_446f

	ld a, [wdcb1]
	inc a
	ld [wdcb1], a
	ld a, c
	ld [wdcb2], a
; Limit combo to 8 inputs
	ld a, [wdcb1]
	cp 8
	ret c

	ld a, c
	inc a
	ld [wdcb0], a
	ld a, SFX_23
	call PlaySound
	xor a
	ld [wdcb1], a
	ld [wdcb2], a
	ld a, 1
	ld [wcd51], a
	ld [wdcf5], a
	jr TitleScreen_LoadNewGameMenu
	ret

.asm_446f
	ld a, [wdcb1]
	and a
	jr nz, .asm_447a
; Limit search to 5 cheat codes (broken)
	inc c
	cp 5
	jr c, .asm_442c

.asm_447a
	xor a
	ld [wdcb1], a
	ld [wdcb2], a
	ret

TitleScreen_HandleStartInput:
	ldh a, [hJoypadPressed]
	bit PADB_START, a
	jr z, TitleScreen_CheckCheatCodes
	ld a, SFX_23
	call PlaySound
	call TitleScreen_LoadSaveFile
	ld a, 1
	ld [wdcf5], a
	ret

TitleScreen_LoadSaveFile:
	call SRAMTest_Fast
	and a
	jr z, TitleScreen_LoadContinueMenu

TitleScreen_LoadNewGameMenu:
	ld a, $40
	ld [wcd5a], a
	ld a, $a0
	ld [wcd59], a
	ld a, 3
	ld [wcd5b], a
	ld a, $83
	ld [wcd5c], a
	ld a, $38
	ld [wcd5e], a
	ld a, $a0
	ld [wcd5d], a
	ld a, 5
	ld [wcd5f], a
	ld a, $85
	ld [wcd60], a
	xor a
	ld [wdcf4], a
	ld [wdcfb], a
	ld a, $40
	ld [wcd56], a
	ld a, $b0
	ld [wcd55], a
	ld a, 0
	ld [wcd57], a
	ld a, $80
	ld [wcd58], a
	ret

TitleScreen_LoadContinueMenu:
	ld a, $40
	ld [wcd5a], a
	ld a, $a0
	ld [wcd59], a
	ld a, 4
	ld [wcd5b], a
	ld a, $84
	ld [wcd5c], a
	ld a, $38
	ld [wcd5e], a
	ld a, $a0
	ld [wcd5d], a
	ld a, 5
	ld [wcd5f], a
	ld a, $85
	ld [wcd60], a
	ld a, 1
	ld [wdcf4], a
	ld [wdcfb], a
	ld a, $40
	ld [wcd56], a
	ld a, $b0
	ld [wcd55], a
	ld a, 0
	ld [wcd57], a
	ld a, $80
	ld [wcd58], a
	ret

TitleScreen_PaletteCycle:
	ld a, [wdcf3]
	inc a
	ld [wdcf3], a
	cp 7
	ret nz
	xor a
	ld [wdcf3], a
	ld a, [wdce8]
	ld de, .Palettes
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld b, 8
	ld c, $90
	call LoadPalettes_BCPD
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	cp 3
	ret c
	xor a
	ld [wdce8], a
	ret

.Palettes:
	dw $7fff
	dw $7ef7
	dw $790d
	dw $1400
	dw $790d
	dw $7fff
	dw $7ef7
	dw $1400
	dw $7ef7
	dw $790d
	dw $7fff
	dw $1400

Func_077_456e:
	ld a, [wcd60]
	and a
	ret z
	and $80
	jr nz, asm_077_457e
	ldh a, [hFF9D]
	and 1
	ret nz
	jr asm_077_458a

asm_077_457e:
	ld a, [wcd60]
	and $7f
	ld [wcd60], a
	xor a
	ld [wcd67], a

asm_077_458a:
	ld a, [wcd60]
	ld de, TitleScreen_SpriteAnimations
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd67]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, asm_077_45a9
	xor a
	ld [wcd67], a
	ret

asm_077_45a9:
	ld [wcd5f], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	ret

Func_077_45b4:
	ld a, [wcd5c]
	and a
	ret z
	and $80
	jr nz, asm_077_45c4
	ldh a, [hFF9D]
	and 1
	ret nz
	jr asm_077_45d0

asm_077_45c4:
	ld a, [wcd5c]
	and $7f
	ld [wcd5c], a
	xor a
	ld [wcd66], a

asm_077_45d0:
	ld a, [wcd5c]
	ld de, $4640
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd66]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, asm_077_45ef
	xor a
	ld [wcd66], a
	ret

asm_077_45ef:
	ld [wcd5b], a
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	ret

TitleScreen_DoSpriteAnimations:
	ld a, [wcd58]
	and a
	ret z
	and $80
	jr nz, .restart_animation
	ldh a, [hFF9D]
	and 1
	ret nz
	jr .animate

.restart_animation:
	ld a, [wcd58]
	and $7f
	ld [wcd58], a
	xor a
	ld [wcd65], a

.animate:
	ld a, [wcd58]
	ld de, TitleScreen_SpriteAnimations
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcd65]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	cp $ff
	jr nz, .finished
	xor a
	ld [wcd65], a
	ret

.finished:
	ld [wcd57], a
	ld a, [wcd65]
	inc a
	ld [wcd65], a
	ret

TitleScreen_SpriteAnimations:
	dw .Nothing
	dw .TitleScreen
	dw .PressStartText
	dw .NewGameText
	dw .NewGameContinueText
	dw .Cursor

.Nothing:
	db $ff

.TitleScreen:
	db $1
	db $1
	db $1
	db $1
	db $ff

.PressStartText:
	db $2
	db $2
	db $2
	db $2
	db $0
	db $0
	db $0
	db $0
	db $ff

.NewGameText:
	db $3
	db $3
	db $3
	db $ff

.NewGameContinueText:
	db $4
	db $4
	db $4
	db $ff

.Cursor:
	db $5
	db $5
	db $5
	db $ff

TitleScreen_UpdateSprites:
	ld hl, wVirtualOAM
	ld bc, 40
	ld de, 4

.init_sprites
	ld a, 160
	ld [hl], a
	add hl, de
	dec c
	jr nz, .init_sprites
	xor a
	ld [wd1fb], a
	call .UpdateTitleSprites
	call .UpdatePressStartSprites
	call .UpdateMenuSprites
	call .UpdateCursorSprites
	ret

.UpdateTitleSprites:
	ld hl, TitleScreen_Sprites
; get y offset -> c
	ld de, wcd42
	ld a, [de]
	ld c, a
; get x offset -> b
	inc de
	ld a, [de]
	ld b, a
; get sprite number
	inc de
	ld a, [de]
	and a
; return if sprite 0 is selected
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb] ; where to put the sprite
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_1
	ld a, [hli]
	cp -1
	jr z, .finished_copying_1
; apply Y and X offsets
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .copy_sprite_1
.finished_copying_1
	ld a, e
	ld [wd1fb], a
	ret

.UpdateCursorSprites:
; See .UpdateTitleSprites
	ld hl, TitleScreen_Sprites
	ld de, wcd5d
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_2
	ld a, [hli]
	cp -1
	jr z, .finished_copying_2
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .copy_sprite_2
.finished_copying_2
	ld a, e
	ld [wd1fb], a
	ret

.UpdateMenuSprites:
	ld hl, TitleScreen_Sprites
	ld de, wcd59
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_3
	ld a, [hli]
	cp -1
	jr z, .finished_copying_3
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .copy_sprite_3
.finished_copying_3
	ld a, e
	ld [wd1fb], a
	ret

.UpdatePressStartSprites:
	ld hl, TitleScreen_Sprites
	ld de, wcd55
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, HIGH(wVirtualOAM)
.copy_sprite_4
	ld a, [hli]
	cp -1
	jr z, .finished_copying_4
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .copy_sprite_4
.finished_copying_4
	ld a, e
	ld [wd1fb], a
	ret

TitleScreen_Sprites:
	dw .Nothing
	dw .TitleScreen
	dw .PushStartText
	dw .NewGameText
	dw .NewGameContinueText
	dw .Cursor

.Nothing:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $00, 0
	dsprite  0,  0,  2,  0, $00, 0
	dsprite  0,  0,  3,  0, $00, 0
	dsprite  0,  0,  4,  0, $00, 0
	dsprite  0,  0,  5,  0, $00, 0
	db -1 ; end

.TitleScreen:
	dsprite  0,  0, 10,  0, $00, 0
	dsprite  1,  0,  7,  0, $02, 0
	dsprite  1,  0,  8,  0, $04, 0
	dsprite  1,  0,  9,  0, $06, 0
	dsprite  1,  0, 11,  0, $08, 0
	dsprite  1,  0, 12,  0, $0a, 0
	dsprite  2,  0, 10,  0, $0c, 0
	dsprite  3,  0,  5,  0, $0e, 0
	dsprite  3,  0,  6,  0, $10, 0
	dsprite  3,  0,  7,  0, $12, 0
	dsprite  3,  0,  8,  0, $14, 0
	dsprite  3,  0,  9,  0, $16, 0
	dsprite  4,  0, 11,  0, $18, 0
	dsprite  4,  0, 12,  0, $1a, 0
	dsprite  4,  0, 15,  0, $1c, 0
	dsprite  4,  0, 16,  0, $1e, 0
	dsprite  5,  0,  3,  0, $20, 0
	dsprite  5,  0,  4,  0, $22, 0
	dsprite  6,  0,  5,  0, $24, 0
	dsprite  6,  0,  6,  0, $26, 1
	dsprite  7,  0,  3,  0, $28, 0
	dsprite  7,  0,  4,  0, $2a, 0
	dsprite  8,  0,  5,  0, $2c, 0
	dsprite  8,  0,  6,  0, $2e, 0
	db -1 ; end

.PushStartText:
	dsprite  0,  0,  0,  0, $30, 2
	dsprite  0,  0,  1,  0, $32, 2
	dsprite  0,  0,  2,  0, $34, 2
	dsprite  0,  0,  3,  0, $36, 2
	dsprite  0,  0,  4,  0, $38, 2
	dsprite  0,  0,  5,  0, $3a, 2
	db -1 ; end

.NewGameText:
	dsprite  0,  0,  0,  0, $3c, 2
	dsprite  0,  0,  1,  0, $3e, 2
	dsprite  0,  0,  2,  0, $40, 2
	dsprite  0,  0,  3,  0, $42, 2
	dsprite  0,  0,  4,  0, $44, 2
	dsprite  0,  0,  5,  0, $46, 2
	db -1 ; end

.NewGameContinueText:
	dsprite  0,  0,  0,  0, $48, 2
	dsprite  0,  0,  1,  0, $4a, 2
	dsprite  0,  0,  2,  0, $4c, 2
	dsprite  0,  0,  3,  0, $4e, 2
	dsprite  0,  0,  4,  0, $50, 2
	dsprite  0,  0,  5,  0, $52, 2
	dsprite  2,  0,  0,  0, $54, 2
	dsprite  2,  0,  1,  0, $56, 2
	dsprite  2,  0,  2,  0, $58, 2
	dsprite  2,  0,  3,  0, $5a, 2
	dsprite  2,  0,  4,  0, $5c, 2
	dsprite  2,  0,  5,  0, $5e, 2
	db -1 ; end

.Cursor:
	dsprite  0,  0,  0,  0, $60, 2
	db -1 ; end

Func_077_4856:
	ld a, [wdcfb]
	cp 4
	jr z, asm_077_48a8
	cp 3
	jr z, asm_077_4894
	cp 2
	jr z, asm_077_487f
	cp 1
	jr z, asm_077_486a
	ret

asm_077_486a:
	ld a, [hSCX]
	inc a
	inc a
	inc a
	inc a
	ld [hSCX], a
	cp $a0
	jr z, asm_077_4879
	ret

asm_077_4879:
	ld a, 1
	ld [wdcf5], a
	ret

asm_077_487f:
	ld a, [hSCX]
	dec a
	dec a
	dec a
	dec a
	ld [hSCX], a
	cp $a8
	jr z, asm_077_488e
	ret

asm_077_488e:
	ld a, 1
	ld [wdcf5], a
	ret

asm_077_4894:
	ld a, [hSCY]
	dec a
	dec a
	dec a
	dec a
	ld [hSCY], a
	and a
	jr z, asm_077_48a2
	ret

asm_077_48a2:
	ld a, 1
	ld [wdcf5], a
	ret

asm_077_48a8:
	ld a, [hSCY]
	inc a
	inc a
	inc a
	inc a
	ld [hSCY], a
	and a
	jr z, asm_077_48b6
	ret

asm_077_48b6:
	ld a, 1
	ld [wdcf5], a
	ret

Func_077_48bc:
	ld a, [wdcf3]
	cp $20
	jr z, asm_077_48c8
	inc a
	ld [wdcf3], a
	ret

asm_077_48c8:
	ld a, [wcd42]
	sub 8
	ld [wcd42], a
	cp $38
	ret nz
	ld a, 2
	ld [wdcf5], a
	ret

Func_077_48d9:
	ld a, [wdcf4]
	cp 4
	jp z, asm_077_492f
	cp 3
	jp z, asm_077_491a
	cp 2
	jp z, asm_077_4906
	cp 1
	jp z, asm_077_48f1
	ret

asm_077_48f1:
	ld a, [wWX]
	dec a
	dec a
	dec a
	dec a
	ld [wWX], a
	cp $58
	jr z, asm_077_4900
	ret

asm_077_4900:
	ld a, 4
	ld [wdcf5], a
	ret

asm_077_4906:
	ld a, [wWY]
	dec a
	dec a
	dec a
	dec a
	ld [wWY], a
	and a
	jr z, asm_077_4914
	ret

asm_077_4914:
	ld a, 4
	ld [wdcf5], a
	ret

asm_077_491a:
	ld a, [wWX]
	dec a
	dec a
	dec a
	dec a
	ld [wWX], a
	cp $58
	jr z, asm_077_4929
	ret

asm_077_4929:
	ld a, 4
	ld [wdcf5], a
	ret

asm_077_492f:
	ld a, [wWY]
	dec a
	dec a
	dec a
	dec a
	ld [wWY], a
	and a
	jr z, asm_077_493d
	ret

asm_077_493d:
	ld a, 4
	ld [wdcf5], a
	ret


Intro_SetupNewScreen:
; set appropriate scrolling animation
	ld a, [wdce8]
	ld de, Intro_ScrollingModes
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wdcfb], a ; BG scrolling mode
	ld a, [hli]
	ld [wdcf4], a ; window scrolling mode

; set initial BG positions
	ld a, [wdcfb]
	ld de, Intro_InitialBGPositions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [hSCY], a
	ld a, [hli]
	ld [hSCX], a

; set initial window positions
	ld a, [wdcf4]
	ld de, Intro_InitialWindowPositions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wWY], a
	ldh [rWY], a
	ld a, [hli]
	ld [wWX], a
	ldh [rWX], a
	ld a, [wdce8]

; render to BG
	ld de, Intro_TilemapPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
; offset the map so that it may be scrolled in
	ld hl, $9814
	ld bc, $0a12
	ld a, $12
	ldh [hFF93], a
	ld a, $a
	ldh [hFF92], a
	call PlaceTilemap_Bank0
	ld a, [wdce8]

; render to window
	ld de, Intro_TilemapPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
; get window tilemap
	ld de, 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9c00
	ld bc, $0a12
	ld a, $12
	ldh [hFF93], a
	ld a, $a
	ldh [hFF92], a
	call Func_1373

; set bg attributes
	ld a, [wdce8]
	ld de, Intro_AttrPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9814
	ld bc, $0a12
	ld a, $12
	ldh [hFF93], a
	ld a, $a
	ldh [hFF92], a
	call PlaceAttrmap

; set win attributes
	ld a, [wdce8]
	ld de, Intro_AttrPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld de, 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld hl, $9c00
	ld bc, $0a12
	ld a, $12
	ldh [hFF93], a
	ld a, $a
	ldh [hFF92], a
	call Func_1367

; set BG palettes
	ld a, [wdce8]
	ld de, Intro_BGPalettePointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

; static object palette
	ld hl, IntroText_Palette
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

; load in GFX for BG layer
	ld a, [wdce8]
	ld de, Intro_BGGFXPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $9000
	ld bc, $0800
	call FarCopyBytesVRAM

; load in GFX for window layer
	ld a, [wdce8]
	ld de, Intro_WinGFXPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8800
	ld bc, $0800
	call FarCopyBytesVRAM

; load in GFX for sprite layer
	ld a, [wdce8]
	ld de, Intro_SpriteGFXPointers
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [wTempBank], a
	ld a, [hli]
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $8000
	ld bc, $0800
	call FarCopyBytesVRAM

	ld a, $a0
	ld [wcd42], a
	ld a, $38
	ld [wcd43], a
	ld a, [wdce8]
	inc a
	ld [wcd44], a
	ret

Intro_ScrollingModes:
	dw $101
	dw $202
	dw $301
	dw $402
	dw $202
	dw $302
	dw $101
	dw $402

Intro_InitialBGPositions:
	dw $0
	dw $0
	dw $0
	dw $80
	dw $80

Intro_InitialWindowPositions:
	dw $0
	dw $a000
	dw $5880
	dw $a000
	dw $5880

Intro_TilemapPointers:
	dw IntroBallot_BGTilemap
	dw IntroBallot_WinTilemap

	dw IntroBuck_BGTilemap
	dw IntroBuck_WinTilemap

	dw IntroNina_BGTilemap
	dw IntroNina_WinTilemap

	dw IntroClaude_BGTilemap
	dw IntroClaude_WinTilemap

	dw IntroHelen_BGTilemap
	dw IntroHelen_WinTilemap

	dw IntroLante_BGTilemap
	dw IntroLante_WinTilemap

	dw IntroRandt_BGTilemap
	dw IntroRandt_WinTilemap

	dw IntroMitt_BGTilemap
	dw IntroMitt_WinTilemap

Intro_AttrPointers:
; Using the same attributes for all intro pictures
; for both BG and Window
rept 8
	dw IntroPics_BGAttrs
	dw IntroPics_WinAttrs
endr

Intro_BGPalettePointers:
	dw IntroBallot_Palette
	dw IntroBuck_Palette
	dw IntroNina_Palette
	dw IntroClaude_Palette
	dw IntroHelen_Palette
	dw IntroLante_Palette
	dw IntroRandt_Palette
	dw IntroMitt_Palette

Intro_BGGFXPointers:
	dbaw IntroBallot_BGGFX
	dbaw IntroBuck_BGGFX
	dbaw IntroNina_BGGFX
	dbaw IntroClaude_BGGFX
	dbaw IntroHelen_BGGFX
	dbaw IntroLante_BGGFX
	dbaw IntroRandt_BGGFX
	dbaw IntroMitt_BGGFX

Intro_WinGFXPointers:
	dbaw IntroBallot_WinGFX
	dbaw IntroBuck_WinGFX
	dbaw IntroNina_WinGFX
	dbaw IntroClaude_WinGFX
	dbaw IntroHelen_WinGFX
	dbaw IntroLante_WinGFX
	dbaw IntroRandt_WinGFX
	dbaw IntroMitt_WinGFX

Intro_SpriteGFXPointers:
	dbaw IntroBallot_TextGFX
	dbaw IntroBuck_TextGFX
	dbaw IntroNina_TextGFX
	dbaw IntroClaude_TextGFX
	dbaw IntroHelen_TextGFX
	dbaw IntroLante_TextGFX
	dbaw IntroRandt_TextGFX
	dbaw IntroMitt_TextGFX

Intro_InitStars:
	ld a, [wdce8]
	cp 7
	ret nc
	ld a, [wdcf6]
	and a
	jr z, .asm_077_4b81
	dec a
	ld [wdcf6], a
	ret

.asm_077_4b81
	ld bc, wdd50
.asm_077_4b84
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_077_4b98
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, .asm_077_4b84
	ret

.asm_077_4b98
	ld de, .StarSprites
	ld a, [wdce8]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, 1
	ld [bc], a
	inc bc
	ld a, [hli]
	ld [wdcf6], a
	ld a, [hli]
	ld [bc], a
	ld a, [wdce8]
	inc a
	ld [wdce8], a
	ret

.StarSprites:
	dsprite 30,  0, 14,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  1,  0,  0, $00, 0
	dsprite  0,  0, 18,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  1,  0,  0, $00, 0
	dsprite 30,  0, 16,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  1,  0,  0, $00, 0
	dsprite  0,  0, 18,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  1,  0,  0, $00, 0
	dsprite 30,  0, 14,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  1,  0,  0, $00, 0
	dsprite  0,  0, 16,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  1,  0,  0, $00, 0
	dsprite 30,  0, 18,  0, $02, (OAMF_PAL1|OAMF_BANK1) + 0
	dsprite  0,  2,  0,  0, $00, 0


Intro_MoveStars:
	ld bc, wdd50

asm_077_4bfb:
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_077_4c0f

asm_077_4c03:
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, asm_077_4bfb
	ret

asm_077_4c0f:
	ld de, unk_077_4c20
	ld hl, 4
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

unk_077_4c20:
	dw asm_077_4c26
	dw asm_077_4ccb
	dw asm_077_4c78

asm_077_4c26:
	ret

unk_077_4c27:
	dw $ff00
	dw $fc03
	dw $fc04
	dw $fc03
	dw $fc03
	dw $fc03
	dw $fc03
	dw $fc04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fb04
	dw $fa04
	dw $fa05
	dw $fa05
	dw $fcfe
	dw $fffc
	dw $fdfa
	dw $fcfa
	dw $fbfa
	dw $fcfc
	dw $fcfd
	dw $fcff
	dw $fcff
	dw $fcff
	dw $fc00
	dw $fc00
	dw $fc01
	dw $fc01
	dw $fc02
	dw $fc02
	dw $fc02
	dw $fc03
	dw $fa05
	dw $fa06
	dw $fa05
	dw $fa06
	db $88

asm_077_4c78:
	ld de, unk_077_4c27
	ld a, [wdcf3]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	cp $88
	jr z, asm_077_4cbf
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ld hl, 1
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_077_4ca3
	dec [hl]
	jr asm_077_4cb4

asm_077_4ca3:
	ld [hl], 2
	ld hl, 3
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp 5
	jp c, asm_077_4cb4
	ld a, 1
	ld [hl], a

asm_077_4cb4:
	ld a, [wdcf3]
	add 2
	ld [wdcf3], a
	jp asm_077_4c03

asm_077_4cbf:
	xor a
	ld [wdcf3], a
	ld a, 1
	ld [hFFBF], a
	jp asm_077_4c03

asm_077_4ccb:
	ld hl, 1
	add hl, bc
	dec [hl]
	dec [hl]
	ld hl, 0
	add hl, bc
	ld a, [hl]
	add 4
	ld [hl], a
	cp $a8
	jr z, asm_077_4cfd
	ld hl, 2
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_077_4ce9
	dec [hl]
	jp asm_077_4c03

asm_077_4ce9:
	ld [hl], 2
	ld hl, 3
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	cp 5
	jp c, asm_077_4c03
	ld a, 1
	ld [hl], a
	jp asm_077_4c03

asm_077_4cfd:
	ld hl, 3
	add hl, bc
	ld [hl], 0
	jp asm_077_4c03

Func_077_4d06:
	ld hl, $c000
	ld bc, $28
	ld de, 4

asm_077_4d0f:
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, asm_077_4d0f
	xor a
	ld [wd1fb], a
	call Func_077_4d1e
	ret

Func_077_4d1e:
	ld bc, $dd50

asm_077_4d21:
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr nz, asm_077_4d35

asm_077_4d29:
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, asm_077_4d21
	ret

asm_077_4d35:
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
	ld de, unk_077_4d82
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

asm_077_4d5b:
	ld a, [hli]
	cp $ff
	jr z, asm_077_4d7b
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
	jr asm_077_4d5b

asm_077_4d7b:
	ld a, e
	ld [wd1fb], a
	jp asm_077_4d29

unk_077_4d82:
	dw unk_077_4d8c
	dw unk_077_4d8c
	dw unk_077_4dad
	dw unk_077_4dce
	dw unk_077_4def

unk_077_4d8c:
	db $0
	db $0
	db $0
	db $0
	db $0
	db $8
	db $2
	db $0
	db $0
	db $10
	db $4
	db $0
	db $0
	db $18
	db $6
	db $0
	db $10
	db $0
	db $8
	db $0
	db $10
	db $8
	db $a
	db $0
	db $10
	db $10
	db $c
	db $0
	db $10
	db $18
	db $e
	db $0
	db $ff

unk_077_4dad:
	db $0
	db $0
	db $10
	db $0
	db $0
	db $8
	db $12
	db $0
	db $0
	db $10
	db $14
	db $0
	db $0
	db $18
	db $16
	db $0
	db $10
	db $0
	db $18
	db $0
	db $10
	db $8
	db $1a
	db $0
	db $10
	db $10
	db $1c
	db $0
	db $10
	db $18
	db $1e
	db $0
	db $ff

unk_077_4dce:
	db $0
	db $0
	db $20
	db $0
	db $0
	db $8
	db $22
	db $0
	db $0
	db $10
	db $24
	db $0
	db $0
	db $18
	db $26
	db $0
	db $10
	db $0
	db $28
	db $0
	db $10
	db $8
	db $2a
	db $0
	db $10
	db $10
	db $2c
	db $0
	db $10
	db $18
	db $2e
	db $0
	db $ff

unk_077_4def:
	db $0
	db $0
	db $30
	db $0
	db $0
	db $8
	db $32
	db $0
	db $0
	db $10
	db $34
	db $0
	db $0
	db $18
	db $36
	db $0
	db $10
	db $0
	db $38
	db $0
	db $10
	db $8
	db $3a
	db $0
	db $10
	db $10
	db $3c
	db $0
	db $10
	db $18
	db $3e
	db $0
	db $ff


Intro_LoadNewTextSprites:
	ld hl, wVirtualOAM
	ld bc, $28
	ld de, 4
.clear
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear
	xor a
	ld [wd1fb], a
	call .LoadSprites
	ret

.LoadSprites:
	ld hl, Intro_TextSprites
	ld de, wcd42
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	and a
	ret z
	add a
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1fb]
	ld e, a
	ld d, $c0
.load_sprite
	ld a, [hli]
	cp -1
	jr z, .done
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .load_sprite
.done
	ld a, e
	ld [wd1fb], a
	ret

Intro_TextSprites:
	dw .Nothing
	dw .BallotText
	dw .BuckText
	dw .NinaText
	dw .ClaudeText
	dw .HelenText
	dw .LanteText
	dw .RandtText
	dw .MittText

.Nothing:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $00, 0
	db -1 ; end

.BallotText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  0,  0, $36, 0
	dsprite  6,  0,  1,  0, $38, 0
	dsprite  6,  0,  2,  0, $3a, 0
	dsprite  6,  0,  3,  0, $3c, 0
	dsprite  6,  0,  4,  0, $3e, 0
	dsprite  6,  0,  5,  0, $40, 0
	dsprite  6,  0,  6,  0, $42, 0
	db -1 ; end

.BuckText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  0,  0, $36, 0
	dsprite  6,  0,  1,  0, $38, 0
	dsprite  6,  0,  2,  0, $3a, 0
	dsprite  6,  0,  3,  0, $3c, 0
	dsprite  6,  0,  4,  0, $3e, 0
	dsprite  6,  0,  5,  0, $40, 0
	dsprite  6,  0,  6,  0, $42, 0
	dsprite  6,  0,  7,  0, $44, 0
	dsprite  6,  0,  8,  0, $46, 0
	db -1 ; end

.NinaText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  1,  0, $36, 0
	dsprite  6,  0,  2,  0, $38, 0
	dsprite  6,  0,  3,  0, $3a, 0
	dsprite  6,  0,  4,  0, $3c, 0
	dsprite  6,  0,  5,  0, $3e, 0
	dsprite  6,  0,  6,  0, $40, 0
	db -1 ; end

.ClaudeText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	db -1 ; end

.HelenText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	db -1 ; end

.LanteText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  1,  0, $24, 0
	dsprite  4,  0,  2,  0, $26, 0
	dsprite  4,  0,  3,  0, $28, 0
	dsprite  4,  0,  4,  0, $2a, 0
	dsprite  4,  0,  5,  0, $2c, 0
	dsprite  4,  0,  6,  0, $2e, 0
	db -1 ; end

.RandtText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	dsprite  4,  0,  8,  0, $34, 0
	dsprite  6,  0,  0,  0, $36, 0
	dsprite  6,  0,  1,  0, $38, 0
	dsprite  6,  0,  2,  0, $3a, 0
	dsprite  6,  0,  3,  0, $3c, 0
	dsprite  6,  0,  4,  0, $3e, 0
	dsprite  6,  0,  5,  0, $40, 0
	dsprite  6,  0,  6,  0, $42, 0
	db -1 ; end

.MittText:
	dsprite  0,  0,  0,  0, $00, 0
	dsprite  0,  0,  1,  0, $02, 0
	dsprite  0,  0,  2,  0, $04, 0
	dsprite  0,  0,  3,  0, $06, 0
	dsprite  0,  0,  4,  0, $08, 0
	dsprite  0,  0,  5,  0, $0a, 0
	dsprite  0,  0,  6,  0, $0c, 0
	dsprite  0,  0,  7,  0, $0e, 0
	dsprite  0,  0,  8,  0, $10, 0
	dsprite  2,  0,  0,  0, $12, 0
	dsprite  2,  0,  1,  0, $14, 0
	dsprite  2,  0,  2,  0, $16, 0
	dsprite  2,  0,  3,  0, $18, 0
	dsprite  2,  0,  4,  0, $1a, 0
	dsprite  2,  0,  5,  0, $1c, 0
	dsprite  2,  0,  6,  0, $1e, 0
	dsprite  2,  0,  7,  0, $20, 0
	dsprite  2,  0,  8,  0, $22, 0
	dsprite  4,  0,  0,  0, $24, 0
	dsprite  4,  0,  1,  0, $26, 0
	dsprite  4,  0,  2,  0, $28, 0
	dsprite  4,  0,  3,  0, $2a, 0
	dsprite  4,  0,  4,  0, $2c, 0
	dsprite  4,  0,  5,  0, $2e, 0
	dsprite  4,  0,  6,  0, $30, 0
	dsprite  4,  0,  7,  0, $32, 0
	db -1 ; end

Intro_CheckButtonSkip:
	ldh a, [hJoypadDown]
	and a
	ret z
; able to be skipped by any button
	ld a, 1
	ld [hFFBF], a
	ret

Func_077_5249:
	ld hl, IntroStart_BGPalette
	call CopyBackgroundPalettes
	ld hl, IntroStart_BGPalette
	ld de, wcab0
	ld bc, $40
	call CopyBytes3
	ret

; unused?
	ld hl, unk_077_52f7
	call CopyBackgroundPalettes
	ld hl, unk_077_52f7
	ld de, wcab0
	ld bc, $40
	call CopyBytes3
	ret

; unused?
	ld hl, unk_077_52b7
	call CopyBackgroundPalettes
	ld hl, unk_077_52f7
	ld de, wcab0
	ld bc, $40
	call CopyBytes3
	ret

Func_077_5282:
	call DelayFrame
	dec c
	jr nz, Func_077_5282
	ret

Func_077_5289:
	ld hl, wcd00
	ld bc, $0100

asm_077_528f:
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, asm_077_528f
	ret

Func_077_5297:
	ld hl, wdd50
	ld bc, $10

asm_077_529d:
	ld [hl], 0
	inc hl
	dec c
	ld a, c
	or b
	jr nz, asm_077_529d
	ret

Func_077_52a6:
	ld hl, $c000
	ld bc, $28
	ld de, 4

asm_077_52af:
	ld a, $a0
	ld [hl], a
	add hl, de
	dec c
	jr nz, asm_077_52af
	ret

unk_077_52b7:
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff
	dw $7fff

unk_077_52f7:
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0
	dw $0


IntroStart_BGPalette:
	RGB 30, 30, 30
	RGB 31, 22, 28
	RGB 20, 13, 10
	RGB 00, 00, 00

rept 8
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroStart_ObjPalette:
	RGB 21, 21, 21
	RGB 22, 00, 00
	RGB 29, 14, 00
	RGB 31, 24, 00

rept 8
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroText_Palette:
	RGB 21, 21, 21
	RGB 00, 00, 06
	RGB 16, 26, 31
	RGB 31, 31, 31

rept 8
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroStart_Attrs:
INCBIN "gfx/intro/background/begin.gbcattr"

IntroStart_Tilemap:
INCBIN "gfx/intro/background/begin.tilemap"

IntroStart_GFX:
INCBIN "gfx/intro/background/begin.2bpp"

IntroStars_GFX:
INCBIN "gfx/intro/sprites/stars.2bpp"

IntroBallot_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 28, 00, 00
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 09, 20, 30
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroBuck_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 13, 06, 29
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 31, 26, 00
	RGB 12, 23, 06
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroNina_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 00, 13, 00
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 31, 19, 16
	RGB 12, 18, 31
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroClaude_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 18, 14, 00
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 31, 26, 00
	RGB 29, 04, 00
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroHelen_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 00, 18, 31
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 31, 07, 26
	RGB 00, 19, 30
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroLante_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 25, 00, 17
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 19, 24, 31
	RGB 22, 11, 23
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroRandt_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 00
	RGB 13, 13, 25
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 16, 22, 31
	RGB 28, 13, 10
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroMitt_Palette::
	RGB 30, 30, 30
	RGB 31, 22, 13
	RGB 31, 25, 00
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 31, 22, 28
	RGB 20, 13, 10
	RGB 00, 00, 00

rept 7
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

IntroPics_BGAttrs::
INCBIN "gfx/intro/background/pics.gbcattr"

IntroBallot_BGTilemap::
INCBIN "gfx/intro/background/ballot.tilemap"

IntroBuck_BGTilemap::
INCBIN "gfx/intro/background/buck.tilemap"

IntroNina_BGTilemap::
INCBIN "gfx/intro/background/nina.tilemap"

IntroClaude_BGTilemap::
INCBIN "gfx/intro/background/claude.tilemap"

IntroHelen_BGTilemap::
INCBIN "gfx/intro/background/helen.tilemap"

IntroLante_BGTilemap::
INCBIN "gfx/intro/background/lante.tilemap"

IntroRandt_BGTilemap::
INCBIN "gfx/intro/background/randt.tilemap"

IntroMitt_BGTilemap::
INCBIN "gfx/intro/background/mitt.tilemap"

IntroPics_WinAttrs::
INCBIN "gfx/intro/window/pics.gbcattr"

IntroBallot_WinTilemap::
INCBIN "gfx/intro/window/ballot.tilemap"

IntroBuck_WinTilemap::
INCBIN "gfx/intro/window/buck.tilemap"

IntroNina_WinTilemap::
INCBIN "gfx/intro/window/nina.tilemap"

IntroClaude_WinTilemap::
INCBIN "gfx/intro/window/claude.tilemap"

IntroHelen_WinTilemap::
INCBIN "gfx/intro/window/helen.tilemap"

IntroLante_WinTilemap::
INCBIN "gfx/intro/window/lante.tilemap"

IntroRandt_WinTilemap::
INCBIN "gfx/intro/window/randt.tilemap"

IntroMitt_WinTilemap::
INCBIN "gfx/intro/window/mitt.tilemap"

TitleScreen_BGPalette:
	RGB 28, 31, 31
	RGB 00, 17, 26
	RGB 00, 00, 22
	RGB 00, 00, 05

	RGB 31, 31, 31
	RGB 00, 20, 31
	RGB 00, 00, 28
	RGB 00, 00, 05

	RGB 31, 31, 31
	RGB 23, 23, 31
	RGB 13, 08, 30
	RGB 00, 00, 05

; fill remaining slots
rept 6
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr

TitleScreen_ObjPalette:
	RGB 21, 21, 21
	RGB 22, 00, 00
	RGB 29, 14, 00
	RGB 31, 24, 00

	RGB 21, 21, 21
	RGB 00, 07, 00
	RGB 06, 18, 00
	RGB 22, 29, 00

	RGB 21, 21, 21
	RGB 10, 10, 10
	RGB 31, 00, 00
	RGB 30, 30, 30

; fill remaining slots
rept 6
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
endr


TitleScreen_Attrs:
	INCBIN "gfx/title_screen/title_screen.gbcattr"

TitleScreen_Tilemap:
	INCBIN "gfx/title_screen/title_screen.tilemap"

VastFame_Attrs:
	INCBIN "gfx/intro/vast_fame_logo.gbcattr"

VastFame_Tilemap:
	INCBIN "gfx/intro/vast_fame_logo.tilemap"

VastFame_Palette:
	RGB 30, 30, 30
	RGB 00, 20, 31
	RGB 00, 00, 27
	RGB 00, 00, 00

	RGB 30, 30, 30
	RGB 20, 20, 20
	RGB 10, 10, 10
	RGB 00, 00, 00

VastFameGFX:
	INCBIN "gfx/intro/vast_fame_logo.2bpp"

SECTION "banknum77", ROMX[$7fff], BANK[$77]
	db $77
