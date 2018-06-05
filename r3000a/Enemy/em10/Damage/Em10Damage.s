

		addiu	$sp, -0x30
		sw		$s1, 0x1C($sp)
		move	$s1, $a0
		sw		$s2, 0x20($sp)
		move	$s2, $a1
		sw		$s3, 0x24($sp)
		la		$a0, Player_Routine_0
		sw		$ra, 0x28($sp)
		sw		$s0, 0x18($sp)
		lbu		$v1, 0($a0)
		li		$v0, 5
		bne		$v1, $v0, loc_80111FE0
		move	$s3, $a2
		lw		$v0, Player_pEnemy_ptr
		nop
		bne		$v0, $s1, loc_80111FE0
		li		$v0, 1
		sw		$v0, 0($a0)
		lbu		$v0, Player_Damage_cnt
		lbu		$v1, Player_Neck_flg
		andi	$v0, 0x7F
		andi	$v1, 0xED
		sb		$v0, Player_Damage_cnt
		sb		$v1, Player_Neck_flg
		lw		$v0, 0($s1)
		li		$v1, 0xFFFFEFFB
		and		$v0, $v1
		sw		$v0, 0($s1)
		lw		$v0, Player_Be_flg
		nop
		and		$v0, $v1
		sw		$v0, Player_Be_flg
loc_80111FE0:
		lhu		$a0, 0x10E($s1)
		nop
		andi	$v0, $a0, 1
		beqz	$v0, loc_80112014
		move	$a1, $s2
		lbu		$v0, 5($s1)
		nop
		sll		$v0, 2
		lui     at, 0x8012
		addu    at, at, $v0
		lw      $v0, -0x6418(at)		;; Em10_dm+0x284
		j		loc_8011240C
		move	$a0, $s1
loc_80112014:
		lhu		$v0, 0x21A($s1)
		nop
		andi	$v0, 0x10
		beqz	$v0, loc_8011203C
		andi	$v0, $a0, 0x40
		move	$a0, $s1
		jal		Em10Dm07
		move	$a2, $s3
		j		loc_80112418
		nop
loc_8011203C:
		beqz	$v0, loc_8011205C
		move	$v1, $0
		lbu		$v0, 5($s1)
		nop
		xori		$v0, 1
		sltu	$v0, $0, $v0
		negu	$v0, $v0
		andi	$v1, $v0, 0x17
loc_8011205C:
		lbu		$v0, 6($s1)
		nop
		bnez	$v0, loc_80112168
		nop
		lb		$v0, 0x223($s1)
		nop
		slt		$v0, $v1, $v0
		bnez	$v0, loc_80112168
		li		$v1, 1
		lbu		$v0, 0x222($s1)
		nop
		beq		$v0, $v1, loc_801120A0
		li		$v0, 1
		lbu		$v0, 5($s1)
		nop
		bne		$v0, $v1, loc_80112164
		li		$v0, 1
loc_801120A0:
		sb		$v0, 0x222($s1)
		li		$v0, 0x501
		jal		Rnd
		sw		$v0, 4($s1)
		lbu		$a0, 0x1D2($s1)
		li		$v1, 0xAAAAAAAB
		multu	$a0, $v1
		andi	$v0, 0xF
		addiu	$v0, 0x10
		sb		$v0, 0x223($s1)
		mfhi	$t0
		srl		$v1, $t0, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		subu	$a0, $v0
		andi	$a0, 0xFF
		bnez	$a0, loc_8011211C
		li		$a0, 0x1000
		li		$a0, 0x17D0
		addiu	$a3, $sp, 0x10
		lw		$a2, 0x198($s1)
		li		$v0, 0x320
		sh		$0, 0x10($sp)
		sh		$v0, 0x12($sp)
		sh		$0, 0x14($sp)
		lh		$a1, 0x76($s1)
		jal		Esp_call
		addiu	$a2, 0xF4
		j		loc_80112418
		nop
loc_8011211C:
		lw		$v1, 0x198($s1)
		nop
		lw		$v0, 0x58C($v1)
		nop
		sh		$v0, 0x10($sp)
		lw		$v0, 0x590($v1)
		nop
		addiu	$v0, 0x1F4
		sh		$v0, 0x12($sp)
		lw		$v0, 0x594($v1)
		addiu	$a3, $sp, 0x10
		sh		$v0, 0x14($sp)
		lw		$s0, 0x198($s1)
		lh		$a1, 0x76($s1)
		jal		Esp_call
		addiu	$a2, $s0, 0x48
		j		loc_80112418
		nop
loc_80112164:
		sb		$v0, 0x222($s1)
loc_80112168:
		lhu		$v1, 0x21A($s1)
		nop
		andi	$v0, $v1, 2
		beqz	$v0, loc_80112288
		li		$v0, 1
		li		$v1, 0x60501
		sw		$v1, 4($s1)
		lbu		$v1, 5($s1)
		sb		$v0, 0x16B($s1)
		li		$v0, 0xA
		bne		$v1, $v0, loc_801121C8
		nop
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_801121C8
		nop
		jal		Em10Firedm
		move	$a0, $s1
		lhu		$v0, 0x21A($s1)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s1)
loc_801121C8:
		lbu		$v1, 5($s1)
		li		$v0, 0xB
		bne		$v1, $v0, loc_801121E8
		li		$v0, 9
		jal		Em10Ryudm
		move	$a0, $s1
		lbu		$v1, 5($s1)
		li		$v0, 9
loc_801121E8:
		bne		$v1, $v0, loc_8011220C
		nop
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_8011220C
		nop
		jal		Em10Tudm
		move	$a0, $s1
loc_8011220C:
		lbu		$v1, 5($s1)
		li		$v0, 0xE
		bne		$v1, $v0, loc_8011222C
		li		$v0, 0x10
		jal		Em10Spdm
		move	$a0, $s1
		lbu		$v1, 5($s1)
		li		$v0, 0x10
loc_8011222C:
		bne		$v1, $v0, loc_80112418
		nop
		lhu		$v0, 0x10E($s1)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80112274
		nop
		lbu		$v0, 0x23A($s1)
		nop
		sltiu	$v0, 9
		bnez	$v0, loc_80112274
		nop
		jal		Em10Firedm
		move	$a0, $s1
		lhu		$v0, 0x21A($s1)
		nop
		ori		$v0, 0x800
		sh		$v0, 0x21A($s1)
loc_80112274:
		lbu		$v0, 0x23A($s1)
		nop
		addiu	$v0, 1
		j		loc_80112418
		sb		$v0, 0x23A($s1)
loc_80112288:
		andi	$v0, $v1, 0x60
		bnez	$v0, loc_801123DC
		move	$a0, $s1
		lb		$v0, 0x152($s1)
		nop
		bgez	$v0, loc_801123E0
		move	$a1, $s2
		lhu		$v0, 0x1D0($s1)
		nop
		andi	$v0, 0xC0
		beqz	$v0, loc_801123D8
		li		$a0, 9
		jal		Snd_se_enem
		move	$a1, $s1
		lhu		$v0, 0x1D0($s1)
		nop
		andi	$v0, 0x80
		beqz	$v0, loc_801122E8
		nop
		lw		$v1, 0x198($s1)
		lhu		$v0, 0x21A($s1)
		addiu	$s0, $v1, 0x810
		j		loc_801122F8
		ori		$v0, 0x40
loc_801122E8:
		lw		$v1, 0x198($s1)
		lhu		$v0, 0x21A($s1)
		addiu	$s0, $v1, 0x60C
		ori		$v0, 0x20
loc_801122F8:
		jal		Rnd
		sh		$v0, 0x21A($s1)
		andi	$v0, 1
		beqz	$v0, loc_80112354
		li		$v0, 0x1E
		lbu		$v1, 8($s1)
		nop
		beq		$v1, $v0, loc_80112354
		nop
		lw		$v1, 0x198($s1)
		nop
		lw		$v0, 0xA1C($v1)
		nop
		sw		$v0, 8($s0)
		lw		$v0, 0xA24($v1)
		nop
		sw		$v0, 0x10($s0)
		lw		$v0, 0xA20($v1)
		nop
		sw		$v0, 0xC($s0)
		lw		$v0, 0xA28($v1)
		nop
		sw		$v0, 0x14($s0)
loc_80112354:
		jal		Rnd
		nop
		li		$a0, 0x1F40
		sll		$a1, $v0, 4
		addiu	$a2, $s0, 0x48
		jal		Esp_call
		move	$a3, $0
		addiu	$s0, 0xAC
		lw		$v0, 0($s0)
		nop
		ori		$v0, 0x1062
		sw		$v0, 0($s0)
		lhu		$v1, 0x76($s1)
		li		$v0, 0xA
		sh		$v0, 0x3C($s0)
		li		$v0, 0xFFFFFF38
		sh		$v0, 0x3A($s0)
		li		$v0, 0x32
		sh		$0, 0x86($s0)
		sb		$v0, 0x79($s0)
		sh		$0, 0x3E($s0)
		addiu	$v1, 0x800
		sh		$v1, 0x38($s0)
		lhu		$v1, 0x76($s1)
		li		$v0, 0x400
		sh		$v0, 0x42($s0)
		jal		Rnd
		sh		$v1, 0x40($s0)
		li		$a0, 0x1B58
		sll		$a1, $v0, 4
		addiu	$a2, $s0, 0x48
		jal		Esp_call
		move	$a3, $0
loc_801123D8:
		move	$a0, $s1
loc_801123DC:
		move	$a1, $s2
loc_801123E0:
		lbu		$v1, 5($a0)
		li		$a2, 0x80119940
		sll		$v0, $v1, 3
		addu	$v0, $v1
		sll		$v0, 2
		lbu		$v1, 0x1D2($a0)
		addu	$v0, $a2
		sll		$v1, 2
		addu	$v1, $v0
		lw		$v0, 0($v1)
loc_8011240C:
		nop
		jalr	$v0
		move	$a2, $s3
loc_80112418:
		lw		$ra, 0x28($sp)
		lw		$s3, 0x24($sp)
		lw		$s2, 0x20($sp)
		lw		$s1, 0x1C($sp)
		lw		$s0, 0x18($sp)
		addiu	$sp, 0x30
		jr		$ra
		nop