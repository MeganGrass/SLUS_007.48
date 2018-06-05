

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		sw		$ra, 0x18($sp)
		sw		$s1, 0x14($sp)
		lw		$s1, 0x1F0($s0)
		jal		Goto00_ck
		li		$a3, 0x400
		move	$a0, $s0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x200
		sll		$v0, 16
		bnez	$v0, loc_80110B30
		sltiu	$v0, $s1, 0x514
		beqz	$v0, loc_80110B30
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80110B30
		nop
		lhu		$v0, 0x154($s0)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_80110B30
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, Player_nFloor
		nop
		bne		$v1, $v0, loc_80110B30
		li		$v0, 0x101
		sw		$v0, 4($s0)
		lbu		$v0, Player_Damage_cnt
		nop
		ori		$v0, 0x80
		sb		$v0, Player_Damage_cnt
loc_80110B30:
		lw		$ra, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop