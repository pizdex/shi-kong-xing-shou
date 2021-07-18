INCLUDE "constants.asm"


SECTION "WRAM", WRAM0

wc000::
wVirtualOAM::
wVirtualOAMSprite00:: sprite_oam_struct wVirtualOAMSprite00
wVirtualOAMSprite01:: sprite_oam_struct wVirtualOAMSprite01
wVirtualOAMSprite02:: sprite_oam_struct wVirtualOAMSprite02
wVirtualOAMSprite03:: sprite_oam_struct wVirtualOAMSprite03
wVirtualOAMSprite04:: sprite_oam_struct wVirtualOAMSprite04
wVirtualOAMSprite05:: sprite_oam_struct wVirtualOAMSprite05
wVirtualOAMSprite06:: sprite_oam_struct wVirtualOAMSprite06
wVirtualOAMSprite07:: sprite_oam_struct wVirtualOAMSprite07
wVirtualOAMSprite08:: sprite_oam_struct wVirtualOAMSprite08
wVirtualOAMSprite09:: sprite_oam_struct wVirtualOAMSprite09
wVirtualOAMSprite10:: sprite_oam_struct wVirtualOAMSprite10
wVirtualOAMSprite11:: sprite_oam_struct wVirtualOAMSprite11
wVirtualOAMSprite12:: sprite_oam_struct wVirtualOAMSprite12
wVirtualOAMSprite13:: sprite_oam_struct wVirtualOAMSprite13
wVirtualOAMSprite14:: sprite_oam_struct wVirtualOAMSprite14
wVirtualOAMSprite15:: sprite_oam_struct wVirtualOAMSprite15
wVirtualOAMSprite16:: sprite_oam_struct wVirtualOAMSprite16
wVirtualOAMSprite17:: sprite_oam_struct wVirtualOAMSprite17
wVirtualOAMSprite18:: sprite_oam_struct wVirtualOAMSprite18
wVirtualOAMSprite19:: sprite_oam_struct wVirtualOAMSprite19
wVirtualOAMSprite20:: sprite_oam_struct wVirtualOAMSprite20
wVirtualOAMSprite21:: sprite_oam_struct wVirtualOAMSprite21
wVirtualOAMSprite22:: sprite_oam_struct wVirtualOAMSprite22
wVirtualOAMSprite23:: sprite_oam_struct wVirtualOAMSprite23
wVirtualOAMSprite24:: sprite_oam_struct wVirtualOAMSprite24
wVirtualOAMSprite25:: sprite_oam_struct wVirtualOAMSprite25
wVirtualOAMSprite26:: sprite_oam_struct wVirtualOAMSprite26
wVirtualOAMSprite27:: sprite_oam_struct wVirtualOAMSprite27
wVirtualOAMSprite28:: sprite_oam_struct wVirtualOAMSprite28
wVirtualOAMSprite29:: sprite_oam_struct wVirtualOAMSprite29
wVirtualOAMSprite30:: sprite_oam_struct wVirtualOAMSprite30
wVirtualOAMSprite31:: sprite_oam_struct wVirtualOAMSprite31
wVirtualOAMSprite32:: sprite_oam_struct wVirtualOAMSprite32
wVirtualOAMSprite33:: sprite_oam_struct wVirtualOAMSprite33
wVirtualOAMSprite34:: sprite_oam_struct wVirtualOAMSprite34
wVirtualOAMSprite35:: sprite_oam_struct wVirtualOAMSprite35
wVirtualOAMSprite36:: sprite_oam_struct wVirtualOAMSprite36
wVirtualOAMSprite37:: sprite_oam_struct wVirtualOAMSprite37
wVirtualOAMSprite38:: sprite_oam_struct wVirtualOAMSprite38
wVirtualOAMSprite39:: sprite_oam_struct wVirtualOAMSprite39
wVirtualOAMEnd::

wc0a0:: ds $10

wBGMapBufferPointers:: ds $38

wc0e8:: ds $18

wc100:: ds $640

wc740:: ds $1e0

; c920
wTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::

wca88:: ds $28

wcab0:: ds $40

wcaf0:: ds 8 * 8

wcb30:: ds $a0

wcbd0:: ds $20

wCharacterTilemapPos:: ds 1
wTextLine:: ds 1
wCharacterTileCount:: ds 1
wcbf3:: ds 1
wCharacterBGMapTransferStatus:: ds 1
wCharacterTileTransferStatus:: ds 1
wcbf6:: ds 1
wTextNameID:: ds 1

wScriptPos:: ds 2
wScriptByte:: ds 1
wcbfb:: ds 1
wcbfc:: ds 1
wcbfd:: ds 1

wcbfe:: ds 2

; eight 4-color palettes each
wBGPals1:: ds 8 palettes
wOBPals1:: ds 8 palettes
wBGPals2:: ds 8 palettes
wOBPals2:: ds 8 palettes

wcd00:: ds 1 ; Distance to warp border y
wcd01:: ds 1 ; Distance to warp border x

wcd02:: ds 1
wcd03:: ds 1 ; Facing direction
wcd04:: ds 1 ; OW sprite ID?
wcd05:: ds 1
wcd06:: ds 1
wcd07:: ds 1
wcd08:: ds 1
wcd09:: ds 1
wcd0a:: ds 1
wcd0b:: ds 1
wcd0c:: ds 6
wcd12:: ds 1
wcd13:: ds 1
wcd14:: ds $c

wcd20:: ds 1
wcd21:: ds 1
wcd22:: ds 1
wcd23:: ds 1
wcd24:: ds 1
wcd25:: ds 1
wcd26:: ds 1
wcd27:: ds $19

wcd40:: ds 1
wcd41:: ds 1
wcd42:: ds 1
wcd43:: ds 1
wcd44:: ds 1

wcd45:: ds 11

wcd50:: ds 1
wcd51:: ds 1
wcd52:: ds 1
wcd53:: ds 1
wcd54:: ds 1
wcd55:: ds 1
wcd56:: ds 1
wcd57:: ds 1
wcd58:: ds 1

	ds $87

; Start menu
wcde0:: ds 1
wcde1:: ds 1
wcde2:: ds 1

wcde3:: ds $1d

wce00:: ds $100

wcf00:: ds $100


SECTION "WRAM1", WRAMX

wd000:: ds $82

wd082:: ds 1
wd083:: ds 1
wd084:: ds 1
wTextDelayFrames:: ds 1
wd086:: ds 1
wd087:: ds 1

wd088:: ds 2
wd08a:: ds 1
wd08b:: ds 1
wd08c:: ds 1

wd08d:: ds 1 ; selected page
wd08e:: ds 1 ; selected option
wd08f:: ds 1
wd090:: ds 1
wd091:: ds 1
wd092:: ds $e

wd0a0:: ds 2
wd0a2:: ds 2
wd0a4:: ds 2
wd0a6:: ds 2
wd0a8:: ds 2
wd0aa:: ds 2
wd0ac:: ds 2
wd0ae:: ds 2

wd0b0:: ds 2
wd0b2:: ds 2
wd0b4:: ds 1
wd0b5:: ds 5

wd0ba:: ds 2
wd0bc:: ds 5

wd0c1:: ds 1
wd0c2:: ds 1
wd0c3:: ds 1

wd0c4:: ds 2
wd0c6:: ds 2

wd0c8:: ds 1
wd0c9:: ds 1
wd0ca:: ds 1
wd0cb:: ds 2

wd0cd:: ds 2
wTextboxPointer:: ds 2
wd0d1:: ds 2
wd0d3:: ds 1
wd0d4:: ds 1 ; step counter
wd0d5:: ds 1
wd0d6:: ds 1

wMoney:: ds 3

wd0da:: ds 1

wGameTimeHours:: ds 1
wGameTimeMinutes:: ds 1

	ds 2

wd0df:: ds 1
wd0e0:: ds 3
wd0e3:: ds 1
wd0e4:: ds $b
wd0ef:: ds 1
wd0f0:: ds 1
wd0f1:: ds 1
wd0f2:: ds 2
wd0f4:: ds 1
wd0f5:: ds 1

wCharacterTileDest:: ds 2
wd0f8:: ds 1
wd0f9:: ds 1
wd0fa:: ds 1
wd0fb:: ds 2
wd0fd:: ds 2
wd0ff:: ds 1

wd100:: ds $28 ; wTextboxAttrmap?

wd128:: ds $78

wd1a0:: ds 8
wd1a8:: ds 8
wd1b0:: ds $32

wd1e2:: ds 1
wd1e3:: ds 1

	ds 13

wd1f1:: ds 1
wd1f2:: ds 7

wd1f9:: ds 1
wd1fa:: ds 1
wd1fb:: ds 1
wd1fc:: ds 1
	ds 3

wPartyMons::
wPartyMon1:: party_struct wPartyMon1
wPartyMon2:: party_struct wPartyMon2
wPartyMon3:: party_struct wPartyMon3
wPartyMon4:: party_struct wPartyMon4
wPartyMon5:: party_struct wPartyMon5
wPartyMon6:: party_struct wPartyMon6

wd284:: ds $7c

; Items (ID, Quantity)
wd300:: ds $f4

wd3f4:: ds 1

; collision related
wd3f5:: ds 1
wd3f6:: ds 1
wd3f7:: ds 1
wd3f8:: ds 1

wd3f9:: ds 5
wd3fe:: ds 1
wd3ff:: ds 1

; sound engine
wd400:: ds 1
	ds 1

wd402:: ds 1
wSoundCurChannel:: ds 1
wCurrentSongID:: ds 1
wSoundNumChannels:: ds 1
wd406:: ds 1
	ds 7

; music channels
wChannels::
wChannel1:: channel_struct wChannel1
wChannel2:: channel_struct wChannel2
wChannel3:: channel_struct wChannel3
wChannel4:: channel_struct wChannel4

; sfx channels
wSFXChannels::
wChannel5:: channel_struct wChannel5
wChannel6:: channel_struct wChannel6
wChannel7:: channel_struct wChannel7
wChannel8:: channel_struct wChannel8

wd56e:: ds 1
wd56f:: ds 1
wd570:: ds 1
wd571:: ds 1
wd572:: ds 1
wd573:: ds 1
wd574:: ds 1

wd575:: ds 1
wd576:: ds 1
wd577:: ds 2
wd579:: ds 1
wd57a:: ds 1
wd57b:: ds 1
wd57c:: ds 1
wd57d:: ds 1
wd57e:: ds 1
wd57f:: ds 1
wd580:: ds 1
wd581:: ds 2
wd583:: ds 1

	ds $14
wd598:: ds 1
wd599:: ds 2
wd59b:: ds 1

	ds $6b

wd607:: ds 1
wd608:: ds 1
wd609:: ds 1
wd60a:: ds 1
wSoundFadeEnabled:: ds 1
wSoundFadeTimer:: ds 1
wd60d:: ds 1
	ds 8
wd616:: ds $2c
wd642:: ds $2c
wd66e:: ds $2c
wd69a:: ds 1
	ds $23

wd6be:: ds 1
	ds 7

wd6c6:: ds 1
	ds $23

wd6ea:: ds 1
	ds 7

wd6f2:: ds 1
	ds $2b

wd71e:: ds 1
	ds $2b

wd74a:: ds $81

wd7cb:: ds $9f ; mon dex

wd86a:: ds 12

wd876:: ds $16

wd88c:: ds $6e

wd8fa:: ds 4
wd8fe:: ds 1
wd8ff:: ds 1

wd900:: ds $3c

wd93c:: ds $3c

wd978:: ds 4
wd97c:: ds 5

wd981:: ds 2
wd983:: ds 1
wd984:: ds 2
wd986:: ds 1
wd987:: ds 1
wd988:: ds 1
wd989:: ds 1
wd98a:: ds 1
wd98b:: ds 1
wd98c:: ds 3
wd98f:: ds 1
wd990:: ds 1
wd991:: ds 2
wd993:: ds 1
wd994:: ds 4

wd998:: ds 1
wd999:: ds 1
wd99a:: ds 1
wd99b:: ds 1
wd99c:: ds $f

wd9ab:: ds 1
wd9ac:: ds 1
wd9ad:: ds 2

wd9af:: ds 3

