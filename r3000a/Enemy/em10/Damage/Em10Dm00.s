

		addiu	$sp, -0x60
		sw		$s1, 0x4C($sp)
		move	$s1, $a0
		li		$a0, 1
		sw		$ra, 0x58($sp)
		sw		$s3, 0x54($sp)
		sw		$s2, 0x50($sp)
		sw		$s0, 0x48($sp)
		lbu		$v0, 0x222($s1)
		lw		$s3, 0x1F0($s1)
		bne		$v0, $a0, loc_80112478
		nop
		jal		Em10Dm01
		move	$a0, $s1
		j		loc_80112BA0
		nop
loc_80112478:
		lbu		$v1, 6($s1)
		nop
		beq		$v1, $a0, loc_8011273C
		slti	$v0, $v1, 2
		beqz	$v0, loc_801124A0
		nop
		beqz	$v1, loc_801124BC
		nop
		j		loc_80112B84
		nop
loc_801124A0:
		li		$v0, 2
		beq		$v1, $v0, loc_8011288C
		li		$v0, 3
		beq		$v1, $v0, loc_80112A50
		li		$v0, 0xE
		j		loc_80112B84
		nop
loc_801124BC:
		lbu		$v1, 0x218($s1)
		lbu		$v0, 0x14C($s1)
		nop
		beq		$v1, $v0, loc_801124D8
		lui		$v0, 0xF
		addu	$v0, $v1, $v0
		sw		$v0, 0x14C($s1)
loc_801124D8:
		lbu		$v0, 0x239($s1)
		nop
		bnez	$v0, loc_80112510
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_80112500
		li		$a0, 0xB
		li		$a0, 0xC
loc_80112500:
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_80112510:
		lbu		$v1, 5($s1)
		li		$v0, 0x18
		sb		$v0, 0x16B($s1)
		li		$v0, 0x10
		bne		$v1, $v0, loc_80112580
		move	$a0, $s1
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80112568
		nop
		lbu		$v0, 0x23A($s1)
		nop
		sltiu	$v0, 9
		bnez	$v0, loc_80112568
		nop
		jal		Em10Firedm
		move	$a0, $s1
		lhu		$v0, 0x21A($s1)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s1)
loc_80112568:
		lbu		$v0, 0x23A($s1)
		li		$v1, 2
		sb		$v1, 0x16B($s1)
		addiu	$v0, 1
		sb		$v0, 0x23A($s1)
		move	$a0, $s1
loc_80112580:
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		lbu		$s0, 0x14D($s1)
		move	$a3, $0
		jal		Spd_get
		sb		$0, 0x14D($s1)
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		move	$a3, $0
		jal		Spd_get
		sb		$s0, 0x14D($s1)
		li		$v0, 1
		sb		$v0, 6($s1)
		li		$v0, 1
		sh		$v0, 0x15A($s1)
		lbu		$v0, 5($s1)
		lbu		$a0, 0x223($s1)
		move	$s3, $0
		sh		$0, 0x158($s1)
		lui     at, 0x8012
		addu    at, at, $v0
		lbu     $v1, -0x63CD(at)		;; Em10_haidm+0x47
		lhu		$v0, 0x10E($s1)
		subu	$a0, $v1
		andi	$v0, 0x40
		bnez	$v0, loc_80112624
		sb		$a0, 0x223($s1)
		sll		$v0, $a0, 24
		bgtz	$v0, loc_80112624
		nop
		lh		$v0, 0x156($s1)
		nop
		slti	$v0, 0x51
		bnez	$v0, loc_80112624
		nop
		jal		Rnd
		nop
		andi	$v0, 0xF
		addiu	$v0, 0x10
		sb		$v0, 0x223($s1)
loc_80112624:
		lhu		$v0, 0x1D0($s1)
		nop
		andi	$v0, 0x20
		beqz	$v0, loc_80112640
		li		$v0, 0xFFFFFFFF
		sh		$v0, 0x15A($s1)
		li		$s3, 0x800
loc_80112640:
		lbu		$v1, 5($s1)
		li		$v0, 0x10
		beq		$v1, $v0, loc_80112714
		move	$a0, $s1
		lbu		$v1, 0x1D2($s1)
		li		$v0, 0xAAAAAAAB
		multu	$v1, $v0
		mfhi	$t0
		srl		$a0, $t0, 1
		sll		$v0, $a0, 1
		addu	$v0, $a0
		subu	$v1, $v0
		andi	$v1, 0xFF
		beqz	$v1, loc_801126DC
		li		$a0, 0x17D0
		lh		$v1, 0x15A($s1)
		lw		$a1, 0x198($s1)
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 3
		addu	$v0, $v1
		lw		$v1, 0x58C($a1)
		sll		$v0, 2
		subu	$v1, $v0
		sh		$v1, 0x10($sp)
		lw		$v0, 0x590($a1)
		addiu	$a3, $sp, 0x10
		addiu	$v0, 0x12C
		sh		$v0, 0x12($sp)
		lw		$v0, 0x594($a1)
		sll		$a1, $s3, 16
		sra		$a1, 16
		sh		$v0, 0x14($sp)
		lh		$v0, 0x76($s1)
		lw		$s2, 0x198($s1)
		subu	$a1, $v0, $a1
		j		loc_80112708
		addiu	$a2, $s2, 0x48
loc_801126DC:
		addiu	$a3, $sp, 0x10
		li		$v0, 0x320
		lw		$a2, 0x198($s1)
		sll		$a1, $s3, 16
		sh		$0, 0x10($sp)
		sh		$v0, 0x12($sp)
		sh		$0, 0x14($sp)
		lh		$v0, 0x76($s1)
		sra		$a1, 16
		subu	$a1, $v0, $a1
		addiu	$a2, 0xF4
loc_80112708:
		jal		Esp_call
		nop
		move	$a0, $s1
loc_80112714:
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		jal		Goto00
		li		$a3, 0x10
		lbu		$v1, 5($s1)
		li		$v0, 0xE
		bne		$v1, $v0, loc_80112740
		move	$a0, $s1
		jal		Em10Spdm
		move	$a0, $s1
loc_8011273C:
		move	$a0, $s1
loc_80112740:
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		jal		Goto00
		li		$a3, 0x10
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s1
		li		$a3, 0x100
		lw		$a1, 0x108($s1)
		lhu		$v0, 0x144($s1)
		lw		$a2, 0x17C($s1)
		lhu		$v1, 0x148($s1)
		sll		$v0, 16
		sra		$v0, 17
		sll		$v1, 16
		sra		$v1, 17
		sh		$v0, 0x144($s1)
		jal		Joint_move
		sh		$v1, 0x148($s1)
		lw		$s2, 0x198($s1)
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		lh		$v1, 0x158($s1)
		lb		$v0, 0x16B($s1)
		nop
		mult	$v1, $v0
		lh		$v1, 0x15A($s1)
		mflo	$t0
		sll		$v0, $t0, 3
		negu	$v0, $v0
		mult	$v0, $v1
		addiu	$a0, $sp, 0x10
		addiu	$s0, $sp, 0x18
		move	$a1, $s0
		mflo	$t0
		jal		RotMatrix
		sh		$t0, 0x14($sp)
		addiu	$a0, $s2, 0x18
		jal		MulMatrix
		move	$a1, $s0
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		lh		$v1, 0x158($s1)
		lb		$v0, 0x16B($s1)
		nop
		mult	$v1, $v0
		lh		$v0, 0x15A($s1)
		mflo	$t0
		sll		$v0, 3
		nop
		mult	$t0, $v0
		addiu	$s2, 0xAC
		addiu	$a0, $sp, 0x10
		move	$a1, $s0
		mflo	$t0
		jal		RotMatrix
		sh		$t0, 0x14($sp)
		move	$a0, $s0
		jal		MulMatrix2
		addiu	$a1, $s2, 0x18
		lhu		$v0, 0x158($s1)
		nop
		addiu	$v1, $v0, 1
		sll		$v0, 16
		sra		$v0, 16
		slti	$v0, 3
		bnez	$v0, loc_80112B84
		sh		$v1, 0x158($s1)
		lbu		$v1, 5($s1)
		li		$v0, 2
		sb		$v0, 6($s1)
		li		$v0, 0x10
		sh		$v0, 0x158($s1)
		li		$v0, 0xE
		bne		$v1, $v0, loc_80112B84
		nop
		jal		Em10Spdm
		move	$a0, $s1
		j		loc_80112B84
		nop
loc_8011288C:
		move	$a0, $s1
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		jal		Goto00
		li		$a3, 0x10
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Joint_move
		li		$a3, 0x100
		lw		$s2, 0x198($s1)
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		lh		$v1, 0x158($s1)
		lb		$v0, 0x16B($s1)
		nop
		mult	$v1, $v0
		mflo	$t0
		lh		$v1, 0x15A($s1)
		negu	$v0, $t0
		mult	$v0, $v1
		addiu	$a0, $sp, 0x10
		addiu	$s0, $sp, 0x18
		move	$a1, $s0
		mflo	$t0
		jal		RotMatrix
		sh		$t0, 0x14($sp)
		addiu	$a0, $s2, 0x18
		jal		MulMatrix
		move	$a1, $s0
		sh		$0, 0x10($sp)
		sh		$0, 0x12($sp)
		lh		$v1, 0x158($s1)
		lb		$v0, 0x16B($s1)
		nop
		mult	$v1, $v0
		mflo	$t0
		lh		$v0, 0x15A($s1)
		nop
		mult	$t0, $v0
		addiu	$s2, 0xAC
		addiu	$a0, $sp, 0x10
		move	$a1, $s0
		mflo	$t0
		jal		RotMatrix
		sh		$t0, 0x14($sp)
		move	$a0, $s0
		jal		MulMatrix2
		addiu	$a1, $s2, 0x18
		lhu		$v1, 0x158($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80112980
		sh		$v0, 0x158($s1)
		li		$v0, 3
		sb		$v0, 6($s1)
loc_80112980:
		sltiu	$v0, $s3, 0x514
		beqz	$v0, loc_80112B84
		nop
		la		$a1, Player_Damage_cnt
		lbu		$v0, 0($a1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80112B84
		nop
		lbu		$v1, 0x106($s1)
		lbu		$v0, Player_nFloor
		nop
		bne		$v1, $v0, loc_80112B84
		nop
		lw		$v0, G_pEnemy+4
		nop
		lw		$v0, 0($v0)
		nop
		andi	$v0, 1
		bnez	$v0, loc_80112B84
		nop
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x20
		bnez	$v0, loc_80112A14
		addiu	$a0, $s1, 0x38
		addiu	$a1, -0x19B
		lh		$a2, 0x76($s1)
		li		$a3, 0x120
		jal		Dir_pos_ck
		addiu	$a2, 0x100
		bnez	$v0, loc_80112A14
		li		$v0, 0x301
		sw		$v0, 4($s1)
loc_80112A14:
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x40
		bnez	$v0, loc_80112B84
		addiu	$a0, $s1, 0x38
		la		$a1, Player_Pos_x
		lh		$a2, 0x76($s1)
		li		$a3, 0x120
		jal		Dir_pos_ck
		addiu	$a2, -0x100
		bnez	$v0, loc_80112B84
		li		$v0, 0x301
		j		loc_80112B84
		sw		$v0, 4($s1)
loc_80112A50:
		lbu		$v1, 5($s1)
		nop
		bne		$v1, $v0, loc_80112A6C
		move	$a0, $s1
		jal		Em10Spdm
		move	$a0, $s1
		move	$a0, $s1
loc_80112A6C:
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x200
		bnez	$v0, loc_80112AD8
		move	$a0, $s1
		lw		$v0, 0x1F0($s1)
		nop
		sltiu	$v0, 0xFA0
		beqz	$v0, loc_80112AD8
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80112AD8
		nop
		jal		Rnd
		nop
		andi	$v0, 0xF
		bnez	$v0, loc_80112AD8
		move	$a0, $s1
		li		$v0, 0xB01
		j		loc_80112BA0
		sw		$v0, 4($s1)
loc_80112AD8:
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x400
		beqz	$v0, loc_80112B14
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80112B14
		li		$v0, 0xC01
		j		loc_80112BA0
		sw		$v0, 4($s1)
loc_80112B14:
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80112B30
		li		$v0, 0x201
		j		loc_80112BA0
		sw		$v0, 4($s1)
loc_80112B30:
		lbu		$a0, 0x218($s1)
		lbu		$v1, 0x14C($s1)
		li		$v0, 0x101
		bne		$a0, $v1, loc_80112BA0
		sw		$v0, 4($s1)
		li		$v0, 0x10101
		jal		Rnd
		sw		$v0, 4($s1)
		andi	$v0, 0xF
		sll		$v0, 1
		sb		$v0, 0x16B($s1)
		li		$v0, 0x1E
		jal		Rnd
		sh		$v0, 0x158($s1)
		andi	$v0, 0x1F
		addiu	$v0, 0x1E
		jal		Rnd
		sb		$v0, 0x16A($s1)
		addiu	$v0, 0x12C
		sh		$v0, 0x15A($s1)
loc_80112B84:
		lbu		$v1, 0x218($s1)
		lbu		$v0, 0x14C($s1)
		nop
		bne		$v1, $v0, loc_80112BA0
		move	$a0, $s1
		jal		Add_speedXZ
		move	$a1, $0
loc_80112BA0:
		lw		$ra, 0x58($sp)
		lw		$s3, 0x54($sp)
		lw		$s2, 0x50($sp)
		lw		$s1, 0x4C($sp)
		lw		$s0, 0x48($sp)
		addiu	$sp, 0x60
		jr		$ra
		nop