

		addiu	$sp, -0x38
		sw		$s2, 0x28($sp)
		move	$s2, $a0
		sw		$s3, 0x2C($sp)
		move	$s3, $a1
		sw		$s4, 0x30($sp)
		move	$s4, $a2
		sw		$ra, 0x34($sp)
		sw		$s1, 0x24($sp)
		sw		$s0, 0x20($sp)
		la		$a1, 0x8010D124
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x1B($sp)
		swr		$v0, 0x18($sp)
		swl		$v1, 0x1F($sp)
		swr		$v1, 0x1C($sp)
		lbu		$v1, 6($s2)
		li		$v0, 1
		beq		$v1, $v0, loc_80115184
		addiu	$s0, $sp, 0x18
		slti	$v0, $v1, 2
		beqz	$v0, loc_80114F6C
		nop
		beqz	$v1, loc_80114F80
		nop
		j		loc_8011522C
		nop
loc_80114F6C:
		li		$v0, 2
		beq		$v1, $v0, loc_801151AC
		li		$v0, 0x101
		j		loc_8011522C
		nop
loc_80114F80:
		jal		Rnd
		nop
		andi	$v0, 7
		addu	$v0, $s0, $v0
		lbu		$v1, 0($v0)
		li		$v0, 1
		sb		$v0, 6($s2)
		lui		$v0, 7
		lw		$a0, 0x38($s2)
		lw		$a1, 0x40($s2)
		addu	$v1, $v0
		sw		$v1, 0x14C($s2)
		lw		$a2, Player_Pos_x
		lw		$a3, Player_Pos_z
		jal		Direction_ck
		nop
		lbu		$a0, 0x1D2($s2)
		li		$v1, 0xAAAAAAAB
		multu	$a0, $v1
		sh		$v0, 0x158($s2)
		mfhi	$t0
		srl		$v1, $t0, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		subu	$a0, $v0
		andi	$a0, 0xFF
		beqz	$a0, loc_80115068
		nop
		lw		$s1, 0x198($s2)
		jal		Rnd
		li		$s0, 0x100
		sll		$v0, 1
		subu	$v0, $s0, $v0
		jal		Rnd
		sh		$v0, 0x10($sp)
		sll		$v0, 2
		li		$v1, 0x138
		subu	$v1, $v0
		jal		Rnd
		sh		$v1, 0x12($sp)
		sll		$v0, 1
		subu	$s0, $v0
		jal		Rnd
		sh		$s0, 0x14($sp)
		jal		Rnd
		move	$s0, $v0
		andi	$s0, 1
		sll		$s0, 16
		sll		$v0, 3
		addiu	$v0, 0x1B58
		or		$a0, $s0, $v0
		addiu	$a3, $sp, 0x10
		lh		$a1, 0x158($s2)
		j		loc_801150C4
		addiu	$a2, $s1, 0x48
loc_80115068:
		lw		$s1, 0x198($s2)
		jal		Rnd
		li		$s0, 0x7F
		subu	$v0, $s0, $v0
		jal		Rnd
		sh		$v0, 0x10($sp)
		li		$v1, 0x39F
		subu	$v1, $v0
		jal		Rnd
		sh		$v1, 0x12($sp)
		subu	$s0, $v0
		jal		Rnd
		sh		$s0, 0x14($sp)
		jal		Rnd
		move	$s0, $v0
		andi	$s0, 1
		sll		$s0, 16
		sll		$v0, 3
		addiu	$v0, 0x17D0
		or		$a0, $s0, $v0
		addiu	$a3, $sp, 0x10
		lh		$a1, 0x158($s2)
		addiu	$a2, $s1, 0xF4
loc_801150C4:
		jal		Esp_call
		nop
		lbu		$v0, 0x239($s2)
		nop
		bnez	$v0, loc_801150EC
		li		$a0, 0xC
		jal		Snd_se_enem
		move	$a1, $s2
		li		$v0, 0x96
		sb		$v0, 0x239($s2)
loc_801150EC:
		la		$s0, Player_Pos_x
		lw		$a0, 0x38($s2)
		lw		$a1, 0x40($s2)
		lw		$a2, 0($s0)
		lw		$a3, Player_Pos_z
		jal		Direction_ck
		nop
		jal		Rnd
		sh		$v0, 0x158($s2)
		andi	$v0, 0x3F
		addiu	$v0, 0x14
		jal		Rnd
		sh		$v0, 0x144($s2)
		move	$a0, $s2
		andi	$v0, 0x7F
		li		$v1, 0x40
		lh		$a1, 0x158($s2)
		lh		$a2, 0x76($s2)
		subu	$v1, $v0
		sh		$v1, 0x148($s2)
		subu	$a1, $a2
		jal		Add_speedXZ
		addiu	$a1, 0x800
		jal		Rnd
		nop
		move	$a0, $s2
		lhu		$v1, 0x76($s2)
		andi	$v0, 0x7F
		addiu	$v1, 0x40
		subu	$v1, $v0
		sh		$v1, 0x76($s2)
		lw		$a1, 0($s0)
		lw		$a2, Player_Pos_z
		jal		Goto00
		li		$a3, 0x10
loc_80115184:
		move	$a0, $s2
		move	$a1, $s3
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x200
		lbu		$v1, 6($s2)
		nop
		addu	$v1, $v0
		j		loc_8011522C
		sb		$v1, 6($s2)
loc_801151AC:
		jal		Rnd
		sw		$v0, 4($s2)
		andi	$v0, 1
		beqz	$v0, loc_801151C4
		li		$v0, 0x201
		sw		$v0, 4($s2)
loc_801151C4:
		move	$a0, $s2
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x200
		bnez	$v0, loc_8011522C
		nop
		lw		$v0, 0x1F0($s2)
		nop
		sltiu	$v0, 0x1388
		beqz	$v0, loc_8011522C
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8011522C
		nop
		jal		Rnd
		nop
		andi	$v0, 7
		bnez	$v0, loc_8011522C
		li		$v0, 0xB01
		sw		$v0, 4($s2)
loc_8011522C:
		lw		$ra, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop