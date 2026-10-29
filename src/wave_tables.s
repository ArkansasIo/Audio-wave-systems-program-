; 32-sample 8-bit tables for software preview/export tools.
; Original NES channels do not accept arbitrary wavetable samples.
.export Wave_Sine8, Wave_Triangle8, Wave_Saw8, Wave_Square8
.export WaveTableLength
.segment "RODATA"
WaveTableLength = 32
Wave_Sine8:
.byte 128,153,177,199,218,234,245,253,255,253,245,234,218,199,177,153
.byte 128,103,79,57,38,22,11,3,0,3,11,22,38,57,79,103
Wave_Triangle8:
.byte 0,16,32,48,64,80,96,112,128,143,159,175,191,207,223,239
.byte 255,239,223,207,191,175,159,143,128,112,96,80,64,48,32,16
Wave_Saw8:
.byte 0,8,16,24,32,40,48,56,64,72,80,88,96,104,112,120
.byte 128,136,144,152,160,168,176,184,192,200,208,216,224,232,240,248
Wave_Square8:
.byte 255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
