

		lbu		$v0, 6($a0)
		nop
		bnez	$v0, locret_80110B64
		li		$v0, 1
		sb		$v0, 6($a0)
		li		$v0, 0x17
		sw		$v0, 0x14C($a0)
locret_80110B64:
		jr		$ra
		nop