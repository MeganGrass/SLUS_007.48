

.org LoadPlwTable

		;; Stack
		addiu   $sp, -0x38
		sw      $s7, 0x38+-0x0C($sp)
		sw      $s6, 0x38+-0x10($sp)
		sw      $s5, 0x38+-0x14($sp)
		sw      $s4, 0x38+-0x18($sp)
		sw      $s3, 0x38+-0x1C($sp)
		sw      $s2, 0x38+-0x20($sp)
		sw      $s1, 0x38+-0x24($sp)
		sw      $s0, 0x38+-0x28($sp)
		sw      $ra, 0x38+-0x08($sp)

		;; File Sector
		lw		$v0, GAME_PLW_LBA
		lbu		$a3, Player_Id
		li		$v1, 8
		multu	$v1, $a3
		mflo	$v1
		addu	$s3, $v0, $v1
		lw		$a0, 0x04($s3)			;; Disc.fpos.sector
		li		$a1, 0xA4				;; Size
		li		$a2, PlwArchiveTbl		;; Address
		jal		CdReadEx
		li		$a3, 20					;; Auto-Parse Index

		;; Terminate
		lw      $ra, 0x38+-0x08($sp)
		lw      $s7, 0x38+-0x0C($sp)
		lw      $s6, 0x38+-0x10($sp)
		lw      $s5, 0x38+-0x14($sp)
		lw      $s4, 0x38+-0x18($sp)
		lw      $s3, 0x38+-0x1C($sp)
		lw      $s2, 0x38+-0x20($sp)
		lw      $s1, 0x38+-0x24($sp)
		lw      $s0, 0x38+-0x28($sp)
		jr      $ra
		addiu   $sp, 0x38
