; Source for floppy disk bootstrap ROM. Generated by disassembling
; code.

       ADDR = $FD

       DSKPIA = $C000
       KBD = $DF00
       VM = $FE00
       ACIA = $F000

        *=$FC00

        jsr     LFC0C
        jmp     (ADDR)
        jsr     LFC0C
        jmp     VM
LFC0C:  ldy     #$00
        sty     DSKPIA+1
        sty     DSKPIA
        ldx     #$04
        stx     DSKPIA+1
        sty     DSKPIA+3
        dey
        sty     DSKPIA+2
        stx     DSKPIA+3
        sty     DSKPIA+2
        lda     #$FB
        bne     LFC33
LFC2A:  lda     #$02
        bit     DSKPIA
        beq     LFC4D
        lda     #$FF
LFC33:  sta     DSKPIA+2
        jsr     LFCA5
        and     #$F7
        sta     DSKPIA+2
        jsr     LFCA5
        ora     #$08
        sta     DSKPIA+2
        ldx     #$18
        jsr     LFC91
        beq     LFC2A
LFC4D:  ldx     #$7F
        stx     DSKPIA+2
        jsr     LFC91
LFC55:  lda     DSKPIA
        bmi     LFC55
LFC5A:  lda     DSKPIA
        bpl     LFC5A
        lda     #$03
        sta     DSKPIA+$10
        lda     #$58
        sta     DSKPIA+$10
        jsr     LFC9C
        sta     $FE
        tax
        jsr     LFC9C
        sta     ADDR
        jsr     LFC9C
        sta     $FF
        ldy     #$00
LFC7B:  jsr     LFC9C
        sta     (ADDR),y
        iny
        bne     LFC7B
        inc     $FE
        dec     $FF
        bne     LFC7B
        stx     $FE
        lda     #$FF
        sta     DSKPIA+2
        rts

LFC91:  ldy     #$F8
LFC93:  dey
        bne     LFC93
        eor     $FF,x
        dex
        bne     LFC91
        rts

LFC9C:  lda     DSKPIA+$10
        lsr     a
        bcc     LFC9C
        lda     DSKPIA+$11
LFCA5:  rts

        lda     #$03
        sta     ACIA
        lda     #$11
        sta     ACIA
        rts

        pha
LFCB2:  lda     ACIA
        lsr     a
        lsr     a
        bcc     LFCB2
        pla
        sta     ACIA+1
        rts

        eor     #$FF
        sta     KBD
        eor     #$FF
        rts

        pha
        jsr     LFCCF
        tax
        pla
        dex
        inx
        rts

LFCCF:  lda     KBD
        eor     #$FF
        rts

        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
        .byte $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
        .byte $FF, $FF, $FF