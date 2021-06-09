; party_struct members (see macros/wram.asm)
rsreset
MON_SPECIES            rb   ; $00
MON_LEVEL              rb   ; $01
MON_HP                 rw   ; $02
MON_EXP                rb 3 ; $04

MON_MOVE1ID            rb   ; $07
MON_MOVE1PP            rb   ; $08
MON_MOVE1MAXPP         rb   ; $09
MON_MOVE2ID            rb   ; $0a
MON_MOVE2PP            rb   ; $0b
MON_MOVE2MAXPP         rb   ; $0c
MON_MOVE3ID            rb   ; $0d
MON_MOVE3PP            rb   ; $0e
MON_MOVE3MAXPP         rb   ; $0f
MON_MOVE4ID            rb   ; $10
MON_MOVE4PP            rb   ; $11
MON_MOVE4MAXPP         rb   ; $12

MON_STATUS             rb   ; $13
MON_ITEM               rb   ; $14
MON_UNK22              rb   ; $15
PARTYMON_STRUCT_LENGTH EQU _RS
