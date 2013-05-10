hello_load:

    lda #bank(typewriter)
    tam #page(typewriter)
    

    loadtypewriterfont

    ; prepare satb for texts
    lda LOW_BYTE #hello_text01
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #hello_text01
    sta HIGH_BYTE <data_ptr

    lda LOW_BYTE #satb
    sta LOW_BYTE <satb_ptr
    lda HIGH_BYTE #satb
    sta HIGH_BYTE <satb_ptr

    lda #$28
    sta LOW_BYTE <R1
    stz HIGH_BYTE <R1

    lda #$50
    sta LOW_BYTE <R2
    stz HIGH_BYTE <R2

    jsr maketextsatb

    ; text02
    incw <data_ptr
    lda #$40
    sta LOW_BYTE <R1
    stz HIGH_BYTE <R1

    lda #$70
    sta LOW_BYTE <R2
    stz HIGH_BYTE <R2

    jsr maketextsatb


    ; text03
    incw <data_ptr
    lda #$25
    sta LOW_BYTE <R1
    stz HIGH_BYTE <R1

    lda #$98
    sta LOW_BYTE <R2
    stz HIGH_BYTE <R2

    jsr maketextsatb


    ; text04
    incw <data_ptr
    lda #$28
    sta LOW_BYTE <R1
    stz HIGH_BYTE <R1

    lda #$B8
    sta LOW_BYTE <R2
    stz HIGH_BYTE <R2

    jsr maketextsatb


    ; text05
    incw <data_ptr
    lda #$28
    sta LOW_BYTE <R1
    stz HIGH_BYTE <R1

    lda #$D8
    sta LOW_BYTE <R2
    stz HIGH_BYTE <R2

    jsr maketextsatb





    rts


hello:
    jsr hello_load

    stz LOW_BYTE <frame_counter
    stz HIGH_BYTE <frame_counter

    stz <frame_skip_counter

    copypalette #typewriterpalette, palette

.wait:


    jsr wait_vsync

    ; offset in satb = 0
    stz <R0
    stz <R0 + 1

    stz <R1
    stz <R1 + 1

    clx
.loop:
    lda hello_text_timing, x
    sta <R2
    inx
    lda hello_text_timing, x
    sta <R2 + 1
    inx

    cmpw <R2, <frame_counter
    bne .loopend
    txa
    lsr a
    sta <R1
    jsr copysatbslice

    lda #bank(typewriter_key)
    sta <music_start_bank
    stz <music_loop
    jsr play_sample


    bra .afterloop

.loopend:
    cpx #HELLO_TEXT_LENGTH * 2
    bne .loop
    
.afterloop

    clx
.loopding:
    lda dings_timing, x
    sta <R2
    inx
    lda dings_timing, x
    sta <R2 + 1
    inx

    cmpw <R2, <frame_counter
    bne .loopdingend

    lda #bank(typewriter_return)
    sta <music_start_bank
    stz <music_loop
    jsr play_sample

    bra .afterloopding

.loopdingend:
    cpx #DINGS_COUNT * 2
    bne .loopding
    
.afterloopding


    cmpw #950, <frame_counter
    lblo .end
    bne .fadeout
    stz <frame_skip_counter

.fadeout:
    lda <frame_skip_counter
    cmp #4
    bne .end
    stz <frame_skip_counter

    lda LOW_BYTE #palette
    sta <R0
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #palette
    sta <R0 + 1
    sta HIGH_BYTE <data_ptr

    lda LOW_BYTE #blackpalette
    sta <R1
    lda HIGH_BYTE #blackpalette
    sta <R1 + 1

    jsr fadepalette


    lda #16
    sta <R0
    jsr loadpalette



.end:
    inc <frame_skip_counter
    incw <frame_counter

    cmpw #1000, <frame_counter
    lblo .wait


    jsr wait_vsync
    jsr clearsatb
    jsr clearsatb2
    jsr copysatb
    jsr copysatb2


    rts
