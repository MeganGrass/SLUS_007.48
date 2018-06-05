

		addiu	$sp, -0x40
		sw		$s4, 0x30($sp)
		move	$s4, $a0
		sw		$s5, 0x34($sp)
		move	$s5, $a1
		sw		$ra, 0x3C($sp)
		sw		$s6, 0x38($sp)
		sw		$s3, 0x2C($sp)
		sw		$s2, 0x28($sp)
		sw		$s1, 0x24($sp)
		sw		$s0, 0x20($sp)
		li		$v0, 1
		sb		$v0, 0x10($sp)
		li		$v0, 2
		sb		$v0, 0x11($sp)
		lbu		$v1, 6($s4)
		nop
		sltiu	$v0, $v1, 5
		beqz	$v0, loc_801165E4
		move	$s6, $a2
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2EB4(at)		;; jpt_80116328
		nop
		jr		$v0
		nop
loc_80116330:
		jal		Rnd
		nop
		andi	$v0, 1
		sb		$v0, 0x16A($s4)
		lhu		$v0, 0x21A($s4)
		lb		$v1, 0x16A($s4)
		andi	$v0, 0xFFFB
		beqz	$v1, loc_8011635C
		sh		$v0, 0x21A($s4)
		ori		$v0, 4
		sh		$v0, 0x21A($s4)
loc_8011635C:
		lb		$v1, 0x16A($s4)
		nop
		addu	$v0, $sp, $v1
		lbu		$a0, 0x10($v0)
		lbu		$v0, 0x1D3($s4)
		li		$s3, 1
		sb		$s3, 6($s4)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s4)
		sll		$v0, $v1, 2
		addu	$v0, $v1
		sll		$v0, 9
		lui		$v1, 3
		addu	$a0, $v1
		lw		$v1, 0x198($s4)
		addu	$v0, $a0
		sw		$v0, 0x14C($s4)
		lw		$v0, 0x58C($v1)
		addiu	$s2, $sp, 0x18
		sh		$v0, 0x18($sp)
		lw		$v0, 0x590($v1)
		move	$a3, $s2
		addiu	$v0, 0x12C
		sh		$v0, 0x1A($sp)
		lw		$v0, 0x594($v1)
		li		$a0, 0x1F40
		sh		$v0, 0x1C($sp)
		lw		$s1, 0x198($s4)
		lh		$a1, 0x76($s4)
		addiu	$s1, 0x48
		jal		Esp_call
		move	$a2, $s1
		lw		$a0, 0x38($s4)
		lw		$a1, 0x40($s4)
		lw		$a2, Player_Pos_x
		lw		$a3, Player_Pos_z
		jal		Direction_ck
		nop
		li		$a0, 0x8001B58
		move	$s0, $v0
		sll		$a1, $s0, 16
		sra		$a1, 16
		move	$a2, $s1
		lhu		$v0, 0x1A($sp)
		move	$a3, $s2
		addiu	$v0, -0x190
		jal		Esp_call
		sh		$v0, 0x1A($sp)
		li		$a0, 0x21F40
		move	$a2, $s1
		lh		$a1, 0x76($s4)
		jal		Esp_call
		move	$a3, $s2
		li		$t0, 0x101040
		li		$a0, 5
		li		$a1, 3
		addiu	$s0, 0x800
		lw		$v1, 0x198($s4)
		li		$v0, 0x190
		sb		$s3, 0x1C0($s4)
		lw		$a3, 0x560($v1)
		addiu	$a2, $v1, 0x5A8
		sh		$v0, 0x5FC($v1)
		li		$v0, 0xFFFFFF9C
		sh		$v0, 0x5FA($v1)
		li		$v0, 0xA
		sh		$v0, 0x5FE($v1)
		li		$v0, 0xFFFFFFCE
		sh		$s0, 0x5F8($v1)
		sh		$0, 0x600($v1)
		sh		$v0, 0x604($v1)
		sw		$t0, 0x5D0($v1)
		ori		$a3, 0x4A
		jal		Esp_kill
		sw		$a3, 0x560($v1)
		li		$a2, 0x101010
		li		$a0, 2
		lw		$s1, 0x198($s4)
		move	$a1, $s4
		lw		$v1, 0($s1)
		li		$v0, 0x40
		sw		$v0, 0x98($s1)
		sw		$a2, 0x9C($s1)
		ori		$v1, 0x80
		jal		Snd_se_enem
		sw		$v1, 0($s1)
		jal		Em_dead_flg_on
		move	$a0, $s4
		li		$v0, 0xB
		jal		Rnd
		sh		$v0, 0x144($s4)
		andi	$v0, 1
		beqz	$v0, loc_801164F4
		li		$v0, 3
		j		loc_801165E4
		sb		$v0, 6($s4)
loc_801164F4:
		move	$a0, $s4
		move	$a1, $s5
		move	$a2, $s6
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s4)
		lbu		$a0, 0x14E($s4)
		addu	$v1, $v0
		bnez	$a0, loc_801165E4
		sb		$v1, 6($s4)
		move	$a0, $s4
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
		j		loc_801165E4
		nop
loc_80116534:
		li		$v0, 7
		j		loc_801165E4
		sw		$v0, 4($s4)
loc_80116540:
		li		$v0, 4
		sb		$v0, 6($s4)
		lbu		$v0, 0x218($s4)
		lui		$v1, 0xF
		addu	$v0, $v1
		jal		Rnd
		sw		$v0, 0x14C($s4)
		andi	$v0, 0x3F
		addiu	$v0, 0x1E
		sh		$v0, 0x158($s4)
loc_80116568:
		lhu		$v1, 0x158($s4)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8011659C
		sh		$v0, 0x158($s4)
		li		$a0, 0xF0001
		lhu		$v1, 0x21A($s4)
		li		$v0, 1
		sb		$v0, 6($s4)
		sw		$a0, 0x14C($s4)
		andi	$v1, 0xFFFB
		sh		$v1, 0x21A($s4)
loc_8011659C:
		move	$a0, $s4
		lh		$a1, 0x1C4($s4)
		lh		$a2, 0x1C6($s4)
		jal		Goto00
		li		$a3, 8
		move	$a0, $s4
		lw		$a1, 0x108($s4)
		lw		$a2, 0x17C($s4)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s4
		lw		$a1, 0x108($s4)
		lw		$a2, 0x17C($s4)
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s4
		jal		Add_speedXZ
		move	$a1, $0
loc_801165E4:
		lw		$ra, 0x3C($sp)
		lw		$s6, 0x38($sp)
		lw		$s5, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x40
		jr		$ra
		nop