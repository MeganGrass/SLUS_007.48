

		addiu	$sp, -0x48
		sw		$s1, 0x34($sp)
		move	$s1, $a0
		sw		$s2, 0x38($sp)
		move	$s2, $a1
		sw		$s3, 0x3C($sp)
		move	$s3, $a2
		sw		$ra, 0x40($sp)
		sw		$s0, 0x30($sp)
		li		$v0, 6
		sb		$v0, 0x18($sp)
		li		$v0, 0xA
		sb		$v0, 0x19($sp)
		la		$a1, 0x8010D1F8
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		lwl		$a0, 0xB($a1)
		lwr		$a0, 8($a1)
		swl		$v0, 0x23($sp)
		swr		$v0, 0x20($sp)
		swl		$v1, 0x27($sp)
		swr		$v1, 0x24($sp)
		swl		$a0, 0x2B($sp)
		swr		$a0, 0x28($sp)
		lw		$v0, 0($s1)
		lbu		$v1, 6($s1)
		lw		$a2, 0x1B4($s1)
		ori		$v0, 4
		sw		$v0, 0($s1)
		sltiu	$v0, $v1, 9
		beqz	$v0, loc_801183A0
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2DFC(at)		;; off_8010D204
		nop
		jr		$v0
		nop
loc_80117FFC:
		lbu		$v0, 5($s1)
		move	$a0, $s1
		addu	$v0, $sp, $v0
		lbu		$v1, 0x16($v0)
		li		$v0, 1
		sb		$v0, 6($s1)
		li		$v0, 0x800
		sh		$v0, 0x158($s1)
		lui		$v0, 0xF
		addu	$v1, $v0
		sw		$v1, 0x14C($s1)
		lw		$a1, 0x38($a2)
		lw		$a2, 0x40($a2)
		jal		Goto00
		li		$a3, 0x800
		lbu		$v0, 5($s1)
		nop
		andi	$v0, 1
		beqz	$v0, loc_8011805C
		lui		$a0, 0x400
		lhu		$v0, 0x76($s1)
		sh		$0, 0x158($s1)
		addiu	$v0, 0x800
		sh		$v0, 0x76($s1)
loc_8011805C:
		ori		$a0, 1
		jal		Snd_se_stad
		addiu	$a1, $s1, 0x38
		lbu		$v0, 0x1C0($s1)
		nop
		ori		$v0, 0x12
		sb		$v0, 0x1C0($s1)
loc_80118078:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s1)
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		j		loc_80118330
		li		$a3, 0x100
loc_801180B8:
		lbu		$v0, 5($s1)
		nop
		addu	$v0, $sp, $v0
		lbu		$v0, 0x16($v0)
		li		$v1, 3
		sb		$v1, 6($s1)
		addiu	$v0, 1
		sw		$v0, 0x14C($s1)
loc_801180D8:
		lbu		$v0, 0x14D($s1)
		nop
		bnez	$v0, loc_80118190
		addiu	$a0, $sp, 0x20
		lbu		$v1, 5($s1)
		lw		$s0, 0x198($s1)
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 0($v0)
		nop
		sh		$v0, 0x10($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 2($v0)
		nop
		sh		$v0, 0x12($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$a0, $v0
		lhu		$v0, 4($a0)
		jal		Rnd
		sh		$v0, 0x14($sp)
		li		$a0, 0xFD0
		addiu	$a2, $s0, 0x24C
		addiu	$a3, $sp, 0x10
		sll		$v0, 1
		lh		$v1, 0x76($s1)
		lbu		$a1, 5($s1)
		addu	$v1, $v0
		andi	$a1, 1
		sll		$a1, 11
		addiu	$a1, -0x100
		jal		Esp_call
		addu	$a1, $v1, $a1
loc_80118190:
		lbu		$v1, 0x14D($s1)
		li		$v0, 3
		bne		$v1, $v0, loc_80118250
		move	$a0, $s1
		addiu	$a0, $sp, 0x20
		lbu		$v1, 5($s1)
		lw		$s0, 0x198($s1)
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 0($v0)
		nop
		sh		$v0, 0x10($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 2($v0)
		nop
		sh		$v0, 0x12($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$a0, $v0
		lhu		$v0, 4($a0)
		jal		Rnd
		sh		$v0, 0x14($sp)
		li		$a0, 0x17D0
		addiu	$a2, $s0, 0x24C
		addiu	$a3, $sp, 0x10
		sll		$v0, 1
		lh		$v1, 0x76($s1)
		lbu		$a1, 5($s1)
		addu	$v1, $v0
		andi	$a1, 1
		sll		$a1, 11
		addiu	$a1, -0x100
		jal		Esp_call
		addu	$a1, $v1, $a1
		move	$a0, $s1
loc_80118250:
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s1)
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($a0)
		lhu		$v1, 0x158($a0)
		li		$a3, 0x100
		subu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($a0)
		j		loc_801183A0
		nop
loc_8011829C:
		lui		$a0, 7
		lbu		$v0, 5($s1)
		ori     $a0, 2
		addu	$v0, $sp, $v0
		lbu		$v0, 0x16($v0)
		li		$v1, 5
		sb		$v1, 6($s1)
		addu	$v0, $a0
		j		loc_801182F4
		sw		$v0, 0x14C($s1)
loc_801182C4:
		li		$v0, 9
		sw		$v0, 0x14C($s1)
		lbu		$v0, 5($s1)
		li		$v1, 7
		andi	$v0, 1
		beqz	$v0, loc_801182F4
		sb		$v1, 6($s1)
		lhu		$v0, 0x76($s1)
		li		$v1, 0x800
		sh		$v1, 0x158($s1)
		addiu	$v0, 0x800
		sh		$v0, 0x76($s1)
loc_801182F4:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s1)
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		li		$a3, 0x200
loc_80118330:
		subu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($s1)
		lbu		$v1, 6($s1)
		nop
		addu	$v1, $v0
		j		loc_801183A0
		sb		$v1, 6($s1)
loc_80118350:
		li		$v0, 1
		la		$v1, Player_Damage_cnt
		sw		$v0, 4($s1)
		lbu		$v0, 0($v1)
		nop
		andi	$v0, 0x7F
		sb		$v0, 0($v1)
		lbu		$v0, 0x1C0($s1)
		nop
		andi	$v0, 0xED
		sb		$v0, 0x1C0($s1)
		lw		$v0, 0($s1)
		li		$v1, 0xFFFFEFFB
		and		$v0, $v1
		sw		$v0, 0($s1)
		lw		$v0, 0($a2)
		nop
		and		$v0, $v1
		sw		$v0, 0($a2)
loc_801183A0:
		lw		$ra, 0x40($sp)
		lw		$s3, 0x3C($sp)
		lw		$s2, 0x38($sp)
		lw		$s1, 0x34($sp)
		lw		$s0, 0x30($sp)
		addiu	$sp, 0x48
		jr		$ra
		nop