

		addiu	$sp, -0x48
		sw		$s4, 0x38($sp)
		move	$s4, $a0
		sw		$s5, 0x3C($sp)
		move	$s5, $a1
		sw		$s6, 0x40($sp)
		sw		$ra, 0x44($sp)
		sw		$s3, 0x34($sp)
		sw		$s2, 0x30($sp)
		sw		$s1, 0x2C($sp)
		sw		$s0, 0x28($sp)
		li		$v0, 0xFFFFFE3E
		sh		$v0, 0x10($sp)
		sh		$0, 0x12($sp)
		lbu		$v1, 6($s4)
		li		$v0, 1
		beq		$v1, $v0, loc_80112F1C
		move	$s6, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_80112C24
		nop
		beqz	$v1, loc_80112C38
		lui		$a1, 3
		j		loc_801130FC
		nop
loc_80112C24:
		li		$v0, 2
		beq		$v1, $v0, loc_80113010
		li		$v0, 0x101
		j		loc_801130FC
		nop
loc_80112C38:
		ori		$a1, 4
		move	$a0, $s4
		lhu		$v1, 0x1D0($s4)
		li		$v0, 1
		sb		$v0, 6($s4)
		li		$v0, 0xA
		sh		$v0, 0x15A($s4)
		lhu		$v0, 0x1D0($s4)
		andi	$v1, 0x20
		sltu	$v1, $0, $v1
		subu	$a1, $v1
		srl		$v0, 4
		andi	$v0, 2
		addiu	$v1, $sp, 0x10
		addu	$v0, $v1
		sw		$a1, 0x14C($s4)
		lhu		$v0, 0($v0)
		move	$a1, $0
		sh		$0, 0x148($s4)
		jal		Add_speedXZ
		sh		$v0, 0x144($s4)
		move	$a0, $s4
		lh		$a1, 0x1C4($s4)
		lh		$a2, 0x1C6($s4)
		jal		Goto00
		li		$a3, 0x10
		lbu		$v0, 0x239($s4)
		nop
		bnez	$v0, loc_80112CDC
		move	$t0, $0
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80112CC8
		li		$a0, 0xD
		li		$a0, 0xC
loc_80112CC8:
		jal		Snd_se_enem
		move	$a1, $s4
		li		$v0, 0x96
		sb		$v0, 0x239($s4)
		move	$t0, $0
loc_80112CDC:
		lhu		$v0, 0x1D0($s4)
		li		$v1, 1
		andi	$v0, 0x20
		beqz	$v0, loc_80112CFC
		sb		$v1, 0x16A($s4)
		li		$t0, 0x800
		li		$v0, 0xFFFFFFFF
		sb		$v0, 0x16A($s4)
loc_80112CFC:
		lbu		$v1, 0x1D2($s4)
		li		$v0, 0xAAAAAAAB
		multu	$v1, $v0
		mfhi	$t1
		srl		$a0, $t1, 1
		sll		$v0, $a0, 1
		addu	$v0, $a0
		subu	$v1, $v0
		andi	$v1, 0xFF
		beqz	$v1, loc_80112D90
		li		$a0, 0x17D0
		lb		$v1, 0x16A($s4)
		lw		$a1, 0x198($s4)
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 3
		addu	$v0, $v1
		lw		$v1, 0x58C($a1)
		sll		$v0, 2
		subu	$v1, $v0
		sh		$v1, 0x18($sp)
		lw		$v0, 0x590($a1)
		addiu	$a3, $sp, 0x18
		addiu	$v0, 0x12C
		sh		$v0, 0x1A($sp)
		lw		$v0, 0x594($a1)
		sll		$a1, $t0, 16
		sra		$a1, 16
		sh		$v0, 0x1C($sp)
		lh		$v0, 0x76($s4)
		lw		$s3, 0x198($s4)
		subu	$a1, $v0, $a1
		jal		Esp_call
		addiu	$a2, $s3, 0x48
		j		loc_80112DC4
		nop
loc_80112D90:
		addiu	$a3, $sp, 0x18
		li		$v0, 0x320
		lw		$a2, 0x198($s4)
		sll		$a1, $t0, 16
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$v0, 0x76($s4)
		sra		$a1, 16
		subu	$a1, $v0, $a1
		jal		Esp_call
		addiu	$a2, 0xF4
		sb		$0, 0x16A($s4)
loc_80112DC4:
		lbu		$v1, 5($s4)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80112E08
		li		$v0, 0xB
		lhu		$v0, 0x10E($s4)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80112E08
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s4
		lhu		$v0, 0x21A($s4)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s4)
		lbu		$v1, 5($s4)
		li		$v0, 0xB
loc_80112E08:
		bne		$v1, $v0, loc_80112F1C
		nop
		lhu		$v0, 0x21A($s4)
		nop
		andi	$v0, 0x1000
		bnez	$v0, loc_80112F14
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_80112F14
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		lhu		$v1, 0x21A($s4)
		andi	$s0, 1
		ori		$v1, 0x20
		beqz	$s0, loc_80112E70
		sh		$v1, 0x21A($s4)
		andi	$v0, $v1, 0xFFDF
		ori		$v0, 0x40
		sh		$v0, 0x21A($s4)
loc_80112E70:
		li		$s2, 0x304040
		li		$a0, 0x40F0BB8
		move	$a3, $0
		sll		$v0, $s0, 7
		addu	$v0, $s0
		sll		$v0, 2
		addiu	$v0, 0x6B8
		li		$s1, 0xFFFF8032
		lw		$v1, 0x198($s4)
		li		$s0, 5
		addu	$s3, $v1, $v0
		lw		$v0, 0($s3)
		addiu	$a2, $s3, 0x48
		sh		$0, 0x98($s3)
		sh		$0, 0x9A($s3)
		sh		$s1, 0x9E($s3)
		sb		$s0, 0x9C($s3)
		sb		$s0, 0x9D($s3)
		sw		$s2, 0x70($s3)
		ori		$v0, 0x10
		sw		$v0, 0($s3)
		lh		$a1, 0x76($s4)
		jal		Esp_call
		addiu	$s3, 0xAC
		li		$a0, 0x40F07D0
		lw		$v0, 0($s3)
		addiu	$a2, $s3, 0x48
		sh		$0, 0x98($s3)
		sh		$0, 0x9A($s3)
		sh		$s1, 0x9E($s3)
		sb		$s0, 0x9C($s3)
		sb		$s0, 0x9D($s3)
		sw		$s2, 0x70($s3)
		ori		$v0, 0x10
		sw		$v0, 0($s3)
		lh		$a1, 0x76($s4)
		jal		Esp_call
		move	$a3, $0
loc_80112F14:
		jal		Em10Ryudm
		move	$a0, $s4
loc_80112F1C:
		move	$a0, $s4
		move	$a1, $s5
		move	$a2, $s6
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s4
		move	$a1, $s5
		move	$a2, $s6
		jal		Joint_move
		li		$a3, 0x400
		move	$a0, $s4
		lbu		$v1, 6($s4)
		move	$a1, $0
		addu	$v1, $v0
		jal		Add_speedXZ
		sb		$v1, 6($s4)
		lh		$v0, 0x15A($s4)
		nop
		beqz	$v0, loc_801130FC
		move	$v1, $v0
		lb		$v0, 0x16A($s4)
		nop
		beqz	$v0, loc_801130FC
		andi	$v0, $v1, 1
		bnez	$v0, loc_80112FFC
		nop
		lbu		$v0, 0x222($s4)
		lw		$s3, 0x198($s4)
		bnez	$v0, loc_80112FBC
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		li		$a0, 0x1F40
		addiu	$a2, $s3, 0x48
		addiu	$a3, $s4, 0x144
		lh		$a1, 0x76($s4)
		j		loc_80112FEC
		sll		$s0, 4
loc_80112FBC:
		lhu		$v0, 0x146($s4)
		nop
		addiu	$v0, -0x1F4
		jal		Rnd
		sh		$v0, 0x146($s4)
		jal		Rnd
		move	$s0, $v0
		li		$a0, 0x13E8
		addiu	$a2, $s3, 0x48
		addiu	$a3, $s4, 0x144
		sll		$s0, 4
		lh		$a1, 0x76($s4)
loc_80112FEC:
		sll		$v0, 4
		addu	$a1, $s0
		jal		Esp_call
		subu	$a1, $v0
loc_80112FFC:
		lhu		$v0, 0x15A($s4)
		nop
		addiu	$v0, -1
		j		loc_801130FC
		sh		$v0, 0x15A($s4)
loc_80113010:
		lb		$v1, 0x223($s4)
		nop
		bgtz	$v1, loc_80113038
		sw		$v0, 4($s4)
		jal		Rnd
		nop
		andi	$v0, 0x10
		addiu	$v0, 0xF
		sb		$v0, 0x223($s4)
		sb		$0, 0x222($s4)
loc_80113038:
		move	$a0, $s4
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x200
		bnez	$v0, loc_8011309C
		nop
		lw		$v0, 0x1F0($s4)
		nop
		sltiu	$v0, 0xFA0
		beqz	$v0, loc_8011309C
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8011309C
		nop
		jal		Rnd
		nop
		andi	$v0, 3
		beqz	$v0, loc_801130F8
		li		$v0, 0xB01
loc_8011309C:
		lw		$v0, 0x1F0($s4)
		nop
		sltiu	$v0, 0xBB8
		beqz	$v0, loc_801130E4
		move	$a0, $s4
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x384
		beqz	$v0, loc_801130E4
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_801130F8
		li		$v0, 0xC01
loc_801130E4:
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_801130FC
		li		$v0, 0x201
loc_801130F8:
		sw		$v0, 4($s4)
loc_801130FC:
		lw		$ra, 0x44($sp)
		lw		$s6, 0x40($sp)
		lw		$s5, 0x3C($sp)
		lw		$s4, 0x38($sp)
		lw		$s3, 0x34($sp)
		lw		$s2, 0x30($sp)
		lw		$s1, 0x2C($sp)
		lw		$s0, 0x28($sp)
		addiu	$sp, 0x48
		jr		$ra
		nop