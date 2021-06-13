party_struct: MACRO
\1Species:: db
\1Level::   db
\1HP::      dw
\1Exp::     ds 3

\1Move1ID::    db
\1Move1PP::    db
\1Move1MaxPP:: db
\1Move2ID::    db
\1Move2PP::    db
\1Move2MaxPP:: db
\1Move3ID::    db
\1Move3PP::    db
\1Move3MaxPP:: db
\1Move4ID::    db
\1Move4PP::    db
\1Move4MaxPP:: db

\1Status:: db
\1Item::   db
\1unk22::  db
ENDM

sprite_oam_struct: MACRO
\1YCoord::     db
\1XCoord::     db
\1TileID::     db
\1Attributes:: db
; bit 7: priority
; bit 6: y flip
; bit 5: x flip
; bit 4: pal # (non-cgb)
; bit 3: vram bank (cgb only)
; bit 2-0: pal # (cgb only)
ENDM
