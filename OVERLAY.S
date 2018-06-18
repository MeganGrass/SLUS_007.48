

;; OVERLAY
.erroronwarning on
.psx

.include ".\\r3000a\\Executable.map"
.include ".\\r3000a\\DualShock.map"
.include ".\\r3000a\\Miscellaneous\\FileTable.s"

.open "BIO1.BIN",0x801BFA18
.include ".\\r3000a\\Bio1\\AreaJump.s"		;; Area Jump
.close
.open "BIO2P.BIN",0x801BFA18
.include ".\\r3000a\\Bio2P\\AreaJump.s"		;; Area Jump
.close
.open "BIO2.BIN",0x801BFA18
.include ".\\r3000a\\Bio2\\AreaJump.s"		;; Area Jump
.close
.open "BIO3.BIN",0x801BFA18
.include ".\\r3000a\\Bio3\\AreaJump.s"		;; Area Jump
.close
.open "BIO0.BIN",0x801BFA18
.include ".\\r3000a\\Bio0\\AreaJump.s"		;; Area Jump
.close
.open "BOOT.BIN",0x80190000
.include ".\\r3000a\\Boot\\Main.s"			;; Boot Game (Custom)
.close
.open "DEBUG.BIN",0x801BFA18
.include ".\\r3000a\\Debug\\Debug.s"		;; Debug Utilities
.close
.open "DIEDEMO.BIN",0x80190000
.include ".\\r3000a\\Bio2\\DieDemo\\Main.s"	;; Game Over
.close
.open "ENDING.BIN",0x8011A000
.include ".\\r3000a\\Bio2\\Ending\\Main.s"	;; End Scene
.close
.open "OPENING.BIN",0x801BFA18
.include ".\\r3000a\\Bio2\\Opening\\Main.s"	;; Intro Scene
.close
.open "SELECT.BIN",0x801BFA18
.include ".\\r3000a\\Bio2\\Select\\Main.s"	;; Ex Battle Character Select
.close
.open "TITLE.BIN",0x80190000
.include ".\\r3000a\\Bio2\\Title\\Main.s"	;; Boot Game (Vanilla)
.close
