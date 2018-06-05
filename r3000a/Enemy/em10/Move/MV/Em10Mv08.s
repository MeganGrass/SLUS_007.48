

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$s2, 0x18($sp)
		sw		$ra, 0x1C($sp)
		lbu		$v1, 6($s0)
		li		$v0, 1
		beq		$v1, $v0, loc_80110A08
		move	$s2, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_8011099C
		nop
		beqz	$v1, loc_801109B0
		lui		$v0, 0xF
		j		loc_80110A54
		nop
loc_8011099C:
		li		$v0, 2
		beq		$v1, $v0, loc_80110A44
		li		$v1, 0x801
		j		loc_80110A54
		nop
loc_801109B0:
		ori		$v0, 0x18
		la		$a0, G_Player
		move	$a1, $s1
		move	$a2, $s2
		move	$a3, $0
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		jal		Set_base_pos
		sb		$v0, 6($s0)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_801109F0
		li		$a0, 0xB
		li		$a0, 0xA
loc_801109F0:
		jal		Snd_se_enem
		move	$a1, $s0
		lbu		$v0, 0x1D3($s0)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s0)
loc_80110A08:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Null_pos_set
		move	$a3, $0
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s0)
		nop
		addu	$v1, $v0
		j		loc_80110A54
		sb		$v1, 6($s0)
loc_80110A44:
		lhu		$v0, 0x10E($s0)
		sw		$v1, 4($s0)
		ori		$v0, 0x4000
		sh		$v0, 0x10E($s0)
loc_80110A54:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop