; Example pattern: 0..11 chromatic note index, $FE rest, $FF end.
.export Music_IntroPattern
.segment "RODATA"
Music_IntroPattern:
.byte 0,4,7,4,2,5,9,5,0,4,7,11,9,7,4,0
.byte $FE,7,9,11,7,4,2,0,$FF
