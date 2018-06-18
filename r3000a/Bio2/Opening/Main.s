
;; OPENING.BIN


;; Patch Game_loop()
;; for BOOT.BIN
.org 0x801BFB00
		jal		0x80032180
		nop

;; Xa_play
.org 0x801C070C
		nop
.org 0x801C07C8
		nop
.org 0x801C08F0
		nop
.org 0x801C09FC
		nop
.org 0x801C0AD0
		nop
.org 0x801C0DF8
		nop
.org 0x801C0E70
		nop
.org 0x801C0EB8
		nop
.org 0x801C0F2C
		nop
.org 0x801C0FD0
		nop
.org 0x801C1048
		nop
.org 0x801C10F8
		nop
.org 0x801C13A4
		nop
.org 0x801C141C
		nop
.org 0x801C1494
		nop
.org 0x801C150C
		nop
.org 0x801C15A8
		nop
.org 0x801C15F8
		nop
.org 0x801C1670
		nop
.org 0x801C16E8
		nop
.org 0x801C1800
		nop
.org 0x801C0C84
		nop
.org 0x801C0CC8
		nop
.org 0x801C1230
		nop
.org 0x801C1274
		nop
.org 0x801C1938		;; Init_movie_work
		nop
.org 0x801C197C		;; Init_movie_work
		nop