

		addiu	$sp, -0x38
		sw		$s0, 0x28($sp)
		move	$s0, $a0
		sw		$s1, 0x2C($sp)
		move	$s1, $a1
		sw		$s2, 0x30($sp)
		move	$s2, $a2
		sw		$ra, 0x34($sp)
		la		$a1, 0x8010D160
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		lb		$a0, 8($a1)
		swl		$v0, 0x13($sp)
		swr		$v0, 0x10($sp)
		swl		$v1, 0x17($sp)
		swr		$v1, 0x14($sp)
		sb		$a0, 0x18($sp)
		lbu		$v1, 6($s0)
		li		$a0, 1
		beq		$v1, $a0, loc_80116C78
		addiu	$a1, $sp, 0x10
		slti	$v0, $v1, 2
		beqz	$v0, loc_80116A60
		nop
		beqz	$v1, loc_80116A7C
		nop
		j		loc_80116CE0
		nop
loc_80116A60:
		li		$v0, 2
		beq		$v1, $v0, loc_80116CB0
		li		$v0, 3
		beq		$v1, $v0, loc_80116CDC
		li		$v0, 7
		j		loc_80116CE0
		nop
loc_80116A7C:
		lhu		$v0, 0x21A($s0)
		lbu		$v1, 0x234($s0)
		ori		$v0, 4
		bne		$v1, $a0, loc_80116A98
		sh		$v0, 0x21A($s0)
		andi	$v0, 0xFFFB
		sh		$v0, 0x21A($s0)
loc_80116A98:
		lbu		$v1, 0x234($s0)
		nop
		sll		$v0, $v1, 1
		addu	$v0, $v1
		addu	$a0, $a1, $v0
		lbu		$v0, 0x14D($s0)
		lbu		$v1, 0($a0)
		nop
		sltu	$v0, $v1
		beqz	$v0, loc_80116AD4
		lui		$v1, 0x1F
		lbu		$v0, 1($a0)
		sb		$0, 0x16B($s0)
		j		loc_80116B08
		addu	$v0, $v1
loc_80116AD4:
		li		$a0, 0x1F1E00
		lhu		$v0, 0x21A($s0)
		lbu		$v1, 0x234($s0)
		andi	$v0, 0xFFFB
		sh		$v0, 0x21A($s0)
		sll		$v0, $v1, 1
		addu	$v0, $v1
		addu	$v0, $a1, $v0
		lbu		$v0, 2($v0)
		li		$v1, 1
		sb		$v1, 0x16B($s0)
		addu	$v0, $a0
loc_80116B08:
		sw		$v0, 0x14C($s0)
		lbu		$v0, 0x1C0($s0)
		li		$v1, 1
		sb		$v1, 6($s0)
		ori		$v0, 1
		sb		$v0, 0x1C0($s0)
		lbu		$v0, 0x1D3($s0)
		lw		$v1, 0x198($s0)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s0)
		lw		$v0, 0x58C($v1)
		nop
		sh		$v0, 0x20($sp)
		lw		$v0, 0x590($v1)
		li		$a0, 0x1FA0
		addiu	$v0, 0x12C
		sh		$v0, 0x22($sp)
		lw		$v0, 0x594($v1)
		addiu	$a3, $sp, 0x20
		sh		$v0, 0x24($sp)
		lw		$a2, 0x198($s0)
		lh		$a1, 0x76($s0)
		jal		Esp_call
		addiu	$a2, 0x48
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80116B80
		li		$a0, 0xB
		li		$a0, 0xD
loc_80116B80:
		jal		Snd_se_enem
		move	$a1, $s0
		jal		Em_dead_flg_on
		move	$a0, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80116BC4
		li		$v0, 0xB
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80116BC4
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0xB
loc_80116BC4:
		bne		$v1, $v0, loc_80116C24
		nop
		jal		Em10Ryudm
		move	$a0, $s0
		li		$a1, 0x304040
		li		$a0, 0x40F0FA0
		lw		$a2, 0x198($s0)
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
		lh		$a1, 0x76($s0)
		jal		Esp_call
		addiu	$a2, 0x5A8
loc_80116C24:
		lbu		$v1, 5($s0)
		li		$v0, 9
		beq		$v1, $v0, loc_80116C3C
		li		$v0, 0x11
		bne		$v1, $v0, loc_80116C60
		li		$v0, 0xE
loc_80116C3C:
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80116C58
		nop
		jal		Em10Tudm
		move	$a0, $s0
loc_80116C58:
		lbu		$v1, 5($s0)
		li		$v0, 0xE
loc_80116C60:
		bne		$v1, $v0, loc_80116C74
		li		$v0, 0xB
		jal		Em10Spdm
		move	$a0, $s0
		li		$v0, 0xB
loc_80116C74:
		sh		$v0, 0x144($s0)
loc_80116C78:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x80
		beqz	$v0, loc_80116CE0
		nop
		lb		$v0, 0x16B($s0)
		nop
		bnez	$v0, loc_80116CD4
		li		$v0, 3
		li		$v0, 2
		j		loc_80116CE0
		sb		$v0, 6($s0)
loc_80116CB0:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x80
		lbu		$v0, 0x14E($s0)
		nop
		bnez	$v0, loc_80116CE0
		li		$v0, 3
loc_80116CD4:
		j		loc_80116CE0
		sb		$v0, 6($s0)
loc_80116CDC:
		sw		$v0, 4($s0)
loc_80116CE0:
		lw		$ra, 0x34($sp)
		lw		$s2, 0x30($sp)
		lw		$s1, 0x2C($sp)
		lw		$s0, 0x28($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop