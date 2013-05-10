DEBUG .equ 0
TILE_START .equ $1000 ; $2500 words for tiles = 592 tiles max
TRANSITION_TILE_START .equ $34e0
TILE_SIZE .equ $10
SPRITE_START .equ $3700 ; $48FF word for sprites = 291 sprites max
SPRITE_SIZE .equ $40 ; in words
SATB_START .equ $3500
SATB_ITEM_SIZE .equ $08 ; in bytes


NYAN_BG01_LENGTH .equ 30 * TILE_SIZE
NYAN_BG02_LENGTH .equ 29 * TILE_SIZE
NYAN_BG03_LENGTH .equ 28 * TILE_SIZE
NYAN_BG04_LENGTH .equ 29 * TILE_SIZE
NYAN_BG05_LENGTH .equ 26 * TILE_SIZE
NYAN_BG06_LENGTH .equ 36 * TILE_SIZE
NYAN_BG07_LENGTH .equ 38 * TILE_SIZE

RAINBOW01_OFFSET .equ 0
RAINBOW01_LENGTH .equ 26 * SPRITE_SIZE
RAINBOW02_LENGTH .equ SPRITE_SIZE * 26
RAINBOW02_OFFSET .equ RAINBOW01_OFFSET + RAINBOW01_LENGTH

BODY_OFFSET .equ RAINBOW02_OFFSET + RAINBOW02_LENGTH
BODY_LENGTH .equ 20 * SPRITE_SIZE
FACE_LENGTH .equ 18 * SPRITE_SIZE
FACE_OFFSET .equ BODY_OFFSET + BODY_LENGTH
PAW_LENGTH .equ 4 * SPRITE_SIZE
PAW_OFFSET .equ FACE_OFFSET + FACE_LENGTH
TAIL01_LENGTH .equ 5 * SPRITE_SIZE
TAIL01_OFFSET .equ PAW_OFFSET + PAW_LENGTH
TAIL02_LENGTH .equ 5 * SPRITE_SIZE
TAIL02_OFFSET .equ TAIL01_OFFSET + TAIL01_LENGTH
TAIL03_LENGTH .equ 5 * SPRITE_SIZE
TAIL03_OFFSET .equ TAIL02_OFFSET + TAIL02_LENGTH
TAIL04_LENGTH .equ 5 * SPRITE_SIZE
TAIL04_OFFSET .equ TAIL03_OFFSET + TAIL03_LENGTH
TAIL05_LENGTH .equ 5 * SPRITE_SIZE
TAIL05_OFFSET .equ TAIL04_OFFSET + TAIL04_LENGTH
PAW01_LENGTH .equ SPRITE_SIZE
PAW01_OFFSET .equ TAIL05_OFFSET + TAIL05_LENGTH
PAW02_LENGTH .equ SPRITE_SIZE
PAW02_OFFSET .equ PAW01_OFFSET + PAW01_LENGTH
PAW03_LENGTH .equ SPRITE_SIZE
PAW03_OFFSET .equ PAW02_OFFSET + PAW02_LENGTH
PAWB_LENGTH .equ 4 * SPRITE_SIZE
PAWB_OFFSET .equ PAW03_OFFSET + PAW03_LENGTH



    .zp
vdc_status_register: .ds 1
vdc2_status_register: .ds 1
vdc_current_scanline:.ds 2
frame_counter:.ds 2
frame_skip_counter:.ds 1
in_timer_int:   .ds 1
timer_counter:  .ds 2
MR0: .ds 2 ; comme R0, mais réservé à l'usage des macros
MR1: .ds 2 ; comme R1, mais réservé à l'usage des macros
MR2: .ds 2 ; comme R2, mais réservé à l'usage des macros
MR3: .ds 2 ; comme R3, mais réservé à l'usage des macros
r: .ds 1
g: .ds 1
b: .ds 1
R0: .ds 2
R1: .ds 2
R2: .ds 2
R3: .ds 2
R4: .ds 2

R10: .ds 2
R11: .ds 2
R12: .ds 2
R13: .ds 2
R14: .ds 2

data_ptr:   .ds 2
vram_ptr:   .ds 2
satb_ptr:   .ds 2
music_play: .ds 1
music_ptr:  .ds 2
music_counter:  .ds 2
music_bank: .ds 1
music_start_bank: .ds 1
music_loop: .ds 1

sound_level:.ds 1

scanline_handler:   .ds 2

nyan_body_traj_index: .ds 1
nyan_face_traj_index: .ds 1
nyan_paw01_traj_index: .ds 1
nyan_paw02_traj_index: .ds 1
nyan_paw03_traj_index: .ds 1
nyan_paw04_traj_index: .ds 1
nyan_rainbow01_traj_index: .ds 1
nyan_rainbow02_traj_index: .ds 1
nyan_tail_traj_index: .ds 1

sine_counter: .ds 1

        .bss
satb:          .ds 512
satb2:          .ds 512
palette:       .ds 16 * 6

    .code
    .bank $00
    .org $e000
    .include "_funcs.asm"
    .include "_macrosbase.asm"
    .include "_macros.asm"
    .include "_font.asm"
    .include "_sound.asm"
;    .include "azasel.asm"

    .include "hello.asm"
    .include "title.asm"
    .include "nyan.asm"
    .include "goodbye.asm"
   
startup:
    sei             ; disable interrupts
    csh             ; set cpu to 7.16Mhz ultra turbo mode :)
	cld 			; clear the decimal flag 
    ldx #$ff
    txs             ; initialise the stack
    lda #$ff
    tam #$00        ; map hardware bank ($ff) to MPR0
    lda #$f8
    tam #$01        ; map ram bank ($f8) to MPR1

    stz $2000       ; set first byte of ram to 0
    tii $2000, $2001, $1fff ; copy this byte in the whole ram (i.e zero out the ram)

    st0 #$05        ; activate bg and sprite planes, and vertical and horizontal blanking
    lda #%11001100
    sta $0002
    st2 #$00

    st0 #$09        ; set the BAT size to 32x32 (tiles, not pixels :) )
    st1 #$00
    st2 #$00

    ; setup 256x242 display mode (values are shamelessly ripped from Bonk's Revenge)
    st0 #$0A
    st1 #$02
    st2 #$02

    st0 #$0B
    .if (DEBUG)
    st1 #$1e ; 1f
    st2 #$01 ; 04
    .else
    st1 #$1f
    st2 #$04
    .endif

    st0 #$0C
    st1 #$02
    st2 #$0F

    st0 #$0D
    st1 #$ef
    st2 #$00

    st0 #$0E
    st1 #$04
    st2 #$00

    st0 #$0f
    st1 #$00
    st2 #$00


    ; --same shit but for vdc #2
    lda #$01
    sta $000E

    st0 #$05        ; activate bg and sprite planes, and vertical and horizontal blanking
    lda #%11001100
    sta $0012
    st2 #$00

    st0 #$09        ; set the BAT size to 32x32 (tiles, not pixels :) )
    st1 #$00
    st2 #$00

    ; setup 256x242 display mode (values are shamelessly ripped from Bonk's Revenge)
    st0 #$0A
    st1 #$02
    st2 #$02

    st0 #$0B
    .if (DEBUG)
    st1 #$1e ; 1f
    st2 #$01 ; 04
    .else
    st1 #$1f
    st2 #$04
    .endif

    st0 #$0C
    st1 #$02
    st2 #$0F

    st0 #$0D
    st1 #$ef
    st2 #$00

    st0 #$0E
    st1 #$04
    st2 #$00

    st0 #$0f
    st1 #$00
    st2 #$00

    stz $000E


    lda #$04
    sta $400

    lda #%01110111
    sta $0008
    sta $0009

    stz $000A
    stz $000B
    stz $000C
    stz $000D

;    cly
;    lda #bank(song_1)
;    sta song_bank,y
;    lda #low(song_1)
;    sta song_ptr.l,y
;    lda #high(song_1)
;    sta song_ptr.h,y
;
;    stz current_song
;    jsr load_song
;
;
;     timer setup (uncomment for sound)
    lda #$00  ;bonk puts d0 oO
    sta $c00
    lda #$01  ;bonk puts 03 oO
    sta $c01

    ; prepare sound channel #1
    jsr init_channels

    ; prepare music pointer
    stz <music_ptr                                      ; 5
    lda #$40                                            ; 2
    sta <music_ptr + 1                                  ; 4

    lda #$ff
    sta <sound_level

    lda #$30
    sta <music_start_bank

    lda #1
    sta <music_loop

    ; map the memory location of our data
    lda #bank(commondata)
    tam #page(commondata)

    stz <R0
    stz <R0 + 1
    lda LOW_BYTE #blackpalette
    sta LOW_BYTE <data_ptr
    lda HIGH_BYTE #blackpalette
    sta HIGH_BYTE <data_ptr
    jsr loadpalette

    ; we don't use irq2 int so we mask it
    lda #$00000001
    sta $1402

    cli
main:

;    ldx #120
;.wait01:
;    jsr wait_vsync
;    dex
;    bne .wait01

    jsr clearsatb
    jsr copysatb
    jsr clearsatb2
    jsr copysatb2

    jsr hello
    jsr title
    jsr nyan
    jsr goodbye



    ;jmp startup


_timer:
    pha
    phx
    phy
    stz $1403 ; during a timer interrupt, we HAVE to write to this register to acknowledge the interrupt

    lda <music_play
    beq ._endtimer

; play that funky music, white boy
    stz $800                                            ; 5
    lda <music_start_bank                               ; 2
    clc                                                 ; 2
    adc <music_bank                                     ; 4
    tax

    tma #page(nyanyanya)                          ; 4
    pha                                                 ; 3
    txa
    tam #page(nyanyanya)                          ; 5
      
    lda [music_ptr]                                     ; 7
    tax

    pla                                                 ; 4
    tam #page(nyanyanya)                          ; 5

    cmpw #1170, <music_counter
    beq .bluh
    bra .bleah

.bluh:
    nop

.bleah:
    cpx #$0d ; end of sample, rewind
    beq .loopsample
    cpx #$ff ; end of sample, rewind
    bne .outputsound
.loopsample:
    lda <music_loop
    beq ._stop_music_play
    stz <music_ptr                                      ; 5
    lda #$40                                            ; 2
    sta <music_ptr + 1                                  ; 4
    stz <music_counter                                  ; 5
    stz <music_counter + 1                              ; 5
    stz <music_bank                                     


.outputsound:
    txa
    lsr a
    lsr a
    lsr a
    ldy #$01
    sty $800
    sta $806                                            ; 5

    txa
    asl a
    asl a
    stz $800
    sta $806



    incw <music_ptr                                     ; 10-14
    incw <music_counter                                 ; 10-14
    cmpw <music_counter, #$2000                         ; 12-18
    bne ._endtimer                                      ; 2-4

    stz <music_ptr                                      ; 5
    lda #$40                                            ; 2
    sta <music_ptr + 1                                  ; 4
    stz <music_counter                                  ; 5
    stz <music_counter + 1                              ; 5
    inc <music_bank                                     ; 6


._endtimer:
    ply
    plx
    pla
    rti

._stop_music_play:
    stz <music_play
    bra ._endtimer

_irq2:
    rti

_vdc:
    pha
    lda $0010
    ;sta <vdc2_status_register

    lda $0000 ; during a VDC interrupt, we HAVE to read this register (the VDC status register) to acknowledge the interrupt, else we'll be stuck here forever
    sta <vdc_status_register
;    bbr5 <vdc_status_register, .noresetscanlinecount
    ;stz <vdc_current_scanline
.compote:
;    stz <timer_counter
;    stz <timer_counter + 1
.noresetscanlinecount:
    pla
    bbs2 <vdc_status_register, _vdc_scanline

;    bbr5 <vdc2_status_register, .noresetscanlinecount2
;    stz <vdc_current_scanline
;    stz <timer_counter
;    stz <timer_counter + 1
;.noresetscanlinecount2:
;    bbs2 <vdc2_status_register, _vdc_scanline
     rti

_vdc_scanline:
    rti

_nmi:
    rti

.data
; set interrupt handlers
    .org $fff6
    .dw _irq2
    .dw _vdc
    .dw _timer
    .dw _nmi
    .dw startup     ; RESET, which is called when the console boots, so this must map to our startup code

     .code

    .bank $10
    .org $4000
nyan_bg01:
    .include "nyan_bg01.asm"

    .bank $11
    .org $4000
nyan_bg02:
    .include "nyan_bg02.asm"

    .bank $12
    .org $4000
nyan_bg03:
    .include "nyan_bg03.asm"

    .bank $13
    .org $4000
nyan_bg04:
    .include "nyan_bg04.asm"

    .bank $14
    .org $4000
nyan_bg05:
    .include "nyan_bg05.asm"

    .bank $15
    .org $4000
nyan_bg06:
    .include "nyan_bg06.asm"

    .bank $16
    .org $4000
nyan_bg07:
    .include "nyan_bg07.asm"

    .bank $17
    .org $4000
rainbow01:
    .include "nyan_rainbow01.asm"

    .bank $18
    .org $4000
rainbow02:
    .include "nyan_rainbow02.asm"

    .bank $19
    .org $4000
cat_body:
    .include "nyan_cat_body.asm"

    .bank $1a
    .org $4000
cat_face:
    .include "nyan_cat_face.asm"

    .bank $1b
    .org $4000
cat_paw:
    .include "nyan_cat_paw.asm"

    .bank $1c
    .org $4000
cat_tail:
    .include "nyan_cat_tail.asm"

    .bank $1d
    .org $4000
goodbye_data:
    .include "goodbye_data.asm"

    .bank $1e
    .org $4000
typewriter_key:
    .incbin "music/typewriter.key.raw"

    .bank $1f
    .org $4000
typewriter_return:
    .incbin "music/typewriter.return.raw"

    .bank $20
    .org $4000
title01:
    .include "title_data01.asm"

    .bank $21
    .org $4000
title02:
    .include "title_data02.asm"

    .bank $22
    .org $4000
title03:
    .include "title_data03.asm"

    .bank $23
    .org $4000
typewriter:
    .include "font_typewriter.asm"


    .bank $30
    .org $4000
nyanyanya:
    .incbin "music/music.raw"


   .bank $09
    .org $c000
commondata:
    .include "common.asm"
 
 ;   .bank $02
 ;   .org $6000
 ;   .include "music\\myamyamyamyamya.azl"

 ;   .bank $06
 ;   .org $6000
 ;   .include "music\\samples_.inc"

  
