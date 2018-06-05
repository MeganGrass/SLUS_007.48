

		addiu	$sp, -0x18
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$ra, 0x14($sp)
		lbu		$v0, 5($s0)
		nop
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, $v0
		lw      $v0, -0x60D4(at)		;; PlDamageEm10Tbl
		nop
		jalr	$v0
		nop
		lh		$v1, 0x10C($s0)
		nop
		beqz	$v1, loc_801179A4
		nop
		lw		$v0, 0x198($s0)
		nop
		lw		$v0, 0x60($v0)
		nop
		addiu	$v0, -0x1F4
		slt		$v0, $v1
		beqz	$v0, loc_801179A4
		li		$v1, 1
		lbu		$v0, 0x14D($s0)
		nop
		andi	$v0, 0xF
		bne		$v0, $v1, loc_801179A4
		nop
		jal		Em10Water
		move	$a0, $s0
loc_801179A4:
		lw		$ra, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop