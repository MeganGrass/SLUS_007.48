

		addiu	$sp, -0x28
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$s2, 0x18($sp)
		sw		$s3, 0x1C($sp)
		la		$s3, G_Player
		sw		$ra, 0x20($sp)
		lbu		$v1, 6($s0)
		li		$v0, 1
		beq		$v1, $v0, loc_8011182C
		move	$s2, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_8011179C
		nop
		beqz	$v1, loc_801117B8
		lui		$v0, 7
		j		loc_80111900
		nop
loc_8011179C:
		li		$v0, 2
		beq		$v1, $v0, loc_80111884
		li		$v0, 3
		beq		$v1, $v0, loc_8011189C
		move	$a0, $s0
		j		loc_80111900
		nop
loc_801117B8:
		ori		$v0, 0x19
		move	$a0, $s0
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		sb		$v0, 6($s0)
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00
		li		$a3, 0x20
		move	$a0, $s0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0xBE
		lbu		$v1, 0x239($s0)
		nop
		bnez	$v1, loc_80111824
		sh		$v0, 0x158($s0)
		li		$a0, 0xA
		jal		Snd_se_enem
		move	$a1, $s0
		li		$v0, 0x96
		sb		$v0, 0x239($s0)
loc_80111824:
		li		$v0, 0xB
		sh		$v0, 0x144($s0)
loc_8011182C:
		move	$a0, $s0
		lw		$a1, 0x38($s3)
		lw		$a2, 0x40($s3)
		jal		Goto00_ck
		li		$a3, 0x140
		bnez	$v0, loc_80111854
		move	$a0, $s0
		li		$v0, 2
		sh		$0, 0x158($s0)
		sb		$v0, 6($s0)
loc_80111854:
		move	$a1, $s1
		move	$a2, $s2
		lhu		$v0, 0x76($s0)
		lhu		$v1, 0x158($s0)
		li		$a3, 0x200
		addu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($s0)
		beqz	$v0, loc_80111900
		li		$v0, 2
		j		loc_80111900
		sb		$v0, 6($s0)
loc_80111884:
		li		$v0, 0x7001B
		sw		$v0, 0x14C($s0)
		li		$v0, 3
		sb		$v0, 6($s0)
		move	$a0, $s0
loc_8011189C:
		lw		$a1, 0x38($s3)
		lw		$a2, 0x40($s3)
		jal		Goto00
		li		$a3, 0x20
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x200
		beqz	$v0, loc_801118E0
		li		$v0, 0x101
		sw		$v0, 4($s0)
loc_801118E0:
		move	$a0, $s0
		jal		Add_speedXZ
		move	$a1, $0
		lbu		$v1, 0x14D($s0)
		li		$v0, 0x19
		bne		$v1, $v0, loc_80111900
		li		$v0, 0x101
		sw		$v0, 4($s0)
loc_80111900:
		lw		$ra, 0x20($sp)
		lw		$s3, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop