

;; desld
.org 0x80010000
		.fill 0x778


;; Cd_read/_s
.org 0x80012FB8
		.fill 0x75C


;; Disc File Position
.org 0x800988A4
		.fill 0x1AD8


;; XA Audio
.org 0x80012984		;; Function Hardcode
		.fill 0x634
.org 0x8009A37C		;; Xa_sector00
		.fill 0x64
.org 0x8009A418		;; xa_control_tbl
		.fill 0x10
.org 0x8002B458		;; main()
		j		0x8002AF20	;; Cd_system_control()
.org 0x800338A4		;; sub_80033674()
		nop			;; Xa_play()
.org 0x80058040		;; Xa_on() (for scripted events)
		j		0x80058068	;; lbu     $a0, 1($v0)


;; STR Video
.org 0x80032150		;; Function Hardcode
		.fill 0x1470
.org 0x800A216C		;; Movie_tbl
		.fill 0x254
.org 0x8002BA28
		nop			;; Movie()
.org 0x80058D7C
		nop			;; lbu     $a0, 1($v0)
		nop			;; Init_movie_work()
