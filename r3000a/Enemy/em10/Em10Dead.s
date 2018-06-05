

		addiu	$sp, -0x40
		sw		$s0, 0x28($sp)
		move	$s0, $a0
		sw		$s2, 0x30($sp)
		move	$s2, $a1
		sw		$s3, 0x34($sp)
		sw		$ra, 0x38($sp)
		sw		$s1, 0x2C($sp)
		lbu		$v1, 5($s0)
		lw		$s1, 0x16C($s0)
		sltiu	$v0, $v1, 0xC
		beqz	$v0, loc_8011780C
		move	$s3, $a2
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2E64(at)		;; jpt_80117488
		nop
		jr		$v0
		nop
loc_80117490:
		li		$v0, 0x70017
		sw		$v0, 0x14C($s0)
		lbu		$v0, 0x1C0($s0)
		lhu		$v1, 0x21A($s0)
		ori		$v0, 1
		andi	$v1, 4
		beqz	$v1, loc_801174C0
		sb		$v0, 0x1C0($s0)
		li		$v0, 0x70016
		sw		$v0, 0x14C($s0)
loc_801174C0:
		li		$a2, 0xBFBF10
		move	$a0, $s0
		li		$v0, 0xFFFFFFFF
		li		$v1, 1
		sh		$v0, 0x156($s0)
		lw		$v0, 0($s0)
		lui		$a1, 0xFF00
		sb		$v1, 5($s0)
		ori		$v0, 2
		sw		$v0, 0($s0)
		lw		$v0, 0x1C($s1)
		lw		$v1, 0x44($s1)
		and		$v0, $a1
		or		$v0, $a2
		and		$v1, $a1
		or		$v1, $a2
		sw		$v0, 0x1C($s1)
		li		$v0, 0x78
		sw		$v1, 0x44($s1)
		sb		$v0, 0x16A($s0)
		li		$v0, 0x28
		sh		$v0, 0x158($s0)
		sb		$0, 0x238($s0)
		jal		Em_dead_flg_on
		sh		$0, 0x144($s0)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x204($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x204($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x2B0($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x2B0($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x408($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x408($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x4B4($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x4B4($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x560($v1)
		nop
		ori		$v0, 0x8000
		jal		Rnd
		sw		$v0, 0x560($v1)
		li		$v1, 0x55555556
		mult	$v0, $v1
		sra		$a0, $v0, 31
		mfhi	$t0
		subu	$a0, $t0, $a0
		sll		$v1, $a0, 1
		addu	$v1, $a0
		beq		$v0, $v1, loc_801175D4
		li		$v0, 8
		j		loc_80117904
		sb		$v0, 5($s0)
loc_801175D4:
		sh		$0, 0x15A($s0)
loc_801175D8:
		lb		$v0, 0x16A($s0)
		nop
		beqz	$v0, loc_801177E0
		move	$v1, $v0
		addiu	$v0, $v1, -1
		sb		$v0, 0x16A($s0)
		lhu		$v0, 4($s1)
		lhu		$v1, 6($s1)
		addiu	$v0, 5
		addiu	$v1, 5
		sh		$v0, 4($s1)
		j		loc_801177E0
		sh		$v1, 6($s1)
loc_8011760C:
		jal		Rnd
		nop
		andi	$v0, 0xF
		lhu		$v1, 0x158($s0)
		addiu	$v0, 1
		sb		$v0, 0x16B($s0)
		li		$v0, 3
		sb		$v0, 5($s0)
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8011764C
		sh		$v0, 0x158($s0)
		li		$v0, 4
		sb		$v0, 5($s0)
		li		$v0, 0x1E
		j		loc_8011780C
		sh		$v0, 0x158($s0)
loc_8011764C:
		lb		$v0, 0x16A($s0)
		nop
		beqz	$v0, loc_8011767C
		move	$v1, $v0
		addiu	$v0, $v1, -1
		sb		$v0, 0x16A($s0)
		lhu		$v0, 4($s1)
		lhu		$v1, 6($s1)
		addiu	$v0, 5
		addiu	$v1, 5
		sh		$v0, 4($s1)
		sh		$v1, 6($s1)
loc_8011767C:
		lbu		$v1, 0x16B($s0)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8011780C
		sb		$v0, 0x16B($s0)
		li		$v0, 1
		j		loc_8011780C
		sb		$v0, 5($s0)
loc_8011769C:
		lbu		$v1, 0x16B($s0)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8011780C
		sb		$v0, 0x16B($s0)
		li		$v0, 5
		j		loc_8011780C
		sb		$v0, 5($s0)
loc_801176BC:
		jal		Rnd
		nop
		andi	$v0, 0x3F
		lhu		$v1, 0x158($s0)
		addiu	$v0, 0x3C
		sb		$v0, 0x16B($s0)
		li		$v0, 4
		sb		$v0, 5($s0)
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8011780C
		sh		$v0, 0x158($s0)
		lw		$v1, 0x198($s0)
		li		$v0, 7
		sb		$v0, 5($s0)
		lw		$v0, 0x204($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x204($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x2B0($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x2B0($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x408($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x408($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x4B4($v1)
		nop
		ori		$v0, 0x8000
		sw		$v0, 0x4B4($v1)
		lw		$v1, 0x198($s0)
		nop
		lw		$v0, 0x560($v1)
		nop
		ori		$v0, 0x8000
		j		loc_8011780C
		sw		$v0, 0x560($v1)
loc_80117768:
		lb		$v0, 0x16A($s0)
		nop
		beqz	$v0, loc_801177A8
		move	$v1, $v0
		addiu	$v0, $v1, -1
		sb		$v0, 0x16A($s0)
		lhu		$v0, 4($s1)
		lhu		$v1, 6($s1)
		addiu	$v0, 5
		addiu	$v1, 5
		sh		$v0, 4($s1)
		sh		$v1, 6($s1)
		lb		$v0, 0x16A($s0)
		nop
		bnez	$v0, loc_8011780C
		nop
loc_801177A8:
		li		$v0, 7
		j		loc_8011780C
		sb		$v0, 5($s0)
loc_801177B4:
		lui     $v1, 7
		lhu     $v0, 0x21A($s0)
		ori     $v1, 7
		andi    $v0, 4
		beqz    $v0, loc_801177D8
		sw      $v1, 0x14C($s0)
		lui     $v0, 7
		ori     $v0, 0x16
		sw      $v0, 0x14C($s0)
loc_801177D8:
		li		$v0, 0xA
		sb		$v0, 5($s0)
loc_801177E0:
		move	$a0, $s0
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x200
		lbu		$v1, 5($s0)
		nop
		addu	$v1, $v0
		j		loc_8011780C
		sb		$v1, 5($s0)
loc_80117808:
		sb		$0, 5($s0)
loc_8011780C:
		lhu		$v1, 0x15A($s0)
		lhu		$v0, 0x10E($s0)
		addiu	$a1, $v1, 1
		andi	$v0, 0x80
		beqz	$v0, loc_8011786C
		sh		$a1, 0x15A($s0)
		lw		$a2, 0x198($s0)
		nop
		lbu		$v1, 0x70($a2)
		li		$v0, 0x10
		beq		$v1, $v0, loc_8011786C
		li		$a0, 0xF
		andi	$v0, $a1, 3
		bnez	$v0, loc_8011786C
		nop
		li		$a1, 0xFFFEFEFF
		addiu	$v1, $a2, 0x70
loc_80117854:
		lw		$v0, 0($v1)
		addiu	$a0, -1
		addu	$v0, $a1
		sw		$v0, 0($v1)
		bnez	$a0, loc_80117854
		addiu	$v1, 0xAC
loc_8011786C:
		lh		$v0, 0x10C($s0)
		nop
		beqz	$v0, loc_80117904
		nop
		lbu		$v1, 0x238($s0)
		nop
		andi	$v0, $v1, 0x80
		bnez	$v0, loc_801178B8
		sltiu	$v0, $v1, 0xA0
		lw		$v0, 0x3C($s0)
		lh		$v1, 0x10C($s0)
		addiu	$v0, -5
		addiu	$v1, 0x12C
		sw		$v0, 0x3C($s0)
		slt		$v0, $v1
		beqz	$v0, loc_801178F4
		li		$v0, 0x80
		j		loc_801178F0
		sw		$v1, 0x3C($s0)
loc_801178B8:
		beqz	$v0, loc_801178D4
		nop
		lw		$v0, 0x3C($s0)
		nop
		addiu	$v0, -2
		j		loc_801178F4
		sw		$v0, 0x3C($s0)
loc_801178D4:
		lw		$v0, 0x3C($s0)
		lbu		$v1, 0x238($s0)
		addiu	$v0, 2
		sw		$v0, 0x3C($s0)
		li		$v0, 0xBF
		bne		$v1, $v0, loc_801178F4
		li		$v0, 0x80
loc_801178F0:
		sb		$v0, 0x238($s0)
loc_801178F4:
		lbu		$v0, 0x238($s0)
		nop
		addiu	$v0, 1
		sb		$v0, 0x238($s0)
loc_80117904:
		lw		$ra, 0x38($sp)
		lw		$s3, 0x34($sp)
		lw		$s2, 0x30($sp)
		lw		$s1, 0x2C($sp)
		lw		$s0, 0x28($sp)
		addiu	$sp, 0x40
		jr		$ra
		nop