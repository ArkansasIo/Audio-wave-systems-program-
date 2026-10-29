; Example event stream: channel ID, parameter, duration in frames; $FF terminates.
; Full event interpreter is future work; see docs/SOUND_EFFECTS.md.
.export Sfx_Laser, Sfx_Explosion, Sfx_MenuMove
.segment "RODATA"
Sfx_Laser: .byte $02,$A0,$02,$02,$70,$02,$02,$40,$03,$FF
Sfx_Explosion: .byte $03,$03,$04,$03,$06,$04,$03,$0A,$06,$FF
Sfx_MenuMove: .byte $02,$D0,$01,$FF
