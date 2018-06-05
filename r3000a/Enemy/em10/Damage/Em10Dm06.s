

		addiu	$sp, -0x30
		sw		$s0, 0x20($sp)
		move	$s0, $a0
		sw		$s1, 0x24($sp)
		move	$s1, $a1
		sw		$s2, 0x28($sp)
		sw		$ra, 0x2C($sp)
		li		$v0, -450
		sh		$v0, 0x10($sp)
		li		$v0, 0xFA
		sh		$v0, 0x12($sp)
		lbu		$v1, 6($s0)
		li		$a0, 1
		beq		$v1, $a0, loc_80114A2C
		move	$s2, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_801148E0
		nop
		beqz	$v1, loc_801148F4
		nop
		j		loc_80114A5C
		nop
loc_801148E0:
		li		$v0, 2
		beq		$v1, $v0, loc_80114A54
		li		$v0, 1
		j		loc_80114A5C
		nop
loc_801148F4:
		jal		Rnd
		nop
		li		$v1, 0x30006
		li		$a0, 0x1770
		move	$a1, $0
		addiu	$a3, $sp, 0x18
		andi	$v0, 7
		sll		$v0, 8
		lw		$a2, 0x198($s0)
		addu	$v0, $v1
		sw		$v0, 0x14C($s0)
		li		$v0, 1
		sb		$v0, 6($s0)
		sh		$0, 0x18($sp)
		sh		$0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		jal		Esp_call
		addiu	$a2, 0x48
		lbu		$v0, 0x239($s0)
		nop
		bnez	$v0, loc_80114960
		li		$a0, 0xC
		jal		Snd_se_enem
		move	$a1, $s0
		li		$v0, 0x96
		sb		$v0, 0x239($s0)
loc_80114960:
		lbu		$v1, 5($s0)
		li		$v0, 0xA
		bne		$v1, $v0, loc_801149A4
		li		$v0, 0xB
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_801149A4
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s0
		lhu		$v0, 0x21A($s0)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s0)
		lbu		$v1, 5($s0)
		li		$v0, 0xB
loc_801149A4:
		bne		$v1, $v0, loc_801149B4
		nop
		jal		Em10Ryudm
		move	$a0, $s0
loc_801149B4:
		lbu		$v1, 5($s0)
		li		$v0, 0xE
		bne		$v1, $v0, loc_801149D4
		li		$v0, 0x10
		jal		Em10Spdm
		move	$a0, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0x10
loc_801149D4:
		bne		$v1, $v0, loc_80114A2C
		nop
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80114A1C
		nop
		lbu		$v0, 0x23A($s0)
		nop
		sltiu	$v0, 9
		bnez	$v0, loc_80114A1C
		nop
		jal		Em10Firedm
		move	$a0, $s0
		lhu		$v0, 0x21A($s0)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s0)
loc_80114A1C:
		lbu		$v0, 0x23A($s0)
		nop
		addiu	$v0, 1
		sb		$v0, 0x23A($s0)
loc_80114A2C:
		move	$a0, $s0
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x400
		lbu		$v1, 6($s0)
		nop
		addu	$v1, $v0
		j		loc_80114A5C
		sb		$v1, 6($s0)
loc_80114A54:
		sh		$v0, 0x10E($s0)
		sw		$a0, 4($s0)
loc_80114A5C:
		lw		$ra, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x30
		jr		$ra
		nop