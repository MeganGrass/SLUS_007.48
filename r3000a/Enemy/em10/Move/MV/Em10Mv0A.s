

		addiu	$sp, -0x30
		sw		$s1, 0x24($sp)
		move	$s1, $a0
		sw		$s0, 0x20($sp)
		move	$s0, $a1
		sw		$ra, 0x2C($sp)
		sw		$s2, 0x28($sp)
		la		$a1, 0x8010D0A8
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x13($sp)
		swr		$v0, 0x10($sp)
		swl		$v1, 0x17($sp)
		swr		$v1, 0x14($sp)
		lbu		$v1, 6($s1)
		nop
		sltiu	$v0, $v1, 9
		beqz	$v0, loc_80110E24
		move	$s2, $a2
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, at, $v0
		lw      $v0, -0x2F4C(at)		;; jpt_80110BE0
		nop
		jr		$v0
		nop
loc_80110BE8:
		li		$v0, 1
		jal		Rnd
		sb		$v0, 6($s1)
		andi	$v0, 7
		addu	$v0, $sp, $v0
		lui		$a0, 7
		lbu		$v0, 0x10($v0)
		lbu		$v1, 0x1D3($s1)
		addu	$v0, $a0
		ori		$v1, 0x80
		sw		$v0, 0x14C($s1)
		sb		$v1, 0x1D3($s1)
loc_80110C18:
		move	$a0, $s1
		move	$a1, $s0
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x200
		lbu		$v1, 6($s1)
		lbu		$a0, 0x14E($s1)
		addu	$v1, $v0
		bnez	$a0, loc_80110C50
		sb		$v1, 6($s1)
		move	$a0, $s1
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
loc_80110C50:
		lw		$v0, 0x178($s1)
		nop
		lw		$v0, 0($v0)
		lui		$v1, 1
		and		$v0, $v1
		beqz	$v0, loc_80110C94
		li		$v0, 0xC8
		lw		$s0, 0x198($s1)
		sh		$v0, 0x18($sp)
		sh		$0, 0x1A($sp)
		jal		Rnd
		sh		$0, 0x1C($sp)
		li		$a0, 0x13D0
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x18
		jal		Esp_call
		addiu	$a2, $s0, 0x5A8
loc_80110C94:
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x4000
		bnez	$v0, loc_80110E24
		li		$v0, 3
		j		loc_80110E24
		sb		$v0, 6($s1)
loc_80110CB0:
		jal		Rnd
		nop
		andi	$v0, 7
		addu	$v0, $sp, $v0
		lbu		$v0, 0x10($v0)
		li		$v1, 1
		sb		$v1, 6($s1)
		addiu	$v0, 0x300
		j		loc_80110E24
		sw		$v0, 0x14C($s1)
loc_80110CD8:
		lui		$v1, 0xF
		li		$v0, 4
		sb		$v0, 6($s1)
		lbu		$v0, 0x1D3($s1)
		ori     $v1, $v1, 0x15
		sw		$v1, 0x14C($s1)
		li		$v1, 2
		sb		$v1, 0x234($s1)
		andi	$v0, 0x7F
		sb		$v0, 0x1D3($s1)
		lhu		$v0, 0x21A($s1)
		lbu		$v1, 0x239($s1)
		ori		$v0, 0x10
		bnez	$v1, loc_80110D60
		sh		$v0, 0x21A($s1)
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_80110D5C
		li		$v0, 0x96
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_80110D50
		li		$a0, 0xB
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80110D58
		li		$a0, 0xA
loc_80110D50:
		jal		Snd_se_enem
		move	$a1, $s1
loc_80110D58:
		li		$v0, 0x96
loc_80110D5C:
		sb		$v0, 0x239($s1)
loc_80110D60:
		move	$a0, $s1
		move	$a1, $s0
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		beqz	$v0, loc_80110E24
		li		$v1, 5
		lhu		$v0, 0x21A($s1)
		sb		$v1, 6($s1)
		andi	$v0, 0xFFEF
		j		loc_80110E24
		sh		$v0, 0x21A($s1)
loc_80110D90:
		li		$v0, 0x101
		sw		$v0, 4($s1)
		lbu		$v0, 0x1D3($s1)
		lhu		$v1, 0x21A($s1)
		andi	$v0, 0x7F
		andi	$v1, 0xFFEF
		sb		$v0, 0x1D3($s1)
		j		loc_80110E24
		sh		$v1, 0x21A($s1)
loc_80110DB4:
		li		$v0, 7
		jal		Rnd
		sb		$v0, 6($s1)
		li		$v1, 0xF0015
		andi	$v0, 7
		sll		$v0, 8
		addu	$v0, $v1
		sw		$v0, 0x14C($s1)
loc_80110DD8:
		move	$a0, $s1
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00
		li		$a3, 0x10
		move	$a0, $s1
		move	$a1, $s0
		move	$a2, $s2
		lui		$a3, 1
		jal		Joint_move
		ori     $a3, $a3, 0x100
		lbu		$v1, 6($s1)
		nop
		addu	$v1, $v0
		j		loc_80110E24
		sb		$v1, 6($s1)
loc_80110E20:
		sb		$0, 6($s1)
loc_80110E24:
		lw		$ra, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x30
		jr		$ra
		nop