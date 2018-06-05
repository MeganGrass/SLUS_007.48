

;; OVERLAY
.erroronwarning on
.psx

.include ".\\r3000a\\Executable.map"			;; 
.include ".\\r3000a\\DualShock.map"				;; 
.include ".\\r3000a\\Miscellaneous\\FileTable.s"	;; DO2, CORE and ARMS file IDs (deprecated)

.open "BIO1.BIN",0x801BFA18
.include ".\\r3000a\\Bio1\\AreaJump.s"		;; Debug Room Jump
.close
.open "BIO2P.BIN",0x801BFA18
.include ".\\r3000a\\Bio2P\\AreaJump.s"		;; Debug Room Jump
.close
.open "BIO2.BIN",0x801BFA18
.include ".\\r3000a\\Bio2\\AreaJump.s"		;; Debug Room Jump
.close
.open "BIO3.BIN",0x801BFA18
.include ".\\r3000a\\Bio3\\AreaJump.s"		;; Debug Room Jump
.close
.open "AREA.BIN",0x801BFA18
.include ".\\r3000a\\Zero\\AreaJump.s"		;; Debug Room Jump
.close

.open "BOOT.BIN",0x80190000
.include ".\\r3000a\\Boot\\Main.s"				;; Boot/Reset Game
.close

.open "DEBUG.BIN",0x801BFA18
.include ".\\r3000a\\Debug\\Debug.s"			;; Debug Engine
.close

.open "DIEDEMO.BIN",0x80190000
.org 0x80190278
	nop			;; Xa_play
.close
