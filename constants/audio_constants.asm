; channel
	const_def
	const CHAN1 ; 0
	const CHAN2 ; 1
	const CHAN3 ; 2
	const CHAN4 ; 3
NUM_MUSIC_CHANS EQU const_value
	const CHAN5 ; 4
	const CHAN6 ; 5
	const CHAN7 ; 6
	const CHAN8 ; 7
NUM_NOISE_CHANS EQU const_value - NUM_MUSIC_CHANS
NUM_CHANNELS EQU const_value

; channel_struct members (see macros/wram.asm)
CHANNEL_SONG_ID                     EQUS "(wChannel1SongID - wChannel1)"
CHANNEL_FIELD01                     EQUS "(wChannel1Field01 - wChannel1)"
CHANNEL_FIELD02                     EQUS "(wChannel1Field02 - wChannel1)"
CHANNEL_GLOBAL_TRANSPOSE            EQUS "(wChannel1GlobalTranspose - wChannel1)"
CHANNEL_GLOBAL_FINE_PITCH           EQUS "(wChannel1GlobalFinePitch - wChannel1)"
CHANNEL_GLOBAL_STEREO_PANNING       EQUS "(wChannel1GlobalStereoPanning - wChannel1)"
CHANNEL_CURRENT_STEREO              EQUS "(wChannel1CurrentStereo - wChannel1)"
CHANNEL_LENGTH_COUNTER              EQUS "(wChannel1LengthCounter - wChannel1)"
CHANNEL_FIELD08                     EQUS "(wChannel1Field08 - wChannel1)"
CHANNEL_FIELD09                     EQUS "(wChannel1Field09 - wChannel1)"
CHANNEL_FIELD0A                     EQUS "(wChannel1Field0A - wChannel1)"
CHANNEL_SPEED                       EQUS "(wChannel1Speed - wChannel1)"
CHANNEL_FIELD0C                     EQUS "(wChannel1Field0C - wChannel1)"
CHANNEL_FIELD0D                     EQUS "(wChannel1Field0D - wChannel1)"
CHANNEL_VIBRATO_DELAY               EQUS "(wChannel1VibratoDelay - wChannel1)"
CHANNEL_VIBRATO_TABLE_POINTER       EQUS "(wChannel1VibratoTablePointer - wChannel1)"
CHANNEL_FIELD11                     EQUS "(wChannel1Field11 - wChannel1)"
CHANNEL_FIELD12                     EQUS "(wChannel1Field12 - wChannel1)"
CHANNEL_FIELD13                     EQUS "(wChannel1Field13 - wChannel1)"
CHANNEL_INSTRUMENT_POINTER          EQUS "(wChannel1InstrumentPointer - wChannel1)"
CHANNEL_INSTRUMENT_PITCH_OFFSET     EQUS "(wChannel1InstrumentPitchOffset - wChannel1)"
CHANNEL_INSTRUMENT_VOLUME_OFFSET    EQUS "(wChannel1InstrumentVolumeOffset - wChannel1)"
CHANNEL_FIELD18                     EQUS "(wChannel1Field18 - wChannel1)"
CHANNEL_INSTRUMENT_UNKNOWN_OFFSET   EQUS "(wChannel1InstrumentUnknownOffset - wChannel1)"
CHANNEL_INSTRUMENT_UNKNOWN2_RETRIG  EQUS "(wChannel1InstrumentUnknown2Retrig - wChannel1)"
CHANNEL_CUR_OCTAVE                  EQUS "(wChannel1CurOctave - wChannel1)"
CHANNEL_PITCH_OFFSET                EQUS "(wChannel1PitchOffset - wChannel1)"
CHANNEL_NOTE_FREQ                   EQUS "(wChannel1NoteFreq - wChannel1)"
CHANNEL_FIELD1F                     EQUS "(wChannel1Field1F - wChannel1)"
CHANNEL_PLAYHEAD                    EQUS "(wChannel1Playhead - wChannel1)"
CHANNEL_LOOP_POINT_1                EQUS "(wChannel1LoopPoint1 - wChannel1)"
CHANNEL_LOAD_POINT                  EQUS "(wChannel1LoadPoint - wChannel1)"
CHANNEL_LOOP_POINT_2                EQUS "(wChannel1LoopPoint2 - wChannel1)"
CHANNEL_FIELD28                     EQUS "(wChannel1Field28 - wChannel1)"
CHANNEL_FIELD2A                     EQUS "(wChannel1Field2A - wChannel1)"
CHANNEL_FIELD2B                     EQUS "(wChannel1Field2B - wChannel1)"

CHANNEL_STRUCT_LENGTH EQUS "(wChannel2 - wChannel1)"
