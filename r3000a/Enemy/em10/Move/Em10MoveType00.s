

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$ra, 0x1C($sp)
		sw		$s2, 0x18($sp)
		lbu		$v0, 5($s0)
		nop
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, at, $v0
		lw      $v0, -0x6774(at)
		nop
		jalr	$v0
		move	$s2, $a2
		move	$a0, $s0
		lbu		$v0, 5($s0)
		move	$a1, $s1
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, at, $v0
		lw      $v0, -0x6734(at)
		nop
		jalr	$v0
		move	$a2, $s2
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop