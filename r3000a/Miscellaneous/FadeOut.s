

				;; Stack
				addiu   $sp, -0x18
				sw      $s0, 0x10($sp)
				sw      $ra, 0x14($sp)

				;; Screen Fade
				li      $a0, 0x200
				li      $a1, 0x400
				li      $a2, 7
				jal     Fade_set
				move    $a3, $0

				@FadeStatus:
				jal     Fade_status
				move    $a0, $0
				bnez    $v0, @FadeOut
				li      $a0, 2
				jal     Task_sleep
				li      $a0, 1
				j       @FadeStatus
				nop

				@FadeOut:
				jal     Bg_set_mode
				move    $a1, $0
				li      $a0, 0x200
				move    $a1, $0
				li      $a2, 7
				jal     Fade_set
				li      $a3, 1
				move    $a0, $0
				li      $a1, 0x7FFF
				li      $a2, 0xFFFFFF
				jal     Fade_adjust
				move    $a3, $0

				;; Terminate
				lw      $ra, 0x14($sp)
				lw      $s0, 0x10($sp)
				jr      $ra
				addiu   $sp, 0x18