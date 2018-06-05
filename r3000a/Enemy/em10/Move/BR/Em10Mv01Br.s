

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
		bnez	$v0, loc_8010E830
		lui		$v0, 0xC000
		lw		$v1, 0x1F4($s0)
		nop
		and		$v0, $v1, $v0
		beqz	$v0, loc_8010E7E8
		lui		$v0, 0x3FFF
		ori     $v0, $v0, 0xFFFF
		and		$v0, $v1, $v0
		sltiu	$v0, 0x7D0
		beqz	$v0, loc_8010E7E8
		move	$a0, $s0
		lh		$a1, 0x1F8($s0)
		jal		Goto01_ck
		li		$a2, 0x100
		bnez	$v0, loc_8010E7E8
		li		$v0, 0xE01
		j		loc_8010EA1C
		sw		$v0, 4($s0)
loc_8010E7E8:
		lbu		$v0, 0x23E($s0)
		nop
		bnez	$v0, loc_8010E830
		sll		$v0, $s3, 16
		bnez	$v0, loc_8010E830
		sltiu	$v0, $s2, 0x7D0
		beqz	$v0, loc_8010E830
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, 0x106($s1)
		nop
		beq		$v1, $v0, loc_8010E830
		nop
		lbu		$v0, 0x1D3($s1)
		nop
		bnez	$v0, loc_8010E830
		li		$v0, 0xE01
		sw		$v0, 4($s0)
loc_8010E830:
		lh		$v0, 0x1D4($s0)
		nop
		andi	$v0, 0xC000
		beqz	$v0, loc_8010E860
		sltiu	$v0, $s2, 0xDAC
		lw		$v0, 0x110($s0)
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010E85C
		li		$v0, 0xA01
		sw		$v0, 4($s0)
loc_8010E85C:
		sltiu	$v0, $s2, 0xDAC
loc_8010E860:
		beqz	$v0, loc_8010E8A4
		sll		$v0, $s4, 16
		beqz	$v0, loc_8010E8A8
		sltiu	$v0, $s2, 0x9C4
		lhu		$v0, G_Room_player_flg
		nop
loc_8010E87C:
		andi	$v0, 0x15
		beqz	$v0, loc_8010E8A8
		sltiu	$v0, $s2, 0x9C4
		jal		Rnd
		nop
		andi	$v0, 3
		bnez	$v0, loc_8010E8A8
		sltiu	$v0, $s2, 0x9C4
		li		$v0, 0xC01
		sw		$v0, 4($s0)
loc_8010E8A4:
		sltiu	$v0, $s2, 0x9C4
loc_8010E8A8:
		beqz	$v0, loc_8010E8E8
		sll		$v0, $s4, 16
		beqz	$v0, loc_8010E8E8
		nop
		lhu		$v0, G_Room_player_flg
		nop
		andi	$v0, 0x17
		beqz	$v0, loc_8010E8E8
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_8010E8E8
		li		$v0, 0xC01
		sw		$v0, 4($s0)
loc_8010E8E8:
		lbu		$v1, 8($s1)
		li		$v0, 0xF
		beq		$v1, $v0, loc_8010E9B4
		sltiu	$v0, $s2, 0x4B0
		beqz	$v0, loc_8010E9E8
		nop
		lbu		$v0, 0x1D3($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8010E9E8
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, 0x106($s1)
		nop
		bne		$v1, $v0, loc_8010E9E8
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x20
		bnez	$v0, loc_8010E96C
		addiu	$a0, $s0, 0x38
		addiu	$a1, $s1, 0x38
		lh		$a2, 0x76($s0)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, 0x100
		bnez	$v0, loc_8010E96C
		li		$v0, 0x301
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s1)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s1)
loc_8010E96C:
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x40
		bnez	$v0, loc_8010E9E8
		addiu	$a0, $s0, 0x38
		addiu	$a1, $s1, 0x38
		lh		$a2, 0x76($s0)
		li		$a3, 0x100
		jal		Dir_pos_ck
		addiu	$a2, -0x100
		bnez	$v0, loc_8010E9E8
		li		$v0, 0x301
		sw		$v0, 4($s0)
		lbu		$v0, 0x1D3($s1)
		nop
		ori		$v0, 0x80
		j		loc_8010E9E8
		sb		$v0, 0x1D3($s1)
loc_8010E9B4:
		lbu		$v0, 0x23E($s0)
		nop
		bnez	$v0, loc_8010E9E8
		sll		$v0, $s3, 16
		bnez	$v0, loc_8010E9E8
		sltiu	$v0, $s2, 0x7D0
		beqz	$v0, loc_8010E9E8
		nop
		lbu		$v0, 0x1D3($s1)
		nop
		bnez	$v0, loc_8010E9E8
		li		$v0, 0xE01
		sw		$v0, 4($s0)
loc_8010E9E8:
		lh		$v1, 0x156($s1)
		addiu   $v0, $0, -0x8000
		bne		$v1, $v0, loc_8010EA1C
		sll		$v0, $s3, 16
		bnez	$v0, loc_8010EA1C
		sltiu	$v0, $s2, 0x3E8
		beqz	$v0, loc_8010EA1C
		lui		$v1, 6
		lhu		$v0, 0x10E($s0)
		ori     $v1, $v1, 0x801
		sw		$v1, 4($s0)
		ori		$v0, 0x4000
		sh		$v0, 0x10E($s0)
loc_8010EA1C:
		lw		$ra, 0x24($sp)
		lw		$s4, 0x20($sp)
		lw		$s3, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop