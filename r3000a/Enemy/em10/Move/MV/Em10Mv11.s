

		addiu	$sp, -0x18
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$ra, 0x14($sp)
		lbu		$v1, 6($s0)
		nop
		beqz	$v1, loc_80111E84
		li		$v0, 1
		beq		$v1, $v0, loc_80111EBC
		move	$a0, $s0
		j		loc_80111F2C
		nop
loc_80111E84:
		move	$a0, $s0
		lw		$a1, 0x190($s0)
		lw		$a2, 0x194($s0)
		li		$a3, 0x100
		jal		Joint_move
		sw		$0, 0x14C($s0)
		lhu		$v0, 0x1D4($s0)
		nop
		andi	$v0, 1
		beqz	$v0, loc_80111F2C
		li		$v0, 1
		sb		$v0, 6($s0)
		j		loc_80111F2C
		sw		$0, 0x14C($s0)
loc_80111EBC:
		lw		$a1, 0x190($s0)
		lw		$a2, 0x194($s0)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s0
		lw		$a1, 0x190($s0)
		lw		$a2, 0x194($s0)
		jal		Joint_move
		li		$a3, 0x100
		beqz	$v0, loc_80111F20
		lui		$v0, 6
		ori     $v0, $v0, 0x501
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s0)
		lhu		$v1, 0x10E($s0)
		sb		$0, 0x16B($s0)
		sb		$0, 0x16A($s0)
		andi	$v0, 0x7F
		sb		$v0, 0x1D3($s0)
		lw		$v0, 0($s0)
		andi	$v1, 0xBFFF
		sh		$v1, 0x10E($s0)
		li		$v1, 0xFFFFFFF7
		and		$v0, $v1
		sw		$v0, 0($s0)
loc_80111F20:
		move	$a0, $s0
		jal		Add_speedXZ
		move	$a1, $0
loc_80111F2C:
		lw		$ra, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop