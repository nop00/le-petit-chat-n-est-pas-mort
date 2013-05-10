tailpalette:	.defpal $707,$000,$444,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000,$000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail01_0:	.defspr $4000, $0,\
$11111111,$11111111,\
$11111111,$11111111,\
$11111111,$11111111,\
$11111111,$11111111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11111111,$22222222,\
$11111111,$22222222,\
$11111111,$22222222,\
$11111111,$22222222,\
$00001111,$11112222,\
$00001111,$11112222,\
$00001111,$11112222,\
$00001111,$11112222

; TODO: change the vram address (1st number) and palette number (2nd number)
tail01_1:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$11110000,$00000000,\
$11110000,$00000000,\
$11110000,$00000000,\
$11110000,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$22221111,$00000000,\
$22221111,$00000000,\
$22221111,$00000000,\
$22221111,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail01_2:	.defspr $4000, $0,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$00001111,\
$00000000,$00001111,\
$00000000,$00001111,\
$00000000,$00001111,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail01_3:	.defspr $4000, $0,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$00001111,$00000000,\
$00001111,$00000000,\
$00001111,$00000000,\
$00001111,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail01_4:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000


tail01_satb:	.dw $0000, $0000, ((SPRITE_START + TAIL01_OFFSET + SPRITE_SIZE * 0) >> 5), $0084
	.dw $0000, $0010, ((SPRITE_START + TAIL01_OFFSET + SPRITE_SIZE * 1) >> 5), $0084
	.dw $0010, $0000, ((SPRITE_START + TAIL01_OFFSET + SPRITE_SIZE * 2) >> 5), $0084
	.dw $0010, $0010, ((SPRITE_START + TAIL01_OFFSET + SPRITE_SIZE * 3) >> 5), $0084
	.dw $0020, $0000, ((SPRITE_START + TAIL01_OFFSET + SPRITE_SIZE * 4) >> 5), $0084
	.dw $0020, $0010, ((SPRITE_START + TAIL01_OFFSET + SPRITE_SIZE * 4) >> 5), $0084


; TODO: change the vram address (1st number) and palette number (2nd number)
tail02_0:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00001111,$11110000,\
$00001111,$11110000,\
$00001111,$11110000,\
$00001111,$11110000,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111

; TODO: change the vram address (1st number) and palette number (2nd number)
tail02_1:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail02_2:	.defspr $4000, $0,\
$00001111,$22222222,\
$00001111,$22222222,\
$00001111,$22222222,\
$00001111,$22222222,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail02_3:	.defspr $4000, $0,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail02_4:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000


tail02_satb:	.dw $0000, $0000, ((SPRITE_START + TAIL02_OFFSET + SPRITE_SIZE * 0) >> 5), $0084
	.dw $0000, $0010, ((SPRITE_START + TAIL02_OFFSET + SPRITE_SIZE * 1) >> 5), $0084
	.dw $0010, $0000, ((SPRITE_START + TAIL02_OFFSET + SPRITE_SIZE * 2) >> 5), $0084
	.dw $0010, $0010, ((SPRITE_START + TAIL02_OFFSET + SPRITE_SIZE * 3) >> 5), $0084
	.dw $0020, $0000, ((SPRITE_START + TAIL02_OFFSET + SPRITE_SIZE * 4) >> 5), $0084
	.dw $0020, $0010, ((SPRITE_START + TAIL02_OFFSET + SPRITE_SIZE * 4) >> 5), $0084


; TODO: change the vram address (1st number) and palette number (2nd number)
tail03_0:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00001111,$11111111,\
$00001111,$11111111,\
$00001111,$11111111,\
$00001111,$11111111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111

; TODO: change the vram address (1st number) and palette number (2nd number)
tail03_1:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail03_2:	.defspr $4000, $0,\
$11111111,$22222222,\
$11111111,$22222222,\
$11111111,$22222222,\
$11111111,$22222222,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail03_3:	.defspr $4000, $0,\
$22221111,$00000000,\
$22221111,$00000000,\
$22221111,$00000000,\
$22221111,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail03_4:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000


tail03_satb:	.dw $0000, $0000, ((SPRITE_START + TAIL03_OFFSET + SPRITE_SIZE * 0) >> 5), $0084
	.dw $0000, $0010, ((SPRITE_START + TAIL03_OFFSET + SPRITE_SIZE * 1) >> 5), $0084
	.dw $0010, $0000, ((SPRITE_START + TAIL03_OFFSET + SPRITE_SIZE * 2) >> 5), $0084
	.dw $0010, $0010, ((SPRITE_START + TAIL03_OFFSET + SPRITE_SIZE * 3) >> 5), $0084
	.dw $0020, $0000, ((SPRITE_START + TAIL03_OFFSET + SPRITE_SIZE * 4) >> 5), $0084
	.dw $0020, $0010, ((SPRITE_START + TAIL03_OFFSET + SPRITE_SIZE * 4) >> 5), $0084


; TODO: change the vram address (1st number) and palette number (2nd number)
tail04_0:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111

; TODO: change the vram address (1st number) and palette number (2nd number)
tail04_1:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00001111,$00000000,\
$00001111,$00000000,\
$00001111,$00000000,\
$00001111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail04_2:	.defspr $4000, $0,\
$11111111,$22222222,\
$11111111,$22222222,\
$11111111,$22222222,\
$11111111,$22222222,\
$11112222,$22222222,\
$11112222,$22222222,\
$11112222,$22222222,\
$11112222,$22222222,\
$00001111,$11111111,\
$00001111,$11111111,\
$00001111,$11111111,\
$00001111,$11111111,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail04_3:	.defspr $4000, $0,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11110000,$00000000,\
$11110000,$00000000,\
$11110000,$00000000,\
$11110000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail04_4:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000


tail04_satb:	.dw $0000, $0000, ((SPRITE_START + TAIL04_OFFSET + SPRITE_SIZE * 0) >> 5), $0084
	.dw $0000, $0010, ((SPRITE_START + TAIL04_OFFSET + SPRITE_SIZE * 1) >> 5), $0084
	.dw $0010, $0000, ((SPRITE_START + TAIL04_OFFSET + SPRITE_SIZE * 2) >> 5), $0084
	.dw $0010, $0010, ((SPRITE_START + TAIL04_OFFSET + SPRITE_SIZE * 3) >> 5), $0084
	.dw $0020, $0000, ((SPRITE_START + TAIL04_OFFSET + SPRITE_SIZE * 4) >> 5), $0084
	.dw $0020, $0010, ((SPRITE_START + TAIL04_OFFSET + SPRITE_SIZE * 4) >> 5), $0084


; TODO: change the vram address (1st number) and palette number (2nd number)
tail05_0:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail05_1:	.defspr $4000, $0,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail05_2:	.defspr $4000, $0,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00000000,$11111111,\
$00001111,$22222222,\
$00001111,$22222222,\
$00001111,$22222222,\
$00001111,$22222222,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111,\
$11112222,$22221111

; TODO: change the vram address (1st number) and palette number (2nd number)
tail05_3:	.defspr $4000, $0,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$22222222,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$11111111,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000

; TODO: change the vram address (1st number) and palette number (2nd number)
tail05_4:	.defspr $4000, $0,\
$00001111,$11110000,\
$00001111,$11110000,\
$00001111,$11110000,\
$00001111,$11110000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000,\
$00000000,$00000000


tail05_satb:	.dw $0000, $0000, ((SPRITE_START + TAIL05_OFFSET + SPRITE_SIZE * 0) >> 5), $0084
	.dw $0000, $0010, ((SPRITE_START + TAIL05_OFFSET + SPRITE_SIZE * 1) >> 5), $0084
	.dw $0010, $0000, ((SPRITE_START + TAIL05_OFFSET + SPRITE_SIZE * 2) >> 5), $0084
	.dw $0010, $0010, ((SPRITE_START + TAIL05_OFFSET + SPRITE_SIZE * 3) >> 5), $0084
	.dw $0020, $0000, ((SPRITE_START + TAIL05_OFFSET + SPRITE_SIZE * 4) >> 5), $0084
	.dw $0020, $0010, ((SPRITE_START + TAIL05_OFFSET + SPRITE_SIZE * 0) >> 5), $0084
