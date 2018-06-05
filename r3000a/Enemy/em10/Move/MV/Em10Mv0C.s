

		addiu	$sp, -0x28
		sw		$s1, 0x1C($sp)
		move	$s1, $a0
		sw		$ra, 0x20($sp)
		sw		$s0, 0x18($sp)
		li		$a1, 0x8010D0DC
		lb		$v0, 0($a1)
		lb		$v1, 1($a1)
		lb		$a0, 2($a1)
		sb		$v0, 0x10($sp)
		sb		$v1, 0x11($sp)
		sb		$a0, 0x12($sp)
		lhu		$v0, 0x1D6($s1)
		lbu		$v1, 6($s1)
		ori		$v0, 0x4000
		sh		$v0, 0x1D6($s1)
		sltiu	$v0, $v1, 5
		beqz	$v0, loc_8011137C
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, at, $v0
		lw      $v0, -0x2F1C(at)		;; jpt_801111DC
		nop
		jr		$v0
		nop
loc_801111E4:
		jal		Rnd
		nop
		li		$v1, 1
		andi	$v0, 3
		sll		$v0, 8
		sb		$v1, 6($s1)
		lbu		$v1, 0x218($s1)
		lui		$a0, 0xF
		sb		$0, 0x16A($s1)
		addu	$v1, $a0
		lhu		$a0, 0x1D4($s1)
		addu	$v0, $v1
		andi	$a0, 0x4000
		beqz	$a0, loc_80111234
		sw		$v0, 0x14C($s1)
		jal		Rnd
		nop
		andi	$v0, 1
		addiu	$v0, 1
		sb		$v0, 0x16A($s1)
loc_80111234:
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s1
		lhu		$a1, 0x1D4($s1)
		li		$a2, 0x20
		jal		Goto01_ck
		andi	$a1, 0xFFF
		lhu		$v1, 0x76($s1)
		nop
		addu	$v1, $v0
		sll		$v0, 16
		bnez	$v0, loc_8011137C
		sh		$v1, 0x76($s1)
		li		$v0, 2
		j		loc_8011137C
		sb		$v0, 6($s1)
loc_80111280:
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$s0, 7
		sll		$s0, 8
		lb		$v1, 0x16A($s1)
		andi	$v0, 1
		addu	$v1, $sp, $v1
		lbu		$a0, 0x10($v1)
		li		$v1, 3
		sb		$v1, 6($s1)
		addu	$a0, $v0
		lui		$v0, 0xF
		addu	$a0, $v0
		addu	$s0, $a0
		jal		Rnd
		sw		$s0, 0x14C($s1)
		andi	$v0, 0x7F
		addiu	$v0, 0x3C
		sh		$v0, 0x158($s1)
loc_801112D4:
		move	$a0, $s1
		lw		$a1, 0x190($s1)
		lw		$a2, 0x194($s1)
		jal		Joint_move
		li		$a3, 0x100
		beqz	$v0, loc_8011132C
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$s0, 7
		lb		$v1, 0x16A($s1)
		sll		$s0, 8
		addu	$v1, $sp, $v1
		lbu		$v1, 0x10($v1)
		andi	$v0, 1
		addu	$v1, $v0
		lui		$v0, 0xF
		addu	$v1, $v0
		addu	$s0, $v1
		sw		$s0, 0x14C($s1)
loc_8011132C:
		lhu		$v0, 0x1D6($s1)
		lw		$v1, 0x178($s1)
		andi	$a0, $v0, 0x7FFF
		sh		$a0, 0x1D6($s1)
		lw		$v0, 0($v1)
		lui		$v1, 1
		and		$v0, $v1
		beqz	$v0, loc_80111354
		ori		$v0, $a0, 0x8000
		sh		$v0, 0x1D6($s1)
loc_80111354:
		lhu		$v1, 0x158($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8011137C
		sh		$v0, 0x158($s1)
		li		$v0, 4
		j		loc_8011137C
		sb		$v0, 6($s1)
loc_80111374:
		li		$v0, 0x101
		sw		$v0, 4($s1)
loc_8011137C:
		lw		$ra, 0x20($sp)
		lw		$s1, 0x1C($sp)
		lw		$s0, 0x18($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop