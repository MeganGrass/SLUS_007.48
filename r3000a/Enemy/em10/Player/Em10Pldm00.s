

		addiu	$sp, -0x48
		sw		$s1, 0x34($sp)
		move	$s1, $a0
		sw		$s2, 0x38($sp)
		move	$s2, $a1
		sw		$s3, 0x3C($sp)
		move	$s3, $a2
		sw		$ra, 0x44($sp)
		sw		$s4, 0x40($sp)
		sw		$s0, 0x30($sp)
		li		$v0, 3
		sb		$0, 0x18($sp)
		sb		$v0, 0x19($sp)
		la		$a1, 0x8010D1CC
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lwl		$v1, 7($a1)
		lwr		$v1, 4($a1)
		lwl		$a0, 0xB($a1)
		lwr		$a0, 8($a1)
		swl		$v0, 0x23($sp)
		swr		$v0, 0x20($sp)
		swl		$v1, 0x27($sp)
		swr		$v1, 0x24($sp)
		swl		$a0, 0x2B($sp)
		swr		$a0, 0x28($sp)
		lbu		$v1, 6($s1)
		lw		$a2, 0x1B4($s1)
		sltiu	$v0, $v1, 7
		beqz	$v0, loc_80117F2C
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2E24(at)		;; jpt_80117A48
		nop
		jr		$v0
		nop
loc_80117A50:
		lbu		$v0, 5($s1)
		move	$a0, $s1
		addu	$v0, $sp, $v0
		lbu		$v1, 0x18($v0)
		li		$v0, 1
		sb		$v0, 6($s1)
		li		$v0, 0x800
		sh		$v0, 0x158($s1)
		lui		$v0, 0xF
		sb		$0, 0x16A($s1)
		addu	$v1, $v0
		sw		$v1, 0x14C($s1)
		lw		$a1, 0x38($a2)
		lw		$a2, 0x40($a2)
		jal		Goto00
		li		$a3, 0x800
		lbu		$v0, 5($s1)
		nop
		andi	$v0, 1
		beqz	$v0, loc_80117AB8
		li		$v0, 0xFF
		lhu		$v0, 0x76($s1)
		sh		$0, 0x158($s1)
		addiu	$v0, 0x800
		sh		$v0, 0x76($s1)
		li		$v0, 0xFF
loc_80117AB8:
		sb		$v0, Em10_pldm00_hajiki
		sb		$v0, Em10_pldm00_hajiki+1
		sb		$v0, Em10_pldm00_hajiki+2
		sb		$v0, Em10_pldm00_hajiki+3
		sb		$0, Em10_hajiki_no
		jal		Rnd
		nop
		lui     $a0, 0x400
		ori     $a0, 1
		andi	$v0, 1
		sll		$v0, 17
		or		$a0, $v0, $a0
		jal		Snd_se_stad
		addiu	$a1, $s1, 0x38
		lbu		$v0, 0x1C0($s1)
		sh		$0, 0x15A($s1)
		ori		$v0, 0x12
		sb		$v0, 0x1C0($s1)
loc_80117B14:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s1)
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		li		$a3, 0x100
		subu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($s1)
		lbu		$v1, 6($s1)
		nop
		addu	$v1, $v0
		j		loc_80117F2C
		sb		$v1, 6($s1)
loc_80117B70:
		lbu		$v0, 5($s1)
		nop
		addu	$v0, $sp, $v0
		lbu		$v0, 0x18($v0)
		li		$v1, 3
		sb		$v1, 6($s1)
		addiu	$v0, 1
		sw		$v0, 0x14C($s1)
loc_80117B90:
		lbu		$v1, 0x14D($s1)
		li		$v0, 0xF
		bne		$v1, $v0, loc_80117C54
		move	$a0, $s1
		addiu	$a0, $sp, 0x20
		lbu		$v1, 5($s1)
		lw		$s0, 0x198($s1)
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 0($v0)
		nop
		sh		$v0, 0x10($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 2($v0)
		nop
		sh		$v0, 0x12($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$a0, $v0
		lhu		$v0, 4($a0)
		jal		Rnd
		sh		$v0, 0x14($sp)
		li		$a0, 0x17D0
		addiu	$a2, $s0, 0x5A8
		addiu	$a3, $sp, 0x10
		sll		$v0, 1
		lh		$v1, 0x76($s1)
		lbu		$a1, 5($s1)
		addu	$v1, $v0
		andi	$a1, 1
		sll		$a1, 11
		addiu	$a1, -0x100
		jal		Esp_call
		addu	$a1, $v1, $a1
		sb		$0, 0x16A($s1)
		move	$a0, $s1
loc_80117C54:
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s1)
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($a0)
		lhu		$v1, 0x158($a0)
		li		$a3, 0x100
		subu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($a0)
		j		loc_80117F2C
		nop
loc_80117CA0:
		lui		$a0, 7
		lbu		$v0, 5($s1)
		ori     $a0, 2
		addu	$v0, $sp, $v0
		lbu		$v1, 0x18($v0)
		li		$v0, 5
		sb		$v0, 6($s1)
		lb		$v0, 0x16A($s1)
		addu	$v1, $a0
		beqz	$v0, loc_80117D78
		sw		$v1, 0x14C($s1)
		addiu	$a0, $sp, 0x20
		lbu		$v1, 5($s1)
		lw		$s0, 0x198($s1)
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 0($v0)
		nop
		sh		$v0, 0x10($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$v0, $a0, $v0
		lhu		$v0, 2($v0)
		nop
		sh		$v0, 0x12($sp)
		lbu		$v1, 5($s1)
		nop
		andi	$v1, 1
		sll		$v0, $v1, 1
		addu	$v0, $v1
		sll		$v0, 1
		addu	$a0, $v0
		lhu		$v0, 4($a0)
		jal		Rnd
		sh		$v0, 0x14($sp)
		li		$a0, 0x17D0
		addiu	$a2, $s0, 0x5A8
		addiu	$a3, $sp, 0x10
		sll		$v0, 1
		lh		$v1, 0x76($s1)
		lbu		$a1, 5($s1)
		addu	$v1, $v0
		andi	$a1, 1
		sll		$a1, 11
		addiu	$a1, -0x100
		jal		Esp_call
		addu	$a1, $v1, $a1
loc_80117D78:
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		move	$a3, $0
		addu	$v0, $v1
		jal		Null_pos_set
		sh		$v0, 0x76($s1)
		move	$a0, $s1
		move	$a1, $s2
		move	$a2, $s3
		lhu		$v0, 0x76($s1)
		lhu		$v1, 0x158($s1)
		li		$a3, 0x200
		subu	$v0, $v1
		jal		Joint_move
		sh		$v0, 0x76($s1)
		lbu		$v1, 6($s1)
		lbu		$a0, 0x14D($s1)
		addu	$v1, $v0
		addiu	$a0, -9
		sltiu	$a0, 5
		beqz	$a0, loc_80117F2C
		sb		$v1, 6($s1)
		lhu		$s2, 0xE($s1)
		nop
		sll		$v0, $s2, 2
		move	$s2, $v0
		sll		$v0, 16
		beqz	$v0, loc_80117EC4
		li		$s4, 2
		la		$s3, (G_pEnemy+8)
loc_80117E00:
		andi	$v0, $s2, 0x8000
		beqz	$v0, loc_80117EAC
		nop
		lh		$v0, 0x15A($s1)
		nop
		srav	$v0, $s4
		andi	$v0, 1
		bnez	$v0, loc_80117EAC
		nop
		lw		$s0, 0($s3)
		nop
		lbu		$v0, 8($s0)
		nop
		andi	$v0, 0x10
		beqz	$v0, loc_80117EAC
		nop
		lh		$v0, 0x156($s0)
		nop
		bltz	$v0, loc_80117EAC
		nop
		lhu		$v1, 0x10E($s0)
		nop
		andi	$v0, $v1, 1
		bnez	$v0, loc_80117EAC
		nop
		lbu		$v0, 0x1D3($s0)
		nop
		bnez	$v0, loc_80117EAC
		nop
		lhu		$v0, 0x21A($s0)
		nop
		andi	$v0, 8
		bnez	$v0, loc_80117EAC
		andi	$v0, $v1, 0x2000
		bnez	$v0, loc_80117EAC
		move	$a0, $s1
		move	$a1, $s0
		li		$v0, 0x901
		jal		Cdir_ck2
		sw		$v0, 4($s0)
		nor		$v0, $0, $v0
		andi	$v0, 1
		sb		$v0, 0x16B($s0)
loc_80117EAC:
		addiu	$s3, 4
		sll		$v0, $s2, 1
		move	$s2, $v0
		sll		$v0, 16
		bnez	$v0, loc_80117E00
		addiu	$s4, 1
loc_80117EC4:
		lhu		$v0, 0x15A($s1)
		lhu		$v1, 0xE($s1)
		nop
		or		$v0, $v1
		j		loc_80117F2C
		sh		$v0, 0x15A($s1)
loc_80117EDC:
		li		$v0, 1
		la		$v1, Player_Damage_cnt
		sw		$v0, 4($s1)
		lbu		$v0, 0($v1)
		nop
		andi	$v0, 0x7F
		sb		$v0, 0($v1)
		lbu		$v0, 0x1C0($s1)
		nop
		andi	$v0, 0xED
		sb		$v0, 0x1C0($s1)
		lw		$v0, 0($s1)
		li		$v1, 0xFFFFEFFB
		and		$v0, $v1
		sw		$v0, 0($s1)
		lw		$v0, 0($a2)
		nop
		and		$v0, $v1
		sw		$v0, 0($a2)
loc_80117F2C:
		lw		$ra, 0x44($sp)
		lw		$s4, 0x40($sp)
		lw		$s3, 0x3C($sp)
		lw		$s2, 0x38($sp)
		lw		$s1, 0x34($sp)
		lw		$s0, 0x30($sp)
		addiu	$sp, 0x48
		jr		$ra
		nop