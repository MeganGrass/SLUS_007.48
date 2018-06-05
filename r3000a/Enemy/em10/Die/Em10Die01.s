

		addiu	$sp, -0x30
		sw		$s0, 0x20($sp)
		move	$s0, $a0
		sw		$s1, 0x24($sp)
		move	$s1, $a1
		sw		$s2, 0x28($sp)
		sw		$ra, 0x2C($sp)
		li		$a1, 1
		li		$v0, 2
		sb		$a1, 0x10($sp)
		sb		$v0, 0x11($sp)
		lbu		$v1, 6($s0)
		li		$v0, 1
		beq		$v1, $v0, loc_80115BA4
		move	$s2, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_80115A6C
		nop
		beqz	$v1, loc_80115A80
		lui		$v0, 0xF
		j		loc_80115BD0
		nop
loc_80115A6C:
		li		$v0, 2
		beq		$v1, $v0, loc_80115BCC
		li		$v0, 7
		j		loc_80115BD0
		nop
loc_80115A80:
		ori		$v0, 7
		li		$a0, 0x1FA0
		sw		$v0, 0x14C($s0)
		lhu		$v0, 0x21A($s0)
		lbu		$v1, 0x1C0($s0)
		lw		$a2, 0x198($s0)
		addiu	$a3, $sp, 0x18
		sb		$a1, 6($s0)
		andi	$v0, 0xFFFB
		sh		$v0, 0x21A($s0)
		lbu		$v0, 0x1D3($s0)
		ori		$v1, 1
		sb		$v1, 0x1C0($s0)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s0)
		li		$v0, 0x12C
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$a1, 0x76($s0)
		jal		Esp_call
		addiu	$a2, 0x48
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80115AF0
		li		$a0, 0xB
		li		$a0, 0xD
loc_80115AF0:
		jal		Snd_se_enem
		move	$a1, $s0
		jal		Em_dead_flg_on
		move	$a0, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80115B34
		li		$v0, 0xB
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80115B34
		li		$v0, 0xB
		jal		Em10Firedm
		move	$a0, $s0
		lbu		$v1, 5($s0)
		li		$v0, 0xB
loc_80115B34:
		bne		$v1, $v0, loc_80115B58
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x1000
		bnez	$v0, loc_80115B58
		nop
		jal		Em10Ryudm
		move	$a0, $s0
loc_80115B58:
		lbu		$v1, 5($s0)
		li		$v0, 9
		beq		$v1, $v0, loc_80115B70
		li		$v0, 0x11
		bne		$v1, $v0, loc_80115B94
		li		$v0, 0xE
loc_80115B70:
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80115B8C
		nop
		jal		Em10Tudm
		move	$a0, $s0
loc_80115B8C:
		lbu		$v1, 5($s0)
		li		$v0, 0xE
loc_80115B94:
		bne		$v1, $v0, loc_80115BA8
		move	$a0, $s0
		jal		Em10Spdm
		move	$a0, $s0
loc_80115BA4:
		move	$a0, $s0
loc_80115BA8:
		move	$a1, $s1
		move	$a2, $s2
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s0)
		nop
		addu	$v1, $v0
		j		loc_80115BD0
		sb		$v1, 6($s0)
loc_80115BCC:
		sw		$v0, 4($s0)
loc_80115BD0:
		lw		$ra, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x30
		jr		$ra
		nop