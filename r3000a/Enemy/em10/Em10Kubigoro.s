

		addiu	$sp, -0x70
		sw		$s3, 0x54($sp)
		move	$s3, $a0
		sw		$ra, 0x68($sp)
		sw		$s7, 0x64($sp)
		sw		$s6, 0x60($sp)
		sw		$s5, 0x5C($sp)
		sw		$s4, 0x58($sp)
		sw		$s2, 0x50($sp)
		sw		$s1, 0x4C($sp)
		sw		$s0, 0x48($sp)
		la		$a1, 0x8010D2A0
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x33($sp)
		swr		$v0, 0x30($sp)
		swl		$v1, 0x37($sp)
		swr		$v1, 0x34($sp)
		lhu		$v1, 0x21A($s3)
		nop
		andi	$v0, $v1, 0x180
		beqz	$v0, loc_801190C8
		addiu	$s4, $sp, 0x30
		lw		$s1, 0x198($s3)
		andi	$v0, $v1, 0x80
		beqz	$v0, loc_80118DE4
		addiu	$s2, $s1, 0x560
		li		$v0, 1
		sb		$v0, 0x1C0($s3)
		lw		$v0, 0x560($s1)
		nop
		ori		$v0, 0x8040
		sw		$v0, 0x560($s1)
		lhu		$v0, 0x21A($s3)
		addiu	$s0, $sp, 0x10
		andi	$v0, 0xFF7F
		ori		$v0, 0x100
		sh		$v0, 0x21A($s3)
		la		$a1, GsIDMATRIX
		lw		$v0, 0($a1)
		lw		$v1, 4($a1)
		lw		$a0, 8($a1)
		sw		$v0, 0x10($sp)
		sw		$v1, 0x14($sp)
		sw		$a0, 0x18($sp)
		lw		$v0, 0xC($a1)
		lw		$v1, 0x10($a1)
		lw		$a0, 0x14($a1)
		sw		$v0, 0x1C($sp)
		sw		$v1, 0x20($sp)
		sw		$a0, 0x24($sp)
		lw		$v0, 0x18($a1)
		lw		$v1, 0x1C($a1)
		sw		$v0, 0x28($sp)
		sw		$v1, 0x2C($sp)
		lh		$a0, 0x76($s3)
		move	$a1, $s0
		jal		RotMatrixY
		addiu	$a0, 0x800
		move	$a0, $s0
		move	$a1, $s4
		jal		ApplyMatrixSV
		addiu	$a2, $s1, 0x598
		li		$v0, 2
		sb		$v0, 0x5D9($s1)
loc_80118DE4:
		la		$a1, GsIDMATRIX
		lw		$v0, 0($a1)
		lw		$v1, 4($a1)
		lw		$a0, 8($a1)
		sw		$v0, 0x10($sp)
		sw		$v1, 0x14($sp)
		sw		$a0, 0x18($sp)
		lw		$v0, 0xC($a1)
		lw		$v1, 0x10($a1)
		lw		$a0, 0x14($a1)
		sw		$v0, 0x1C($sp)
		sw		$v1, 0x20($sp)
		sw		$a0, 0x24($sp)
		lw		$v0, 0x18($a1)
		lw		$v1, 0x1C($a1)
		sw		$v0, 0x28($sp)
		sw		$v1, 0x2C($sp)
		li		$a0, 0x80
		addiu	$s0, $sp, 0x10
		jal		RotMatrixZ
		move	$a1, $s0
		li		$a0, 0x40
		jal		RotMatrixX
		move	$a1, $s0
		addiu	$s4, $s1, 0x5A8
		move	$a0, $s4
		move	$a1, $s0
		jal		CompM
		move	$a2, $s4
		lw		$v0, 0x5BC($s1)
		lw		$v1, 0x5C0($s1)
		lw		$a0, 0x5C4($s1)
		lw		$a1, 0x5C8($s1)
		sw		$v0, 0x38($sp)
		sw		$v1, 0x3C($sp)
		sw		$a0, 0x40($sp)
		sw		$a1, 0x44($sp)
		addiu	$a0, $sp, 0x38
		li		$a1, 0x64
		li		$a2, 0x2000
		li		$a3, 1
		lui		$s6, 0x91A2
		lh		$v1, 0x598($s1)
		lw		$v0, 0x5BC($s1)
		lh		$t0, 0x59A($s1)
		lh		$t1, 0x59C($s1)
		addu	$v0, $v1
		sw		$v0, 0x5BC($s1)
		lw		$v0, 0x5C0($s1)
		lw		$v1, 0x5C4($s1)
		addu	$v0, $t0
		addu	$v1, $t1
		sw		$v0, 0x5C0($s1)
		jal		Sca_get_ground
		sw		$v1, 0x5C4($s1)
		lw		$a2, 0x5C0($s1)
		ori     $s6, 0xB3C5
		mult	$a2, $s6
		move	$s5, $v0
		addiu	$s0, $s1, 0x5BC
		move	$a0, $s0
		li		$a1, 0x64
		li		$a3, 0x2000
		li		$s7, 1
		mfhi	$t2
		addu	$v0, $t2, $a2
		sra		$v0, 10
		sra		$a2, 31
		subu	$a2, $v0
		jal		Sca_ck_hit
		sllv	$a2, $s7, $a2
		beqz	$v0, loc_80118FFC
		li		$a2, 0x2000
		lw		$v0, 0x38($sp)
		lw		$v1, 0x3C($sp)
		lw		$a0, 0x40($sp)
		lw		$a1, 0x44($sp)
		sw		$v0, 0x5BC($s1)
		sw		$v1, 0x5C0($s1)
		sw		$a0, 0x5C4($s1)
		sw		$a1, 0x5C8($s1)
		move	$a0, $s0
		li		$a1, 0x64
		jal		Sca_get_ground
		li		$a3, 1
		move	$s5, $v0
		lh		$v0, 0x598($s1)
		lh		$v1, 0x59C($s1)
		negu	$v0, $v0
		negu	$v1, $v1
		sh		$v0, 0x598($s1)
		jal		Rnd
		sh		$v1, 0x59C($s1)
		li		$a0, 0x3E8
		sll		$a1, $v0, 4
		move	$a2, $s4
		jal		Esp_call
		move	$a3, $0
		lbu		$v1, 0x5D9($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80118FA4
		sb		$v0, 0x5D9($s1)
		li		$a0, 5
		li		$a1, 3
		lhu		$v0, 0x21A($s3)
		move	$a2, $s4
		andi	$v0, 0xFEFF
		sh		$v0, 0x21A($s3)
		j		loc_801190C0
		sw		$0, 0x560($s1)
loc_80118FA4:
		lw		$a2, 0x5C0($s1)
		nop
		mult	$a2, $s6
		move	$a0, $s0
		li		$a1, 0x64
		li		$a3, 0x2000
		mfhi	$t2
		addu	$v0, $t2, $a2
		sra		$v0, 10
		sra		$a2, 31
		subu	$a2, $v0
		jal		Sca_ck_hit
		sllv	$a2, $s7, $a2
		beqz	$v0, loc_80118FFC
		li		$a0, 5
		li		$a1, 3
		lhu		$v0, 0x21A($s3)
		move	$a2, $s4
		andi	$v0, 0xFEFF
		sh		$v0, 0x21A($s3)
		j		loc_801190C0
		sw		$0, 0x560($s1)
loc_80118FFC:
		lhu		$v0, 0x3A($s2)
		lw		$v1, 0x60($s2)
		addiu	$v0, 0x32
		sh		$v0, 0x3A($s2)
		sll		$v0, $s5, 16
		sra		$v0, 16
		addiu	$a0, $v0, -0xC8
		slt		$v1, $a0, $v1
		beqz	$v1, loc_801190C8
		nop
		lhu		$v0, 0x38($s2)
		lhu		$v1, 0x3C($s2)
		sw		$a0, 0x60($s2)
		sll		$v0, 16
		sra		$v0, 17
		sll		$v1, 16
		sh		$v0, 0x38($s2)
		lhu		$v0, 0x3A($s2)
		sra		$v1, 17
		sh		$v1, 0x3C($s2)
		sll		$v0, 16
		sra		$v0, 18
		negu	$v0, $v0
		sh		$v0, 0x3A($s2)
		sw		$0, 0x40($sp)
		sw		$0, 0x3C($sp)
		jal		Rnd
		sw		$0, 0x38($sp)
		li		$a0, 0x3E8
		sll		$a1, $v0, 4
		addiu	$s0, $s2, 0x48
		move	$a2, $s0
		jal		Esp_call
		move	$a3, $0
		li		$a0, 7
		jal		Snd_se_enem
		move	$a1, $s3
		lbu		$v1, 0x79($s2)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_801190C8
		sb		$v0, 0x79($s2)
		li		$a0, 5
		li		$a1, 3
		lhu		$v0, 0x21A($s3)
		move	$a2, $s0
		andi	$v0, 0xFEFF
		sh		$v0, 0x21A($s3)
		sw		$0, 0($s2)
loc_801190C0:
		jal		Esp_kill
		nop
loc_801190C8:
		lw		$ra, 0x68($sp)
		lw		$s7, 0x64($sp)
		lw		$s6, 0x60($sp)
		lw		$s5, 0x5C($sp)
		lw		$s4, 0x58($sp)
		lw		$s3, 0x54($sp)
		lw		$s2, 0x50($sp)
		lw		$s1, 0x4C($sp)
		lw		$s0, 0x48($sp)
		addiu	$sp, 0x70
		jr		$ra
		nop