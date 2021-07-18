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

signpost: MACRO
; Signpost event, accessible by pressing A while facing up
; \1 = X
; \2 = Y
; \3 = Signpost number (seems to be determined per map group)
	event \1, \2, $02, \3, $00, $00
ENDM

warp: MACRO
; Warp event
; \1 = X
; \2 = Y
; \3 = map ID?    -> FF9B
; \4 = map group? -> FF9C
; \5 = ???        -> FFC1
	event \1, \2, $00, \3, \4, \5
ENDM
