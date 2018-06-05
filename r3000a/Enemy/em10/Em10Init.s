

		addiu	$sp, -0x50
		sw		$s2, 0x38($sp)
		move	$s2, $a0
		sw		$s4, 0x40($sp)
		move	$s4, $a1
		sw		$ra, 0x48($sp)
		sw		$s5, 0x44($sp)
		sw		$s3, 0x3C($sp)
		sw		$s1, 0x34($sp)
		sw		$s0, 0x30($sp)
		la		$a1, 0x8010D004
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		swl		$v0, 0x23($sp)
		swr		$v0, 0x20($sp)
		swl		$v1, 0x27($sp)
		swr		$v1, 0x24($sp)
		li		$v0, 1
		la		$s1, G_System_flg
		sw		$v0, 4($s2)
		sh		$0, 0x1D0($s2)
		sh		$0, 0x1CC($s2)
		sh		$0, 0x1C8($s2)
		sb		$0, 0x1D3($s2)
		lw		$v0, 0($s1)
		nop
		andi	$v0, 0x40
		beqz	$v0, loc_8010D75C
		move	$s5, $a2
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		sll		$s0, 1
		lui     at, 0x8012
		addu    at, at, $s0
		lhu     $v0, -0x6990(at)
		nop
		sh		$v0, 0x156($s2)
		lw		$v0, 0($s1)
		nop
		andi	$v0, 0x20
		beqz	$v0, loc_8010D7F0
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		sll		$s0, 1
		lui     at, 0x8012
		addu    at, at, $s0
		lhu     $v0, -0x6970(at)
		j		loc_8010D7D8
		sh		$v0, 0x156($s2)
loc_8010D75C:
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		sll		$s0, 1
		lui     at, 0x8012
		addu    at, at, $s0
		lhu     $v0, -0x6A00(at)
		nop
		sh		$v0, 0x156($s2)
		lw		$v0, 0($s1)
		nop
		andi	$v0, 0x20
		beqz	$v0, loc_8010D7F0
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		sll		$s0, 1
		lui     at, 0x8012
		addu    at, at, $s0
		lhu     $v0, -0x69E0(at)
		nop
		sh		$v0, 0x156($s2)
loc_8010D7D8:
		lw		$v0, G_System_flg
		nop
		andi	$v0, 0x20
		bnez	$v0, loc_8010D818
		nop
loc_8010D7F0:
		lbu		$v0, G_Enemy_num
		nop
		sltiu	$v0, 4
		beqz	$v0, loc_8010D818
		nop
		lhu		$v0, 0x156($s2)
		nop
		addiu	$v0, 0xF
		sh		$v0, 0x156($s2)
loc_8010D818:
		lw		$v1, 0x198($s2)
		li		$v0, 0xD
		sb		$v0, 0x151($s2)
		sb		$v0, 0x152($s2)
		sb		$v0, 0x153($s2)
		li		$v0, 8
		sb		$v0, 0x1C1($s2)
		li		$v0, 0x60
		sb		$0, 0x1C0($s2)
		sh		$v0, 0x5FC($v1)
		sh		$v0, 0x5FE($v1)
		li		$v0, 0x200
		sh		$v0, 0x600($v1)
		li		$v0, 0x138
		sh		$0, 0x5F8($v1)
		sh		$0, 0x5FA($v1)
		jal		Rnd
		sh		$v0, 0x602($v1)
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 7
		addu	$v0, $sp, $s0
		lbu		$v0, 0x20($v0)
		sh		$0, 0x21A($s2)
		sb		$0, 0x219($s2)
		sb		$0, 0x222($s2)
		jal		Rnd
		sb		$v0, 0x218($s2)
		andi	$v0, 0xF
		lbu		$v1, 8($s2)
		addiu	$v0, 0x10
		sb		$v0, 0x223($s2)
		li		$v0, 0x11
		sb		$0, 0x230($s2)
		sb		$0, 0x231($s2)
		sh		$0, 0x236($s2)
		sb		$0, 0x239($s2)
		sb		$0, 0x23A($s2)
		sb		$0, 0x23B($s2)
		bne		$v1, $v0, loc_8010D8D8
		sb		$0, 0x23C($s2)
		lhu		$v0, 0x21A($s2)
		li		$v1, 0xFA
		sh		$v1, 0x156($s2)
		ori		$v0, 0x8000
		sh		$v0, 0x21A($s2)
loc_8010D8D8:
		lw		$v0, G_System_flg
		nop
		andi	$v0, 0x40
		beqz	$v0, loc_8010D954
		li		$v0, 1
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		li		$v1, 0x55555556
		andi	$v0, 3
		srav	$s0, $v0
		mult	$s0, $v1
		sra		$v1, $s0, 31
		mfhi	$t1
		subu	$v1, $t1, $v1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		bne		$s0, $v0, loc_8010D954
		li		$v0, 1
		lhu		$v0, 0x21A($s2)
		nop
		ori		$v0, 0x8000
		jal		Rnd
		sh		$v0, 0x21A($s2)
		andi	$v0, 0xF
		addiu	$v0, 0x20
		sb		$v0, 0x223($s2)
		li		$v0, 1
loc_8010D954:
		sw		$v0, 0x1E8($s2)
		li		$v0, 0xFFFFFA24
		sh		$v0, 0x98($s2)
		li		$v0, 0x5DC
		sh		$v0, 0x9E($s2)
		lw		$v0, 0($s2)
		li		$v1, 0x1F4
		sh		$v1, 0x9A($s2)
		sh		$v1, 0x9C($s2)
		sh		$v1, 0x90($s2)
		sh		$v1, 0x92($s2)
		sh		$v1, 0x1EE($s2)
		lui		$v1, 0xC00
		or		$v0, $v1
		lbu		$v1, 8($s2)
		sh		$0, 0x94($s2)
		sh		$0, 0x96($s2)
		sw		$v0, 0($s2)
		li		$v0, 0x13
		bne		$v1, $v0, loc_8010D9AC
		li		$v0, 0xE66
		sh		$v0, 0x1DE($s2)
loc_8010D9AC:
		lbu		$v1, 8($s2)
		li		$v0, 0x1E
		bne		$v1, $v0, loc_8010D9C4
		li		$a1, 1
		li		$v0, 0xE66
		sh		$v0, 0x1DE($s2)
loc_8010D9C4:
		lhu		$v1, 0x10E($s2)
		li		$v0, 2
		andi	$v1, 0x3F
		bne		$v1, $v0, loc_8010D9F4
		sw		$a1, 0x14C($s2)
		li		$v0, 0x16
		sw		$v0, 0x14C($s2)
		lhu		$v0, 0x21A($s2)
		li		$v1, 0x701
		sw		$v1, 4($s2)
		ori		$v0, 4
		sh		$v0, 0x21A($s2)
loc_8010D9F4:
		lhu		$v0, 0x10E($s2)
		li		$v1, 4
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DA14
		li		$v0, 0x17
		sw		$v0, 0x14C($s2)
		li		$v0, 0x701
		sw		$v0, 4($s2)
loc_8010DA14:
		lhu		$v0, 0x10E($s2)
		li		$v1, 5
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DA64
		li		$v0, 0x16
		sw		$v0, 0x14C($s2)
		li		$v0, 0x701
		sw		$v0, 4($s2)
		li		$v0, 0x4002
		sh		$v0, 0x10E($s2)
		li		$v0, 0xFFFFFFFF
		sh		$v0, 0x156($s2)
		lhu		$v0, 0x21A($s2)
		lw		$v1, 0x198($s2)
		ori		$v0, 4
		sh		$v0, 0x21A($s2)
		lw		$v0, 0x560($v1)
		nop
		ori		$v0, 0x4000
		sw		$v0, 0x560($v1)
loc_8010DA64:
		lhu		$v0, 0x10E($s2)
		li		$v1, 7
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DAA8
		li		$v0, 0x17
		lw		$v1, 0x198($s2)
		sw		$v0, 0x14C($s2)
		li		$v0, 0x701
		sw		$v0, 4($s2)
		li		$v0, 0x4004
		sh		$v0, 0x10E($s2)
		li		$v0, 0xFFFFFFFF
		sh		$v0, 0x156($s2)
		lw		$v0, 0x560($v1)
		nop
		ori		$v0, 0x4000
		sw		$v0, 0x560($v1)
loc_8010DAA8:
		lhu		$v0, 0x10E($s2)
		li		$v1, 6
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DAC0
		li		$v0, 0x101
		sw		$v0, 4($s2)
loc_8010DAC0:
		lhu		$v0, 0x10E($s2)
		li		$v1, 8
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DAE0
		li		$v0, 0x12
		sw		$v0, 0x14C($s2)
		li		$v0, 0x801
		sw		$v0, 4($s2)
loc_8010DAE0:
		lhu		$v0, 0x10E($s2)
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010DB60
		lui		$v1, 0xF3FF
		ori     $v1, $v1, 0xFFFF
		li		$v0, 0x17
		sw		$v0, 0x14C($s2)
		li		$v0, 0xC8
		sh		$v0, 0x9A($s2)
		sh		$v0, 0x9C($s2)
		sh		$v0, 0x90($s2)
		sh		$v0, 0x92($s2)
		li		$v0, 0xFFFFFEA2
		sh		$v0, 0x98($s2)
		li		$v0, 0x15E
		sh		$v0, 0x9E($s2)
		lhu		$v0, 0x10E($s2)
		lw		$a0, 0($s2)
		ori		$v0, 0x2000
		and		$a0, $v1
		sh		$v0, 0x10E($s2)
		lui		$v0, 0x400
		lhu		$v1, 0x156($s2)
		or		$a0, $v0
		sw		$a0, 0($s2)
		sll		$v1, 16
		sra		$v0, $v1, 16
		srl		$v1, 31
		addu	$v0, $v1
		sra		$v0, 1
		sh		$v0, 0x156($s2)
loc_8010DB60:
		lhu		$v0, 0x10E($s2)
		nop
		andi	$v0, 0x3F
		bne		$v0, $a1, loc_8010DB78
		li		$v0, 0x201
		sw		$v0, 4($s2)
loc_8010DB78:
		lhu		$v0, 0x10E($s2)
		li		$v1, 3
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DB90
		move	$a0, $s2
		sw		$a1, 4($s2)
loc_8010DB90:
		move	$a1, $s4
		move	$a2, $s5
		jal		Joint_move
		li		$a3, 0x100
		lhu		$v0, 0x10E($s2)
		li		$v1, 0xA
		andi	$v0, 0x3F
		bne		$v0, $v1, loc_8010DC40
		addiu	$a0, $s2, 0x16C
		li		$t0, 0xF3FFFFFF
		move	$a0, $s2
		lw		$a1, 0x190($s2)
		lw		$a2, 0x194($s2)
		li		$v0, 0xFFFFFEA2
		sh		$v0, 0x98($s2)
		li		$v0, 0x15E
		sh		$v0, 0x9E($s2)
		li		$v0, 0xF01
		sw		$v0, 4($s2)
		lbu		$v0, 0x1D3($s2)
		lw		$v1, 0($s2)
		li		$a3, 0x100
		sb		$0, 0x222($s2)
		sh		$0, 0x9A($s2)
		sh		$0, 0x9C($s2)
		sh		$0, 0x90($s2)
		sh		$0, 0x92($s2)
		sw		$0, 0x14C($s2)
		ori		$v0, 0x80
		and		$v1, $t0
		lui		$t0, 0x400
		sb		$v0, 0x1D3($s2)
		lhu		$v0, 0x21A($s2)
		or		$v1, $t0
		sw		$v1, 0($s2)
		lw		$v1, 0($s2)
		andi	$v0, 0xFFFB
		ori		$v0, 2
		ori		$v1, 8
		sh		$v0, 0x21A($s2)
		jal		Joint_move
		sw		$v1, 0($s2)
		addiu	$a0, $s2, 0x16C
loc_8010DC40:
		move	$a1, $0
		li		$a2, 0x2580190
		lw		$v0, 0x198($s2)
		move	$a3, $0
		addiu	$v0, 0x5C
		jal		Kage_work_set
		sw		$v0, 0x10($sp)
		lbu		$v1, 8($s2)
		li		$v0, 0x12
		bne		$v1, $v0, loc_8010DE98
		li		$v0, 0x1F
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_8010DCA0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x564
		addiu	$a1, 2
		jal		Texture_Move
		addiu	$a3, 0x1E2
loc_8010DCA0:
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_8010DE90
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 4
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0xAC4
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0xB0
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x15C
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x208
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x2B4
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x360
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x40C
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x4B8
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x610
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x6BC
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x768
		addiu	$a1, 2
		jal		Texture_Move
		addiu	$a3, 0x1E2
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x814
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x8C0
		addiu	$a1, 3
		jal		Texture_Move
		addiu	$a3, 0x1E3
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x96C
		addiu	$a1, 2
		jal		Texture_Move
		addiu	$a3, 0x1E2
loc_8010DE90:
		lbu		$v1, 8($s2)
		li		$v0, 0x1F
loc_8010DE98:
		bne		$v1, $v0, loc_8010E0B8
		nop
		lbu		$v0, 0x1CF($s2)
		nop
		andi	$v0, 0xC0
		bnez	$v0, loc_8010DF00
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		jal		Rnd
		move	$s1, $v0
		li		$v1, 0x55555556
		andi	$v0, 3
		sllv	$s1, $v0
		addu	$s0, $s1
		mult	$s0, $v1
		sra		$v1, $s0, 31
		mfhi	$t1
		subu	$v1, $t1, $v1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		subu	$s0, $v0
		addiu	$s3, $s0, 1
loc_8010DF00:
		lbu		$v0, 0x1CF($s2)
		nop
		andi	$v0, 0x3F
		beqz	$v0, loc_8010DF18
		move	$a2, $0
		move	$s3, $v0
loc_8010DF18:
		addiu	$s0, $s3, 0x1E0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 4
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0xB0
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x15C
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x208
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x2B4
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x360
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x40C
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x4B8
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x610
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x6BC
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x814
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0x8C0
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
		move	$a2, $0
		lw		$a0, 0x198($s2)
		lbu		$a1, 0x104($s2)
		lbu		$a3, 0x105($s2)
		addiu	$a0, 0xAC4
		addu	$a1, $s3
		jal		Texture_Move
		addu	$a3, $s0
loc_8010E0B8:
		lhu		$v0, 0x10E($s2)
		nop
		andi	$v0, 0x80
		beqz	$v0, loc_8010E0D4
		nop
		jal		Em10Firedm
		move	$a0, $s2
loc_8010E0D4:
		lw		$v0, 0x198($s2)
		nop
		sw		$0, 0xA14($v0)
		lw		$v0, 0x198($s2)
		nop
		sw		$0, 0xAC0($v0)
		lbu		$v0, 8($s2)
		la		$v1, PlDamegeEm210
		sll		$v0, 2
		lui     at, 0x800D
		addu    at, at, $v0
		sw      $v1, -0x1D00(at)
		lbu		$v0, 8($s2)
		la		$v1, PldieEm210
		sll		$v0, 2
		lui     at, 0x800D
		addu    at, at, $v0
		sw      $v1, -0x1C00(at)
		lw		$ra, 0x48($sp)
		lw		$s5, 0x44($sp)
		lw		$s4, 0x40($sp)
		lw		$s3, 0x3C($sp)
		lw		$s2, 0x38($sp)
		lw		$s1, 0x34($sp)
		lw		$s0, 0x30($sp)
		addiu	$sp, 0x50
		jr		$ra
		nop