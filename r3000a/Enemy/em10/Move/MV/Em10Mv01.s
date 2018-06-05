

		addiu	$sp, -0x20
		sw		$s1, 0x14($sp)
		move	$s1, $a0
		sw		$ra, 0x18($sp)
		sw		$s0, 0x10($sp)
		lbu		$v1, 6($s1)
		nop
		beqz	$v1, loc_8010EA74
		li		$v0, 1
		beq		$v1, $v0, loc_8010EB24
		nop
		j		loc_8010EF64
		nop
loc_8010EA74:
		li		$v0, 1
		sb		$v0, 6($s1)
		lbu		$v0, 0x218($s1)
		lui		$v1, 0xF
		addu	$v0, $v1
		jal		Rnd
		sw		$v0, 0x14C($s1)
		andi	$v0, 0xF
		sll		$v0, 1
		jal		Rnd
		sb		$v0, 0x16B($s1)
		lb		$v1, 0x16B($s1)
		nop
		sll		$v1, 1
		lui     at, 0x8012
		addu    at, at, $v1
		lhu     $v1, -0x66DC(at)
		nop
		andi	$v1, 0x7FFF
		addu	$v1, $v0
		jal		Rnd
		sh		$v1, 0x158($s1)
		move	$a0, $s1
		move	$a3, $0
		andi	$v0, 0x1F
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		addiu	$v0, 0x1E
		jal		Spd_get
		sb		$v0, 0x16A($s1)
		jal		Rnd
		nop
		move	$a0, $s1
		move	$a3, $0
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		andi	$v0, 0x1F
		jal		Spd_get
		sb		$v0, 0x14D($s1)
		jal		Rnd
		nop
		sra		$v0, 3
		addiu	$v0, 0x64
		sh		$v0, 0x15A($s1)
