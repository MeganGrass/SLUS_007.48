

		addiu	$sp, -0x68
		sw		$s1, 0x4C($sp)
		move	$s1, $a0
		sw		$s2, 0x50($sp)
		move	$s2, $a1
		sw		$s4, 0x58($sp)
		sw		$ra, 0x60($sp)
		sw		$s5, 0x5C($sp)
		sw		$s3, 0x54($sp)
		sw		$s0, 0x48($sp)
		la		$a1, (0x8010D004+8)
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x13($sp)
		swr		$v0, 0x10($sp)
		swl		$v1, 0x17($sp)
		swr		$v1, 0x14($sp)
		la		$a1, (0x8010D004+0x10)
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x43($sp)
		swr		$v0, 0x40($sp)
		swl		$v1, 0x47($sp)
		swr		$v1, 0x44($sp)
		la		$s3, G_Player
		lhu		$v0, 0x10E($s1)
		lbu		$v1, 8($s1)
		andi	$s5, $v0, 1
		li		$v0, 0x17
		beq		$v1, $v0, loc_8010F690
		move	$s4, $a2
		li		$v0, 0x11
		bne		$v1, $v0, loc_8010F694
		nop
loc_8010F690:
		addiu	$s5, 2
loc_8010F694:
		lbu		$v1, 6($s1)
		nop
		sltiu	$v0, $v1, 0xA
		beqz	$v0, loc_8010FEBC
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, at, $v0
		lw      $v0, -0x2FE4(at)		;; jpt_8010F6B8
		nop
		jr		$v0
		nop
loc_8010F6C0:
		move	$a0, $s1
		sll		$v0, $s5, 1
		addu	$v0, $sp, $v0
		lbu		$v1, 0x10($v0)
		li		$v0, 1
		sb		$v0, 6($s1)
		lui		$v0, 0xF
		addu	$v1, $v0
		sw		$v1, 0x14C($s1)
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00
		li		$a3, 0x800
		move	$a0, $s3
		move	$a1, $s2
		move	$a2, $s4
		move	$a3, $0
		jal		Set_base_pos
		sw		$s1, 0x1B4($s3)
		move	$a0, $s1
		jal		Cdir_ck
		move	$a1, $s3
		sll		$v0, 8
		ori		$v0, 5
		sw		$v0, 4($s3)
		andi	$v0, $s5, 1
		beqz	$v0, loc_8010F748
		nop
		lbu		$v0, 5($s3)
		nop
		addiu	$v0, 2
		sb		$v0, 5($s3)
loc_8010F748:
		lw		$v0, 0x188($s1)
		nop
		sw		$v0, 0x188($s3)
		lbu		$v0, 0x1D3($s3)
		lw		$v1, 0x18C($s1)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s3)
		sw		$v1, 0x18C($s3)
		lw		$v0, 0($s1)
		li		$v1, 0xF
		sb		$v1, 0x1D3($s1)
		ori		$v0, 0x1000
		sw		$v0, 0($s1)
		lw		$v0, 0($s3)
		nop
		ori		$v0, 0x1000
		sw		$v0, 0($s3)
		lbu		$v0, 0x239($s1)
		nop
		bnez	$v0, loc_8010F7C4
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010F7B4
		li		$a0, 0xB
		li		$a0, 0xA
loc_8010F7B4:
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_8010F7C4:
		li		$a0, 0x14
		move	$a1, $0
		li		$a2, 0xFA
		jal		sub_800395B8
		move	$a3, $0
loc_8010F7D8:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Null_pos_set
		move	$a3, $0
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s1)
		nop
		addu	$v1, $v0
		j		loc_8010FEBC
		sb		$v1, 6($s1)
loc_8010F814:
		sll		$v0, $s5, 1
		addu	$v0, $sp, $v0
		lbu		$v1, 0x10($v0)
		li		$v0, 3
		sb		$v0, 6($s1)
		li		$v0, 0x94
		sh		$v0, 0x158($s1)
		addiu	$v1, 1
		sw		$v1, 0x14C($s1)
loc_8010F838:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Null_pos_set
		move	$a3, $0
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x100
		jal		Gacha_ch
		nop
		sll		$v1, $v0, 2
		lhu		$a0, 0x158($s1)
		addu	$v1, $v0
		addiu	$a0, -2
		subu	$a0, $v1
		sh		$a0, 0x158($s1)
		sll		$a0, 16
		bgez	$a0, loc_8010F898
		sll		$v1, $s5, 1
		li		$v0, 4
		sb		$v0, 6($s1)
		sb		$v0, 6($s3)
loc_8010F898:
		addiu	$v0, $sp, 0x40
		addu	$s0, $v0, $v1
		lbu		$v1, 0x14D($s1)
		lbu		$v0, 0($s0)
		nop
		bne		$v1, $v0, loc_8010FEBC
		li		$a0, 6
		li		$a1, 0xFA
		jal		sub_80039514
		move	$a2, $0
		li		$a0, 0xA
		jal		sub_8003947C
		move	$a1, $0
		li		$a0, 4
		li		$a1, 0xFA
		jal		sub_80039514
		li		$a2, 0xF
		li		$a0, 4
		jal		sub_8003947C
		li		$a1, 0xD
		li		$a0, 3
		jal		Snd_se_enem
		move	$a1, $s1
		lbu		$a0, 1($s0)
		jal		Pl_life_down
		andi	$a1, $s5, 1
		move	$v1, $v0
		andi	$v0, $v1, 1
		beqz	$v0, loc_8010F920
		li		$v0, 4
		sb		$v0, 6($s1)
		sb		$v0, 6($s3)
		li		$v0, 1
		sb		$v0, 0x16A($s3)
loc_8010F920:
		andi	$v0, $v1, 2
		beqz	$v0, loc_8010FEBC
		move	$a0, $s1
		move	$a1, $s3
		li		$v0, 0x601
		jal		Cdir_ck
		sw		$v0, 4($a0)
		sll		$v0, 8
		lw		$v1, G_System_flg
		ori		$v0, 6
		sw		$v0, Player_Routine_0
		ori		$v1, 0x100
		sw		$v1, G_System_flg
		j		loc_8010FEBC
		nop
loc_8010F968:
		li		$a3, 0x70002
		li		$a0, 4
		li		$a1, 0xFA
		li		$a2, 0xA
		sll		$v0, $s5, 1
		addu	$v0, $sp, $v0
		lbu		$v1, 0x10($v0)
		li		$v0, 5
		sb		$v0, 6($s1)
		sh		$0, 0x158($s1)
		sb		$0, 0x16A($s1)
		addu	$v1, $a3
		jal		sub_80039514
		sw		$v1, 0x14C($s1)
loc_8010F9A4:
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x60
		bnez	$v0, loc_8010FA48
		move	$a0, $s1
		lbu		$v1, 0x14D($s1)
		li		$v0, 3
		bne		$v1, $v0, loc_8010FA4C
		move	$a1, $s2
		andi	$v0, $s5, 1
		bnez	$v0, loc_8010FA50
		move	$a2, $s4
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		bnez	$s0, loc_8010FA48
		move	$a0, $s1
		move	$a1, $s3
		li		$v0, 1
		jal		Cdir_ck
		sb		$v0, 0x23C($s1)
		jal		Rnd
		sb		$v0, 0x23D($s1)
		lbu		$v1, 0x23D($s1)
		andi	$v0, 2
		or		$v1, $v0
		sb		$v1, 0x23D($s1)
		lhu		$v1, 0x21A($s1)
		lbu		$v0, 0x23D($s1)
		ori		$v1, 0x40
		andi	$v0, 2
		beqz	$v0, loc_8010FA44
		sh		$v1, 0x21A($s1)
		andi	$v0, $v1, 0xFFBF
		ori		$v0, 0x20
		sh		$v0, 0x21A($s1)
loc_8010FA44:
		move	$a0, $s1
loc_8010FA48:
		move	$a1, $s2
loc_8010FA4C:
		move	$a2, $s4
loc_8010FA50:
		jal		Null_pos_set
		move	$a3, $0
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x200
		lbu		$v1, 6($s1)
		nop
		addu	$v1, $v0
		andi	$v0, $s5, 1
		beqz	$v0, loc_8010FBD0
		sb		$v1, 6($s1)
		lbu		$v1, 8($s3)
		nop
		andi	$v0, $v1, 1
		bnez	$v0, loc_8010FAA4
		addiu	$v0, $v1, -0xC
		sltiu	$v0, $v1, 0xB
		bnez	$v0, loc_8010FABC
		addiu	$v0, $v1, -0xC
loc_8010FAA4:
		sltiu	$v0, 2
		bnez	$v0, loc_8010FABC
		andi	$v1, 0xFF
		li		$v0, 0xB
		bne		$v1, $v0, loc_8010FB38
		li		$v0, 0x1B
loc_8010FABC:
		lbu		$v1, 0x14D($s1)
		li		$v0, 0x16
		bne		$v1, $v0, loc_8010FB70
		lui		$a1, 0x10
		ori     $a1, $a1, 0x1040
		lw		$v1, 0x198($s1)
		lui		$a0, 0x800
		lw		$v0, 0x560($v1)
		ori     $a0, $a0, 0x1000
		ori		$v0, 0x4A
		sw		$v0, 0x560($v1)
		lhu		$v0, 0x76($s1)
		addiu	$a3, $sp, 0x18
		sh		$0, 0x600($v1)
		sh		$0, 0x5FC($v1)
		sh		$0, 0x5FA($v1)
		sh		$0, 0x5FE($v1)
		sh		$0, 0x604($v1)
		sw		$a1, 0x5D0($v1)
		sh		$v0, 0x5F8($v1)
		lw		$a2, 0x198($s1)
		addiu   $v0, $0, -0x258
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$a1, 0x76($s1)
		jal		Esp_call
		addiu	$a2, 0x48
		li		$a0, 2
		j		loc_8010FB58
		move	$a1, $s1
loc_8010FB38:
		lbu		$v1, 0x14D($s1)
		nop
		bne		$v1, $v0, loc_8010FB70
		li		$a0, 8
		lhu		$v0, 0x21A($s1)
		move	$a1, $s1
		ori		$v0, 0x80
		sh		$v0, 0x21A($s1)
loc_8010FB58:
		jal		Snd_se_enem
		nop
		li		$a0, 4
		li		$a1, 0xFA
		jal		sub_80039514
		move	$a2, $0
loc_8010FB70:
		lbu		$v1, 0x14D($s1)
		nop
		addiu	$v0, $v1, -0x17
		sltiu	$v0, 0x13
		beqz	$v0, loc_8010FBC4
		andi	$v0, $v1, 1
		beqz	$v0, loc_8010FBC4
		li		$v0, 0x64
		lw		$s0, 0x198($s1)
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		jal		Rnd
		sh		$0, 0x1C($sp)
		li		$a0, 0x1000
		addiu	$a3, $sp, 0x18
		lh		$a1, 0x76($s1)
		sll		$v0, 2
		addu	$a1, $v0
		addiu	$a1, -0x200
		jal		Esp_call
		addiu	$a2, $s0, 0x5A8
loc_8010FBC4:
		andi	$v0, $s5, 1
		bnez	$v0, loc_8010FEBC
		nop
loc_8010FBD0:
		lbu		$v1, 0x14D($s1)
		li		$v0, 7
		bne		$v1, $v0, loc_8010FEBC
		li		$v0, 7
		j		loc_8010FEBC
		sb		$v0, 6($s1)
loc_8010FBE8:
		li		$a0, 0xF3FFFFFF
		li		$v0, 7
		sw		$v0, 4($s1)
		li		$v0, 0xFFFFFFFF
		sh		$v0, 0x156($s1)
		lhu		$v0, 0x21A($s1)
		lw		$v1, 0($s1)
		andi	$v0, 0xFFFB
		and		$v1, $a0
		lui		$a0, 0x400
		sh		$v0, 0x21A($s1)
		lbu		$v0, 0x1D3($s1)
		or		$v1, $a0
		sw		$v1, 0($s1)
		ori		$v0, 0x80
		j		loc_8010FEBC
		sb		$v0, 0x1D3($s1)
loc_8010FC30:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Spd_get
		move	$a3, $0
		li		$v0, 8
		sb		$v0, 6($s1)
loc_8010FC60:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x200
		move	$a0, $s1
		move	$a1, $0
		move	$s0, $0
		lbu		$v1, 6($s1)
		lhu		$a2, 0x144($s1)
		addu	$v1, $v0
		addiu	$a2, -0x1E
		sb		$v1, 6($s1)
		jal		Add_speedXZ
		sh		$a2, 0x144($s1)
		lbu		$v1, 0x14D($s1)
		li		$v0, 0x16
		bne		$v1, $v0, loc_8010FD20
		li		$s3, 3
		la		$s2, G_Sce_timer
		lh		$v0, 0($s2)
		nop
		beq		$v0, $s3, loc_8010FD08
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		xori		$s0, 2
		lh		$v0, 0($s2)
		nop
		bne		$v0, $s3, loc_8010FD20
		sltu	$s0, $0, $s0
loc_8010FD08:
		jal		Rnd
		nop
		andi	$v0, 3
		bnez	$v0, loc_8010FD20
		nop
		li		$s0, 1
loc_8010FD20:
		beqz	$s0, loc_8010FDF0
		li		$v0, 0x501
		jal		Rnd
		sw		$v0, 4($s1)
		li		$a0, 0xA0A02
		li		$a1, 0xF3FFFFFF
		andi	$v0, 0xF
		addiu	$v0, 0x10
		sb		$v0, 0x223($s1)
		li		$v0, 1
		sb		$v0, 0x16A($s1)
		sb		$v0, 6($s1)
		lhu		$v0, 0x21A($s1)
		lb		$v1, 0x16A($s1)
		andi	$v0, 0xFFF7
		sh		$v0, 0x21A($s1)
		sll		$v0, $v1, 2
		addu	$v0, $v1
		sll		$v0, 9
		lw		$v1, 0($s1)
		addu	$v0, $a0
		sw		$v0, 0x14C($s1)
loc_8010FD80:
		lui		$v0, 0x400
		and		$v1, $a1
		or		$v1, $v0
		lbu		$v0, 0x1D3($s1)
		sb		$0, 0x222($s1)
		sb		$0, 0x16B($s1)
		sw		$v1, 0($s1)
		lhu		$v1, 0x21A($s1)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s1)
		lhu		$v0, 0x10E($s1)
		ori		$v1, 4
		sh		$v1, 0x21A($s1)
		lhu		$v1, 0x21A($s1)
		ori		$v0, 0x2000
		ori		$v1, 0x202
		sh		$v0, 0x10E($s1)
		jal		Rnd
		sh		$v1, 0x21A($s1)
		andi	$v0, 1
		beqz	$v0, loc_8010FDDC
		li		$a0, 0xD
		li		$a0, 0xC
loc_8010FDDC:
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 1
		j		loc_8010FEBC
		sh		$v0, 0x158($s1)
loc_8010FDF0:
		lbu		$v0, 0x14D($s1)
		nop
		addiu	$v0, -7
		sltiu	$v0, 0x12
		beqz	$v0, loc_8010FEBC
		li		$v0, 0xFF
		lbu		$v1, 0xD($s1)
		nop
		beq		$v1, $v0, loc_8010FEBC
		sll		$v0, $v1, 2
		lui     at, 0x800D
		addu    at, at, $v0
		lw      $s0, -0x1EC(at)
		nop
		lbu		$v0, 8($s0)
		nop
		andi	$v0, 0x10
		beqz	$v0, loc_8010FEBC
		nop
		lh		$v0, 0x156($s0)
		nop
		bltz	$v0, loc_8010FEBC
		nop
		lhu		$v1, 0x10E($s0)
		nop
		andi	$v0, $v1, 1
		bnez	$v0, loc_8010FEBC
		nop
		lbu		$v0, 0x1D3($s0)
		nop
		bnez	$v0, loc_8010FEBC
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 8
		bnez	$v0, loc_8010FEBC
		andi	$v0, $v1, 0x2000
		bnez	$v0, loc_8010FEBC
		move	$a0, $s1
		move	$a1, $s0
		li		$v0, 0x901
		jal		Cdir_ck
		sw		$v0, 4($s0)
		li		$a0, 4
		move	$a1, $s1
		jal		Snd_se_enem
		sb		$v0, 0x16B($s0)
		j		loc_8010FEBC
loc_8010FEB0:
		nop
loc_8010FEB4:
		li		$v0, 1
		sw		$v0, 4($s1)
loc_8010FEBC:
		lw		$ra, 0x60($sp)
		lw		$s5, 0x5C($sp)
		lw		$s4, 0x58($sp)
		lw		$s3, 0x54($sp)
		lw		$s2, 0x50($sp)
		lw		$s1, 0x4C($sp)
		lw		$s0, 0x48($sp)
		addiu	$sp, 0x68
		jr		$ra
		nop