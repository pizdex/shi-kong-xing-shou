event: MACRO
; Generic event
; \1 = X
; \2 = Y
; \3 = event type
; \4 = parameter 1
; \5 = parameter 2
; \6 = parameter 3
	db \1, \2
	db \3, \4, \5, \6
ENDM

warp_event: MACRO
; $00 - Warp event
; \1 = X
; \2 = Y
; \3 = map ID
; \4 = warp number
; \5 = scroll to show
if _NARG > 4
	event \1, \2, $00, \3, \4, \5
else
	event \1, \2, $00, \3, \4, 0
endc
ENDM


script_event: MACRO
; $01 - Script event
; \1 = X
; \2 = Y
; \3 = ?
; \4 = script location
	db \1, \2, $01
	db \3
	dw \4
ENDM

signpost_event: MACRO
; $02 - Signpost event, accessible by pressing A while facing up
; \1 = X
; \2 = Y
; \3 = Signpost number (seems to be determined per map group)
	event \1, \2, $02, \3, $00, $00
ENDM

event_04: MACRO
; $04 - Script event
; \1 = X
; \2 = Y
; \3 = ?
; \4 = script location
	db \1, \2, $04
	db \3
	dw \4
ENDM
events_end: MACRO
	db -1
ENDM

object_event: MACRO
; Object event, interactible sprites
; \1 = Sprite ID
; \2 = X
; \3 = Y
; \4 = RAM location?
; \5 = ??
; \6 = ??
; \7 = ??
; \8 = ??
; \9 = Script
	db \1
	db \2, \3
	dw \4
	db \5, \6, \7, \8
	dw \9
ENDM

objects_end: MACRO
	db $88
ENDM

