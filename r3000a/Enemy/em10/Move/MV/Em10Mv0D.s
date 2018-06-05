

		addiu	$sp, -0x20
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s1, 0x14($sp)
		move	$s1, $a1
		sw		$s2, 0x18($sp)
		sw		$ra, 0x1C($sp)
		lbu		$v1, 6($s0)
		li		$v0, 1
		beq		$v1, $v0, loc_8011149C
		move	$s2, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_801113E4
		nop
		beqz	$v1, loc_801113F8
		lui		$v0, 0xF
		j		loc_801115F0
		nop
loc_801113E4:
		li		$v0, 2
		beq		$v1, $v0, loc_801115D4
		lui		$v0, 2
		j		loc_801115F0
		nop
loc_801113F8:
		ori		$v0, 0xA
		move	$a0, $s0
		lh		$a1, 0x1C4($s0)
		lh		$a2, 0x1C6($s0)
		li		$a3, 0x80
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		jal		Goto00
		sb		$v0, 6($s0)
		lui		$a0, 0xF3FF
		lhu		$v0, 0x21A($s0)
		lw		$v1, 0($s0)
		ori     $a0, $a0, 0xFFFF
		sh		$0, 0x158($s0)
		sb		$0, 0x222($s0)
		sb		$0, 0x16B($s0)
		andi	$v0, 0xFFFB
		ori		$v0, 2
		and		$v1, $a0
		lui		$a0, 0x400
		sh		$v0, 0x21A($s0)
		lbu		$v0, 0x1D3($s0)
		or		$v1, $a0
		sw		$v1, 0($s0)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s0)
		lhu		$v0, 0x10E($s0)
		lbu		$v1, 0x239($s0)
		ori		$v0, 0x2000
		bnez	$v1, loc_8011149C
		sh		$v0, 0x10E($s0)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_8011148C
		li		$a0, 0xB
		li		$a0, 0xA
loc_8011148C:
		jal		Snd_se_enem
		move	$a1, $s0
		li		$v0, 0x96
		sb		$v0, 0x239($s0)
loc_8011149C:
		lhu		$v0, 0x158($s0)
		nop
		addiu	$v0, 1
		sh		$v0, 0x158($s0)
		andi	$v0, 1
		beqz	$v0, loc_801114D0
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Spd_get
		move	$a3, $0
		j		loc_801114E4
		move	$a0, $s0
loc_801114D0:
		lhu		$v0, 0x144($s0)
		nop
		sll		$v0, 16
		sra		$v0, 18
		sh		$v0, 0x144($s0)
loc_801114E4:
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s0
		lbu		$v1, 6($s0)
		move	$a1, $0
		addu	$v1, $v0
		jal		Add_speedXZ
		sb		$v1, 6($s0)
		lbu		$v0, 0x14D($s0)
		nop
		sltiu	$v0, 0x12
		bnez	$v0, loc_801115BC
		move	$a0, $s0
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x100
		sll		$v0, 16
		bnez	$v0, loc_801115F0
		nop
		lw		$v0, 0x1F0($s0)
		nop
		sltiu	$v0, 0x708
		beqz	$v0, loc_801115F0
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_801115F0
		nop
		lbu		$v1, 0x106($s0)
		lbu		$v0, Player_nFloor
		nop
		bne		$v1, $v0, loc_801115F0
		li		$v1, 0x101
		lhu		$v0, 0x10E($s0)
		sw		$v1, 4($s0)
		andi	$v0, 0xFFC0
		ori		$v0, 1
		sh		$v0, 0x10E($s0)
		lbu		$v0, Player_Damage_cnt
		nop
		ori		$v0, 0x80
		sb		$v0, Player_Damage_cnt
		j		loc_801115F0
		nop
loc_801115BC:
		lh		$a1, 0x1C4($a0)
		lh		$a2, 0x1C6($a0)
		jal		Goto00
		li		$a3, 0x10
		j		loc_801115F0
		nop
loc_801115D4:
		ori		$v0, 0x501
		jal		Rnd
		sw		$v0, 4($s0)
		andi	$v0, 0xF
		addiu	$v0, 0x10
		sb		$v0, 0x223($s0)
		sb		$0, 0x16A($s0)
loc_801115F0:
		lw		$ra, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop