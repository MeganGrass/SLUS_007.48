

;; Dual Shock
.org 0x8004A3C0

			;; Stack
			addiu	$sp, -0x18
			sw		$ra, 0x18+-0x08($sp)

			;; Update
			jal		LoadStage
			nop

			;; Terminate
			lw		$ra, 0x18+-0x08($sp)
			addiu	$sp, 0x18
			jr		$ra
			nop
