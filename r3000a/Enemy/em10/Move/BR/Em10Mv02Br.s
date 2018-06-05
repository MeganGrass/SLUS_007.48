

		addiu	$sp, -0x28
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		sw		$ra, 0x24($sp)
		sw		$s4, 0x20($sp)
		sw		$s3, 0x1C($sp)
		sw		$s2, 0x18($sp)
		sw		$s1, 0x14($sp)
		lw		$s2, 0x1F0($s0)
		jal		Goto00_ck
		li		$a3, 0x400
		move	$a0, $s0
		li		$a3, 0x200
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		move	$s4, $v0
		move	$a0, $s0
		li		$a3, 0x514
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		move	$s3, $v0
		lbu		$v0, 0x23E($s0)
		la		$s1, G_Player
		bnez	$v0, loc_8010F098
		lui		$v0, 0xC000
		lw		$v1, 0x1F4($s0)
		nop
		and		$v0, $v1, $v0
		beqz	$v0, loc_8010F050
		lui		$v0, 0x3FFF
		ori     $v0, $v0, 0xFFFF
		and		$v0, $v1, $v0
		sltiu	$v0, 0x7D0
		beqz	$v0, loc_8010F050
		move	$a0, $s0
		lh		$a1, 0x1F8($s0)
		jal		Goto01_ck
		li		$a2, 0x100
		bnez	$v0, loc_8010F050
		li		$v0, 0xE01
		j		loc_8010F23C
		sw		$v0, 4($s0)
loc_8010F050:
		lbu		$v0, 0x23E($s0)
		nop
		bnez	$v0, loc_8010F098
		sll		$v0, $s3, 16
		bnez	$v0, loc_8010F098
		sltiu	$v0, $s2, 0x7D0
		beqz	$v0, loc_8010F098
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, 0x106($s1)
		nop
		beq		$v1, $v0, loc_8010F098
		nop
		lbu		$v0, 0x1D3($s1)
		nop
		bnez	$v0, loc_8010F098
		li		$v0, 0xE01
		sw		$v0, 4($s0)
loc_8010F098:
		lh		$v0, 0x1D4($s0)
		nop
		andi	$v0, 0xC000
		beqz	$v0, loc_8010F0C8
		sltiu	$v0, $s2, 0xBB8
		lw		$v0, 0x110($s0)
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010F0C4
		li		$v0, 0xA01
		sw		$v0, 4($s0)
loc_8010F0C4:
		sltiu	$v0, $s2, 0xBB8
loc_8010F0C8:
		beqz	$v0, loc_8010F108
		sll		$v0, $s4, 16
		beqz	$v0, loc_8010F108
		nop
		lhu		$v0, G_Room_player_flg
		nop
		andi	$v0, 0x17
		beqz	$v0, loc_8010F108
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_8010F108
		li		$v0, 0xC01
		sw		$v0, 4($s0)
loc_8010F108:
		lbu		$v1, 8($s1)
		li		$v0, 0xF
		beq		$v1, $v0, loc_8010F1D4
		sltiu	$v0, $s2, 0x4B0
		beqz	$v0, loc_8010F208
		nop
		lbu		$v0, 0x1D3($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8010F208
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, 0x106($s1)
		nop
		bne		$v1, $v0, loc_8010F208
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x20
		bnez	$v0, loc_8010F18C
		addiu	$a0, $s0, 0x38
		addiu	$a1, $s1, 0x38
		lh		$a2, 0x76($s0)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, 0x100
		bnez	$v0, loc_8010F18C
		li		$v0, 0x301
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s1)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s1)
loc_8010F18C:
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x40
		bnez	$v0, loc_8010F208
		addiu	$a0, $s0, 0x38
		addiu	$a1, $s1, 0x38
		lh		$a2, 0x76($s0)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, -0x100
		bnez	$v0, loc_8010F208
		li		$v0, 0x301
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s1)
		nop
		ori		$v0, 0x80
		j		loc_8010F208
		sb		$v0, 0x1D3($s1)
loc_8010F1D4:
		lbu		$v0, 0x23E($s0)
		nop
		bnez	$v0, loc_8010F208
		sll		$v0, $s3, 16
		bnez	$v0, loc_8010F208
		sltiu	$v0, $s2, 0x7D0
		beqz	$v0, loc_8010F208
		nop
		lbu		$v0, 0x1D3($s1)
		nop
		bnez	$v0, loc_8010F208
		li		$v0, 0xE01
		sw		$v0, 4($s0)
loc_8010F208:
		lh		$v1, 0x156($s1)
		addiu   $v0, $0, -0x8000
		bne		$v1, $v0, loc_8010F23C
		sll		$v0, $s3, 16
		bnez	$v0, loc_8010F23C
		sltiu	$v0, $s2, 0x3E8
		beqz	$v0, loc_8010F23C
		lui		$v1, 6
		lhu		$v0, 0x10E($s0)
		ori     $v1, $v1, 0x801
		sw		$v1, 4($s0)
		ori		$v0, 0x4000
		sh		$v0, 0x10E($s0)
loc_8010F23C:
		lw		$ra, 0x24($sp)
		lw		$s4, 0x20($sp)
		lw		$s3, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop