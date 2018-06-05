

		addiu	$sp, -0x50
		sw		$s1, 0x44($sp)
		move	$s1, $a0
		sw		$ra, 0x4C($sp)
		sw		$s2, 0x48($sp)
		sw		$s0, 0x40($sp)
		lbu		$v1, 6($s1)
		nop
		sltiu	$v0, $v1, 7
		beqz	$v0, loc_8011441C
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2EFC(at)
		nop
		jr		$v0
		nop
loc_80114080:
		lw		$s2, 0x200($s1)
		nop
		lbu		$v0, 0x99($s2)
		nop
		sb		$v0, 0x16A($s1)
		lbu		$v1, 0x99($s2)
		li		$v0, 3
		beq		$v1, $v0, loc_801140AC
		li		$v0, 6
		bne		$v1, $v0, loc_801140B8
		li		$v0, 1
loc_801140AC:
		li		$v0, 3
		j		loc_8011441C
		sb		$v0, 0x1D2($s1)
loc_801140B8:
		lhu		$v1, 0x9A($s2)
		lw		$s2, 0x198($s1)
		sb		$v0, 6($s1)
		lbu		$v0, 0x218($s1)
		sh		$v1, 0x158($s1)
		lui		$v1, 0xF
		addu	$v0, $v1
		sw		$v0, 0x14C($s1)
		lw		$v0, 0($s2)
		li		$v1, 0xFFFFFFBF
		and		$v0, $v1
		sw		$v0, 0($s2)
		lbu		$v0, 0x239($s1)
		nop
		bnez	$v0, loc_80114120
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80114110
		li		$a0, 0xD
		li		$a0, 0xC
loc_80114110:
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_80114120:
		lw		$a0, 0x38($s1)
		lw		$a1, 0x40($s1)
		li		$v0, 0x12C
		sh		$v0, 0x144($s1)
		li		$v0, 0x32
		sh		$0, 0x146($s1)
		sh		$0, 0x148($s1)
		sh		$0, 0x15A($s1)
		sb		$v0, 0x16B($s1)
		lw		$a2, Player_Pos_x
		lw		$a3, Player_Pos_z
		jal		Direction_ck
		nop
		lb		$a0, 0x16A($s1)
		move	$s0, $v0
		sll		$v1, $a0, 1
		addu	$v1, $a0
		sll		$v1, 2
		subu	$v1, $a0
		sll		$v1, 2
		subu	$v1, $a0
		lw		$a0, 0x198($s1)
		sll		$v1, 2
		jal		Rnd
		addu	$s2, $a0, $v1
		sll		$v0, 3
		addiu	$a0, $v0, 0x1770
		sll		$s0, 16
		sra		$a1, $s0, 16
		addiu	$a2, $s2, 0x48
		jal		Esp_call
		move	$a3, $0
loc_801141A8:
		addiu	$s0, $sp, 0x30
		move	$a0, $s0
		sh		$0, 0x30($sp)
		lhu		$v0, 0x158($s1)
		addiu	$a1, $sp, 0x10
		sh		$0, 0x34($sp)
		jal		RotMatrix
		sh		$v0, 0x32($sp)
		addiu	$a0, $sp, 0x10
		addiu	$a1, $s1, 0x144
		jal		ApplyMatrixSV
		move	$a2, $s0
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Joint_move
		li		$a3, 0x100
		lbu		$a1, 0x16B($s1)
		lh		$v1, 0x30($sp)
		lw		$v0, 0x38($s1)
		lhu		$a0, 0x15A($s1)
		sll		$a1, 24
		sra		$a1, 24
		addu	$v0, $v1
		sw		$v0, 0x38($s1)
		lh		$a2, 0x34($sp)
		lhu		$v0, 0x144($s1)
		lhu		$v1, 0x15A($s1)
		subu	$v0, $a0
		sh		$v0, 0x144($s1)
		lw		$v0, 0x40($s1)
		addu	$v1, $a1
		sh		$v1, 0x15A($s1)
		lh		$v1, 0x144($s1)
		addu	$v0, $a2
		bgez	$v1, loc_8011441C
		sw		$v0, 0x40($s1)
		li		$v0, 6
		j		loc_8011441C
		sb		$v0, 6($s1)
loc_80114248:
		lw		$s2, 0x198($s1)
		li		$v0, 3
		jal		Rnd
		sb		$v0, 6($s1)
		andi	$v0, 0x3F
		addiu	$v0, 0x1E
		sb		$v0, 0x16B($s1)
		lw		$v1, 0x30($s2)
		li		$v0, 0x1000
		sh		$v0, 0x158($s1)
		sh		$v1, 0x15A($s1)
loc_80114274:
		lbu		$v1, 0x16B($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80114290
		sb		$v0, 0x16B($s1)
		li		$v0, 4
		sb		$v0, 6($s1)
loc_80114290:
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Joint_move
		li		$a3, 0x100
		la		$a0, GsIDMATRIX
		lw		$s2, 0x198($s1)
		addiu	$a1, $sp, 0x10
		lw		$v0, 0x18($s2)
		lw		$v1, 0x1C($s2)
		lw		$a2, 0x20($s2)
		lw		$a3, 0x24($s2)
		sw		$v0, 0x10($sp)
		sw		$v1, 0x14($sp)
		sw		$a2, 0x18($sp)
		sw		$a3, 0x1C($sp)
		lw		$v0, 0x28($s2)
		lw		$v1, 0x2C($s2)
		lw		$a2, 0x30($s2)
		lw		$a3, 0x34($s2)
		sw		$v0, 0x20($sp)
		sw		$v1, 0x24($sp)
		sw		$a2, 0x28($sp)
		sw		$a3, 0x2C($sp)
		lh		$a3, 0x158($s1)
		jal		HMatrix
		addiu	$a2, $s2, 0x18
		lh		$v0, 0x15A($s1)
		nop
		sw		$v0, 0x30($s2)
		lh		$v0, 0x158($s1)
		nop
		move	$v1, $v0
		slti	$v0, 0x401
		bnez	$v0, loc_8011441C
		addiu	$v0, $v1, -0x200
		j		loc_8011441C
		sh		$v0, 0x158($s1)
loc_8011432C:
		li		$v0, 5
		sb		$v0, 6($s1)
		li		$v0, 0x14
		sb		$v0, 0x16B($s1)
loc_8011433C:
		lbu		$v1, 0x16B($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80114358
		sb		$v0, 0x16B($s1)
		li		$v0, 6
		sb		$v0, 6($s1)
loc_80114358:
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Joint_move
		li		$a3, 0x100
		la		$a0, GsIDMATRIX
		lw		$s2, 0x198($s1)
		addiu	$a1, $sp, 0x10
		lw		$v0, 0x18($s2)
		lw		$v1, 0x1C($s2)
		lw		$a2, 0x20($s2)
		lw		$a3, 0x24($s2)
		sw		$v0, 0x10($sp)
		sw		$v1, 0x14($sp)
		sw		$a2, 0x18($sp)
		sw		$a3, 0x1C($sp)
		lw		$v0, 0x28($s2)
		lw		$v1, 0x2C($s2)
		lw		$a2, 0x30($s2)
		lw		$a3, 0x34($s2)
		sw		$v0, 0x20($sp)
		sw		$v1, 0x24($sp)
		sw		$a2, 0x28($sp)
		sw		$a3, 0x2C($sp)
		lh		$a3, 0x158($s1)
		jal		HMatrix
		addiu	$a2, $s2, 0x18
		lh		$v0, 0x15A($s1)
		nop
		sw		$v0, 0x30($s2)
		lhu		$v0, 0x158($s1)
		nop
		addiu	$v0, 0x99
		j		loc_8011441C
		sh		$v0, 0x158($s1)
loc_801143E8:
		lw		$s2, 0x198($s1)
		nop
		lw		$v0, 0($s2)
		li		$v1, 0xFFFFFFBF
		and		$v0, $v1
		sw		$v0, 0($s2)
		li		$v0, 0x101
		jal		Rnd
		sw		$v0, 4($s1)
		andi	$v0, 1
		beqz	$v0, loc_8011441C
		li		$v0, 0x201
		sw		$v0, 4($s1)
loc_8011441C:
		lw		$ra, 0x4C($sp)
		lw		$s2, 0x48($sp)
		lw		$s1, 0x44($sp)
		lw		$s0, 0x40($sp)
		addiu	$sp, 0x50
		jr		$ra
		nop