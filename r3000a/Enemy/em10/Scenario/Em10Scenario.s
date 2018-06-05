

		addiu	$sp, -0x18
		sw		$ra, 0x10($sp)
		lbu		$v0, 5($a0)
		nop
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, at, $v0
		lw      $v0, 0x9F18(at)
		nop
		jalr	$v0
		nop
		lw		$ra, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop