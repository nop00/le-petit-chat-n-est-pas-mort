whitepalette: .defpal $777,$777,$777,$777,$777,$777,$777,$777,$777,$777,$777,$777,$777,$777,$777,$777
blackpalette: .defpal $000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000
transparentpalette: .defpal $707,$707,$707,$707,$707,$707,$707,$707,$707,$707,$707,$707,$707,$707,$707,$707
transitiontileblack:	.defpal $707,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000
transitiontilegreen:	.defpal $707,$021,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000

transitiontilebat: .dw BATVAL(1, TRANSITION_TILE_START)


transitiontile:	.defchr $4000, $0,\
$11111111,\
$11111111,\
$11111111,\
$11111111,\
$11111111,\
$11111111,\
$11111111,\
$11111111

; empty scanline interrupt handler, it just schedules itself
; for next scanline and goes away
dummy_scanline:
    pha
    phx

    lda #$04    ; mask timer interrupt so we
    sta $1402   ; can work without being... INTerrupted :]
    cli
 
    ; set next scanline interrupt
    inc <vdc_current_scanline

    ; we reset the scanline counter if it's == $f2
    lda <vdc_current_scanline
    cmp #$f2
    bne .set_scanline_int

    stz <vdc_current_scanline

.set_scanline_int:
    clc
    lda <vdc_current_scanline
    adc #$40
    st0 #$06
    sta $0002
    cla
    adc #$00
    sta $0003

.end:
    plx
    pla

    stz $1402   ; allow timer interrupt

    rti


; (x, y), (x,y), etc
nyan_body_traj: .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 128
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132
                .db 120, 132

NYAN_BODY_TRAJ_LENGTH .equ 48


; (x, y), (x,y), etc
nyan_face_traj: .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 162, 148
                .db 162, 148
                .db 162, 148
                .db 162, 148
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 158, 152
                .db 158, 152
                .db 158, 152
                .db 158, 152
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 162, 148
                .db 162, 148
                .db 162, 148
                .db 162, 148
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 162, 152
                .db 158, 152
                .db 158, 152
                .db 158, 152
                .db 158, 152
                .db 158, 148
                .db 158, 148
                .db 158, 148
                .db 158, 148

NYAN_FACE_TRAJ_LENGTH .equ 48


; (x, y), (x,y), etc
nyan_paw01_traj: .db 112, 188
                 .db 112, 188
                 .db 112, 188
                 .db 112, 188
                 .db 116, 188
                 .db 116, 188
                 .db 116, 188
                 .db 116, 188
                 .db 120, 192
                 .db 120, 192
                 .db 120, 192
                 .db 120, 192
                 .db 116, 192
                 .db 116, 192
                 .db 116, 192
                 .db 116, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 112, 188
                 .db 112, 188
                 .db 112, 188
                 .db 112, 188
                 .db 116, 188
                 .db 116, 188
                 .db 116, 188
                 .db 116, 188
                 .db 120, 192
                 .db 120, 192
                 .db 120, 192
                 .db 120, 192
                 .db 116, 192
                 .db 116, 192
                 .db 116, 192
                 .db 116, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192
                 .db 108, 192

NYAN_PAW01_TRAJ_LENGTH .equ 48

; (x, y), (x,y), etc
nyan_paw02_traj: .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 140, 196
                 .db 140, 196
                 .db 140, 196
                 .db 140, 196
                 .db 136, 196
                 .db 136, 196
                 .db 136, 196
                 .db 136, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 136, 192
                 .db 140, 196
                 .db 140, 196
                 .db 140, 196
                 .db 140, 196
                 .db 136, 196
                 .db 136, 196
                 .db 136, 196
                 .db 136, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196
                 .db 128, 196

NYAN_PAW02_TRAJ_LENGTH .equ 48


; (x, y), (x,y), etc
nyan_paw03_traj: .db 164, 192
                 .db 164, 192
                 .db 164, 192
                 .db 164, 192
                 .db 168, 192
                 .db 168, 192
                 .db 168, 192
                 .db 168, 192
                 .db 172, 196
                 .db 172, 196
                 .db 172, 196
                 .db 172, 196
                 .db 168, 196
                 .db 168, 196
                 .db 168, 196
                 .db 168, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 168, 192
                 .db 168, 192
                 .db 168, 192
                 .db 168, 192
                 .db 172, 192
                 .db 172, 192
                 .db 172, 192
                 .db 172, 192
                 .db 176, 196
                 .db 176, 196
                 .db 176, 196
                 .db 176, 196
                 .db 172, 196
                 .db 172, 196
                 .db 172, 196
                 .db 172, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196
                 .db 164, 196

NYAN_PAW03_TRAJ_LENGTH .equ 48


; (x, y), (x,y), etc
nyan_paw04_traj: .db 184, 192
                 .db 184, 192
                 .db 184, 192
                 .db 184, 192
                 .db 188, 192
                 .db 188, 192
                 .db 188, 192
                 .db 188, 192
                 .db 192, 196
                 .db 192, 196
                 .db 192, 196
                 .db 192, 196
                 .db 188, 196
                 .db 188, 196
                 .db 188, 196
                 .db 188, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 188, 192
                 .db 188, 192
                 .db 188, 192
                 .db 188, 192
                 .db 192, 192
                 .db 192, 192
                 .db 192, 192
                 .db 192, 192
                 .db 196, 196
                 .db 196, 196
                 .db 196, 196
                 .db 196, 196
                 .db 192, 196
                 .db 192, 196
                 .db 192, 196
                 .db 192, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196
                 .db 184, 196

NYAN_PAW04_TRAJ_LENGTH .equ 48


nyan_rainbow01_traj: .db 132

NYAN_RAINBOW01_TRAJ_LENGTH .equ 1


nyan_rainbow02_traj: .db 132

NYAN_RAINBOW02_TRAJ_LENGTH .equ 1

; first paw starting from the left
paw01_index: .db 2, 2, 2, 2
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 2, 2, 2, 2
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1

; second paw starting from the left
paw02_index: .db 1, 1, 1, 1
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 1, 1, 1, 1
             .db 1, 1, 1, 1
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 1, 1, 1, 1

PAW02_INDEX .equ 48


; third paw starting from the left
paw03_index: .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 1, 1, 1, 1
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 1, 1, 1, 1

PAW03_INDEX .equ 48


; fourth paw starting from the left
paw04_index: .db 3, 3, 3, 3
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 3, 3, 3, 3
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2
             .db 2, 2, 2, 2

PAW04_INDEX .equ 48


nyan_tail_traj: .db 156
                .db 156
                .db 164
                .db 160
                .db 156
                .db 156
                .db 156
                .db 156
                .db 164
                .db 160
                .db 156
                .db 156

NYAN_TAIL_TRAJ_LENGTH .equ 12

sine: .db $0f, $12, $15, $17, $19, $1b, $1d, $1e
      .db $1e, $1e, $1d, $1b, $19, $17, $15, $12
      .db $0f, $0c, $09, $07, $05, $03, $01, $00
      .db $00, $00, $01, $03, $05, $07, $09, $0c


