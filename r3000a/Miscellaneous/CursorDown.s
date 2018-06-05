

;; $a0		Pointer to Cursor Buffer
;; $a1		Min Source
;; $a2		Max Source

				;; Work
				lbu		$v0, 0x00($a0)
				nop
				beq		$v0, $a2, @CursorToTop
				addiu	$v0, 1
				sb		$v0, 0x00($a0)
				j		@Terminate
				nop
				@CursorToTop:
				sb		$a1, 0x00($a0)

				@Terminate:
				jr      $ra
				nop
