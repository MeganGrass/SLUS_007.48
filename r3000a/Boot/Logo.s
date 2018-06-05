

;; Bypass Logo
.org 0x8002B7E8
		j		0x8002B830
		nop

;; Game_Loop TITLE.BIN Hook
.org 0x800257B8
		jal     BOOT_Initialize		// ".\\r3000a\\Boot\\Initialize.s"
