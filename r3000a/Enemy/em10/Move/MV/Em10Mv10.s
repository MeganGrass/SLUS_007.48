

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$ra, 0x1C($sp)
		sw		$s2, 0x18($sp)
		lbu		$v1, 6($s0)
		nop
		beqz	$v1, loc_80111DB4
		move	$s2, $a2
		li		$v0, 1
		beq		$v1, $v0, loc_80111DD0
		nop
		j		loc_80111E30
		nop
loc_80111DB4:
		li		$v0, 0xF0011
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		sb		$v0, 6($s0)
		li		$v0, 0xB
		sh		$v0, 0x144($s0)
loc_80111DD0:
		lbu		$v1, 0x14D($s0)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80111E0C
		move	$a0, $s0
		li		$a0, 0xA001000
		move	$a3, $0
		lw		$a2, 0x198($s0)
		lh		$a1, 0x76($s0)
		jal		Esp_call
		addiu	$a2, 0x5A8
		li		$a0, 5
		jal		Snd_se_enem
		move	$a1, $s0
		move	$a0, $s0
loc_80111E0C:
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		beqz	$v0, loc_80111E30
		li		$v0, 1
		sw		$v0, 4($s0)
		li		$v0, 0x3C
		sb		$v0, 0x23E($s0)
loc_80111E30:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop