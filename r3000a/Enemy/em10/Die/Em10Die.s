

		addiu	$sp, -0x18
		sw		$s0, 0x10($sp)
		move	$s0, $a0
		sw		$ra, 0x14($sp)
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x4000
		bnez	$v0, loc_8011529C
		move	$a3, $a2
		la		$v0, G_Zonbi_cnt
		lhu		$v1, 0($v0)
		nop
		addiu	$v1, 1
		sh		$v1, 0($v0)
		lhu		$v0, 0x21A($s0)
		nop
		ori		$v0, 0x4000
		sh		$v0, 0x21A($s0)
loc_8011529C:
		lhu		$v0, 0x21A($s0)
		la		$a0, Player_Routine_0
		andi	$v0, 0xFDFF
		sh		$v0, 0x21A($s0)
		lbu		$v1, 0($a0)
		li		$v0, 5
		bne		$v1, $v0, loc_80115328
		nop
		lw		$v0, Player_pEnemy_ptr
		nop
		bne		$v0, $s0, loc_80115328
		li		$v0, 1
		sw		$v0, 0($a0)
		lbu		$v0, Player_Damage_cnt
		lbu		$v1, Player_Neck_flg
		andi	$v0, 0x7F
		andi	$v1, 0xED
		sb		$v0, Player_Damage_cnt
		sb		$v1, Player_Neck_flg
		lw		$v0, 0($s0)
		li		$v1, 0xFFFFEFFB
		and		$v0, $v1
		sw		$v0, 0($s0)
		lw		$v0, Player_Be_flg
		nop
		and		$v0, $v1
		sw		$v0, Player_Be_flg
loc_80115328:
		lbu		$v0, 6($s0)
		nop
		bnez	$v0, loc_801153B0
		nop
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
		sw		$v0, 0x560($v1)
loc_801153B0:
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 1
		beqz	$v0, loc_801153E4
		move	$a0, $s0
		lbu		$v0, 5($a0)
		nop
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, $v0
		lw      $v0, -0x6134(at)		;; Em10_die
		j		loc_80115510
		nop
loc_801153E4:
		lhu		$v1, 0x21A($s0)
		nop
		andi	$v0, $v1, 0x10
		beqz	$v0, loc_80115408
		andi	$v0, $v1, 2
		jal		Em10Die05
		move	$a2, $a3
		j		loc_8011551C
		nop
loc_80115408:
		beqz	$v0, loc_801154E0
		li		$a0, 0x1F40
		lw		$a2, 0x198($s0)
		move	$a1, $0
		move	$a3, $0
		jal		Esp_call
		addiu	$a2, 0x48
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_8011543C
		li		$a0, 0xB
		li		$a0, 0xD
loc_8011543C:
		jal		Snd_se_enem
		move	$a1, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80115478
		li		$v0, 0xB
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80115478
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0xB
loc_80115478:
		bne		$v1, $v0, loc_80115488
		nop
		jal		Em10Ryudm
		move	$a0, $s0
loc_80115488:
		lbu		$v1, 5($s0)
		li		$v0, 9
		beq		$v1, $v0, loc_801154A0
		li		$v0, 0x11
		bne		$v1, $v0, loc_801154C4
		li		$v0, 0xE
loc_801154A0:
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_801154BC
		nop
		jal		Em10Tudm
		move	$a0, $s0
loc_801154BC:
		lbu		$v1, 5($s0)
		li		$v0, 0xE
loc_801154C4:
		bne		$v1, $v0, loc_801154D8
		li		$v0, 0x907
		jal		Em10Spdm
		move	$a0, $s0
		li		$v0, 0x907
loc_801154D8:
		j		loc_8011551C
		sw		$v0, 4($s0)
loc_801154E0:
		move	$a0, $s0
		lbu		$v1, 5($a0)
		la		$a2, (Em10_haidm+0x38)
		sll		$v0, $v1, 3
		addu	$v0, $v1
		sll		$v0, 2
		lbu		$v1, 0x1D2($a0)
		addu	$v0, $a2
		sll		$v1, 2
		addu	$v1, $v0
		lw		$v0, 0($v1)
loc_80115510:
		nop
		jalr	$v0
		move	$a2, $a3
loc_8011551C:
		lw		$ra, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x18
		jr		$ra
		nop