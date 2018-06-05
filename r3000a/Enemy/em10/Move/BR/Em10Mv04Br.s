

		addiu	$sp, -0x20
		sw		$s1, 0x14($sp)
		move	$s1, $a0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		sw		$ra, 0x1C($sp)
		sw		$s2, 0x18($sp)
		sw		$s0, 0x10($sp)
		lw		$s0, 0x1F0($s1)
		jal		Goto00_ck
		li		$a3, 0x400
		move	$a0, $s1
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x100
		la		$s2, G_Player
		sltiu	$s0, 0x514
		beqz	$s0, loc_80110008
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80110008
		nop
		lbu		$v1, 0x106($s1)
		lbu		$v0, Player_nFloor
		nop
		bne		$v1, $v0, loc_80110008
		nop
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x20
		bnez	$v0, loc_8010FFC4
		addiu	$a0, $s1, 0x38
		addiu	$a1, $s2, 0x38
		lh		$a2, 0x76($s1)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, 0x100
		bnez	$v0, loc_8010FFC4
		li		$v0, 0x101
		sw		$v0, 4($s1)
		lbu		$v0, Player_Damage_cnt
		nop
		ori		$v0, 0x80
		sb		$v0, Player_Damage_cnt
loc_8010FFC4:
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x40
		bnez	$v0, loc_80110008
		addiu	$a0, $s1, 0x38
		addiu	$a1, $s2, 0x38
		lh		$a2, 0x76($s1)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, -0x100
		bnez	$v0, loc_80110008
		li		$v0, 0x101
		sw		$v0, 4($s1)
		lbu		$v0, 0x1D3($s2)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s2)
loc_80110008:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop