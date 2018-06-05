

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		la		$s1, G_Player
		li		$v1, 3
		sw		$ra, 0x18($sp)
		lbu		$v0, 6($s0)
		lw		$a0, 0x1F0($s0)
		bne		$v0, $v1, loc_801116A0
		move	$a1, $0
		sltiu	$v0, $a0, 0x514
		beqz	$v0, loc_801116A0
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_801116A0
		nop
		lbu		$v0, 0x14D($s0)
		nop
		sltiu	$v0, 0xB
		beqz	$v0, loc_801116A0
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, Player_nFloor
		nop
		bne		$v1, $v0, loc_801116A0
		nop
		lbu		$v0, Player_Id
		nop
		xori		$v0, 0xF
		sltu	$a1, $0, $v0
loc_801116A0:
		beqz	$a1, loc_80111730
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x20
		bnez	$v0, loc_801116EC
		addiu	$a0, $s0, 0x38
		addiu	$a1, $s1, 0x38
		lh		$a2, 0x76($s0)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, 0x100
		bnez	$v0, loc_801116EC
		li		$v0, 0x301
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s1)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s1)
loc_801116EC:
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x40
		bnez	$v0, loc_80111730
		addiu	$a0, $s0, 0x38
		addiu	$a1, $s1, 0x38
		lh		$a2, 0x76($s0)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, -0x100
		bnez	$v0, loc_80111730
		li		$v0, 0x301
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s1)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s1)
loc_80111730:
		lw		$ra, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop