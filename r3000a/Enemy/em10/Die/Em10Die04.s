

		addiu	$sp, -0x48
		sw		$s2, 0x28($sp)
		move	$s2, $a0
		sw		$s6, 0x38($sp)
		move	$s6, $a1
		sw		$s7, 0x3C($sp)
		sw		$ra, 0x40($sp)
		sw		$s5, 0x34($sp)
		sw		$s4, 0x30($sp)
		sw		$s3, 0x2C($sp)
		sw		$s1, 0x24($sp)
		sw		$s0, 0x20($sp)
		li		$v0, 1
		sb		$v0, 0x10($sp)
		li		$v0, 2
		sb		$v0, 0x11($sp)
		lbu		$v1, 6($s2)
		li		$v0, 1
		beq		$v1, $v0, loc_80116894
		move	$s7, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_8011667C
		nop
		beqz	$v1, loc_80116690
		nop
		j		loc_801169B4
		nop
loc_8011667C:
		li		$v0, 2
		beq		$v1, $v0, loc_801169B0
		li		$v0, 7
		j		loc_801169B4
		nop
loc_80116690:
		lw		$a0, 0x38($s2)
		lw		$a1, 0x40($s2)
		lbu		$v0, 0x1C0($s2)
		lbu		$v1, 0x1D3($s2)
		ori		$v0, 1
		ori		$v1, 0x80
		sb		$v0, 0x1C0($s2)
		sb		$v1, 0x1D3($s2)
		lw		$a2, Player_Pos_x
		lw		$a3, Player_Pos_z
		jal		Direction_ck
		nop
		jal		Rnd
		sh		$v0, 0x158($s2)
		andi	$v0, 3
		addiu	$s4, $v0, 1
		lbu		$v1, 5($s2)
		li		$v0, 0xC
		beq		$v1, $v0, loc_801167BC
		addiu	$s1, $sp, 0x18
		li		$a0, 0x1FA0
		move	$a3, $s1
		li		$s5, 0x100
		lw		$s3, 0x198($s2)
		li		$v0, 0xFFFFFED4
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$a1, 0x158($s2)
		addiu	$s0, $s3, 0x48
		jal		Esp_call
		move	$a2, $s0
		li		$a0, 0x17D0
		move	$a2, $s0
		li		$v0, 0xFFFFFF9C
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$a1, 0x158($s2)
		jal		Esp_call
		move	$a3, $s1
loc_8011673C:
		jal		Rnd
		addiu	$s4, -1
		sll		$v0, 1
		subu	$v0, $s5, $v0
		jal		Rnd
		sh		$v0, 0x18($sp)
		sll		$v0, 1
		li		$v1, 0x38
		subu	$v1, $v0
		jal		Rnd
		sh		$v1, 0x1A($sp)
		sll		$v0, 1
		subu	$v0, $s5, $v0
		jal		Rnd
		sh		$v0, 0x1C($sp)
		sll		$s0, $v0, 2
		addiu	$s0, 0x600
		lui		$v0, 0x902
		jal		Rnd
		or		$s0, $v0
		move	$a0, $s0
		addiu	$a2, $s3, 0x48
		addiu	$a3, $sp, 0x18
		sll		$v0, 2
		lh		$a1, 0x158($s2)
		addiu	$v0, -0x200
		jal		Esp_call
		subu	$a1, $v0
		beqz	$s4, loc_80116808
		nop
		j		loc_8011673C
		nop
loc_801167BC:
		li		$a0, 0x17D0
		lw		$s3, 0x200($s2)
		move	$a3, $0
		lbu		$t0, 0x99($s3)
		lh		$a1, 0x158($s2)
		sll		$v1, $t0, 24
		sra		$v1, 24
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 2
		subu	$v0, $v1
		sll		$v0, 2
		subu	$v0, $v1
		lw		$v1, 0x198($s2)
		sll		$v0, 2
		sb		$t0, 0x16A($s2)
		addu	$s3, $v1, $v0
		jal		Esp_call
		addiu	$a2, $s3, 0x48
