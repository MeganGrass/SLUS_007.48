

		addiu	$sp, -0x28
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		sw		$ra, 0x20($sp)
		sw		$s3, 0x1C($sp)
		sw		$s2, 0x18($sp)
		sw		$s1, 0x14($sp)
		lw		$s2, 0x1F0($s0)
		jal		Goto00_ck
		li		$a3, 0x400
		move	$a0, $s0
		li		$a3, 0x320
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		move	$s1, $v0
		move	$v1, $v0
		sltiu	$v0, $s2, 0x1388
		beqz	$v0, loc_8010E320
		move	$s3, $s1
		sll		$v0, $s1, 16
		bnez	$v0, loc_8010E324
		sltiu	$v0, $s2, 0xBB8
		lhu		$v0, 0x154($s0)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_8010E320
		li		$v0, 0x101
		sw		$v0, 4($s0)
loc_8010E320:
		sltiu	$v0, $s2, 0xBB8
loc_8010E324:
		beqz	$v0, loc_8010E37C
		sll		$v0, $v1, 16
		beqz	$v0, loc_8010E380
		sltiu	$v0, $s2, 0x7D0
		lhu		$v0, G_Room_player_flg
		nop
		andi	$v0, 0x15
		beqz	$v0, loc_8010E380
		sltiu	$v0, $s2, 0x7D0
		lhu		$v0, 0x154($s0)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_8010E380
		sltiu	$v0, $s2, 0x7D0
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_8010E380
		sltiu	$v0, $s2, 0x7D0
		li		$v0, 0xC01
		sw		$v0, 4($s0)
loc_8010E37C:
		sltiu	$v0, $s2, 0x7D0
loc_8010E380:
		beqz	$v0, loc_8010E3D4
		sll		$v0, $s3, 16
		beqz	$v0, loc_8010E3D4
		nop
		lhu		$v0, 0x154($s0)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_8010E3D4
		nop
		lhu		$v0, G_Room_player_flg
		nop
		andi	$v0, 0x17
		beqz	$v0, loc_8010E3D4
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010E3D4
		li		$v0, 0xC01
		sw		$v0, 4($s0)
loc_8010E3D4:
		lw		$ra, 0x20($sp)
		lw		$s3, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop