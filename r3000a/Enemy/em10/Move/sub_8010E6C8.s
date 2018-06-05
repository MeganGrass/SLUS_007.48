

		addiu	$sp, -0x18
		move	$a1, $a0
		sw		$ra, 0x10($sp)
		lw		$v0, 0x178($a1)
		nop
		lw		$a0, 0($v0)
		lui		$v0, 0x800
		and		$v0, $a0, $v0
		beqz	$v0, loc_8010E704
		srl		$a0, 28
		sltiu	$v0, $a0, 2
		beqz	$v0, loc_8010E704
		nop
		jal		Snd_se_enem
		nop
loc_8010E704:
		lw		$ra, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop