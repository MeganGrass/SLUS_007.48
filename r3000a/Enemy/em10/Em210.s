

		addiu	$sp, -0x28
		sw		$s0, 0x18($sp)
		move	$s0, $a0
		sw		$s2, 0x20($sp)
		la		$s2, G_Player
		sw		$s1, 0x1C($sp)
		addiu	$s1, $s2, 0x38
		lw		$v0, G_Status_flg
		lui		$v1, 0x1000
		and		$v0, $v1
		beqz	$v0, loc_8010D344
		sw		$ra, 0x24($sp)
		lw		$v0, 0x1F4($s0)
		lui		$v1, 0xC000
		and		$v0, $v1
		lui		$v1, 0x4000
		bne		$v0, $v1, loc_8010D320
		nop
		lw		$v0, G_pEnemy+4
		nop
		addiu	$s1, $v0, 0x38
loc_8010D320:
		lw		$a0, 0($s1)
		lw		$a1, 8($s1)
		jal		Guide_check
		nop
		andi	$v0, 0xFF
		li		$v1, 0xFF
		bne		$v0, $v1, loc_8010D348
		move	$a0, $s0
		addiu	$s1, $s2, 0x38
loc_8010D344:
		move	$a0, $s0
loc_8010D348:
		move	$a1, $s1
		lhu		$a3, 0x21A($s0)
		lbu		$a2, 0x235($s0)
		jal		Root_ck
		andi	$a3, 0x400
		lw		$v0, G_Stop_flg
		lui		$v1, 0x2000
		and		$v0, $v1
		bnez	$v0, loc_8010D640
		nop
		lhu		$v0, 0x10E($s0)
		nop
		andi	$v0, 1
		bnez	$v0, loc_8010D39C
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 2
		beqz	$v0, loc_8010D3AC
		nop
loc_8010D39C:
		lw		$v0, 0($s0)
		lui		$v1, 0x400
		or		$v0, $v1
		sw		$v0, 0($s0)
loc_8010D3AC:
		lw		$a0, 0($s0)
		lui		$v0, 0xC00
		and		$v1, $a0, $v0
		lui		$v0, 0x400
		bne		$v1, $v0, loc_8010D45C
		or		$a0, $v1
		sw		$a0, 0($s0)
		lhu		$v0, 0x10E($s2)
		nop
		andi	$v1, $v0, 0xFFF
		li		$v0, 0xE
		beq		$v1, $v0, loc_8010D45C
		li		$v0, 0x12
		beq		$v1, $v0, loc_8010D45C
		nop
		lhu		$v0, 0x154($s2)
		nop
		andi	$v0, 0x8000
		beqz	$v0, loc_8010D420
		nop
		lw		$v0, 0x3C($s2)
		lw		$v1, 0x3C($s0)
		addiu	$v0, -0x5DC
		slt		$v0, $v1
		beqz	$v0, loc_8010D420
		lui		$v0, 0xFBFF
		ori     $v0, $v0, 0xFFFF
		and     $v0, $a0, $v0
		sw		$v0, 0($s0)
loc_8010D420:
		lhu		$v0, 0x154($s2)
		nop
		andi	$v0, 0x4000
		beqz	$v0, loc_8010D45C
		nop
		lw		$v0, 0x3C($s2)
		lw		$v1, 0x3C($s0)
		addiu	$v0, -0x3E8
		slt		$v0, $v1
		beqz	$v0, loc_8010D45C
		lui		$v1, 0xFBFF
		lw		$v0, 0($s0)
		ori     $v1, $v1, 0xFFFF
		and     $v0, $v0, $v1
		sw		$v0, 0($s0)
loc_8010D45C:
		lbu		$v0, 0x239($s0)
		nop
		beqz	$v0, loc_8010D470
		addiu	$v0, -1
		sb		$v0, 0x239($s0)
loc_8010D470:
		lbu		$v0, 0x23E($s0)
		nop
		beqz	$v0, loc_8010D484
		addiu	$v0, -1
		sb		$v0, 0x23E($s0)
