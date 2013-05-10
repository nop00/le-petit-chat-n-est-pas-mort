;//load the track pointers
load_song:
;      ldy current_song
;      lda song_bank,y
;      tam #$03
;      inc a
;      tam #$04
;      inc a
;      tam #$05
;      lda song_ptr.l,y
;      clc
;      adc #$01
;      sta <R0
;      lda song_ptr.h,y
;      adc #$00
;      sta <R0+1
;      cly
;      
;      clx
;.ll00
;      lda [R0],y
;      iny
;      sta trk_ptr.l,x
;      lda [R0],y
;      iny
;      sta trk_ptr.h,x
;      inx
;      cpx #$06
;      bcc .ll00
;      
;      lda tempo_alt
;      sta tempo
;
;      ldx #$05
;      lda #$01
;.ll01
;      stx $800
;      ldy #$ff
;      stz $805            ;**
;      stz $802
;      stz $803
;      sta chn_dly,x
;      stz env_vol,x
;      stz vbr_mode,x
;      stz vbr_delta.l,x
;      stz vbr_delta.h,x
;      stz chn_frq.l,x
;      stz chn_frq.h,x
;      lda #$55
;      sta chn_note,x
;      lda #$01
;      stz $804
;      stz chn_dda,x
;      dex
;      bpl .ll01
;      
;      lda #$ff  ;**
;      sta $801
;      sta tempo_cntr
;      
;      ldx #$20
;      lda #$05
;      sta $800
;      stz $804
;.ll02
;      stz $806
;      dex
;      bne .ll02
;
;      ldx #$05       
;.ll03            
;      lda #$0f
;      sta chn_left,x
;      sta chn_right,x
;      lda #$03
;      sta trml_sub,x
;      stx $800
;      stz $804
;      stz $807
;      lda #$06
;      sta env_phase,x
;      stz env_vol,x
;      stz detune.l,x
;      stz detune.h,x
;      stz chn_mode,x
;      dex
;      bpl .ll03     
;
;      lda current_song
;      inc a
;      tay
;      lda #$8f
;      ldx #$03
;      clc
;      
    rts

; init channel #1 and #2 for 10bit DDA
init_channels:
      lda #$ff  ; global balance set equally for left and right
      sta $801

      cla
      sta $800  ; init channel #1

      stz $802
      stz $803

      lda #%11001011 ; channel on, dda on, chan volume to $0B (we'll play the lower half here)
      sta $804

      lda #$ff  ; channel balance set equally for left and right
      sta $805


      lda #$01
      sta $800  ; init channel #2

      stz $802
      stz $803

      lda #%11011111 ; channel on, dda on, chan volume to $1F (we'll play the upper half here)
      sta $804

      lda #$ff  ; channel balance set equally for left and right
      sta $805


      lda #$02  ; mute channels #3 to #6
      sta $800
      stz $804

      inc a
      sta $800
      stz $804

      inc a
      sta $800
      stz $804

      inc a
      sta $800
      stz $804

    rts

; sample call
; lda #bank(typewriter)
; sta <music_bank_start
; stz <music_loop
; jsr play_sample
play_sample:    ; sample bank in <music_start_bank
                ; <music_loop can be set to 1 or 0
    stz <music_ptr                                      ; 5
    lda #$40                                            ; 2
    sta <music_ptr + 1                                  ; 4
    stz <music_counter                                  ; 5
    stz <music_counter + 1                              ; 5
    stz <music_bank                                     

    lda #1
    sta <music_play

    rts


