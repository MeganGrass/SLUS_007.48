

				;; Stack
				addiu   $sp, -0x18
				sw      $s0, 0x10($sp)
				sw      $ra, 0x14($sp)
				
				;; Screen Fade
				li      $a0, 0x200
				li      $a1, 0xFFFFFC00
				li      $a2, 7
				jal     Fade_set
				move    $a3, $0
				jal     Swap_Cbuff
				nop

				;; Terminate
				lw      $ra, 0x14($sp)
				lw      $s0, 0x10($sp)
				jr      $ra
				addiu   $sp, 0x18