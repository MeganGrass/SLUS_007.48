

		addiu	$sp, -0x40
		sw		$s2, 0x28($sp)
		move	$s2, $a0
		sw		$s4, 0x30($sp)
		move	$s4, $a1
		sw		$s5, 0x34($sp)
		sw		$ra, 0x38($sp)
		sw		$s3, 0x2C($sp)
		sw		$s1, 0x24($sp)
		sw		$s0, 0x20($sp)
		li		$v0, 0xFFFFFE3E
		sh		$v0, 0x10($sp)
		li		$v0, 0xFA
		sh		$v0, 0x12($sp)
		lbu		$v1, 6($s2)
		li		$v0, 1
		beq		$v1, $v0, loc_80114734
		move	$s5, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_8011449C
		nop
		beqz	$v1, loc_801144B0
		lui		$v0, 0xF
		j		loc_80114860
		nop
loc_8011449C:
		li		$v0, 2
		beq		$v1, $v0, loc_8011477C
		li		$v0, 3
		j		loc_80114860
		nop
loc_801144B0:
		ori		$v0, 1
		move	$a0, $s2
		move	$a1, $s4
		move	$a2, $s5
		move	$a3, $0
		jal		Spd_get
		sw		$v0, 0x14C($s2)
		jal		Rnd
		nop
		move	$a0, $s2
		move	$a1, $s4
		move	$a2, $s5
		move	$a3, $0
		andi	$v0, 7
		jal		Spd_get
		sb		$v0, 0x14D($s2)
		lbu		$v0, 0x1D3($s2)
		li		$v1, 1
		sb		$v1, 6($s2)
		lbu		$v1, 5($s2)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s2)
		li		$v0, 0xC
		beq		$v1, $v0, loc_8011470C
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80114680
		sb		$v0, 0x16B($s2)
		li		$s1, 0x10104F
		li		$a0, 5
		lw		$v1, 0x198($s2)
		li		$a1, 3
		lw		$v0, 0x204($v1)
		li		$s3, 0xFFFFFFF6
		ori		$v0, 0x4A
		sw		$v0, 0x204($v1)
		lhu		$v0, 0x76($s2)
		addiu	$a2, $v1, 0x24C
		sh		$0, 0x2A4($v1)
		sh		$0, 0x2A0($v1)
		sh		$s3, 0x29E($v1)
		sh		$0, 0x2A2($v1)
		sh		$0, 0x2A8($v1)
		sw		$s1, 0x274($v1)
		addiu	$v0, 0x800
		jal		Esp_kill
		sh		$v0, 0x29C($v1)
		li		$a0, 2
		lw		$v0, 0x198($s2)
		move	$a1, $s2
		jal		Snd_se_enem
		sw		$0, 0x2B0($v0)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80114680
		li		$a0, 0x1770
		move	$a1, $0
		lw		$v1, 0x198($s2)
		move	$a3, $0
		lw		$v0, 0x35C($v1)
		addiu	$s0, $v1, 0x3A4
		ori		$v0, 0x4A
		sw		$v0, 0x35C($v1)
		lhu		$v0, 0x76($s2)
		move	$a2, $s0
		sh		$0, 0x3FC($v1)
		sh		$0, 0x3F8($v1)
		sh		$s3, 0x3F6($v1)
		sh		$0, 0x3FA($v1)
		sh		$0, 0x400($v1)
		sw		$s1, 0x3CC($v1)
		addiu	$v0, 0x800
		jal		Esp_call
		sh		$v0, 0x3F4($v1)
		jal		Rnd
		nop
		li		$a0, 0x8001000
		sll		$a1, $v0, 4
		move	$a2, $s0
		jal		Esp_call
		move	$a3, $0
		li		$a0, 5
		li		$a1, 3
		jal		Esp_kill
		move	$a2, $s0
		li		$a0, 0x1770
		move	$a1, $0
		lw		$v1, 0x198($s2)
		move	$a3, $0
		lw		$v0, 0x408($v1)
		addiu	$s0, $v1, 0x450
		ori		$v0, 0x4A
		sw		$v0, 0x408($v1)
		lhu		$v0, 0x76($s2)
		move	$a2, $s0
		sh		$0, 0x4A8($v1)
		sh		$0, 0x4A4($v1)
		sh		$s3, 0x4A2($v1)
		sh		$0, 0x4A6($v1)
		sh		$0, 0x4AC($v1)
		sw		$s1, 0x478($v1)
		addiu	$v0, 0x800
		jal		Esp_call
		sh		$v0, 0x4A0($v1)
		li		$a0, 5
		li		$a1, 3
		jal		Esp_kill
		move	$a2, $s0
		lw		$v0, 0x198($s2)
		nop
		sw		$0, 0x4B4($v0)
loc_80114680:
		li		$a0, 0x1388
		move	$a1, $0
		addiu	$s1, $sp, 0x18
		lw		$s0, 0x198($s2)
		move	$a3, $s1
		sh		$0, 0x18($sp)
		sh		$0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		addiu	$s0, 0x24C
		jal		Esp_call
		move	$a2, $s0
		li		$v0, 0x190
		jal		Rnd
		sh		$v0, 0x1A($sp)
		li		$a0, 0x1770
		sll		$a1, $v0, 2
		move	$a2, $s0
		jal		Esp_call
		move	$a3, $s1
		li		$v0, 0x320
		jal		Rnd
		sh		$v0, 0x1A($sp)
		li		$a0, 0xFA0
		sll		$a1, $v0, 4
		move	$a2, $s0
		jal		Esp_call
		move	$a3, $s1
		jal		Rnd
		nop
		li		$a0, 0x8001000
		sll		$a1, $v0, 4
		move	$a2, $s0
		jal		Esp_call
		move	$a3, $0
loc_8011470C:
		lbu		$v0, 0x239($s2)
		nop
		bnez	$v0, loc_8011472C
		li		$a0, 0xC
		jal		Snd_se_enem
		move	$a1, $s2
		li		$v0, 0x96
		sb		$v0, 0x239($s2)
loc_8011472C:
		jal		Em_dead_flg_on
		move	$a0, $s2
loc_80114734:
		move	$a0, $s2
		move	$a1, $s4
		move	$a2, $s5
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s2
		move	$a1, $s4
		move	$a2, $s5
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s2
		lbu		$v1, 6($a0)
		move	$a1, $0
		addu	$v1, $v0
		jal		Add_speedXZ
		sb		$v1, 6($a0)
		j		loc_80114860
		nop
loc_8011477C:
		lbu		$v1, 4($s2)
		nop
		bne		$v1, $v0, loc_801147B4
		nop
		jal		Rnd
		nop
		andi	$v0, 3
		bnez	$v0, loc_801147B0
		li		$v0, 0xA
		lb		$v0, 0x16B($s2)
		nop
		bnez	$v0, loc_801147DC
		li		$v0, 0xA
loc_801147B0:
		sh		$v0, 0x156($s2)
loc_801147B4:
		lh		$v0, 0x10C($s2)
		nop
		bnez	$v0, loc_801147DC
		lui		$v1, 0x1000
		lw		$v0, G_Status_flg
		nop
		and		$v0, $v1
		beqz	$v0, loc_801147F4
		lui		$a0, 0xF3FF
loc_801147DC:
		lhu		$v0, 0x21A($s2)
		li		$v1, 7
		sw		$v1, 4($s2)
		andi	$v0, 0xFFFB
		j		loc_80114860
		sh		$v0, 0x21A($s2)
loc_801147F4:
		ori		$a0, 0xFFFF
		li		$v0, 0xC8
		sh		$v0, 0x9A($s2)
		sh		$v0, 0x9C($s2)
		sh		$v0, 0x90($s2)
		sh		$v0, 0x92($s2)
		li		$v0, 0xFFFFFEA2
		sh		$v0, 0x98($s2)
		li		$v0, 0x15E
		sh		$v0, 0x9E($s2)
		lw		$v0, 0($s2)
		li		$v1, 0x2001
		sh		$v1, 0x10E($s2)
		lui		$v1, 0x400
		and		$v0, $a0
		or		$v0, $v1
		jal		Rnd
		sw		$v0, 0($s2)
		andi	$v0, 1
		bnez	$v0, loc_8011484C
		li		$v0, 1
		li		$v0, 0x201
loc_8011484C:
		sw		$v0, 4($s2)
		lbu		$v0, 0x1D3($s2)
		nop
		andi	$v0, 0x7F
		sb		$v0, 0x1D3($s2)
loc_80114860:
		lw		$ra, 0x38($sp)
		lw		$s5, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x40
		jr		$ra
		nop