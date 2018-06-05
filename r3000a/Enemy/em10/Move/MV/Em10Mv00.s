

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$s2, 0x18($sp)
		sw		$ra, 0x1C($sp)
		lbu		$v1, 6($s0)
		li		$v0, 1
		beq		$v1, $v0, loc_8010E494
		move	$s2, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_8010E43C
		nop
		beqz	$v1, loc_8010E458
		nop
		j		loc_8010E6AC
		nop
loc_8010E43C:
		li		$v0, 2
		beq		$v1, $v0, loc_8010E5A4
		li		$v0, 3
		beq		$v1, $v0, loc_8010E5E0
		move	$a0, $s0
		j		loc_8010E6AC
		nop
loc_8010E458:
		jal		Rnd
		nop
		andi	$v0, 0x1F
		sll		$v0, 8
		lui		$v1, 0xF
		addu	$v0, $v1
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		jal		Rnd
		sb		$v0, 6($s0)
		addiu	$v0, 0x96
		jal		Rnd
		sh		$v0, 0x158($s0)
		addiu	$v0, 0x12C
		sh		$v0, 0x15A($s0)
loc_8010E494:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		lhu		$v1, 0x15A($s0)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8010E500
		sh		$v0, 0x15A($s0)
		lbu		$v0, 0x239($s0)
		nop
		bnez	$v0, loc_8010E4F0
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010E4F0
		li		$a0, 0xB
		jal		Snd_se_enem
		move	$a1, $s0
		li		$v0, 0x96
		sb		$v0, 0x239($s0)
loc_8010E4F0:
		jal		Rnd
		nop
		addiu	$v0, 0x12C
		sh		$v0, 0x15A($s0)
loc_8010E500:
		lbu		$v0, 0x14E($s0)
		nop
		bnez	$v0, loc_8010E51C
		move	$a0, $s0
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
loc_8010E51C:
		lh		$v0, 0x15A($s0)
		nop
		bnez	$v0, loc_8010E544
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_8010E544
		li		$v0, 2
		sb		$v0, 6($s0)
loc_8010E544:
		lh		$v0, 0x158($s0)
		nop
		bnez	$v0, loc_8010E590
		nop
		lw		$v0, 0x1F0($s0)
		nop
		sltiu	$v0, 0x1D4C
		beqz	$v0, loc_8010E580
		nop
		lhu		$v0, 0x154($s0)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_8010E580
		li		$v0, 0x101
		sw		$v0, 4($s0)
loc_8010E580:
		lh		$v0, 0x158($s0)
		nop
		beqz	$v0, loc_8010E6AC
		nop
loc_8010E590:
		lhu		$v0, 0x158($s0)
		nop
		addiu	$v0, -1
		j		loc_8010E6AC
		sh		$v0, 0x158($s0)
loc_8010E5A4:
		li		$v0, 3
		sb		$v0, 6($s0)
		lbu		$v0, 0x218($s0)
		lui		$v1, 0xF
		addu	$v0, $v1
		jal		Rnd
		sw		$v0, 0x14C($s0)
		addiu	$v0, 0x96
		jal		Rnd_area
		sh		$v0, 0x158($s0)
		lhu		$v1, 0x21A($s0)
		sb		$v0, 0x235($s0)
		ori		$v1, 0x400
		sh		$v1, 0x21A($s0)
		move	$a0, $s0
loc_8010E5E0:
		lh		$a1, 0x1C4($s0)
		lh		$a2, 0x1C6($s0)
		jal		Goto00
		li		$a3, 0x10
		move	$a0, $s0
		lw		$a1, 0x108($s0)
		lw		$a2, 0x17C($s0)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s0
		lw		$a1, 0x108($s0)
		lw		$a2, 0x17C($s0)
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s0
		jal		Add_speedXZ
		move	$a1, $0
		lhu		$v0, 0x158($s0)
		nop
		addiu	$v0, -1
		sh		$v0, 0x158($s0)
		sll		$v0, 16
		bnez	$v0, loc_8010E650
		nop
		lhu		$v0, 0x21A($s0)
		sb		$0, 6($s0)
		andi	$v0, 0xFBFF
		sh		$v0, 0x21A($s0)
loc_8010E650:
		lw		$v0, 0x1F0($s0)
		nop
		sltiu	$v0, 0xBB8
		beqz	$v0, loc_8010E674
		li		$v1, 0x101
		lhu		$v0, 0x21A($s0)
		sw		$v1, 4($s0)
		andi	$v0, 0xFBFF
		sh		$v0, 0x21A($s0)
loc_8010E674:
		lw		$v0, 0x1F0($s0)
		nop
		sltiu	$v0, 0x1D4C
		beqz	$v0, loc_8010E6AC
		nop
		lhu		$v0, 0x154($s0)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_8010E6AC
		li		$v1, 0x101
		lhu		$v0, 0x21A($s0)
		sw		$v1, 4($s0)
		andi	$v0, 0xFBFF
		sh		$v0, 0x21A($s0)
loc_8010E6AC:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop