

		addiu	$sp, -0x40
		sw		$s2, 0x28($sp)
		move	$s2, $a0
		sw		$s4, 0x30($sp)
		move	$s4, $a1
		sw		$s5, 0x34($sp)
		sw		$ra, 0x38($sp)
		sw		$s3, 0x2C($sp)
		sw		$s1, 0x24($sp)
		sw		$s0, 0x20($sp)
		li		$s3, 1
		li		$v0, 2
		sb		$s3, 0x10($sp)
		sb		$v0, 0x11($sp)
		lbu		$v1, 6($s2)
		li		$v0, 1
		beq		$v1, $v0, loc_801173D4
		move	$s5, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_801172A4
		nop
		beqz	$v1, loc_801172B8
		lui		$v1, 3
		j		loc_80117418
		nop
loc_801172A4:
		li		$v0, 2
		beq		$v1, $v0, loc_80117414
		li		$v0, 7
		j		loc_80117418
		nop
loc_801172B8:
		lhu		$v0, 0x21A($s2)
		ori		$v1, 0xA02
		sw		$v1, 0x14C($s2)
		lw		$v1, 0x198($s2)
		ori		$v0, 4
		sh		$v0, 0x21A($s2)
		lbu		$v0, 0x1D3($s2)
		sb		$s3, 0x16A($s2)
		sb		$s3, 6($s2)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s2)
		lw		$v0, 0x58C($v1)
		li		$a0, 0x1F40
		sh		$v0, 0x18($sp)
		lw		$v0, 0x590($v1)
		addiu	$s1, $sp, 0x18
		addiu	$v0, 0x12C
		sh		$v0, 0x1A($sp)
		lw		$v0, 0x594($v1)
		move	$a3, $s1
		sh		$v0, 0x1C($sp)
		lw		$s0, 0x198($s2)
		lh		$a1, 0x76($s2)
		addiu	$s0, 0x48
		jal		Esp_call
		move	$a2, $s0
		li		$a0, 0x8001B58
		lhu		$v0, 0x1A($sp)
		move	$a2, $s0
		addiu	$v0, -0x190
		sh		$v0, 0x1A($sp)
		lh		$a1, 0x76($s2)
		jal		Esp_call
		move	$a3, $s1
		li		$a0, 0x21F40
		move	$a2, $s0
		lh		$a1, 0x76($s2)
		jal		Esp_call
		move	$a3, $s1
		li		$a2, 0x101040
		li		$a3, 0x101010
		lw		$v0, 0x198($s2)
		li		$a0, 2
		sb		$s3, 0x1C0($s2)
		lw		$a1, 0x560($v0)
		li		$v1, 0xFFFFFF9C
		sh		$v1, 0x5FA($v0)
		li		$v1, 0xA
		sh		$0, 0x5F8($v0)
		sh		$0, 0x600($v0)
		sh		$0, 0x5FC($v0)
		sh		$v1, 0x5FE($v0)
		sh		$0, 0x604($v0)
		sw		$a2, 0x5D0($v0)
		ori		$a1, 0x4A
		sw		$a1, 0x560($v0)
		lw		$s0, 0x198($s2)
		move	$a1, $s2
		lw		$v1, 0($s0)
		li		$v0, 0x40
		sw		$v0, 0x98($s0)
		sw		$a3, 0x9C($s0)
		ori		$v1, 0x80
		jal		Snd_se_enem
		sw		$v1, 0($s0)
		jal		Em_dead_flg_on
		move	$a0, $s2
loc_801173D4:
		move	$a0, $s2
		move	$a1, $s4
		move	$a2, $s5
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s2)
		lbu		$a0, 0x14E($s2)
		addu	$v1, $v0
		bnez	$a0, loc_80117418
		sb		$v1, 6($s2)
		move	$a0, $s2
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
		j		loc_80117418
		nop
loc_80117414:
		sw		$v0, 4($s2)
loc_80117418:
		lw		$ra, 0x38($sp)
		lw		$s5, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x40
		jr		$ra
		nop