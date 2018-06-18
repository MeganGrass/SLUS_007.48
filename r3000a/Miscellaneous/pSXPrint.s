

.org pSXPrint
				;; Stack
				addiu   $sp, -0x18
				sw      $ra, 0x10($sp)

				;; Work
				lw		$a3, 0x34(sp)
				nop
				addiu	$a3, -8
				jal		PatchPrintF
				li		$a2, PrintBuffer

				;; Stack
				lw      $ra, 0x10($sp)
				addiu   $sp, 0x18
				jr      $ra
				nop
