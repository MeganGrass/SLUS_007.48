
;; ENDING.BIN


;; Patch Game_loop()
;; for BOOT.BIN
.org 0x8011A114
		jal		0x80032180
		nop

;; ROOM800.SND File
.org 0x8011A2B8
		li      $a0, Room800Snd

;; Init_movie_work
.org 0x8011A9A0
		nop
		nop
.org 0x8011A9C4
		nop
		nop