loc_80116808:
		la		$a1, G_Player
		jal		Cdir_ck
		move	$a0, $s2
		nor		$v0, $0, $v0
		andi	$v0, 1
		sb		$v0, 0x16A($s2)
		lhu		$v0, 0x21A($s2)
		lb		$v1, 0x16A($s2)
		andi	$v0, 0xFFFB
		beqz	$v1, loc_80116840
		sh		$v0, 0x21A($s2)
		ori		$v0, 4
		sh		$v0, 0x21A($s2)
loc_80116840:
		lui		$a0, 0xF
		lb		$v0, 0x16A($s2)
		ori     $a0, 0xF00
		addu	$v0, $sp, $v0
		lbu		$v0, 0x10($v0)
		li		$v1, 1
		sb		$v1, 6($s2)
		addu	$v0, $a0
		jal		Rnd
		sw		$v0, 0x14C($s2)
		andi	$v0, 1
		beqz	$v0, loc_80116878
		li		$a0, 0xB
		li		$a0, 0xD
loc_80116878:
		jal		Snd_se_enem
		move	$a1, $s2
		jal		Em_dead_flg_on
		move	$a0, $s2
		li		$v0, 0x190
		sh		$v0, 0x144($s2)
		sh		$0, 0x148($s2)
loc_80116894:
		lbu		$v1, 5($s2)
		li		$v0, 0xC
		beq		$v1, $v0, loc_80116940
		move	$a0, $s2
		lbu		$a1, 0x14D($s2)
		lb		$v0, 0x16A($s2)
		andi	$a0, $a1, 0xFF
		sll		$v1, $v0, 2
		addu	$v1, $v0
		sll		$v1, 1
		addiu	$v0, $v1, 4
		slt		$v0, $a0, $v0
		bnez	$v0, loc_8011693C
		addiu	$v0, $v1, 0x10
		slt		$v0, $a0
		bnez	$v0, loc_8011693C
		andi	$v0, $a1, 1
		beqz	$v0, loc_80116940
		move	$a0, $s2
		lw		$v1, 0x198($s2)
		nop
		lw		$v0, 0x58C($v1)
		nop
		sh		$v0, 0x18($sp)
		lw		$v0, 0x590($v1)
		nop
		addiu	$v0, 0x1F4
		sh		$v0, 0x1A($sp)
		lw		$v0, 0x594($v1)
		nop
		sh		$v0, 0x1C($sp)
		lw		$s3, 0x198($s2)
		jal		Rnd
		nop
		sll		$s0, $v0, 3
		jal		Rnd
		addiu	$s0, 0xFD0
		move	$a0, $s0
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x18
		jal		Esp_call
		addiu	$a2, $s3, 0x48
loc_8011693C:
		move	$a0, $s2
loc_80116940:
		move	$a1, $s6
		move	$a2, $s7
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s2
		lb		$a1, 0x16A($s2)
		lbu		$v1, 6($s2)
		sll		$a1, 11
		addu	$v1, $v0
		jal		Add_speedXZ
		sb		$v1, 6($s2)
		lhu		$v0, 0x144($s2)
		nop
		addiu	$v0, -0x32
		sh		$v0, 0x144($s2)
		sll		$v0, 16
		bgez	$v0, loc_8011698C
		nop
		sh		$0, 0x144($s2)
loc_8011698C:
		lh		$v0, 0x144($s2)
		nop
		bnez	$v0, loc_801169B4
		move	$a0, $s2
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
		j		loc_801169B4
		nop
loc_801169B0:
		sw		$v0, 4($s2)
loc_801169B4:
		lw		$ra, 0x40($sp)
		lw		$s7, 0x3C($sp)
		lw		$s6, 0x38($sp)
		lw		$s5, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x48
		jr		$ra
		nop