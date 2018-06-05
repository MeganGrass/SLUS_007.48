

		addiu	$sp, -0x48
		sw		$s2, 0x40($sp)
		move	$s2, $a0
		sw		$ra, 0x44($sp)
		sw		$s1, 0x3C($sp)
		sw		$s0, 0x38($sp)
		lbu		$v1, 0x23D($s2)
		lbu		$a0, 0x23C($s2)
		srl		$v1, 1
		sll		$v0, $v1, 7
		addu	$v0, $v1
		sll		$v0, 2
		lw		$v1, 0x198($s2)
		addiu	$v0, 0x60C
		addu	$s1, $v1, $v0
		sltiu	$v0, $a0, 5
		beqz	$v0, loc_801195E4
		sll		$v0, $a0, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2D54(at)		;; jpt_801192FC
		nop
		jr		$v0
		nop
loc_80119304:
		li		$v1, 0x101020
		li		$v0, 0x30
		sw		$v0, 0x98($s1)
		sw		$v0, 0x98($s1)
		lw		$v0, 0($s1)
		la		$s0, Player_pSin_parts_ptr
		sw		$v1, 0x9C($s1)
		sw		$v1, 0x9C($s1)
		lw		$v1, 0xAC($s1)
		ori		$v0, 0x9280
		sw		$v0, 0($s1)
		lw		$v0, 0x158($s1)
		ori		$v1, 0x9200
		sw		$v1, 0xAC($s1)
		lw		$v1, 0($s1)
		ori		$v0, 0x9200
		ori		$v1, 0x80
		sw		$v0, 0x158($s1)
		sw		$v1, 0($s1)
		lw		$v0, 0($s0)
		nop
		addiu	$v0, 0x48
		sw		$v0, 0x74($s1)
		lw		$v0, 0($s0)
		addiu	$a1, $s1, 0x48
		sw		$v0, 0x94($s1)
		lw		$a0, 0($s0)
		addiu	$a2, $s1, 0x18
		jal		MulLMatrix
		addiu	$a0, 0x48
		addiu	$a1, $s1, 0x1A0
		lw		$a0, 0($s0)
		addiu	$a2, $sp, 0x18
		jal		MulLMatrix
		addiu	$a0, 0x48
		lw		$v0, 0x2C($sp)
		li		$a0, 9
		sra		$v0, 1
		sh		$v0, 0x240($s2)
		lw		$v0, 0x30($sp)
		move	$a1, $s2
		addiu	$v0, 0xC8
		sh		$v0, 0x242($s2)
		lw		$v1, 0x34($sp)
		li		$v0, 2
		sb		$v0, 0x23C($s2)
		li		$v0, 0x3C
		sb		$v0, 0x23B($s2)
		sra		$v1, 1
		jal		Snd_se_enem
		sh		$v1, 0x244($s2)
		lh		$v0, 0x240($s2)
		nop
		mult	$v0, $v0
		mflo	$v1
		lh		$v0, 0x244($s2)
		nop
		mult	$v0, $v0
		mflo	$t1
		jal		SquareRoot0
		addu	$a0, $v1, $t1
		slti	$v0, 0x321
		beqz	$v0, loc_801195E0
		li		$v0, 3
loc_8011940C:
		lbu		$v1, 0x23B($s2)
		nop
		addiu	$v0, $v1, 0xFF
		bnez	$v1, loc_80119428
		sb		$v0, 0x23B($s2)
		li		$v0, 3
		sb		$v0, 0x23C($s2)
loc_80119428:
		addiu	$a1, $s1, 0x1A0
		addiu	$s0, $sp, 0x18
		lw		$a0, Player_pSin_parts_ptr
		move	$a2, $s0
		jal		MulLMatrix
		addiu	$a0, 0x48
		lh		$v1, 0x240($s2)
		lw		$a0, 0x2C($sp)
		lw		$v0, 0x2C($s1)
		subu	$v1, $a0
		addu	$v0, $v1
		sw		$v0, 0x2C($s1)
		lh		$v1, 0x242($s2)
		lw		$a0, 0x30($sp)
		lw		$v0, 0x30($s1)
		subu	$v1, $a0
		addu	$v0, $v1
		sw		$v0, 0x30($s1)
		lh		$v1, 0x244($s2)
		lw		$a0, 0x34($sp)
		lw		$v0, 0x34($s1)
		subu	$v1, $a0
		addu	$v0, $v1
		sw		$v0, 0x34($s1)
		sh		$0, 0x10($sp)
		jal		Rnd
		sh		$0, 0x12($sp)
		andi	$v0, 0xF
		lbu		$a0, 0x23B($s2)
		li		$v1, 1
		andi	$a0, 1
		sll		$a0, 1
		subu	$v1, $a0
		mult	$v0, $v1
		move	$a1, $s0
		addiu	$a0, $sp, 0x10
		mflo	$t0
		addiu	$v0, $t0, -8
		jal		RotMatrix
		sh		$v0, 0x14($sp)
		addiu	$a0, $s1, 0x18
		jal		MulMatrix
		move	$a1, $s0
		lbu		$v0, 0x23B($s2)
		nop
		andi	$v0, 3
		bnez	$v0, loc_801195E4
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$s0, 1
		sll		$s0, 16
		addiu	$v0, 0xC18
		or		$a0, $s0, $v0
		addiu	$a2, $s1, 0x48
		lh		$a1, 0x76($s2)
		jal		Esp_call
		move	$a3, $0
		li		$v0, 0xFFFFFE0C
		sh		$0, 0x10($sp)
		sh		$v0, 0x12($sp)
		lbu		$v1, 0x23D($s2)
		nop
		srl		$v1, 1
		sll		$v0, $v1, 5
		subu	$v0, $v1
		sll		$v0, 2
		addu	$v0, $v1
		sll		$v0, 2
		addiu	$v0, -0xFA
		sh		$v0, 0x14($sp)
		lw		$s1, 0x198($s2)
		jal		Rnd
		nop
		andi	$v0, 1
		ori		$a0, $v0, 0xC18
		addiu	$a3, $sp, 0x10
		lh		$a1, 0x76($s2)
		jal		Esp_call
		addiu	$a2, $s1, 0x48
		j		loc_801195E4
		nop
loc_8011957C:
		lw		$v0, 0($s1)
		nop
		ori		$v0, 0x1062
		sw		$v0, 0($s1)
		lhu		$v1, 0x76($s2)
		li		$v0, 0xFFFFFFEC
		sh		$v0, 0x3A($s1)
		li		$v0, 0x1E
		sh		$0, 0x86($s1)
		sh		$0, 0x3C($s1)
		sb		$v0, 0x79($s1)
		sh		$0, 0x3E($s1)
		addiu	$v1, 0x800
		sh		$v1, 0x38($s1)
		lbu		$v0, 0x23D($s2)
		lhu		$a0, Player_Cdir_y
		li		$v1, 0xFFFFFC00
		sh		$v1, 0x42($s1)
		nor		$v0, $0, $v0
		andi	$v0, 1
		sll		$v0, 11
		addu	$a0, $v0
		li		$v0, 4
		sh		$a0, 0x40($s1)
loc_801195E0:
		sb		$v0, 0x23C($s2)
loc_801195E4:
		lw		$ra, 0x44($sp)
		lw		$s2, 0x40($sp)
		lw		$s1, 0x3C($sp)
		lw		$s0, 0x38($sp)
		addiu	$sp, 0x48
		jr		$ra
		nop