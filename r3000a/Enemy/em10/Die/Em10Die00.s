

		addiu	$sp, -0x38
		sw		$s1, 0x24($sp)
		move	$s1, $a0
		sw		$s3, 0x2C($sp)
		move	$s3, $a1
		sw		$s4, 0x30($sp)
		sw		$ra, 0x34($sp)
		sw		$s2, 0x28($sp)
		sw		$s0, 0x20($sp)
		li		$s0, 1
		li		$v0, 2
		sb		$s0, 0x10($sp)
		sb		$v0, 0x11($sp)
		lbu		$v1, 6($s1)
		li		$s2, 1
		beq		$v1, $s2, loc_80115810
		move	$s4, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_80115590
		nop
		beqz	$v1, loc_801155A4
		nop
		j		loc_801159F0
		nop
loc_80115590:
		li		$v0, 2
		beq		$v1, $v0, loc_80115918
		li		$v0, 7
		j		loc_801159F0
		nop
loc_801155A4:
		jal		Rnd
		nop
		lhu		$v1, 0x21A($s1)
		andi	$v0, 1
		andi	$v1, 0x2000
		beqz	$v1, loc_801155C4
		sb		$v0, 0x16A($s1)
		sb		$0, 0x16A($s1)
loc_801155C4:
		lhu		$v0, 0x21A($s1)
		lb		$v1, 0x16A($s1)
		andi	$v0, 0xFFFB
		beqz	$v1, loc_801155E0
		sh		$v0, 0x21A($s1)
		ori		$v0, 4
		sh		$v0, 0x21A($s1)
loc_801155E0:
		lb		$a1, 0x16A($s1)
		lbu		$a0, 0x1D2($s1)
		lbu		$v1, 0x1D3($s1)
		addu	$v0, $sp, $a1
		lbu		$a2, 0x10($v0)
		li		$v0, 0xAAAAAAAB
		multu	$a0, $v0
		lbu		$v0, 0x1C0($s1)
		ori		$v1, 0x80
		sb		$v1, 0x1D3($s1)
		lui		$v1, 0xF
		sb		$s0, 6($s1)
		ori		$v0, 1
		sb		$v0, 0x1C0($s1)
		sll		$v0, $a1, 2
		addu	$v0, $a1
		sll		$v0, 9
		addu	$a2, $v1
		addu	$v0, $a2
		sw		$v0, 0x14C($s1)
		mfhi	$t0
		srl		$v1, $t0, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		subu	$a0, $v0
		andi	$a0, 0xFF
		beqz	$a0, loc_80115694
		addiu	$a3, $sp, 0x18
		lw		$v1, 0x198($s1)
		nop
		lw		$v0, 0x58C($v1)
		nop
		sh		$v0, 0x18($sp)
		lw		$v0, 0x590($v1)
		li		$a0, 0x1FA0
		addiu	$v0, 0x12C
		sh		$v0, 0x1A($sp)
		lw		$v0, 0x594($v1)
		nop
		sh		$v0, 0x1C($sp)
		lw		$s2, 0x198($s1)
		lh		$a1, 0x76($s1)
		j		loc_801156B4
		addiu	$a2, $s2, 0x48
loc_80115694:
		li		$a0, 0x17D0
		lw		$a2, 0x198($s1)
		li		$v0, 0x320
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$a1, 0x76($s1)
		addiu	$a2, 0xF4
loc_801156B4:
		jal		Esp_call
		nop
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_801156D4
		li		$a0, 0xB
		li		$a0, 0xD
loc_801156D4:
		jal		Snd_se_enem
		move	$a1, $s1
		jal		Em_dead_flg_on
		move	$a0, $s1
		lbu		$v1, 5($s1)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80115718
		li		$v0, 0xB
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80115718
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s1
		lbu		$v1, 5($s1)
		li		$v0, 0xB
loc_80115718:
		bne		$v1, $v0, loc_80115790
		sb		$0, 0x16B($s1)
		jal		Em10Ryudm
		move	$a0, $s1
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80115790
		lui		$a1, 0x30
		ori     $a1, 0x4040
		lui     $a0, 0x40F
		ori     $a0, 0xFA0
		lw		$a2, 0x198($s1)
		move	$a3, $0
		lw		$v1, 0x560($a2)
		li		$v0, 0xFFFF801E
		sh		$v0, 0x5FE($a2)
		li		$v0, 0xA
		sh		$0, 0x5F8($a2)
		sh		$0, 0x5FA($a2)
		sb		$v0, 0x5FC($a2)
		sb		$v0, 0x5FD($a2)
		sw		$a1, 0x5D0($a2)
		ori		$v1, 0x10
		sw		$v1, 0x560($a2)
		lh		$a1, 0x76($s1)
		jal		Esp_call
		addiu	$a2, 0x5A8
		li		$v0, 1
		sb		$v0, 0x16B($s1)
loc_80115790:
		lbu		$v1, 5($s1)
		li		$v0, 9
		beq		$v1, $v0, loc_801157A8
		li		$v0, 0x11
		bne		$v1, $v0, loc_801157CC
		li		$v0, 0xE
loc_801157A8:
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_801157C4
		nop
		jal		Em10Tudm
		move	$a0, $s1
loc_801157C4:
		lbu		$v1, 5($s1)
		li		$v0, 0xE
loc_801157CC:
		bne		$v1, $v0, loc_801157DC
		nop
		jal		Em10Spdm
		move	$a0, $s1
loc_801157DC:
		lbu		$v1, 5($s1)
		li		$v0, 0x10
		bne		$v1, $v0, loc_8011580C
		li		$v0, 0xB
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8011580C
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s1
		li		$v0, 0xB
loc_8011580C:
		sh		$v0, 0x144($s1)
loc_80115810:
		lbu		$v1, 0x1D2($s1)
		lui     $v0, 0xAAAA
		ori     $v0, 0xAAAB
		multu	$v1, $v0
		mfhi	$t0
		srl		$a0, $t0, 1
		sll		$v0, $a0, 1
		addu	$v0, $a0
		subu	$v1, $v0
		andi	$v1, 0xFF
		beqz	$v1, loc_801158DC
		move	$a0, $s1
		lbu		$a1, 0x14D($s1)
		lb		$v0, 0x16A($s1)
		andi	$a0, $a1, 0xFF
		sll		$v1, $v0, 2
		addu	$v1, $v0
		sll		$v1, 1
		addiu	$v0, $v1, 4
		slt		$v0, $a0, $v0
		bnez	$v0, loc_801158D8
		addiu	$v0, $v1, 0x10
		slt		$v0, $a0
		bnez	$v0, loc_801158D8
		andi	$v0, $a1, 1
		beqz	$v0, loc_801158DC
		move	$a0, $s1
		lw		$v1, 0x198($s1)
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
		lw		$s2, 0x198($s1)
		jal		Rnd
		nop
		sll		$s0, $v0, 3
		jal		Rnd
		addiu	$s0, 0xFD0
		move	$a0, $s0
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x18
		jal		Esp_call
		addiu	$a2, $s2, 0x48
loc_801158D8:
		move	$a0, $s1
loc_801158DC:
		move	$a1, $s3
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s1)
		lbu		$a0, 0x14E($s1)
		addu	$v1, $v0
		bnez	$a0, loc_801159F0
		sb		$v1, 6($s1)
		move	$a0, $s1
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
		j		loc_801159F0
		nop
loc_80115918:
		jal		Rnd
		sw		$v0, 4($s1)
		andi	$v0, 3
		bnez	$v0, loc_801159F0
		nop
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 4
		bnez	$v0, loc_801159F0
		nop
		lh		$v0, 0x10C($s1)
		nop
		bnez	$v0, loc_801159F0
		nop
		lb		$v0, 0x16B($s1)
		nop
		bnez	$v0, loc_801159F0
		lui		$v1, 0x1000
		lw		$v0, G_Status_flg
		nop
		and		$v0, $v1
		bnez	$v0, loc_801159F0
		lui		$a0, 0xF3FF
		ori     $a0, 0xFFFF
		li		$v0, 1
		sh		$v0, 0x156($s1)
		li		$v0, 0xC8
		sh		$v0, 0x9A($s1)
		sh		$v0, 0x9C($s1)
		sh		$v0, 0x90($s1)
		sh		$v0, 0x92($s1)
		li		$v0, 0xFFFFFEA2
		sh		$v0, 0x98($s1)
		li		$v0, 0x15E
		sh		$v0, 0x9E($s1)
		lw		$v0, 0($s1)
		li		$v1, 0x2001
		sh		$v1, 0x10E($s1)
		lui		$v1, 0x400
		and		$v0, $a0
		or		$v0, $v1
		jal		Rnd
		sw		$v0, 0($s1)
		andi	$v0, 7
		bnez	$v0, loc_801159DC
		li		$v0, 0x201
		j		loc_801159E0
		sw		$s2, 4($s1)
loc_801159DC:
		sw		$v0, 4($s1)
loc_801159E0:
		lbu		$v0, 0x1D3($s1)
		nop
		andi	$v0, 0x7F
		sb		$v0, 0x1D3($s1)
loc_801159F0:
		lw		$ra, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop