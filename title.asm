title_load:
    lda #bank(title02)
    tam #page(title02)

	lda #LOW(TILE_START)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(title02)
    sta LOW_BYTE <data_ptr
    lda #HIGH(title02)
    sta HIGH_BYTE <data_ptr

    stz <R0
    lda #1
    sta <R0 + 1
	
    jsr loadtiles


    lda #bank(title03)
    tam #page(title03)

	lda #LOW(TILE_START + TILE_SIZE * 256)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + TILE_SIZE * 256)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(title03)
    sta LOW_BYTE <data_ptr
    lda #HIGH(title03)
    sta HIGH_BYTE <data_ptr

    lda #235
    sta <R0
    stz <R0 + 1
	
    jsr loadtiles


    lda #bank(title01)
    tam #page(title01)


    stz <R0
    stz <R0 + 1
    lda LOW_BYTE #blackpalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #blackpalette
    sta HIGH_BYTE <data_ptr
    jsr loadpalette


;fill the bat
    st0 #$00
    st1 #$00
    st2 #$00
    st0 #$02

    tia titlebat, $0002, 1024 * 2



    rts


title:
    jsr title_load

    copypalette #blackpalette, palette

    stz LOW_BYTE <frame_counter
    stz HIGH_BYTE <frame_counter

    stz <frame_skip_counter

.wait:
    jsr wait_vsync

    cmpw #30, <frame_counter
    lbpl .end

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

    lda LOW_BYTE #titlepalette
    sta <R1
    lda HIGH_BYTE #titlepalette
    sta <R1 + 1

    jsr fadepalette


    stz <R0
    jsr loadpalette





.end:
    inc <frame_skip_counter
    incw <frame_counter

    cmpw #350, <frame_counter
    lblo .wait


    jsr wait_vsync
    jsr clearsatb
    jsr clearsatb2
    jsr copysatb
    jsr copysatb2


    rts

