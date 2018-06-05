

				;; Stack
				addiu   $sp, -0x50
				sw      $ra, 0x50+-0x08($sp)
				sw      $s7, 0x50+-0x0C($sp)
				sw      $s6, 0x50+-0x10($sp)
				sw      $s5, 0x50+-0x14($sp)
				sw      $s4, 0x50+-0x18($sp)
				sw      $s3, 0x50+-0x1C($sp)
				sw      $s2, 0x50+-0x20($sp)
				sw      $s1, 0x50+-0x24($sp)
				sw      $s0, 0x50+-0x28($sp)

				;; Timer
				jal		@Sleep			;; Sleep_New
				li		$a0, 0x0F		;; 1 Second
				li		$s0, 0x12C			;; 5 Seconds

@Print_Copy_Info:
				beqz    $s0, @End_Copy_Print

				;; Line #1
				li      $a0, 0x11
				li      $a1, 0x6C
				move    $a2, $0
				move    $a3, $0
				la      $v0, BOOT_CopyStr00
				jal     Print8
				sw      $v0, 0x50+-0x40($sp)

				;; Line #2
				li      $a0, 0x11
				li      $a1, 0x74
				move    $a2, $0
				move    $a3, $0
				la      $v0, BOOT_CopyStr01
				jal     Print8
				sw      $v0, 0x50+-0x40($sp)

				;; Line #3
				li      $a0, 0x11
				li      $a1, 0x7C
				move    $a2, $0
				move    $a3, $0
				la      $v0, BOOT_CopyStr02
				jal     Print8
				sw      $v0, 0x50+-0x40($sp)

				;; Loop
				jal     Task_sleep
				li      $a0, 1				;; Task 1
				j		@Print_Copy_Info
				addiu	$s0, -1				;; Timer

@End_Copy_Print:
				jal		@Sleep			;; Sleep_New
				li		$a0, 0x0F		;; 1 Second

				@Complete:
				lw      $ra, 0x50+-0x08($sp)
				lw      $s7, 0x50+-0x0C($sp)
				lw      $s6, 0x50+-0x10($sp)
				lw      $s5, 0x50+-0x14($sp)
				lw      $s4, 0x50+-0x18($sp)
				lw      $s3, 0x50+-0x1C($sp)
				lw      $s2, 0x50+-0x20($sp)
				lw      $s1, 0x50+-0x24($sp)
				lw      $s0, 0x50+-0x28($sp)
				jr      $ra
				addiu   $sp, 0x50

@Sleep:
				addiu   $sp, -0x08
				sw      $s0, 0x08+-0x08($sp)
				sw      $ra, 0x08+-0x04($sp)

				;; Parameter
				move	$s0, $a0		;; Timer
				li		$a0, 0x01		;; Task_sleep() Sleep_counter

				@SleepCounter:
				beqz    $s0, @Terminate
				nop
				jal		Task_sleep
				nop
				j		@SleepCounter
				addiu	$s0, -1			;; Timer

				@Terminate:
				lw      $ra, 0x08+-0x04($sp)
				lw      $s0, 0x08+-0x08($sp)
				jr      $ra
				addiu   $sp, 0x08
