

		addiu	$sp, -0x38
		sw		$s0, 0x20($sp)
		move	$s0, $a0
		sw		$s2, 0x28($sp)
		move	$s2, $a1
		sw		$s3, 0x2C($sp)
		sw		$ra, 0x30($sp)
		sw		$s1, 0x24($sp)
		la		$a1, 0x8010D0A8
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x13($sp)
		swr		$v0, 0x10($sp)
		swl		$v1, 0x17($sp)
		swr		$v1, 0x14($sp)
		lh		$v0, 0x1DA($s0)
		lbu		$a0, 6($s0)
		sll		$v0, 2
		sltiu	$v1, $a0, 5
		lui     at, 0x800D
		addu    at, $v0
		lw      $s1, -0x1EC(at)			;; G_pEnemy
		beqz	$v1, loc_80117220
		move	$s3, $a2
		sll		$v0, $a0, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2E7C(at)		;; jpt_801170DC
		nop
		jr		$v0
		nop
loc_801170E4:
		li		$v0, 1
		jal		Rnd
		sb		$v0, 6($s0)
		li		$a0, 0xF0015
		andi	$v0, 7
		sll		$v0, 8
		lbu		$v1, 0x1D3($s0)
		addu	$v0, $a0
		sw		$v0, 0x14C($s0)
		ori		$v1, 0x80
		sb		$v1, 0x1D3($s0)
loc_80117114:
		move	$a0, $s0
		lw		$a1, 0x38($s1)
		lw		$a2, 0x40($s1)
		jal		Goto00
		li		$a3, 0x10
		move	$a0, $s0
		move	$a1, $s2
		move	$a2, $s3
		lui		$a3, 1
		jal		Joint_move
		ori     $a3, 0x100
		lbu		$v1, 6($s0)
		nop
		addu	$v1, $v0
		j		loc_80117220
		sb		$v1, 6($s0)
loc_80117154:
		li		$v0, 3
		jal		Rnd
		sb		$v0, 6($s0)
		andi	$v0, 7
		addu	$v0, $sp, $v0
		lbu		$v0, 0x10($v0)
		lui		$v1, 7
		addu	$v0, $v1
		sw		$v0, 0x14C($s0)
loc_80117178:
		move	$a0, $s0
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x200
		lbu		$v1, 6($s0)
		lbu		$a0, 0x14E($s0)
		addu	$v1, $v0
		bnez	$a0, loc_801171B0
		sb		$v1, 6($s0)
		move	$a0, $s0
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
loc_801171B0:
		lw		$v0, 0x178($s0)
		nop
		lw		$v0, 0($v0)
		lui		$v1, 1
		and		$v0, $v1
		beqz	$v0, loc_80117220
		li		$v0, 0xC8
		lw		$s0, 0x198($s0)
		sh		$v0, 0x18($sp)
		sh		$0, 0x1A($sp)
		jal		Rnd
		sh		$0, 0x1C($sp)
		li		$a0, 0x17B8
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x18
		jal		Esp_call
		addiu	$a2, $s0, 0x5A8
		j		loc_80117220
		nop
loc_801171FC:
		jal		Rnd
		nop
		andi	$v0, 7
		addu	$v0, $sp, $v0
		lbu		$v0, 0x10($v0)
		li		$v1, 1
		sb		$v1, 6($s0)
		addiu	$v0, 0x300
		sw		$v0, 0x14C($s0)
loc_80117220:
		lw		$ra, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop