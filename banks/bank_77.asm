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
	ld de, unk_077_5577
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceTilemap_Bank0

	ld hl, vBGMap0
	ld de, unk_077_540f
	lb bc, $14, $12
	ld a, $12
	ldh [hFF93], a
	ld a, $14
	ldh [hFF92], a
	call PlaceAttrmap

	ld hl, unk_077_5337
	ld de, wcab0
	ld bc, $40
	call CopyBytes3

	ld hl, unk_077_537f
	ld de, wcaf0
	ld bc, $40
	call CopyBytes3

	ld hl, unk_077_56df
	ld de, vTiles2
	ld bc, $170
	call CopyBytesVRAM

	ld hl, unk_077_584f
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

	call Func_077_523f
	call Func_077_4b70
	call Func_077_4bf8
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
	call Func_077_4943
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

	call Func_077_523f

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
	call Func_077_4943
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

	ld a, BANK(TitleScreenGFX_Part1)
	ld [wTempBank], a
	ld hl, TitleScreenGFX_Part1
	ld de, $9000
	ld bc, $800
	call FarCopyBytesVRAM

	ld a, BANK(TitleScreenGFX_Part2)
	ld [wTempBank], a
	ld hl, TitleScreenGFX_Part2
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
	call Func_077_4667

	ld a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON
	ldh [rLCDC], a

	ld hl, wcab0
	xor a
	ldh [hFFC4], a
	ldh [hFF9D], a
	call FadeInPalette

.asm_42ce:
	call DelayFrame
	call Func_077_4667
	ldh a, [hFF9D]
	inc a
	ldh [hFF9D], a
	ldh a, [hFFBF]
	and a
	jr nz, .asm_4307
	call Func_077_4525
	call Func_077_45fa
	call Func_077_45b4
	call Func_077_456e
	ld a, [wdcf5]
	cp 1
	jr z, .asm_42fb
	cp 2
	jr z, .asm_4301
	call Func_077_4482
	jp .asm_42ce

.asm_42fb
	call Func_077_43d6
	jp .asm_42ce

.asm_4301
	call Func_077_4359
	jp .asm_42ce

.asm_4307
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

Func_077_4424:
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
	jr Func_077_449c
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

Func_077_4482:
	dr $1dc482, $1dc49c

Func_077_449c:
	dr $1dc49c, $1dc525

Func_077_4525:
	dr $1dc525, $1dc56e

Func_077_456e:
	dr $1dc56e, $1dc5b4

Func_077_45b4:
	dr $1dc5b4, $1dc5fa

Func_077_45fa:
	dr $1dc5fa, $1dc667

Func_077_4667:
	dr $1dc667, $1dc856

Func_077_4856:
	dr $1dc856, $1dc8bc

Func_077_48bc:
	dr $1dc8bc, $1dc8d9

Func_077_48d9:
	dr $1dc8d9, $1dc943

Func_077_4943:
	dr $1dc943, $1dcb70

Func_077_4b70:
	dr $1dcb70, $1dcbf8

Func_077_4bf8:
	dr $1dcbf8, $1dcd06

Func_077_4d06:
	dr $1dcd06, $1dce10

Func_077_4e10:
	dr $1dce10, $1dd23f

Func_077_523f:
	dr $1dd23f, $1dd282

Func_077_5282:
	dr $1dd282, $1dd289

Func_077_5289:
	dr $1dd289, $1dd297

Func_077_5297:
	dr $1dd297, $1dd2a6

Func_077_52a6:
	dr $1dd2a6, $1dd337

unk_077_5337:
	dr $1dd337, $1dd37f

unk_077_537f:
	dr $1dd37f, $1dd40f

unk_077_540f:
	dr $1dd40f, $1dd577

unk_077_5577:
	dr $1dd577, $1dd6df

unk_077_56df:
	dr $1dd6df, $1dd84f

unk_077_584f:
	dr $1dd84f, $1deb37

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
