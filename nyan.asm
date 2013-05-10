nyan_load:
    lda #bank(nyan_bg01)
    tam #page(nyan_bg01)

    stz <R0
    stz <R0 + 1
    lda LOW_BYTE #nyanpalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #nyanpalette
    sta HIGH_BYTE <data_ptr

    jsr loadpalette
    copypalette #nyanpalette, palette



	lda #LOW(TILE_START)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg01_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg01_0)
    sta HIGH_BYTE <data_ptr

    lda #30
    sta <R0
	
    jsr loadtiles


    lda #bank(nyan_bg02)
    tam #page(nyan_bg02)

	lda #LOW(TILE_START + NYAN_BG02_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + NYAN_BG02_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg02_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg02_0)
    sta HIGH_BYTE <data_ptr

    lda #29
    sta <R0
	
    jsr loadtiles


    lda #bank(nyan_bg03)
    tam #page(nyan_bg03)

	lda #LOW(TILE_START + NYAN_BG03_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + NYAN_BG03_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg03_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg03_0)
    sta HIGH_BYTE <data_ptr

    lda #28
    sta <R0
	
    jsr loadtiles


    lda #bank(nyan_bg04)
    tam #page(nyan_bg04)

	lda #LOW(TILE_START + NYAN_BG04_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + NYAN_BG04_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg04_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg04_0)
    sta HIGH_BYTE <data_ptr

    lda #29
    sta <R0
	
    jsr loadtiles


    lda #bank(nyan_bg05)
    tam #page(nyan_bg05)

	lda #LOW(TILE_START + NYAN_BG05_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + NYAN_BG05_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg05_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg05_0)
    sta HIGH_BYTE <data_ptr

    lda #26
    sta <R0
	
    jsr loadtiles


    lda #bank(nyan_bg06)
    tam #page(nyan_bg06)

	lda #LOW(TILE_START + NYAN_BG06_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + NYAN_BG06_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg06_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg06_0)
    sta HIGH_BYTE <data_ptr

    lda #36
    sta <R0
	
    jsr loadtiles


    lda #bank(nyan_bg07)
    tam #page(nyan_bg07)

	lda #LOW(TILE_START + NYAN_BG07_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(TILE_START + NYAN_BG07_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(nyan_bg07_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(nyan_bg07_0)
    sta HIGH_BYTE <data_ptr

    lda #38
    sta <R0
	
    jsr loadtiles


; fill the bat
    
    lda #bank(nyan_bg01)
    tam #page(nyan_bg01)

    st0 #$00
    st1 #$00
    st2 #$00
    st0 #$02

    tia nyan_bg01_bat, $0002, 1024 * 2


; load the rainbow
    lda #bank(rainbow01)
    tam #page(rainbow01)

    lda #16
    sta <R0
    stz <R0 + 1
    lda LOW_BYTE #rainbowpalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #rainbowpalette
    sta HIGH_BYTE <data_ptr

    jsr loadpalette
    copypalette #rainbowpalette, palette + 16


	lda #LOW(SPRITE_START)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(rainbow01_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(rainbow01_0)
    sta HIGH_BYTE <data_ptr

    lda #26
    sta <R0
    stz <R0 + 1

    jsr loadsprites2


    lda #bank(rainbow02)
    tam #page(rainbow02)

	lda #LOW(SPRITE_START + RAINBOW02_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + RAINBOW02_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(rainbow02_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(rainbow02_0)
    sta HIGH_BYTE <data_ptr

    lda #26
    sta <R0
    stz <R0 + 1

    jsr loadsprites2


; load the body
    lda #bank(cat_body)
    tam #page(cat_body)

    lda #17
    sta <R0
    stz <R0 + 1
    lda LOW_BYTE #bodypalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #bodypalette
    sta HIGH_BYTE <data_ptr

    jsr loadpalette
    copypalette #bodypalette, palette + 32


	lda #LOW(SPRITE_START + BODY_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + BODY_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(body_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(body_0)
    sta HIGH_BYTE <data_ptr

    lda #20
    sta <R0
    stz <R0 + 1

    jsr loadsprites

;load the face
    lda #bank(cat_face)
    tam #page(cat_face)

    lda #18
    sta <R0
    stz <R0 + 1
    lda LOW_BYTE #facepalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #facepalette
    sta HIGH_BYTE <data_ptr

    jsr loadpalette
    copypalette #facepalette, palette + 48


	lda #LOW(SPRITE_START + FACE_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + FACE_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(face_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(face_0)
    sta HIGH_BYTE <data_ptr

    lda #18
    sta <R0
    stz <R0 + 1

    jsr loadsprites

;load the paw
    lda #bank(cat_paw)
    tam #page(cat_paw)

    lda #19
    sta <R0
    stz <R0 + 1
    lda LOW_BYTE #pawpalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #pawpalette
    sta HIGH_BYTE <data_ptr

    jsr loadpalette
    copypalette #pawpalette, palette + 64


	lda #LOW(SPRITE_START + PAW_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw_0)
    sta HIGH_BYTE <data_ptr

    lda #4
    sta <R0
    stz <R0 + 1

    jsr loadsprites

;load tail anim #01
    lda #bank(cat_tail)
    tam #page(cat_tail)

    lda #20
    sta <R0
    stz <R0 + 1
    lda LOW_BYTE #tailpalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #tailpalette
    sta HIGH_BYTE <data_ptr

    jsr loadpalette
    copypalette #tailpalette, palette + 80


	lda #LOW(SPRITE_START + TAIL01_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + TAIL01_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(tail01_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(tail01_0)
    sta HIGH_BYTE <data_ptr

    lda #5
    sta <R0
    stz <R0 + 1

    jsr loadsprites2

;load tail anim #02
	lda #LOW(SPRITE_START + TAIL02_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + TAIL02_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(tail02_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(tail02_0)
    sta HIGH_BYTE <data_ptr

    lda #5
    sta <R0
    stz <R0 + 1

    jsr loadsprites2


;load tail anim #03
	lda #LOW(SPRITE_START + TAIL03_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + TAIL03_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(tail03_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(tail03_0)
    sta HIGH_BYTE <data_ptr

    lda #5
    sta <R0
    stz <R0 + 1

    jsr loadsprites2


;load tail anim #04
	lda #LOW(SPRITE_START + TAIL04_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + TAIL04_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(tail04_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(tail04_0)
    sta HIGH_BYTE <data_ptr

    lda #5
    sta <R0
    stz <R0 + 1

    jsr loadsprites2


;load tail anim #05
	lda #LOW(SPRITE_START + TAIL05_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + TAIL05_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(tail05_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(tail05_0)
    sta HIGH_BYTE <data_ptr

    lda #5
    sta <R0
    stz <R0 + 1

    jsr loadsprites2


    lda #bank(cat_paw)
    tam #page(cat_paw)
;load front paw #1
	lda #LOW(SPRITE_START + PAW01_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW01_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw01)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw01)
    sta HIGH_BYTE <data_ptr

    lda #1
    sta <R0
    stz <R0 + 1

    jsr loadsprites2

;load front paw #2
	lda #LOW(SPRITE_START + PAW02_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW02_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw02)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw02)
    sta HIGH_BYTE <data_ptr

    lda #1
    sta <R0
    stz <R0 + 1

    jsr loadsprites2

;load front paw #3
	lda #LOW(SPRITE_START + PAW03_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW03_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw03)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw03)
    sta HIGH_BYTE <data_ptr

    lda #1
    sta <R0
    stz <R0 + 1

    jsr loadsprites2

;load front paw #1
	lda #LOW(SPRITE_START + PAW01_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW01_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw01)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw01)
    sta HIGH_BYTE <data_ptr

    lda #1
    sta <R0
    stz <R0 + 1

    jsr loadsprites

;load front paw #2
	lda #LOW(SPRITE_START + PAW02_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW02_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw02)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw02)
    sta HIGH_BYTE <data_ptr

    lda #1
    sta <R0
    stz <R0 + 1

    jsr loadsprites

;load front paw #3
	lda #LOW(SPRITE_START + PAW03_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAW03_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(paw03)
    sta LOW_BYTE <data_ptr
    lda #HIGH(paw03)
    sta HIGH_BYTE <data_ptr

    lda #1
    sta <R0
    stz <R0 + 1

    jsr loadsprites


;load back paw
	lda #LOW(SPRITE_START + PAWB_OFFSET)
    sta LOW_BYTE <vram_ptr
    lda #HIGH(SPRITE_START + PAWB_OFFSET)
    sta HIGH_BYTE <vram_ptr
    lda #LOW(pawb_0)
    sta LOW_BYTE <data_ptr
    lda #HIGH(pawb_0)
    sta HIGH_BYTE <data_ptr

    lda #4
    sta <R0
    stz <R0 + 1

    jsr loadsprites




    rts


nyan:

    jsr nyan_load

    stz LOW_BYTE <frame_counter
    stz HIGH_BYTE <frame_counter

    stz <frame_skip_counter

    stz <R10    ; x scroll counter
    stz <R11    ; nyan bg bat index
    stz <R12    ; rainbow flag / rainbow frame skip counter
    lda #8
    sta <R12 + 1
    stz <R13    ; tail index / tail frame skip counter
    lda #4
    sta <R13 + 1

    stz <R14

    ; start the music
    lda #bank(nyanyanya)
    sta <music_start_bank
    lda #1
    sta <music_loop
    jsr play_sample

.wait:
    inc <frame_skip_counter


    jsr wait_vsync

    jsr copysatb
    jsr copysatb2


    lda <frame_skip_counter
    cmp #4
    lbne .scrollbg

    stz <frame_skip_counter


    inc <R11
    lda <R11
    cmp #7
    bne .setbat
    stz <R11
    cla
.setbat:
    st0 #$00
    st1 #$00
    st2 #$00
    st0 #$02

    cmp #0
    lbeq .setbat01
    cmp #1
    lbeq .setbat02
    cmp #2
    lbeq .setbat03
    cmp #3
    lbeq .setbat04
    cmp #4
    lbeq .setbat05
    cmp #5
    lbeq .setbat06
    cmp #6
    lbeq .setbat07

.setbat01:
    lda #bank(nyan_bg01)
    tam #page(nyan_bg01)

    lda #LOW(nyan_bg01_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg01_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat01:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat01
    ldx #255

    dey
    bne .copybat01

    ;tia nyan_bg01_bat, $0002, 1024 * 2
    jmp .scrollbg

.setbat02:
    lda #bank(nyan_bg02)
    tam #page(nyan_bg02)

    lda #LOW(nyan_bg02_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg02_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat02:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat02
    ldx #255

    dey
    bne .copybat02

    ;tia nyan_bg02_bat, $0002, 1024 * 2

    jmp .scrollbg

.setbat03:
    lda #bank(nyan_bg03)
    tam #page(nyan_bg03)

    lda #LOW(nyan_bg03_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg03_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat03:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat03
    ldx #255

    dey
    bne .copybat03

    ;tia nyan_bg03_bat, $0002, 1024 * 2
    jmp .scrollbg

.setbat04:
    lda #bank(nyan_bg04)
    tam #page(nyan_bg04)

    lda #LOW(nyan_bg04_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg04_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat04:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat04
    ldx #255

    dey
    bne .copybat04


    ;tia nyan_bg04_bat, $0002, 1024 * 2
    jmp .scrollbg

.setbat05:
    lda #bank(nyan_bg05)
    tam #page(nyan_bg05)

    lda #LOW(nyan_bg05_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg05_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat05:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat05
    ldx #255

    dey
    bne .copybat05


    ;tia nyan_bg05_bat, $0002, 1024 * 2
    jmp .scrollbg

.setbat06:
    lda #bank(nyan_bg06)
    tam #page(nyan_bg06)

    lda #LOW(nyan_bg06_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg06_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat06:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat06
    ldx #255

    dey
    bne .copybat06


    ;tia nyan_bg06_bat, $0002, 1024 * 2
    jmp .scrollbg

.setbat07:
    lda #bank(nyan_bg07)
    tam #page(nyan_bg07)

    lda #LOW(nyan_bg07_bat)
    sta <data_ptr
    lda #HIGH(nyan_bg07_bat)
    sta <data_ptr + 1

    ldx #255
    ldy #4
.copybat07:
    lda [data_ptr]
    sta $0002
    incw <data_ptr
    lda [data_ptr]
    sta $0003
    incw <data_ptr

    dex
    bne .copybat07
    ldx #255

    dey
    bne .copybat07


    ;tia nyan_bg07_bat, $0002, 1024 * 2
    jmp .scrollbg



.scrollbg:
    inc <R10 
    inc <R10 
    inc <R10 
    inc <R10 
    lda <R10
    lda <R10

    st0 #$07
    sta $0002
    st2 #$00



    ;jmp .wait



    lda <R12 + 1
    cmp #8
    lbne .afterrainbow
    stz <R12 + 1
    lda <R12
    bne .rainbow02
    inc <R12
    lda #bank(rainbow01)
    tam #page(rainbow01)

    lda #6
    sta <R0
    lda #30
    sta <R1
    lda #LOW(rainbow01_satb)
    sta <data_ptr
    lda #HIGH(rainbow01_satb)
    sta <data_ptr + 1
    jsr copytosatb2
    ;tii rainbow01_satb, satb2 + 6 * SATB_ITEM_SIZE, 30 * SATB_ITEM_SIZE
; move the rainbow
    lda #6
    sta <R3
    lda #32
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #30
    sta <R2
    jsr satb2shiftx
    lda #6
    sta <R3
    lda <nyan_rainbow01_traj_index
    tax
    lda nyan_rainbow01_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #30
    sta <R2
    jsr satb2shifty

    inc <nyan_rainbow01_traj_index
    lda <nyan_rainbow01_traj_index
    cmp #NYAN_RAINBOW01_TRAJ_LENGTH
    bne .afterrainbow
    stz <nyan_rainbow01_traj_index

    bra .afterrainbow

.rainbow02:
    stz <R12
    lda #bank(rainbow02)
    tam #page(rainbow02)

    lda #6
    sta <R0
    lda #30
    sta <R1
    lda #LOW(rainbow02_satb)
    sta <data_ptr
    lda #HIGH(rainbow02_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii rainbow02_satb, satb2 + 6 * SATB_ITEM_SIZE, 30 * SATB_ITEM_SIZE
; move the rainbow
    lda #6
    sta <R3
    lda #32
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #30
    sta <R2
    jsr satb2shiftx
    lda #6
    sta <R3
    lda <nyan_rainbow02_traj_index
    tax
    lda nyan_rainbow02_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #30
    sta <R2
    jsr satb2shifty

    inc <nyan_rainbow02_traj_index
    lda <nyan_rainbow02_traj_index
    cmp #NYAN_RAINBOW02_TRAJ_LENGTH
    bne .afterrainbow
    stz <nyan_rainbow02_traj_index



.afterrainbow:
    inc <R12 + 1


    lda #bank(cat_face)
    tam #page(cat_face)

    stz <R0
    lda #20
    sta <R1
    lda #LOW(face_satb)
    sta <data_ptr
    lda #HIGH(face_satb)
    sta <data_ptr + 1
    jsr copytosatb
    ;tii face_satb, satb, 20 * SATB_ITEM_SIZE
; move the face
    lda #0
    sta <R3
    lda <nyan_face_traj_index
    asl a
    tax
    lda nyan_face_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #20
    sta <R2
    jsr satbshiftx
    lda #0
    sta <R3
    lda <nyan_face_traj_index
    asl a
    tax
    inx
    lda nyan_face_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #20
    sta <R2
    jsr satbshifty

    lda #bank(cat_body)
    tam #page(cat_body)

    lda #20
    sta <R0
    lda #25
    sta <R1
    lda #LOW(body_satb)
    sta <data_ptr
    lda #HIGH(body_satb)
    sta <data_ptr + 1
    jsr copytosatb
    ;tii body_satb, satb + 20 * SATB_ITEM_SIZE, 25 * SATB_ITEM_SIZE
; move the body
    lda #20
    sta <R3
    lda <nyan_body_traj_index
    asl a
    tax
    lda nyan_body_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #25
    sta <R2
    jsr satbshiftx
    lda #20
    sta <R3
    lda <nyan_body_traj_index
    asl a
    tax
    inx
    lda nyan_body_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #25
    sta <R2
    jsr satbshifty

    lda #bank(cat_paw)
    tam #page(cat_paw)

    lda <nyan_paw01_traj_index
    tax
    lda paw01_index, x
    cmp #1
    bne .paw01_02

    lda #45
    sta <R0
    lda #4
    sta <R1
    lda #LOW(paw_satb)
    sta <data_ptr
    lda #HIGH(paw_satb)
    sta <data_ptr + 1
    jsr copytosatb
     ;tii paw_satb, satb + 45 * SATB_ITEM_SIZE, 4 * SATB_ITEM_SIZE
    bra .movepaw1

.paw01_02:
    lda #45
    sta <R0
    lda #4
    sta <R1
    lda #LOW(pawb_satb)
    sta <data_ptr
    lda #HIGH(pawb_satb)
    sta <data_ptr + 1
    jsr copytosatb
     ;tii pawb_satb, satb + 45 * SATB_ITEM_SIZE, 4 * SATB_ITEM_SIZE

.movepaw1:
; move paw #1
    lda #45
    sta <R3
    lda <nyan_paw01_traj_index
    asl a
    tax
    lda nyan_paw01_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #4
    sta <R2
    jsr satbshiftx
    lda #45
    sta <R3
    lda <nyan_paw01_traj_index
    asl a
    tax
    inx
    lda nyan_paw01_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #4
    sta <R2
    jsr satbshifty


    lda <nyan_paw02_traj_index
    tax
    lda paw02_index, x
    cmp #1
    bne .paw02_02

    lda #49
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw01_satb)
    sta <data_ptr
    lda #HIGH(paw01_satb)
    sta <data_ptr + 1
    jsr copytosatb
    ;tii paw01_satb, satb + 49 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE
    bra .movepaw2

.paw02_02:
    cmp #2
    bne .paw02_03
    lda #49
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw02_satb)
    sta <data_ptr
    lda #HIGH(paw02_satb)
    sta <data_ptr + 1
    jsr copytosatb
     ;tii paw02_satb, satb + 49 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE
    bra .movepaw2

.paw02_03:
    lda #49
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw03_satb)
    sta <data_ptr
    lda #HIGH(paw03_satb)
    sta <data_ptr + 1
    jsr copytosatb
  ;tii paw03_satb, satb + 49 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE

.movepaw2:
; move paw #2
    lda #49
    sta <R3
    lda <nyan_paw02_traj_index
    asl a
    tax
    lda nyan_paw02_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #1
    sta <R2
    jsr satbshiftx
    lda #49
    sta <R3
    lda <nyan_paw02_traj_index
    asl a
    tax
    inx
    lda nyan_paw02_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #1
    sta <R2
    jsr satbshifty


    lda <nyan_paw03_traj_index
    tax
    lda paw03_index, x
    cmp #1
    bne .paw03_02

    lda #50
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw01_satb)
    sta <data_ptr
    lda #HIGH(paw01_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii paw01_satb, satb2 + 50 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE
    bra .movepaw3

.paw03_02:
    cmp #2
    bne .paw03_03

    lda #50
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw02_satb)
    sta <data_ptr
    lda #HIGH(paw02_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii paw02_satb, satb2 + 50 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE
    bra .movepaw3

.paw03_03:
    lda #49
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw03_satb)
    sta <data_ptr
    lda #HIGH(paw03_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii paw03_satb, satb2 + 49 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE

.movepaw3:
; move paw #3
    lda #50
    sta <R3
    lda <nyan_paw03_traj_index
    asl a
    tax
    lda nyan_paw03_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #1
    sta <R2
    jsr satb2shiftx
    lda #50
    sta <R3
    lda <nyan_paw03_traj_index
    asl a
    tax
    inx
    lda nyan_paw03_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #1
    sta <R2
    jsr satb2shifty


    lda <nyan_paw04_traj_index
    tax
    lda paw04_index, x
    cmp #1
    bne .paw04_02

    lda #51
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw01_satb)
    sta <data_ptr
    lda #HIGH(paw01_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii paw01_satb, satb2 + 51 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE
    bra .movepaw4

.paw04_02:
    cmp #2
    bne .paw04_03

    lda #51
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw02_satb)
    sta <data_ptr
    lda #HIGH(paw02_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii paw02_satb, satb2 + 51 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE
    bra .movepaw4

.paw04_03:

    lda #51
    sta <R0
    lda #1
    sta <R1
    lda #LOW(paw03_satb)
    sta <data_ptr
    lda #HIGH(paw03_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii paw03_satb, satb2 + 51 * SATB_ITEM_SIZE, 1 * SATB_ITEM_SIZE

.movepaw4:
; move paw #4
    lda #51
    sta <R3
    lda <nyan_paw04_traj_index
    asl a
    tax
    lda nyan_paw04_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #1
    sta <R2
    jsr satb2shiftx
    lda #51
    sta <R3
    lda <nyan_paw04_traj_index
    asl a
    tax
    inx
    lda nyan_paw04_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #1
    sta <R2
    jsr satb2shifty


    lda <R13 + 1
    cmp #4
    lbne .aftertail
    stz <R13 + 1
 
    lda #bank(cat_tail)
    tam #page(cat_tail)
    lda <R13
    inc <R13
    cmp #0
    beq .displaytail01
    cmp #1
    beq .displaytail02
    cmp #2
    beq .displaytail04
    cmp #3
    beq .displaytail05
    cmp #4
    beq .displaytail03
    cmp #5
    beq .displaytail02b


.displaytail01:

    lda #0
    sta <R0
    lda #6
    sta <R1
    lda #LOW(tail01_satb)
    sta <data_ptr
    lda #HIGH(tail01_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii tail01_satb, satb2, 6 * SATB_ITEM_SIZE
    bra .movetail

.displaytail02b:
    stz <R13 ; reset to first step of animation for next loop
.displaytail02:

    lda #0
    sta <R0
    lda #6
    sta <R1
    lda #LOW(tail02_satb)
    sta <data_ptr
    lda #HIGH(tail02_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii tail02_satb, satb2, 6 * SATB_ITEM_SIZE
    bra .movetail

.displaytail03:

    lda #0
    sta <R0
    lda #6
    sta <R1
    lda #LOW(tail03_satb)
    sta <data_ptr
    lda #HIGH(tail03_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii tail03_satb, satb2, 6 * SATB_ITEM_SIZE
    bra .movetail

.displaytail04:

    lda #0
    sta <R0
    lda #6
    sta <R1
    lda #LOW(tail04_satb)
    sta <data_ptr
    lda #HIGH(tail04_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii tail04_satb, satb2, 6 * SATB_ITEM_SIZE
    bra .movetail

.displaytail05:

    lda #0
    sta <R0
    lda #6
    sta <R1
    lda #LOW(tail05_satb)
    sta <data_ptr
    lda #HIGH(tail05_satb)
    sta <data_ptr + 1
    jsr copytosatb2
     ;tii tail05_satb, satb2, 6 * SATB_ITEM_SIZE
    bra .movetail

.movetail:
; move tail
    lda #0
    sta <R3
    lda #96
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #6
    sta <R2
    jsr satb2shiftx
    lda #0
    sta <R3
    ldx nyan_tail_traj_index
    lda nyan_tail_traj, x
    sta <R0
    stz <R0 + 1
    lda #1
    sta <R1
    lda #6
    sta <R2
    jsr satb2shifty

    inc <nyan_tail_traj_index
    lda <nyan_tail_traj_index
    cmp #NYAN_TAIL_TRAJ_LENGTH
    bne .aftertail
    stz <nyan_tail_traj_index