loc_8010EB24:
		lhu		$v1, 0x158($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8010EBAC
		sh		$v0, 0x158($s1)
		lbu		$v0, 0x16B($s1)
		nop
		addiu	$v0, 1
		sb		$v0, 0x16B($s1)
		sll		$v0, 24
		sra		$v0, 24
		slti	$v0, 0x20
		bnez	$v0, loc_8010EB60
		nop
		sb		$0, 0x16B($s1)
loc_8010EB60:
		jal		Rnd
		nop
		lb		$v1, 0x16B($s1)
		nop
		sll		$v1, 1
		lui     at, 0x8012
		addu    at, at, $v1
		lhu     $v1, -0x66DC(at)
		andi	$v0, 0x1F
		andi	$v1, 0x7FFF
		addu	$v1, $v0
		jal		Rnd
		sh		$v1, 0x158($s1)
		andi	$v0, 1
		lhu		$v1, 0x76($s1)
		sll		$v0, 5
		addiu	$v1, -0x10
		addu	$v1, $v0
		sh		$v1, 0x76($s1)
loc_8010EBAC:
		lw		$v0, 0x1F0($s1)
		nop
		sltiu	$v0, 0x1389
		bnez	$v0, loc_8010EBEC
		li		$v1, 8
		lb		$v0, 0x16B($s1)
		nop
		sll		$v0, 1
		lui     at, 0x8012
		addu    at, at, $v0
		lhu     $v0, -0x66DC(at)
		nop
		srl		$v0, 15
		sll		$v0, 4
		j		loc_8010EBF0
		subu	$v1, $v0
loc_8010EBEC:
		li		$v1, 8
loc_8010EBF0:
		move	$a0, $s1
		sll		$a3, $v1, 16
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		jal		Goto00
		sra		$a3, 0x10
		lbu		$v1, 0x16A($s1)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_8010EC8C
		sb		$v0, 0x16A($s1)
		jal		Rnd
		nop
		move	$a0, $s1
		li		$a3, 0x10
		andi	$v0, 0xF
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		addiu	$v0, 0x1E
		jal		Goto00
		sb		$v0, 0x16A($s1)
		lbu		$v0, 0x239($s1)
		nop
		bnez	$v0, loc_8010EC8C
		nop
		jal		Rnd
		nop
		andi	$v0, 0x1F
		beqz	$v0, loc_8010EC7C
		li		$a0, 0xA
		jal		Rnd
		nop
		andi	$v0, 0x1F
		bnez	$v0, loc_8010EC8C
		li		$a0, 0xB
loc_8010EC7C:
		jal		Snd_se_enem
		move	$a1, $s1
		li		$v0, 0x96
		sb		$v0, 0x239($s1)
loc_8010EC8C:
		lw		$v0, 0x1F0($s1)
		nop
		sltiu	$v0, 0xBB8
		beqz	$v0, loc_8010ECB0
		move	$a0, $s1
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		jal		Goto00
		li		$a3, 0x10
loc_8010ECB0:
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s1
		lw		$a1, 0x108($s1)
		lw		$a2, 0x17C($s1)
		jal		Joint_move
		li		$a3, 0x100
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8010ED00
		nop
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x8000
		beqz	$v0, loc_8010ED60
		move	$a0, $s1
loc_8010ED00:
		lbu		$v1, 0x14D($s1)
		li		$v0, 0xAAAAAAAB
		multu	$v1, $v0
		mfhi	$t0
		srl		$a0, $t0, 1
		sll		$v0, $a0, 1
		addu	$v0, $a0
		subu	$v1, $v0
		andi	$v1, 0xFF
		li		$v0, 2
		bne		$v1, $v0, loc_8010ED5C
		nop
		jal		sub_8010E6C8
		move	$a0, $s1
		move	$a0, $s1
		lh		$a1, 0x1C4($s1)
		lh		$a2, 0x1C6($s1)
		jal		Goto00
		li		$a3, 8
		lw		$a1, 0x17C($s1)
		jal		sub_8002A9C8
		move	$a0, $s1
loc_8010ED5C:
		move	$a0, $s1
loc_8010ED60:
		jal		Add_speedXZ
		move	$a1, $0
		lhu		$v0, 0x15A($s1)
		nop
		addiu	$v0, -1
		sh		$v0, 0x15A($s1)
		sll		$v0, 16
		bnez	$v0, loc_8010EDC0
		nop
		jal		Rnd
		nop
		sra		$v0, 3
		addiu	$v0, 0x64
		jal		Rnd
		sh		$v0, 0x15A($s1)
		andi	$v0, 3
		bnez	$v0, loc_8010EDC0
		nop
		lw		$v0, 0x1F0($s1)
		nop
		sltiu	$v0, 0x1388
		beqz	$v0, loc_8010EDC0
		li		$v0, 0x201
		sw		$v0, 4($s1)
loc_8010EDC0:
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8010EDE8
		nop
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x1000
		beqz	$v0, loc_8010EEC4
		nop
loc_8010EDE8:
		lhu		$v0, 0x236($s1)
		nop
		andi	$v0, 7
		bnez	$v0, loc_8010EE94
		nop
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x800
		beqz	$v0, loc_8010EE94
		nop
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 1
		sll		$s0, 7
		lhu		$v1, 0x76($s1)
		lhu		$v0, 0x156($s1)
		addiu	$v1, 0x40
		subu	$v1, $s0
		addiu	$v0, -1
		sh		$v0, 0x156($s1)
		sll		$v0, 16
		bgez	$v0, loc_8010EE94
		sh		$v1, 0x76($s1)
		lhu		$v0, 0x21A($s1)
		li		$v1, 0xA03
		andi	$v0, 0x1000
		beqz	$v0, loc_8010EE70
		sw		$v1, 4($s1)
		li		$v0, 0xB03
		sw		$v0, 4($s1)
loc_8010EE70:
		li		$v0, 4
		sb		$v0, 0x1D2($s1)
		lbu		$v0, 0x1D3($s1)
		lhu		$v1, 0x21A($s1)
		ori		$v0, 0x80
		ori		$v1, 0x2000
		sb		$v0, 0x1D3($s1)
		j		loc_8010EF64
		sh		$v1, 0x21A($s1)
loc_8010EE94:
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x1000
		beqz	$v0, loc_8010EEC4
		nop
		jal		Rnd
		nop
		lhu		$v1, 0x76($s1)
		sra		$v0, 1
		addiu	$v1, 0x40
		subu	$v1, $v0
		sh		$v1, 0x76($s1)
loc_8010EEC4:
		lw		$v0, 0x1F0($s1)
		nop
		sltiu	$v0, 0x7D0
		beqz	$v0, loc_8010EF14
		move	$a0, $s1
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x200
		bnez	$v0, loc_8010EF14
		nop
		lbu		$v0, Player_Damage_cnt
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8010EF14
		li		$v0, 0x201
		sw		$v0, 4($s1)
loc_8010EF14:
		lhu		$v0, G_Room_player_flg
		nop
		andi	$v0, 4
		beqz	$v0, loc_8010EF64
		nop
		lw		$v0, 0x1F0($s1)
		nop
		sltiu	$v0, 0x9C4
		beqz	$v0, loc_8010EF64
		move	$a0, $s1
		lw		$a1, Player_Pos_x
		lw		$a2, Player_Pos_z
		jal		Goto00_ck
		li		$a3, 0x52C
		bnez	$v0, loc_8010EF64
		li		$v0, 0x201
		sw		$v0, 4($s1)
loc_8010EF64:
		lw		$ra, 0x18($sp)
		lw		$s1, 0x14($sp)
		lw		$s0, 0x10($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop