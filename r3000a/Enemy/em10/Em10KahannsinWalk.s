

		addiu	$sp, -0x88
		sw		$s2, 0x80($sp)
		move	$s2, $a0
		sw		$s0, 0x78($sp)
		move	$s0, $a1
		sw		$s1, 0x7C($sp)
		move	$s1, $a2
		addiu	$a3, $sp, 0x18
		la		$a2, 0x8010D248
		addiu	$t0, $a2, 0x30
		sw		$ra, 0x84($sp)
loc_80118804:
		lw		$v0, 0($a2)
		lw		$v1, 4($a2)
		lw		$a0, 8($a2)
		lw		$a1, 0xC($a2)
		sw		$v0, 0($a3)
		sw		$v1, 4($a3)
		sw		$a0, 8($a3)
		sw		$a1, 0xC($a3)
		addiu	$a2, 0x10
		bne		$a2, $t0, loc_80118804
		addiu	$a3, 0x10
		lhu		$v0, 0x21A($s2)
		nop
		andi	$v0, 1
		beqz	$v0, loc_80118CB4
		nop
		lbu		$v1, 0x219($s2)
		nop
		sltiu	$v0, $v1, 9
		beqz	$v0, loc_80118C0C
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2D84(at)		;; jpt_80118868
		nop
		jr		$v0
		nop
loc_80118870:
		lbu		$v1, 0x218($s2)
		lw		$a0, 0x198($s2)
		li		$v0, 7
		sb		$0, 0x21D($s2)
		sb		$v0, 0x21E($s2)
		sb		$v1, 0x21C($s2)
		lw		$v0, 0x108($a0)
		lhu		$v1, 0x76($s2)
		sw		$v0, 0x130($s2)
		lw		$a0, 0x110($a0)
		li		$v0, 1
		sb		$v0, 0x219($s2)
		sh		$v1, 0x220($s2)
		jal		Rnd
		sw		$a0, 0x138($s2)
		addiu	$a0, $s2, 0x224
		move	$a1, $0
		li		$a2, 0x2BC01F4
		move	$a3, $0
		andi	$v0, 0x1F
		addiu	$v0, 0xA
		sb		$v0, 0x21F($s2)
		addiu	$v0, $s2, 0x130
		jal		Kage_work_set
		sw		$v0, 0x10($sp)
loc_801188D8:
		lbu		$v0, 0x21C($s2)
		nop
		sb		$v0, 0x18($sp)
		lbu		$v0, 0x21D($s2)
		nop
		sb		$v0, 0x19($sp)
		lbu		$v0, 0x21E($s2)
		addiu	$a0, $sp, 0x18
		sb		$v0, 0x1A($sp)
		lw		$a1, 0x108($s2)
		lw		$a2, 0x17C($s2)
		jal		Joint_move_p
		li		$a3, 0x200
		lbu		$v0, 0x18($sp)
		addiu	$s1, $sp, 0x48
		sb		$v0, 0x21C($s2)
		lbu		$v0, 0x19($sp)
		move	$a0, $s1
		sb		$v0, 0x21D($s2)
		lbu		$v0, 0x1A($sp)
		addiu	$s0, $sp, 0x58
		sb		$v0, 0x21E($s2)
		sh		$0, 0x48($sp)
		lhu		$v0, 0x220($s2)
		move	$a1, $s0
		sh		$0, 0x4C($sp)
		jal		RotMatrix
		sh		$v0, 0x4A($sp)
		jal		Rnd
		nop
		move	$a0, $s0
		move	$a1, $s1
		addiu	$a2, $sp, 0x50
		andi	$v0, 7
		addiu	$v0, 0xA
		sh		$v0, 0x48($sp)
		jal		ApplyMatrixSV
		sh		$0, 0x4A($sp)
		lh		$v1, 0x50($sp)
		lw		$v0, 0x130($s2)
		lbu		$a0, 0x21F($s2)
		addu	$v0, $v1
		sw		$v0, 0x130($s2)
		lh		$a1, 0x54($sp)
		lw		$v0, 0x138($s2)
		addiu	$v1, $a0, 0xFF
		sb		$v1, 0x21F($s2)
		addu	$v0, $a1
		bnez	$a0, loc_80118C0C
		sw		$v0, 0x138($s2)
		li		$v0, 2
		j		loc_80118C0C
		sb		$v0, 0x219($s2)
loc_801189AC:
		li		$v0, 1
		sb		$v0, 0x21C($s2)
		li		$v0, 7
		sb		$v0, 0x21E($s2)
		li		$v0, 3
		sb		$0, 0x21D($s2)
		sb		$v0, 0x219($s2)
loc_801189C8:
		addiu	$a0, $sp, 0x18
		lbu		$v0, 0x21C($s2)
		move	$a1, $s0
		sb		$v0, 0x18($sp)
		lbu		$v0, 0x21D($s2)
		move	$a2, $s1
		sb		$v0, 0x19($sp)
		lbu		$v0, 0x21E($s2)
		li		$a3, 0x200
		jal		Joint_move_p
		sb		$v0, 0x1A($sp)
		lbu		$v1, 0x219($s2)
		nop
		addu	$v1, $v0
		sb		$v1, 0x219($s2)
		lbu		$v0, 0x18($sp)
		addiu	$s1, $sp, 0x48
		sb		$v0, 0x21C($s2)
		lbu		$v0, 0x19($sp)
		move	$a0, $s1
		sb		$v0, 0x21D($s2)
		lbu		$v0, 0x1A($sp)
		addiu	$s0, $sp, 0x58
		sb		$v0, 0x21E($s2)
		sh		$0, 0x48($sp)
		lhu		$v0, 0x220($s2)
		move	$a1, $s0
		sh		$0, 0x4C($sp)
		jal		RotMatrix
		sh		$v0, 0x4A($sp)
		move	$a0, $s0
		move	$a1, $s1
		addiu	$a2, $sp, 0x50
		li		$v0, 0x1E
		sh		$v0, 0x48($sp)
		jal		ApplyMatrixSV
		sh		$0, 0x4A($sp)
		lh		$v1, 0x50($sp)
		lw		$v0, 0x130($s2)
		nop
		addu	$v0, $v1
		sw		$v0, 0x130($s2)
		lh		$v1, 0x54($sp)
		lw		$v0, 0x138($s2)
		nop
		addu	$v0, $v1
		j		loc_80118C0C
		sw		$v0, 0x138($s2)
loc_80118A88:
		lw		$v1, 0x198($s2)
		nop
		lw		$v0, 0xAC($v1)
		nop
		ori		$v0, 0x40
		sw		$v0, 0xAC($v1)
		li		$v0, 5
		sb		$v0, 0x219($s2)
		li		$v0, 0x16
		sb		$v0, 0x21C($s2)
		li		$v0, 7
		sb		$0, 0x21D($s2)
		jal		Rnd
		sb		$v0, 0x21E($s2)
		li		$a2, 0xBFBF10
		andi	$v0, 0x1F
		addiu	$v0, 0xA
		lw		$a0, 0x224($s2)
		lui		$a1, 0xFF00
		sb		$v0, 0x21F($s2)
		lw		$v0, 0x1C($a0)
		lw		$v1, 0x44($a0)
		and		$v0, $a1
		or		$v0, $a2
		and		$v1, $a1
		or		$v1, $a2
		sw		$v0, 0x1C($a0)
		jal		Rnd
		sw		$v1, 0x44($a0)
		andi	$v0, 1
		bnez	$v0, loc_80118B9C
		li		$v0, 8
loc_80118B0C:
		addiu	$a0, $sp, 0x18
		lbu		$v0, 0x21C($s2)
		move	$a1, $s0
		sb		$v0, 0x18($sp)
		lbu		$v0, 0x21D($s2)
		move	$a2, $s1
		sb		$v0, 0x19($sp)
		lbu		$v0, 0x21E($s2)
		li		$a3, 0x200
		jal		Joint_move_p
		sb		$v0, 0x1A($sp)
		lbu		$v1, 0x219($s2)
		nop
		addu	$v1, $v0
		sb		$v1, 0x219($s2)
		lbu		$v0, 0x18($sp)
		nop
		sb		$v0, 0x21C($s2)
		lbu		$v0, 0x19($sp)
		nop
		sb		$v0, 0x21D($s2)
		lbu		$v0, 0x1A($sp)
		j		loc_80118C0C
		sb		$v0, 0x21E($s2)
loc_80118B6C:
		jal		Rnd
		nop
		andi	$v0, 0x1F
		addiu	$v0, 0x3C
		sb		$v0, 0x21F($s2)
		li		$v0, 7
		jal		Rnd
		sb		$v0, 0x219($s2)
		andi	$v0, 0xF
		bnez	$v0, loc_80118BA8
		addiu	$a0, $sp, 0x18
		li		$v0, 8
loc_80118B9C:
		j		loc_80118CB4
		sb		$v0, 0x219($s2)
loc_80118BA4:
		addiu	$a0, $sp, 0x18
loc_80118BA8:
		move	$a1, $s0
		move	$a2, $s1
		lbu		$v0, 0x21C($s2)
		li		$a3, 0x200
		sb		$0, 0x19($sp)
		sb		$0, 0x1A($sp)
		jal		Joint_move_p
		sb		$v0, 0x18($sp)
		lbu		$v1, 0x21F($s2)
		nop
		addiu	$v0, $v1, 0xFF
		bnez	$v1, loc_80118C0C
		sb		$v0, 0x21F($s2)
		li		$v0, 5
		j		loc_80118C0C
		sb		$v0, 0x219($s2)
loc_80118BE8:
		addiu	$a0, $sp, 0x18
		move	$a1, $s0
		move	$a2, $s1
		lbu		$v0, 0x21C($s2)
		li		$a3, 0x200
		sb		$0, 0x19($sp)
		sb		$0, 0x1A($sp)
		jal		Joint_move_p
		sb		$v0, 0x18($sp)
loc_80118C0C:
		lbu		$v0, 0x219($s2)
		nop
		sltiu	$v0, 4
		beqz	$v0, loc_80118C98
		addiu	$a0, $s2, 0x74
		addiu	$s0, $s2, 0x24
		lhu		$s1, 0x76($s2)
		lhu		$v0, 0x220($s2)
		move	$a1, $s0
		jal		RotMatrix
		sh		$v0, 0x76($s2)
		move	$a0, $s0
		addiu	$a1, $sp, 0x20
		addiu	$a2, $sp, 0x58
		jal		CompM
		sh		$s1, 0x76($s2)
		lw		$v0, 0x58($sp)
		lh		$v1, 0x232($s2)
		sw		$v0, 0x11C($s2)
		lw		$v0, 0x5C($sp)
		nop
		sw		$v0, 0x120($s2)
		lw		$v0, 0x60($sp)
		nop
		sw		$v0, 0x124($s2)
		lw		$v0, 0x64($sp)
		nop
		sw		$v0, 0x128($s2)
		lw		$v0, 0x68($sp)
		nop
		sw		$v0, 0x12C($s2)
		lw		$v0, 0x38($sp)
		nop
		addu	$v0, $v1
		sw		$v0, 0x134($s2)
loc_80118C98:
		lw		$a0, 0x224($s2)
		lh		$a1, 0x1C2($s2)
		lw		$a3, 0($s2)
		lh		$a2, 0x220($s2)
		andi	$a3, 0x400
		jal		MulKage
		srl		$a3, 9
loc_80118CB4:
		lw		$ra, 0x84($sp)
		lw		$s2, 0x80($sp)
		lw		$s1, 0x7C($sp)
		lw		$s0, 0x78($sp)
		addiu	$sp, 0x88
		jr		$ra
		nop