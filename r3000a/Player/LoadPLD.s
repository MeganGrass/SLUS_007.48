
;; XREF
.org 0x8003BAF0

		;; Stack
		addiu   $sp, -0x28
		sw      $ra, 0x28+-0x04($sp)
		sw      $s4, 0x28+-0x08($sp)
		sw      $s3, 0x28+-0x0C($sp)
		sw      $s2, 0x28+-0x10($sp)
		sw      $s1, 0x28+-0x14($sp)
		sw      $s0, 0x28+-0x18($sp)
		move    $s2, $a0				;; PLAYER_WORK
		la      $s3, 0x801BFA14			;; Address
		
		jal		LoadPldEx
		nop
		j		0x8003BB48
		nop


.org LoadPldEx

		;; Stack
		addiu   $sp, -0x18
		sw      $ra, 0x10($sp)

		;; Read Index
		la		$a0, PldArchiveTbl
		lbu		$v0, Player_Id
		li		$v1, 8
		multu	$v1, $v0
		mflo	$v1
		addu	$v0, $v1, $a0			;; LBA Index

		;; Load PLD
		lw		$a0, 0x04($v0)			;; Sector
		lw		$a1, 0x00($v0)			;; Size
		li		$a2, 0x801BFA14			;; Address
		jal		CdReadEx
		move	$a3, $0					;; Auto-Parse Index

		;; Terminate
		lw      $ra, 0x10($sp)
		addiu   $sp, 0x18
		jr      $ra
		nop
