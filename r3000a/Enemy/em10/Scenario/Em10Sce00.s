

		addiu	$sp, -0x18
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$ra, 0x14($sp)
		lbu		$v1, 6($s0)
		nop
		beqz	$v1, loc_80116D68
		li		$v0, 1
		beq		$v1, $v0, loc_80116D7C
		move	$a0, $s0
		j		loc_80116DA0
		nop
loc_80116D68:
		lui		$v0, 0xF
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		sb		$v0, 6($s0)
		move	$a0, $s0
loc_80116D7C:
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v0, 0x14E($s0)
		nop
		bnez	$v0, loc_80116DA0
		move	$a0, $s0
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
loc_80116DA0:
		lw		$ra, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop