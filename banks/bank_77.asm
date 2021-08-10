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

	ld hl, Intro_Palette1
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, Intro_Palette2
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
	call Func_077_4e10

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

	ld hl, TitleScreen_Palette1
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, TitleScreen_Palette2
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
	ld [hFade], a
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
	ld [wTargetMode], a
	ret

asm_077_43c2:
	ld a, 1
	ld [wdcb3], a
	xor a
	ldh [hFade], a
	ld [wTargetMode], a
	ld a, 0
	ld [hFFBA], a
	jp JumpToModeAndSetMapPredefs
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
	dr $1dc856, $1dc8bc

Func_077_48bc:
	dr $1dc8bc, $1dc8d9

Func_077_48d9:
	dr $1dc8d9, $1dc943

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
	ld hl, Intro_ObjPalette
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
	dw unk_077_5f43
	dw unk_077_6597
	dw unk_077_5ff7
	dw unk_077_664b
	dw unk_077_60ab
	dw unk_077_66ff
	dw unk_077_615f
	dw unk_077_67b3
	dw unk_077_6213
	dw unk_077_6867
	dw unk_077_62c7
	dw unk_077_691b
	dw unk_077_637b
	dw unk_077_69cf
	dw unk_077_642f
	dw unk_077_6a83

Intro_AttrPointers:
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3
	dw unk_077_5e8f
	dw unk_077_64e3

Intro_BGPalettePointers:
	dw unk_077_5c4f
	dw unk_077_5c97
	dw unk_077_5cdf
	dw unk_077_5d27
	dw unk_077_5d6f
	dw unk_077_5db7
	dw unk_077_5dff
	dw unk_077_5e47

Intro_BGGFXPointers:
	dbaw IntroBG_GFX_1
	dbaw IntroBG_GFX_2
	dbaw IntroBG_GFX_3
	dbaw IntroBG_GFX_4
	dbaw IntroBG_GFX_5
	dbaw IntroBG_GFX_6
	dbaw IntroBG_GFX_7
	dbaw IntroBG_GFX_8

Intro_WinGFXPointers:
	dbaw IntroWin_GFX_1
	dbaw IntroWin_GFX_2
	dbaw IntroWin_GFX_3
	dbaw IntroWin_GFX_4
	dbaw IntroWin_GFX_5
	dbaw IntroWin_GFX_6
	dbaw IntroWin_GFX_7
	dbaw IntroWin_GFX_8

Intro_SpriteGFXPointers:
	dbaw IntroSprite_GFX_1
	dbaw IntroSprite_GFX_2
	dbaw IntroSprite_GFX_3
	dbaw IntroSprite_GFX_4
	dbaw IntroSprite_GFX_5
	dbaw IntroSprite_GFX_6
	dbaw IntroSprite_GFX_7
	dbaw IntroSprite_GFX_8

Intro_InitStars:
	ld a, [wdce8]
	cp 7
	ret nc
	ld a, [wdcf6]
	and a
	jr z, asm_077_4b81
	dec a
	ld [wdcf6], a
	ret

asm_077_4b81:
	ld bc, wdd50

asm_077_4b84:
	ld hl, 3
	add hl, bc
	ld a, [hl]
	and a
	jr z, asm_077_4b98
	ld hl, 5
	add hl, bc
	push hl
	pop bc
	ld a, l
	cp $5f
	jr c, asm_077_4b84
	ret

asm_077_4b98:
	ld de, unk_077_4bc0
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

unk_077_4bc0:
	db $f0
	db $70
	db $2
	db $18
	db $1
	db $0
	db $0
	db $0
	db $0
	db $90
	db $2
	db $18
	db $1
	db $0
	db $0
	db $0
	db $f0
	db $80
	db $2
	db $18
	db $1
	db $0
	db $0
	db $0
	db $0
	db $90
	db $2
	db $18
	db $1
	db $0
	db $0
	db $0
	db $f0
	db $70
	db $2
	db $18
	db $1
	db $0
	db $0
	db $0
	db $0
	db $80
	db $2
	db $18
	db $1
	db $0
	db $0
	db $0
	db $f0
	db $90
	db $2
	db $18
	db $2
	db $0
	db $0
	db $0

Intro_MoveStars:
	dr $1dcbf8, $1dcd06

Func_077_4d06:
	dr $1dcd06, $1dce10

Func_077_4e10:
	dr $1dce10, $1dd23f

Intro_CheckButtonSkip:
	ldh a, [hJoypadDown]
	and a
	ret z
; able to be skipped by any button
	ld a, 1
	ld [hFade], a
	ret

Func_077_5249:
	dr $1dd249, $1dd282

Func_077_5282:
	dr $1dd282, $1dd289

Func_077_5289:
	dr $1dd289, $1dd297

Func_077_5297:
	dr $1dd297, $1dd2a6

Func_077_52a6:
	dr $1dd2a6, $1dd337

Intro_Palette1:
	dr $1dd337, $1dd37f

Intro_Palette2:
	dr $1dd37f, $1dd3c7

Intro_ObjPalette:
	dr $1dd3c7, $1dd40f

IntroStart_Attrs:
INCBIN "gfx/title_screen/intro/background/begin.gbcattr"

IntroStart_Tilemap:
INCBIN "gfx/title_screen/intro/background/begin.tilemap"

IntroStart_GFX:
INCBIN "gfx/title_screen/intro/background/begin.2bpp"

IntroStars_GFX:
	dr $1dd84f, $1ddc4f

unk_077_5c4f::
	dr $1ddc4f, $1ddc97

unk_077_5c97::
	dr $1ddc97, $1ddcdf

unk_077_5cdf::
	dr $1ddcdf, $1ddd27

unk_077_5d27::
	dr $1ddd27, $1ddd6f

unk_077_5d6f::
	dr $1ddd6f, $1dddb7

unk_077_5db7::
	dr $1dddb7, $1dddff

unk_077_5dff::
	dr $1dddff, $1dde47

unk_077_5e47::
	dr $1dde47, $1dde8f

unk_077_5e8f::
	dr $1dde8f, $1ddf43

unk_077_5f43::
	dr $1ddf43, $1ddff7

unk_077_5ff7::
	dr $1ddff7, $1de0ab

unk_077_60ab::
	dr $1de0ab, $1de15f

unk_077_615f::
	dr $1de15f, $1de213

unk_077_6213::
	dr $1de213, $1de2c7

unk_077_62c7::
	dr $1de2c7, $1de37b

unk_077_637b::
	dr $1de37b, $1de42f

unk_077_642f::
	dr $1de42f, $1de4e3

unk_077_64e3::
	dr $1de4e3, $1de597

unk_077_6597::
	dr $1de597, $1de64b

unk_077_664b::
	dr $1de64b, $1de6ff

unk_077_66ff::
	dr $1de6ff, $1de7b3

unk_077_67b3::
	dr $1de7b3, $1de867

unk_077_6867::
	dr $1de867, $1de91b

unk_077_691b::
	dr $1de91b, $1de9cf

unk_077_69cf::
	dr $1de9cf, $1dea83

unk_077_6a83::
	dr $1dea83, $1deb37

TitleScreen_Palette1:
	dw $7ffc
	dw $6a20
	dw $5800
	dw $1400

	dw $7fff
	dw $7e80
	dw $7000
	dw $1400

	dw $7fff
	dw $7ef7
	dw $790d
	dw $1400
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
	dw 0
	dw 0
	dw 0
	dw 0

TitleScreen_Palette2:
	dw $56B5
 	dw $0016
 	dw $01DD
 	dw $031F

 	dw $56B5
 	dw $00E0
 	dw $0246
 	dw $03B6
 	dw $56B5
 	dw $294A
 	dw $001F
 	dw $7BDE

 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000
 	dw $0000


TitleScreen_Attrs:
	INCBIN "gfx/title_screen/title_screen.gbcattr"

TitleScreen_Tilemap:
	INCBIN "gfx/title_screen/title_screen.tilemap"

VastFame_Attrs:
	INCBIN "gfx/title_screen/vast_fame_logo.gbcattr"

VastFame_Tilemap:
	INCBIN "gfx/title_screen/vast_fame_logo.tilemap"

VastFame_Palette:
	dw $7bde
	dw $7e80
	dw $6c00
	dw 0
	dw $7bde
	dw $5294
	dw $294a
	dw 0

VastFameGFX:
	INCBIN "gfx/title_screen/vast_fame_logo.2bpp"


SECTION "banknum77", ROMX[$7fff], BANK[$77]
	db $77