loc_8010D484:
		lbu		$v1, 0x1D3($s0)
		nop
		andi	$v0, $v1, 0x7F
		beqz	$v0, loc_8010D49C
		addiu	$v0, $v1, -1
		sb		$v0, 0x1D3($s0)
loc_8010D49C:
		lbu		$v0, 0x230($s0)
		nop
		beqz	$v0, loc_8010D4C8
		addiu	$v0, -1
		la		$v1, G_Room_enemy_flg
		sb		$v0, 0x230($s0)
		lhu		$v0, 0($v1)
		nop
		ori		$v0, 0x100
		sh		$v0, 0($v1)
loc_8010D4C8:
		lw		$a1, 0x180($s0)
		lbu		$v0, 4($s0)
		lw		$a2, 0x184($s0)
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, at, $v0
		lw      $v0, -0x67D0(at)
		nop
		jalr	$v0
		move	$a0, $s0
		jal		Em10UdeDown
		move	$a0, $s0
		lhu		$v0, 0x236($s0)
		lbu		$v1, 0x1C0($s0)
		sw		$s2, 0x1B4($s0)
		addiu	$v0, 1
		sh		$v0, 0x236($s0)
		lhu		$v0, 0x10E($s0)
		andi	$v1, 0xFD
		andi	$v0, 0x4000
		bnez	$v0, loc_8010D534
		sb		$v1, 0x1C0($s0)
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 0x200
		beqz	$v0, loc_8010D53C
		nop
loc_8010D534:
		ori		$v0, $v1, 2
		sb		$v0, 0x1C0($s0)
loc_8010D53C:
		lh		$a1, 0x76($s0)
		jal		Rot_neck_em
		move	$a0, $s0
		lw		$a1, 0x180($s0)
		lw		$a2, 0x184($s0)
		jal		Em10KahannsinWalk
		move	$a0, $s0
		lh		$v1, 0x10C($s0)
		nop
		beqz	$v1, loc_8010D614
		nop
		lh		$v0, Player_Life
		nop
		bltz	$v0, loc_8010D614
		nop
		lw		$v0, 0x198($s0)
		nop
		lw		$v0, 0x60($v0)
		nop
		addiu	$v0, -0x1F4
		slt		$v0, $v1
		beqz	$v0, loc_8010D5CC
		li		$v1, 1
		lbu		$v0, 0x14D($s0)
		nop
		andi	$v0, 0xF
		bne		$v0, $v1, loc_8010D5CC
		nop
		lh		$v0, 0x144($s0)
		nop
		slti	$v0, 0xB
		bnez	$v0, loc_8010D5CC
		nop
		jal		Em10Water
		move	$a0, $s0
loc_8010D5CC:
		lw		$v0, 0x178($s0)
		lui		$s1, 0xF800
		lw		$v0, 0($v0)
		lui		$v1, 0x800
		and		$v0, $s1
		bne		$v0, $v1, loc_8010D5F0
		nop
		jal		Em10Water
		move	$a0, $s0
loc_8010D5F0:
		lw		$v0, 0x178($s0)
		nop
		lw		$v0, 0($v0)
		lui		$v1, 0x4800
		and		$v0, $s1
		bne		$v0, $v1, loc_8010D614
		nop
		jal		Em10Water
		move	$a0, $s0
loc_8010D614:
		jal		Em10Kubigoro
		move	$a0, $s0
		lw		$v0, 4($s0)
		move	$a0, $s0
		jal		Em_seq_sound
		sw		$v0, 0x228($s0)
		jal		Oba_ck_em
		move	$a0, $s0
		move	$a0, $s0
		jal		Sca_ck_em
		li		$a1, 0x400
loc_8010D640:
		lw		$ra, 0x24($sp)
		lw		$s2, 0x20($sp)
		lw		$s1, 0x1C($sp)
		lw		$s0, 0x18($sp)
		addiu	$sp, 0x28
		jr		$ra
		nop