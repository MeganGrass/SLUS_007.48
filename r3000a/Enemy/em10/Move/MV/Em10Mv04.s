

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$ra, 0x1C($sp)
		sw		$s2, 0x18($sp)
		lbu		$v1, 6($s0)
		nop
		beqz	$v1, loc_80110064
		move	$s2, $a2
		li		$v0, 1
		beq		$v1, $v0, loc_801100C0
		nop
		j		loc_80110154
		nop
loc_80110064:
		li		$v0, 0xF0005
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		jal		Rnd
		sb		$v0, 6($s0)
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		move	$a3, $0
		andi	$v0, 7
		addiu	$v0, 7
		jal		Spd_get
		sh		$v0, 0x158($s0)
		jal		Rnd
		nop
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		move	$a3, $0
		andi	$v0, 0xF
		jal		Spd_get
		sb		$v0, 0x14D($s0)
loc_801100C0:
		lh		$v0, 0x144($s0)
		nop
		slti	$v0, 0x15
		bnez	$v0, loc_80110124
		move	$a0, $s0
		lh		$a1, 0x1C4($s0)
		lh		$a2, 0x1C6($s0)
		jal		Goto00
		li		$a3, 0x18
		lhu		$v1, 0x158($s0)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80110120
		sh		$v0, 0x158($s0)
		move	$a0, $s0
		lh		$a1, 0x1C4($s0)
		lh		$a2, 0x1C6($s0)
		jal		Goto00
		li		$a3, 0x18
		jal		Rnd
		nop
		andi	$v0, 7
		addiu	$v0, 7
		sh		$v0, 0x158($s0)
loc_80110120:
		move	$a0, $s0
loc_80110124:
		move	$a1, $s1
		move	$a2, $s2
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s0
		jal		Add_speedXZ
		move	$a1, $0
loc_80110154:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop