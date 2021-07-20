Group00_Maps::
	dw BellVillage1_Header
	dw BellVillage1_Header
	dw unk_007_40cc
	dw unk_007_40ea
	dw unk_007_4108
	dw unk_007_414a
	dw unk_007_415c
	dw unk_007_416e
	dw unk_007_4180
	dw unk_007_4192
	dw unk_007_41bc
	dw unk_007_41da
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

BellVillage1_Header:
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

unk_007_40cc::
	dr $1c0cc, $1c0ea

unk_007_40ea::
	dr $1c0ea, $1c108

unk_007_4108::
	dr $1c108, $1c14a

unk_007_414a::
	dr $1c14a, $1c15c

unk_007_415c::
	dr $1c15c, $1c16e

unk_007_416e::
	dr $1c16e, $1c180

unk_007_4180::
	dr $1c180, $1c192

unk_007_4192::
	dr $1c192, $1c1bc

unk_007_41bc::
	dr $1c1bc, $1c1da

unk_007_41da::
	dr $1c1da, $1c1ec

unk_007_41ec::
	dr $1c1ec, $1c20a

unk_007_420a::
	dr $1c20a, $1c21c

BellVillage1_MapEvents::
	event ABSOLUTE, 19, $01, $01, $85, $42
	event ABSOLUTE, 19, $01, $02, $95, $42
	warp_event ABSOLUTE, 0, $02, $00, $00 ; TEMP
	warp_event 23, ABSOLUTE, $03, $00, $00 ; TEMP
	warp_event 3, 7, $05, $00, $00 ; TEMP
	warp_event 19, 5, $06, $00, $00 ; TEMP
	warp_event 20, 15, $07, $00, $00 ; TEMP
	event 4, 15, $01, $00, $a7, $41
	warp_event 12, 11, $08, $00, $00 ; TEMP
	signpost_event  8,  3, $01
	signpost_event 22,  7, $02
	signpost_event 15, 17, $03
	events_end

unk_007_4265::
	dr $1c265, $1c30f

Group01_Maps::
	dr $1c30f, $1c4ef

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
	dr $1c8d3, $1ce2f

unk_007_4e2f::
	dr $1ce2f, $1cf00

SECTION "banknum7", ROMX[$7fff], BANK[$7]
	db $7
