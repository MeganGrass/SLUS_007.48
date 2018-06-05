

		addiu	$sp, -0x18
		sw		$ra, 0x10($sp)
		lhu		$v0, 0x10E($a0)
		nop
		andi	$v0, 0x3F
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, at, $v0
		lw      $v0, -0x67AC(at)
		nop
		jalr	$v0
		nop
		lw		$ra, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop