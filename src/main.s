; Minimal 6502 audio startup/demo skeleton. ca65-compatible.
; Treat as starter source; verify timing and linker layout in emulator.
.setcpu "6502"
.export Reset, NMI, IRQ

.segment "ZEROPAGE"
frame_counter: .res 1
note_index:    .res 1
note_delay:    .res 1

.segment "CODE"
Reset:
    sei
    cld
    ldx #$40
    stx $4017
    ldx #$FF
    txs
    inx
    stx $2000
    stx $2001
    stx $4015
    lda #$00
    sta frame_counter
    sta note_index
    lda #$06
    sta note_delay
    lda #%10111100
    sta $4000
    lda #$00
    sta $4001
    lda #$FD
    sta $4002
    lda #%11111000
    sta $4003
    lda #%00000001
    sta $4015
    lda #%10000000
    sta $2000
MainLoop:
    jmp MainLoop

NMI:
    pha
    txa
    pha
    inc frame_counter
    dec note_delay
    bne @done
    lda #$06
    sta note_delay
    inc note_index
    lda note_index
    and #$03
    tax
    lda DemoPitchLo,x
    sta $4002
    lda DemoPitchHi,x
    and #$07
    ora #$F8
    sta $4003
@done:
    lda $2002
    pla
    tax
    pla
    rti
IRQ:
    rti

.segment "RODATA"
DemoPitchLo: .byte $FD,$BE,$8D,$7E
DemoPitchHi: .byte $00,$00,$00,$00

.segment "VECTORS"
.word NMI
.word Reset
.word IRQ