.aftertail:
    inc <R13 + 1

    inc <nyan_body_traj_index
    lda <nyan_body_traj_index
    cmp #NYAN_BODY_TRAJ_LENGTH
    bne .nextindex01
    stz <nyan_body_traj_index

.nextindex01:
    inc <nyan_face_traj_index
    lda <nyan_face_traj_index
    cmp #NYAN_FACE_TRAJ_LENGTH
    bne .nextindex02
    stz <nyan_face_traj_index

.nextindex02:
    inc <nyan_paw01_traj_index
    lda <nyan_paw01_traj_index
    cmp #NYAN_PAW01_TRAJ_LENGTH
    bne .nextindex03
    stz <nyan_paw01_traj_index

.nextindex03:
    inc <nyan_paw02_traj_index
    lda <nyan_paw02_traj_index
    cmp #NYAN_PAW02_TRAJ_LENGTH
    bne .nextindex04
    stz <nyan_paw02_traj_index

.nextindex04:

    inc <nyan_paw03_traj_index
    lda <nyan_paw03_traj_index
    cmp #NYAN_PAW03_TRAJ_LENGTH
    bne .nextindex05
    stz <nyan_paw03_traj_index

.nextindex05:

    inc <nyan_paw04_traj_index
    lda <nyan_paw04_traj_index
    cmp #NYAN_PAW04_TRAJ_LENGTH
    bne .endindexes
    stz <nyan_paw04_traj_index

.endindexes:

    incw <frame_counter

    cmpw #3600, <frame_counter
    lblo .wait

    lda <R14
    cmp #4
    lbne .nopal
    stz <R14

; fade sound
    
    lda <sound_level
    beq .nosoundfade
    sec
    sbc #$11
    sta <sound_level
    sta $801
    clc

.nosoundfade:
    
; fade bg palette
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

    stz <R0
    stz <R0 + 1
    jsr loadpalette

; fade rainbow palette
    lda LOW_BYTE #palette + 16
    sta <R0
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #palette + 16
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

; fade ? palette
    lda LOW_BYTE #palette + 32
    sta <R0
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #palette + 32
    sta <R0 + 1
    sta HIGH_BYTE <data_ptr

    lda LOW_BYTE #blackpalette
    sta <R1
    lda HIGH_BYTE #blackpalette
    sta <R1 + 1

    jsr fadepalette

    lda #17
    sta <R0
    jsr loadpalette

; fade ? palette
    lda LOW_BYTE #palette + 48
    sta <R0
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #palette + 48
    sta <R0 + 1
    sta HIGH_BYTE <data_ptr

    lda LOW_BYTE #blackpalette
    sta <R1
    lda HIGH_BYTE #blackpalette
    sta <R1 + 1

    jsr fadepalette

    lda #18
    sta <R0
    jsr loadpalette

; fade ? palette
    lda LOW_BYTE #palette + 64
    sta <R0
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #palette + 64
    sta <R0 + 1
    sta HIGH_BYTE <data_ptr

    lda LOW_BYTE #blackpalette
    sta <R1
    lda HIGH_BYTE #blackpalette
    sta <R1 + 1

    jsr fadepalette

    lda #19
    sta <R0
    jsr loadpalette

; fade rainbow palette
    lda LOW_BYTE #palette + 80
    sta <R0
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #palette + 80
    sta <R0 + 1
    sta HIGH_BYTE <data_ptr

    lda LOW_BYTE #blackpalette
    sta <R1
    lda HIGH_BYTE #blackpalette
    sta <R1 + 1

    jsr fadepalette

    lda #20
    sta <R0
    jsr loadpalette


.nopal:
    inc <R14

    cmpw #3650, <frame_counter
    lblo .wait


    jsr wait_vsync
    jsr clearsatb
    jsr clearsatb2
    jsr copysatb
    jsr copysatb2

    rts

