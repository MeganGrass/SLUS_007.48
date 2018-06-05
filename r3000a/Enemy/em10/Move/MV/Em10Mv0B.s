

		addiu	$sp, -0x38
		sw		$s1, 0x24($sp)
		move	$s1, $a0
		sw		$s2, 0x28($sp)
		move	$s2, $a1
		sw		$s3, 0x2C($sp)
		move	$s3, $a2
		sw		$ra, 0x30($sp)
		sw		$s0, 0x20($sp)
		la		$a1, 0x8010D0D8
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		nop
		swl		$v0, 0x13($sp)
		swr		$v0, 0x10($sp)
		la		$a1, 0x8010D044
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lb		$v1, 4($a1)
		lb		$a0, 5($a1)
		swl		$v0, 0x1B($sp)
		swr		$v0, 0x18($sp)
		sb		$v1, 0x1C($sp)
		sb		$a0, 0x1D($sp)
		lbu		$v1, 6($s1)
		li		$v0, 1
		beq		$v1, $v0, loc_80110FB8
		addiu	$s0, $sp, 0x10
		slti	$v0, $v1, 2
		beqz	$v0, loc_80110EDC
		nop
		beqz	$v1, loc_80110EF0
		nop
		j		loc_80111154
		nop
loc_80110EDC:
		li		$v0, 2
		beq		$v1, $v0, loc_80111144
		li		$v1, 0x101
		j		loc_80111154
		nop
loc_80110EF0:
		jal		Rnd
		nop
		andi	$v0, 1
		jal		Rnd
		sb		$v0, 0x16A($s1)
		andi	$v0, 3
		sll		$v0, 8
		lb		$v1, 0x16B($s1)
		lb		$a0, 0x16A($s1)
		sll		$v1, 1
		addu	$v1, $s0
		addu	$v1, $a0
		lbu		$v1, 0($v1)
		lb		$a0, 0x16B($s1)
		addu	$v0, $v1
		beqz	$a0, loc_80110F58
		sw		$v0, 0x14C($s1)
		lb		$v0, 0x16A($s1)
		nop
		beqz	$v0, loc_80110F5C
		li		$v0, 1
		jal		Rnd
		nop
		andi	$v0, 3
		addiu	$v0, 0x14
		sb		$v0, 0x14D($s1)
loc_80110F58:
		li		$v0, 1
loc_80110F5C:
		sb		$v0, 6($s1)
		li		$v0, 0x190
		sh		$v0, 0x144($s1)
		lb		$v0, 0x16B($s1)
		lhu		$v1, 0x21A($s1)
		sh		$0, 0x148($s1)
		sh		$0, 0x15A($s1)
		sll		$v0, 11
		andi	$v1, 0xFFEF
		sh		$v0, 0x158($s1)
		lbu		$v0, 0x239($s1)
		ori		$v1, 8
		bnez	$v0, loc_80110FB8
		sh		$v1, 0x21A($s1)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80110FB8
		li		$a0, 0xC
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_80110FB8:
		lh		$a1, 0x158($s1)
		jal		Add_speedXZ
		move	$a0, $s1
		lhu		$v0, 0x144($s1)
		nop
		addiu	$v0, -0x1E
		sh		$v0, 0x144($s1)
		sll		$v0, 16
		bgez	$v0, loc_80110FF0
		nop
		lhu		$v0, 0x15A($s1)
		sh		$0, 0x144($s1)
		addiu	$v0, 1
		sh		$v0, 0x15A($s1)
loc_80110FF0:
		lh		$v1, 0x15A($s1)
		li		$v0, 1
		bne		$v1, $v0, loc_80111120
		move	$a0, $s1
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 7
		beqz	$s0, loc_8011111C
		li		$v0, 0x501
		jal		Rnd
		sw		$v0, 4($s1)
		andi	$v0, 0xF
		addiu	$v0, 0x10
		sb		$v0, 0x223($s1)
		lhu		$v0, 0x21A($s1)
		lbu		$v1, 0x16B($s1)
		andi	$v0, 0xFFF7
		sh		$v0, 0x21A($s1)
		lhu		$v0, 0x21A($s1)
		sb		$v1, 0x16A($s1)
		lb		$v1, 0x16A($s1)
		andi	$v0, 0xFFFB
		beqz	$v1, loc_80111068
		sh		$v0, 0x21A($s1)
		ori		$v0, 4
		sh		$v0, 0x21A($s1)
loc_80111068:
		li		$a2, 0xF3FFFFFF
		lb		$a0, 0x16A($s1)
		lw		$v1, 0($s1)
		addu	$v0, $sp, $a0
		lbu		$a1, 0x18($v0)
		li		$v0, 1
		sb		$v0, 6($s1)
		lhu		$v0, 0x21A($s1)
		and		$v1, $a2
		ori		$v0, 0x202
		sh		$v0, 0x21A($s1)
		lui		$v0, 0x400
		or		$v1, $v0
		lbu		$v0, 0x1D3($s1)
		sb		$0, 0x222($s1)
		sb		$0, 0x16B($s1)
		sw		$v1, 0($s1)
		lhu		$v1, 0x10E($s1)
		ori		$v0, 0x80
		ori		$v1, 0x2000
		sb		$v0, 0x1D3($s1)
		sll		$v0, $a0, 2
		addu	$v0, $a0
		addiu	$v0, 0xA
		sll		$v0, 8
		sh		$v1, 0x10E($s1)
		lui		$v1, 0xF
		addu	$a1, $v1
		lbu		$v1, 0x239($s1)
		addu	$v0, $a1
		bnez	$v1, loc_80111114
		sw		$v0, 0x14C($s1)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80111104
		li		$a0, 0xD
		li		$a0, 0xC
loc_80111104:
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_80111114:
		j		loc_80111154
		sh		$0, 0x158($s1)
loc_8011111C:
		move	$a0, $s1
loc_80111120:
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s1)
		nop
		addu	$v1, $v0
		j		loc_80111154
		sb		$v1, 6($s1)
loc_80111144:
		lhu		$v0, 0x21A($s1)
		sw		$v1, 4($s1)
		andi	$v0, 0xFFF7
		sh		$v0, 0x21A($s1)
loc_80111154:
		lw		$ra, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop