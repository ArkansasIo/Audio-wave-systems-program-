; Approximate NTSC pulse timer table; verify tuning before production use.
.export NoteTimerLo, NoteTimerHi
.segment "RODATA"
NoteTimerLo:
.byte $F1,$1A,$46,$74,$A5,$D9,$10,$4A,$87,$C7,$0B,$52
NoteTimerHi:
.byte $06,$06,$05,$05,$04,$04,$04,$03,$03,$02,$02,$02
