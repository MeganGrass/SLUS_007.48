

		addiu	$sp, -0x38
		sw		$s1, 0x24($sp)
		move	$s1, $a0
		sw		$s3, 0x2C($sp)
		move	$s3, $a1
		sw		$s4, 0x30($sp)
		move	$s4, $a2
		sw		$ra, 0x34($sp)
		sw		$s2, 0x28($sp)
		sw		$s0, 0x20($sp)
		la		$a1, 0x8010D0F8
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x1B($sp)
		swr		$v0, 0x18($sp)
		swl		$v1, 0x1F($sp)
		swr		$v1, 0x1C($sp)
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		li		$s0, 1
		jal		sub_80028794
		sw		$s0, 4($s1)
		sh		$0, 0x1D0($s1)
		sh		$0, 0x1CC($s1)
		sh		$0, 0x1C8($s1)
		jal		Rnd
		sb		$0, 0x1D3($s1)
		andi	$v0, 0xF
		sll		$v0, 1
		lui     at, 0x8012
		addu    at, at, $v0
		lhu     $v1, -0x6A00(at)		;; Em10Life
		li		$v0, 0xD
		sb		$v0, 0x151($s1)
		sb		$v0, 0x152($s1)
		sb		$v0, 0x153($s1)
		jal		Rnd
		sh		$v1, 0x156($s1)
		addiu	$v1, $sp, 0x18
		andi	$v0, 7
		addu	$v1, $v0
		lbu		$v0, 0($v1)
		sh		$0, 0x21A($s1)
		sb		$0, 0x219($s1)
		sb		$0, 0x222($s1)
		jal		Rnd
		sb		$v0, 0x218($s1)
		li		$a0, 0xC000001
		andi	$v0, 0xF
		li		$v1, 0x1F4
		sh		$v1, 0x9A($s1)
		sh		$v1, 0x9C($s1)
		sh		$v1, 0x90($s1)
		sh		$v1, 0x92($s1)
		lbu		$v1, 8($s1)
		addiu	$v0, 0x10
		sb		$v0, 0x223($s1)
		li		$v0, 0xFFFFFA24
		sh		$v0, 0x98($s1)
		li		$v0, 0x5DC
		sh		$v0, 0x9E($s1)
		li		$v0, 0x13
		sb		$0, 0x230($s1)
		sb		$0, 0x231($s1)
		sw		$s0, 0x1E8($s1)
		sh		$0, 0x94($s1)
		sh		$0, 0x96($s1)
		bne		$v1, $v0, loc_80111A54
		sw		$a0, 0($s1)
		li		$v0, 0xE66
		sh		$v0, 0x1DE($s1)
loc_80111A54:
		lbu		$v1, 8($s1)
		li		$v0, 0x1E
		bne		$v1, $v0, loc_80111A6C
		move	$a0, $s1
		li		$v0, 0xE66
		sh		$v0, 0x1DE($s1)
loc_80111A6C:
		move	$a1, $s3
		move	$a2, $s4
		li		$a3, 0x100
		jal		Joint_move
		sw		$s0, 0x14C($s1)
		lhu		$v0, 0x10E($s1)
		li		$v1, 6
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_80111A98
		li		$v0, 0x101
		sw		$v0, 4($s1)
loc_80111A98:
		lbu		$v1, 8($s1)
		li		$v0, 0x1F
		bne		$v1, $v0, loc_80111CA4
		nop
		lbu		$v0, 0x1CF($s1)
		nop
		andi	$v0, 0xC0
		bnez	$v0, loc_80111AEC
		nop
		jal		Rnd
		nop
		li		$v1, 0x55555556
		mult	$v0, $v1
		sra		$a0, $v0, 31
		mfhi	$t0
		subu	$a0, $t0, $a0
		sll		$v1, $a0, 1
		addu	$v1, $a0
		subu	$v0, $v1
		addiu	$s2, $v0, 1
loc_80111AEC:
		lbu		$v0, 0x1CF($s1)
		nop
		andi	$v0, 0x3F
		beqz	$v0, loc_80111B04
		move	$a2, $0
		move	$s2, $v0
loc_80111B04:
		addiu	$s0, $s2, 0x1E0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 4
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0xB0
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x15C
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x208
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x2B4
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x360
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x40C
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x4B8
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x610
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x6BC
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x814
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0x8C0
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x104($s1)
		lbu		$a3, 0x105($s1)
		addiu	$a0, 0xAC4
		addu	$a1, $s2
		jal		Texture_Move
		addu	$a3, $s0
loc_80111CA4:
		li		$v1, 0x1000
		li		$a3, 1
		li		$a2, 0x808080
		lw		$a0, 0x198($s1)
		lbu		$a1, 0x107($s1)
		addiu	$v0, $a0, 0xA2
loc_80111CC0:
		sw		$v1, -0x5A($v0)
		sw		$0, -0x56($v0)
		sw		$v1, -0x52($v0)
		sw		$0, -0x4E($v0)
		sw		$v1, -0x4A($v0)
		sw		$0, -0x46($v0)
		sw		$0, -0x42($v0)
		sw		$0, -0x3E($v0)
		sw		$v1, -0x8A($v0)
		sw		$0, -0x86($v0)
		sw		$v1, -0x82($v0)
		sw		$0, -0x7E($v0)
		sw		$v1, -0x7A($v0)
		sw		$0, -0x9E($v0)
		sw		$0, -0x3A($v0)
		sh		$0, -0x36($v0)
		sw		$a3, 0($a0)
		sw		$a2, -0x32($v0)
		sh		$0, -0xA($v0)
		sh		$0, -8($v0)
		sh		$0, -6($v0)
		sh		$0, -4($v0)
		sh		$0, -2($v0)
		sh		$0, 0($v0)
		addiu	$v0, 0xAC
		addiu	$a1, -1
		bnez	$a1, loc_80111CC0
		addiu	$a0, 0xAC
		lw		$v0, 0x198($s1)
		nop
		sw		$0, 0xA14($v0)
		lw		$v0, 0x198($s1)
		nop
		sw		$0, 0xAC0($v0)
		lw		$ra, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop