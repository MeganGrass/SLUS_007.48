

.org 0x800408C8

		;; Stack
		addiu   $sp, -0x58
		sw      $s4, 0x58+-0x18($sp)
		move    $s4, $a0				;; PLAYER_WORK
		sw      $s3, 0x58+-0x1C($sp)
		lw      $s3, G_pPl_emd_top
		sw      $ra, 0x58+-0x04($sp)
		sw      $fp, 0x58+-0x08($sp)
		sw      $s7, 0x58+-0x0C($sp)
		sw      $s6, 0x58+-0x10($sp)
		sw      $s5, 0x58+-0x14($sp)
		sw      $s2, 0x58+-0x20($sp)
		sw      $s1, 0x58+-0x24($sp)
		sw      $s0, 0x58+-0x28($sp)
		addiu   $s5, $s3, 0xD70			;; Address
		sw      $s3, 0x58+-0x30($sp)
		move    $s0, $s5				;; Address
		
		;; TEST
		li		$v0, PlwArchiveTbl+0xA0
		lw		$a0, 0($v0)
		lbu		$v1, Player_Id
		nop
		beq		$a0, $v1, @ReadIndex
		nop
		jal		LoadPlwTable
		nop

		@ReadIndex:
		la		$a0, PlwArchiveTbl
		lh		$v0, Player_Type
		li		$v1, 8
		multu	$v1, $v0
		mflo	$v1
		addu	$v0, $v1, $a0			;; LBA Index

		;; Load PLW
		lw		$a0, 0x04($v0)			;; Sector
		lw		$a1, 0x00($v0)			;; Size
		move	$a2, $s5				;; Address
		jal		CdReadEx
		li		$a3, 0					;; Auto-Parse Index

		;; Complete
		j		0x800409B4
		nop