wd9b2:: ds 1
wd9b3:: ds 1
wd9b4:: ds 1
wd9b5:: ds 1
wd9b6:: ds 9

wd9bf:: ds 1

wCharacterTileSrc:: ds 2
wd9c2:: ds $c

wd9ce:: ds 2

wd9d0:: ds 2
wd9d2:: ds 2
wd9d4:: ds 2

wd9d6:: ds 1
wd9d7:: ds 1
wd9d8:: ds 1
wd9d9:: ds 1
wd9da:: ds 3
wd9dd:: ds 1

wWX:: ds 1
wWY:: ds 1

wd9e0:: ds 2
wd9e2:: ds 1
wd9e3:: ds 1
wEnemyMonSpecies:: ds 1
wd9e5:: ds 4
wd9e9:: ds 1
wd9ea:: ds 1
wd9eb:: ds 5

wTempBank:: ds 1
wd9f1:: ds 2
wd9f3:: ds 6
wd9f9:: ds 1
wd9fa:: ds 1
wd9fb:: ds 1
wd9fc:: ds 1
wd9fd:: ds 1
wd9fe:: ds 1
wd9ff:: ds 1
wda00:: ds $a0

wdaa0:: ds 1
wdaa1:: ds 1
wdaa2:: ds 1
wdaa3:: ds 1
wdaa4:: ds 1 ; shop menu
wdaa5:: ds 1
wdaa6:: ds 1
wdaa7:: ds 1
wdaa8:: ds 1
wdaa9:: ds 1
wdaaa:: ds 1
wdaab:: ds 1
wdaac:: ds 1
wdaad:: ds 1
wdaae:: ds 1
wdaaf:: ds 1
wdab0:: ds 1
wdab1:: ds 1
wdab2:: ds 1
wdab3:: ds 1
wdab4:: ds 1
wdab5:: ds 1
wdab6:: ds 1
wdab7:: ds 1
wdab8:: ds 1

wdab9:: ds $15

wTextBGMapPointer:: ds 2
wdad0:: ds $12

wdae2:: ds 1
wdae3:: ds 4
wdae7:: ds 4
wdaeb:: ds $30

wGameTimeSeconds:: ds 1
wdb1c:: ds 1
wdb1d:: ds 1
wCurrentCharacterByte:: ds 1
wdb1f:: ds 1
wdb20:: ds $17e

wdc9e:: ds 1
wdc9f:: ds $11

wdcb0:: ds 1
wdcb1:: ds 1
wdcb2:: ds 1
wdcb3:: ds 2

wdcb5:: ds 1
wdcb6:: ds 5

wdcbb:: ds $d

wdcc8:: ds 2
wdcca:: ds 1
wdccb:: ds 1
wdccc:: ds 1
wdccd:: ds 1
wdcce:: ds 1
wdccf:: ds 1

wdcd0:: ds 1
wdcd1:: ds 2
wdcd3:: ds 2
wdcd5:: ds 3

wTextFaceID:: ds 1
wdcd9:: ds 7

wCharacterTilePos:: ds 1
wdce1:: ds 1
wdce2:: ds 1

; 0 = bottom half, 1 = top half
wTextboxPos:: ds 1

wdce4:: ds 1
wdce5:: ds 2
wdce7:: ds 1
wdce8:: ds 2

wdcea:: ds 1 ; follower?

wdceb:: ds 1
wdcec:: ds 7

wdcf3:: ds 1
wdcf4:: ds 1
wdcf5:: ds 1
wdcf6:: ds 1
wdcf7:: ds 1
wdcf8:: ds 1
wdcf9:: ds 1
wdcfa:: ds 1
wdcfb:: ds 1
wdcfc:: ds 1
wdcfd:: ds 1
wdcfe:: ds 1
wdcff:: ds 1

wdd00:: ds $18
wdd18:: ds $38

wdd50:: ds 1
	ds $5f

wddb0:: ds $50

wde00:: ds $16
wde16:: ds $16
wde2c:: ds $16
wde42:: ds $16
wde58:: ds $16
wde6e:: ds $16
wde84:: ds $16
wde9a:: ds $66

wdf00:: ds $ff

wdfff:: ds 1

INCLUDE "hram.asm"
