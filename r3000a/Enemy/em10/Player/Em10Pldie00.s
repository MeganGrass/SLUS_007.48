

		addiu	$sp, -0x38
		sw		$s2, 0x28($sp)
		move	$s2, $a0
		sw		$s1, 0x24($sp)
		move	$s1, $a1
		sw		$ra, 0x30($sp)
		sw		$s3, 0x2C($sp)
		sw		$s0, 0x20($sp)
		li		$v0, 0xD
		sb		$v0, 0x18($sp)
		li		$v0, 0xF
		sb		$v0, 0x19($sp)
		lbu		$v1, 6($s2)
		nop
		sltiu	$v0, $v1, 7
		beqz	$v0, loc_801187B4
		move	$s3, $a2
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2DD4(at)		;; jpt_801184BC
		nop
		jr		$v0
		nop
loc_801184C4:
		lbu		$v0, 5($s2)
		lui		$a0, 0xF
		addu	$v0, $sp, $v0
		lbu		$v1, 0x18($v0)
		li		$v0, 1
		sb		$v0, 6($s2)
		li		$v0, 0x800
		sh		$v0, 0x158($s2)
		lbu		$v0, 5($s2)
		addu	$v1, $a0
		andi	$v0, 1
		beqz	$v0, loc_801184FC
		sw		$v1, 0x14C($s2)
		sh		$0, 0x158($s2)
loc_801184FC:
		li		$a0, 0x4030001
		lbu		$v0, 0x1C0($s2)
		addiu	$a1, $s2, 0x38
		ori		$v0, 1
		jal		Snd_se_stad
		sb		$v0, 0x1C0($s2)
		li		$a0, 0x21
		li		$a1, 0x32
		lbu		$v0, 0x1C0($s2)
		li		$a2, 0x96
		ori		$v0, 0x12
		sb		$v0, 0x1C0($s2)
		lw		$s0, G_System_flg
		move	$a3, $0
		andi	$s0, 0x800
		sltu	$s0, $0, $s0
		negu	$s0, $s0
		jal		sub_800395B8
		andi	$s0, 0xF
		li		$a0, 8
		li		$a1, 0xFA
		andi	$s0, 0xFF
		li		$a2, 0x21
		jal		sub_80039514
		subu	$a2, $s0
		li		$a0, 0x32
		li		$a1, 0x41
		jal		sub_8003947C
		subu	$a1, $s0
		li		$a0, 6
		li		$a1, 0xFA
		li		$a2, 0x4B
		jal		sub_80039514
		subu	$a2, $s0
		li		$a0, 6
		li		$a1, 0xFA
		li		$a2, 0x56
		jal		sub_80039514
		subu	$a2, $s0
		li		$a0, 6
		li		$a1, 0xFA
		li		$a2, 0x73
		jal		sub_80039514
		subu	$a2, $s0
		li		$a0, 0x5A
		li		$a1, 0xFA
		move	$a2, $0
		li		$a3, 0x79
		jal		sub_800395B8
		subu	$a3, $s0
loc_801185CC:
		move	$a0, $s2
		move	$a1, $s1
		move	$a2, $s3
		lhu		$v0, 0x76($s2)
		lhu		$v1, 0x158($s2)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s2)
		move	$a0, $s2
		move	$a1, $s1
		move	$a2, $s3
		lhu		$v0, 0x76($s2)
		lhu		$v1, 0x158($s2)
		li		$a3, 0x100
		subu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($s2)
		lbu		$v1, 6($s2)
		lbu		$a0, 0x14D($s2)
		addu	$v1, $v0
		addiu	$v0, $a0, -0x29
		sltiu	$v0, 0x3A
		beqz	$v0, loc_80118670
		sb		$v1, 6($s2)
		andi	$v0, $a0, 1
		bnez	$v0, loc_80118670
		nop
		lw		$s1, 0x198($s2)
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		jal		Rnd
		sh		$0, 0x14($sp)
		sll		$s0, $v0, 3
		jal		Rnd
		addiu	$s0, 0xBD0
		move	$a0, $s0
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x10
		jal		Esp_call
		addiu	$a2, $s1, 0x5A8
loc_80118670:
		lbu		$v0, 0x14D($s2)
		nop
		addiu	$v0, -0x64
		sltiu	$v0, 5
		beqz	$v0, loc_801187B4
		nop
		lw		$s0, 0x198($s2)
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		jal		Rnd
		sh		$0, 0x14($sp)
		li		$a0, 0x17D0
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x10
		jal		Esp_call
		addiu	$a2, $s0, 0x5A8
		lw		$s0, 0x198($s2)
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		jal		Rnd
		sh		$0, 0x14($sp)
		li		$a0, 0x1BD0
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x10
		jal		Esp_call
		addiu	$a2, $s0, 0x5A8
		lui     $a1, 0x20
		ori     $a1, 0x2030
		lw		$a0, 0x198($s2)
		lui		$a2, 0x10
		lw		$v1, 0x560($a0)
		li		$v0, 0x40
		sw		$v0, 0x5F8($a0)
		sw		$a1, 0x5FC($a0)
		ori		$v1, 0x80
		sw		$v1, 0x560($a0)
		lw		$a0, 0x198($s2)
		ori     $a2, 0x1030
		lw		$v1, 0($a0)
		li		$v0, 0x80
		sw		$v0, 0x98($a0)
		sw		$a2, 0x9C($a0)
		ori		$v1, 0x80
		j		loc_801187B4
		sw		$v1, 0($a0)
loc_80118724:
		li		$v0, 3
		sb		$v0, 6($s2)
		lbu		$v0, 0x14C($s2)
		li		$v1, 0xFFFF8000
		sb		$0, 0x14D($s2)
		sh		$v1, 0x156($s2)
		addiu	$v0, 1
		sb		$v0, 0x14C($s2)
loc_80118744:
		move	$a0, $s2
		move	$a1, $s1
		move	$a2, $s3
		li		$a3, 0x100
		li		$v0, 0xA
		jal		Joint_move
		sb		$v0, 0x14E($s2)
		lbu		$v1, 6($s2)
		nop
		addu	$v1, $v0
		j		loc_801187B4
		sb		$v1, 6($s2)
loc_80118774:
		li		$v0, 5
		jal		Rnd
		sb		$v0, 6($s2)
		andi	$v0, 0x1F
		addiu	$v0, 3
		sb		$v0, 0x16B($s2)
loc_8011878C:
		lbu		$v1, 0x16B($s2)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_801187B4
		sb		$v0, 0x16B($s2)
		li		$v0, 3
		j		loc_801187B4
		sb		$v0, 6($s2)
loc_801187AC:
		li		$v0, 7
		sw		$v0, 4($s2)
loc_801187B4:
		lw		$ra, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop