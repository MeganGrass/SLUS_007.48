

		addiu	$sp, -0x28
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$s2, 0x18($sp)
		move	$s2, $a1
		sw		$s3, 0x1C($sp)
		sw		$ra, 0x20($sp)
		sw		$s1, 0x14($sp)
		lh		$v0, 0x1DA($s0)
		lbu		$a0, 6($s0)
		sll		$v0, 2
		sltiu	$v1, $a0, 5
		lui     at, 0x800D
		addu    at, $v0
		lw      $s1, -0x1EC(at)			;; G_pEnemy
		beqz	$v1, loc_8011703C
		move	$s3, $a2
		sll		$v0, $a0, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2E94(at)		;; off_8010D16C
		nop
		jr		$v0
		nop
loc_80116EB8:
		li		$v0, 0xF000A
		move	$a0, $s0
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		sb		$v0, 6($s0)
		lw		$a1, 0x38($s1)
		lw		$a2, 0x40($s1)
		jal		Goto00
		li		$a3, 0x400
		li		$a0, 0xA
		move	$a1, $s0
		jal		Snd_se_enem
		sh		$0, 0x158($s0)
		lbu		$v0, 0x1D3($s0)
		nop
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s0)
loc_80116F00:
		lhu		$v0, 0x158($s0)
		nop
		addiu	$v0, 1
		sh		$v0, 0x158($s0)
		andi	$v0, 1
		beqz	$v0, loc_80116F34
		move	$a0, $s0
		move	$a1, $s2
		move	$a2, $s3
		jal		Spd_get
		move	$a3, $0
		j		loc_80116F48
		move	$a0, $s0
loc_80116F34:
		lhu		$v0, 0x144($s0)
		nop
		sll		$v0, 16
		sra		$v0, 18
		sh		$v0, 0x144($s0)
loc_80116F48:
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s0
		lbu		$v1, 6($s0)
		move	$a1, $0
		addu	$v1, $v0
		jal		Add_speedXZ
		sb		$v1, 6($s0)
		lbu		$v1, 0x14D($s0)
		li		$v0, 0x11
		bne		$v1, $v0, loc_8011703C
		li		$v0, 2
		j		loc_8011703C
		sb		$v0, 6($s0)
loc_80116F88:
		li		$v0, 0xF0018
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		move	$a3, $0
		sw		$v0, 0x14C($s0)
		li		$v0, 3
		jal		Set_base_pos
		sb		$v0, 6($s0)
		li		$v0, 0x2004
		sw		$v0, 4($s1)
		sw		$s0, 0x1B4($s1)
		lw		$v0, 0x188($s0)
		nop
		sw		$v0, 0x188($s1)
		lw		$v0, 0x18C($s0)
		nop
		sw		$v0, 0x18C($s1)
		lw		$v0, 0($s0)
		nop
		ori		$v0, 0x1000
		sw		$v0, 0($s0)
		lw		$v0, 0($s1)
		nop
		ori		$v0, 0x1000
		sw		$v0, 0($s1)
loc_80116FF4:
		move	$a0, $s0
		move	$a1, $s2
		move	$a2, $s3
		jal		Null_pos_set
		move	$a3, $0
		move	$a0, $s0
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s0)
		nop
		addu	$v1, $v0
		j		loc_8011703C
		sb		$v1, 6($s0)
loc_80117030:
		li		$v0, 0x20308
		sw		$v0, 4($s0)
loc_8011703C:
		lw		$ra, 0x20($sp)
		lw		$s3, 0x1C($sp)
		lw		$s2, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop