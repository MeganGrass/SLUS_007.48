

		addiu	$sp, -0x18
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$ra, 0x14($sp)
		lbu		$v1, 6($s0)
		nop
		beqz	$v1, loc_80116DE4
		li		$v0, 1
		beq		$v1, $v0, loc_80116E00
		move	$a0, $s0
		j		loc_80116E44
		nop
loc_80116DE4:
		li		$v0, 1
		sb		$v0, 6($s0)
		lbu		$v0, 0x218($s0)
		lui		$v1, 0xF
		addu	$v0, $v1
		sw		$v0, 0x14C($s0)
		move	$a0, $s0
loc_80116E00:
		lh		$a1, 0x1C4($s0)
		lh		$a2, 0x1C6($s0)
		jal		Goto00
		li		$a3, 0x24
		move	$a0, $s0
		lw		$a1, 0x108($s0)
		lw		$a2, 0x17C($s0)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s0
		lw		$a1, 0x108($s0)
		lw		$a2, 0x17C($s0)
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s0
		jal		Add_speedXZ
		move	$a1, $0
loc_80116E44:
		lw		$ra, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop