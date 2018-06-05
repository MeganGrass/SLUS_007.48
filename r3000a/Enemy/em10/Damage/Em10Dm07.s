

		addiu	$sp, -0x88
		sw		$s1, 0x74($sp)
		move	$s1, $a0
		sw		$s2, 0x78($sp)
		move	$s2, $a1
		sw		$s3, 0x7C($sp)
		sw		$ra, 0x80($sp)
		sw		$s0, 0x70($sp)
		sh		$0, 0x18($sp)
		sh		$0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lbu		$v1, 6($s1)
		li		$s0, 1
		beq		$v1, $s0, loc_80114D00
		move	$s3, $a2
		slti	$v0, $v1, 2
		beqz	$v0, loc_80114AD0
		nop
		beqz	$v1, loc_80114AEC
		li		$v0, 1
		j		loc_80114ED0
		nop
loc_80114AD0:
		li		$v0, 2
		beq		$v1, $v0, loc_80114DB8
		li		$v0, 3
		beq		$v1, $v0, loc_80114E58
		move	$a0, $s1
		j		loc_80114ED0
		nop
loc_80114AEC:
		lhu		$v1, 0x1D0($s1)
		sb		$v0, 6($s1)
		li		$v0, 1
		sh		$0, 0x158($s1)
		sh		$v0, 0x15A($s1)
		andi	$v1, 0x20
		beqz	$v1, loc_80114B14
		sb		$0, 0x16A($s1)
		li		$v0, 0xFFFFFFFF
		sh		$v0, 0x15A($s1)
loc_80114B14:
		li		$a0, 0x17D0
		addiu	$a3, $sp, 0x18
		lw		$a2, 0x198($s1)
		li		$v0, 0x12C
		sh		$v0, 0x1A($sp)
		lh		$a1, 0x76($s1)
		jal		Esp_call
		addiu	$a2, 0x5A8
		lw		$v1, 0x228($s1)
		li		$v0, 0xF
		sb		$v0, 0x14E($s1)
		andi	$v0, $v1, 0xFF
		bne		$v0, $s0, loc_80114B80
		lui		$v0, 0xFF
		sw		$v1, 0x22C($s1)
		and		$v0, $v1, $v0
		li		$v1, 2
		bne		$v0, $v1, loc_80114B80
		li		$a0, 0x20
		li		$a1, 0x84
		move	$a2, $0
		move	$a3, $0
		la		$v0, aBug
		sw		$v0, 0x10($sp)
		jal		Print8
		sw		$0, 0x14($sp)
loc_80114B80:
		lh		$v0, 0x156($s1)
		nop
		bgez	$v0, loc_80114BC0
		li		$v0, 1
		lw		$s0, 0x198($s1)
		sh		$0, 0x156($s1)
		jal		Rnd
		sb		$v0, 0x16A($s1)
		li		$a0, 0x31F40
		sll		$a1, $v0, 4
		addiu	$a3, $sp, 0x18
		jal		Esp_call
		addiu	$a2, $s0, 0x5A8
		li		$v0, 0xF
		sb		$v0, 0x14E($s1)
loc_80114BC0:
		lbu		$v0, 0x239($s1)
		nop
		bnez	$v0, loc_80114BE0
		li		$a0, 0xC
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_80114BE0:
		lbu		$v1, 5($s1)
		li		$v0, 0xA
		bne		$v1, $v0, loc_80114C38
		li		$v0, 0x18
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80114C38
		li		$v0, 0x18
		lbu		$v0, 0x1D2($s1)
		nop
		sltiu	$v0, 3
		beqz	$v0, loc_80114C38
		li		$v0, 0x18
		jal		Em10Firedm
		move	$a0, $s1
		lhu		$v0, 0x21A($s1)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s1)
		lbu		$v1, 5($s1)
		li		$v0, 0x18
loc_80114C38:
		sb		$v0, 0x16B($s1)
		li		$v0, 0x10
		bne		$v1, $v0, loc_80114C9C
		nop
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80114C88
		nop
		lbu		$v0, 0x23A($s1)
		nop
		sltiu	$v0, 9
		bnez	$v0, loc_80114C88
		nop
		jal		Em10Firedm
		move	$a0, $s1
		lhu		$v0, 0x21A($s1)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s1)
loc_80114C88:
		lbu		$v0, 0x23A($s1)
		li		$v1, 2
		sb		$v1, 0x16B($s1)
		addiu	$v0, 1
		sb		$v0, 0x23A($s1)
loc_80114C9C:
		lbu		$v1, 5($s1)
		li		$v0, 0xF
		beq		$v1, $v0, loc_80114CB4
		li		$v0, 0x12
		bne		$v1, $v0, loc_80114CC4
		li		$v0, 0xB
loc_80114CB4:
		li		$v0, 2
		sb		$v0, 0x16B($s1)
		lbu		$v1, 5($s1)
		li		$v0, 0xB
loc_80114CC4:
		bne		$v1, $v0, loc_80114CE8
		nop
		lbu		$v0, 0x1D2($s1)
		nop
		sltiu	$v0, 3
		beqz	$v0, loc_80114CE8
		nop
		jal		Em10Ryudm
		move	$a0, $s1
loc_80114CE8:
		lbu		$v1, 5($s1)
		li		$v0, 0xE
		bne		$v1, $v0, loc_80114D04
		move	$a0, $s1
		jal		Em10Spdm
		move	$a0, $s1
loc_80114D00:
		move	$a0, $s1
loc_80114D04:
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x100
		bnez	$v0, loc_80114E70
		addiu	$a0, $sp, 0x18
		lh		$v1, 0x158($s1)
		lb		$v0, 0x16B($s1)
		nop
		mult	$v1, $v0
		lh		$v1, 0x15A($s1)
		mflo	$t0
		sll		$v0, $t0, 3
		negu	$v0, $v0
		mult	$v0, $v1
		addiu	$s0, $sp, 0x20
		move	$a1, $s0
		lw		$s2, 0x198($s1)
		mflo	$t0
		jal		RotMatrix
		sh		$t0, 0x1C($sp)
		addiu	$a0, $s2, 0x18
		jal		MulMatrix
		move	$a1, $s0
		addiu	$s2, 0xAC
		move	$a0, $s0
		addiu	$s0, $sp, 0x40
		jal		TransposeMatrix
		move	$a1, $s0
		move	$a0, $s0
		jal		MulMatrix2
		addiu	$a1, $s2, 0x18
		lhu		$v0, 0x158($s1)
		nop
		addiu	$v1, $v0, 1
		sll		$v0, 16
		sra		$v0, 16
		slti	$v0, 3
		bnez	$v0, loc_80114ED0
		sh		$v1, 0x158($s1)
		li		$v0, 2
		sb		$v0, 6($s1)
		li		$v0, 0x10
		j		loc_80114ED0
		sh		$v0, 0x158($s1)
loc_80114DB8:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x100
		bnez	$v0, loc_80114E70
		addiu	$a0, $sp, 0x18
		lh		$v1, 0x158($s1)
		lb		$v0, 0x16B($s1)
		nop
		mult	$v1, $v0
		mflo	$t0
		lh		$v1, 0x15A($s1)
		negu	$v0, $t0
		mult	$v0, $v1
		addiu	$s0, $sp, 0x20
		move	$a1, $s0
		lw		$s2, 0x198($s1)
		mflo	$t0
		jal		RotMatrix
		sh		$t0, 0x1C($sp)
		addiu	$a0, $s2, 0x18
		jal		MulMatrix
		move	$a1, $s0
		addiu	$s2, 0xAC
		move	$a0, $s0
		addiu	$s0, $sp, 0x40
		jal		TransposeMatrix
		move	$a1, $s0
		move	$a0, $s0
		jal		MulMatrix2
		addiu	$a1, $s2, 0x18
		lhu		$v1, 0x158($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80114ED0
		sh		$v0, 0x158($s1)
		li		$v0, 3
		j		loc_80114ED0
		sb		$v0, 6($s1)
loc_80114E58:
		move	$a1, $s2
		move	$a2, $s3
		jal		Joint_move
		li		$a3, 0x100
		beqz	$v0, loc_80114ED0
		nop
loc_80114E70:
		lw		$a0, 0x22C($s1)
		lhu		$v1, 0x21A($s1)
		li		$v0, 0x1F4
		sh		$v0, 0x9A($s1)
		sh		$v0, 0x9C($s1)
		sh		$v0, 0x90($s1)
		sh		$v0, 0x92($s1)
		li		$v0, 0xFFFFFA24
		sh		$v0, 0x98($s1)
		li		$v0, 0x5DC
		sh		$v0, 0x9E($s1)
		lw		$v0, 0($s1)
		andi	$v1, 0xFFED
		sh		$v1, 0x21A($s1)
		lui		$v1, 0xC00
		or		$v0, $v1
		sw		$v0, 0($s1)
		lhu		$v0, 0x10E($s1)
		sw		$a0, 4($s1)
		lbu		$v1, 6($s1)
		andi	$v0, 0xDFFF
		addiu	$v1, 1
		sh		$v0, 0x10E($s1)
		sb		$v1, 6($s1)
loc_80114ED0:
		lw		$ra, 0x80($sp)
		lw		$s3, 0x7C($sp)
		lw		$s2, 0x78($sp)
		lw		$s1, 0x74($sp)
		lw		$s0, 0x70($sp)
		addiu	$sp, 0x88
		jr		$ra
		nop