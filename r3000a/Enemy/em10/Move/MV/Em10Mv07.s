

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$ra, 0x1C($sp)
		sw		$s2, 0x18($sp)
		lbu		$v1, 6($s0)
		nop
		sltiu	$v0, $v1, 5
		beqz	$v0, loc_80110930
		move	$s2, $a2
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, at, $v0
		lw      $v0, -0x2F6C(at)		;; jpt_801107C4
		nop
		jr		$v0
		nop
loc_801107CC:
		lhu		$v0, 0x21A($s0)
		li		$v1, 0x17
		andi	$v0, 4
		beqz	$v0, loc_801107E8
		sw		$v1, 0x14C($s0)
		li		$v0, 0x16
		sw		$v0, 0x14C($s0)
loc_801107E8:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		li		$v0, 1
		sb		$v0, 6($s0)
		lbu		$v0, 0x1D3($s0)
		lbu		$v1, 0x1C0($s0)
		ori		$v0, 0x80
		ori		$v1, 1
		sb		$v0, 0x1D3($s0)
		sb		$v1, 0x1C0($s0)
loc_8011081C:
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x4000
		bnez	$v0, loc_80110930
		li		$v0, 2
		j		loc_80110930
		sb		$v0, 6($s0)
loc_80110838:
		jal		Rnd
		nop
		li		$v1, 0xF0008
		andi	$v0, 0xF
		sll		$v0, 8
		lhu		$a0, 0x21A($s0)
		addu	$v0, $v1
		andi	$a0, 4
		beqz	$a0, loc_80110884
		sw		$v0, 0x14C($s0)
		jal		Rnd
		nop
		li		$v1, 0xF0009
		andi	$v0, 0xF
		sll		$v0, 8
		addu	$v0, $v1
		sw		$v0, 0x14C($s0)
loc_80110884:
		lbu		$v1, 0x239($s0)
		li		$v0, 3
		bnez	$v1, loc_801108D8
		sb		$v0, 6($s0)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_801108B0
		nop
		j		loc_801108C8
		li		$a0, 0xC
loc_801108B0:
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_801108C8
		li		$a0, 0xA
		li		$a0, 0xB
loc_801108C8:
		jal		Snd_se_enem
		move	$a1, $s0
		li		$v0, 0x96
		sb		$v0, 0x239($s0)
loc_801108D8:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s0)
		nop
		addu	$v1, $v0
		j		loc_80110930
		sb		$v1, 6($s0)
loc_80110900:
		li		$v1, 0x101
		lbu		$v0, 0x1D3($s0)
		lui		$a0, 0xC00
		sw		$v1, 4($s0)
		lbu		$v1, 0x1C0($s0)
		andi	$v0, 0x7F
		sb		$v0, 0x1D3($s0)
		lw		$v0, 0($s0)
		andi	$v1, 0xFE
		sb		$v1, 0x1C0($s0)
		or		$v0, $a0
		sw		$v0, 0($s0)
loc_80110930:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop