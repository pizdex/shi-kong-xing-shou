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

channel_struct: MACRO
\1SongID::                   db ; 00
\1Field01::                  db ; 01
\1Field02::                  db ; 02
\1GlobalTranspose::          db ; 03
\1GlobalFinePitch::          db ; 04
\1GlobalStereoPanning::      db ; 05
\1CurrentStereo::            db ; 06
\1LengthCounter::            db ; 07
\1Field08::                  db ; 08
\1Field09::                  db ; 09
\1Field0A::                  db ; 0a
\1Speed::                    db ; 0b
\1Field0C::                  db ; 0c
\1Field0D::                  db ; 0d
\1VibratoDelay::             db ; 0e
\1VibratoTablePointer::      dw ; 0f
\1Field11::                  db ; 11
\1Field12::                  db ; 12
\1Field13::                  db ; 13
\1InstrumentPointer::        dw ; 14
\1InstrumentPitchOffset::    db ; 16
\1InstrumentVolumeOffset::   db ; 17
\1Field18::                  db ; 18
\1InstrumentUnknownOffset::  db ; 19
\1InstrumentUnknown2Retrig:: db ; 1A
\1CurOctave::                db ; 1B
\1PitchOffset::              db ; 1C
\1NoteFreq::                 dw ; 1D
\1Field1F::                  db ; 1F
\1Playhead::                 dw ; 20
\1LoopPoint1::               dw ; 22
\1LoadPoint::                dw ; 24
\1LoopPoint2::               dw ; 26
\1Field28::                  dw ; 28
\1Field2A::                  db ; 2A
\1Field2B::                  db ; 2B
ENDM
