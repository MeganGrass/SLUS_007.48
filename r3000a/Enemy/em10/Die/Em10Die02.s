

		addiu	$sp, -0x50
		sw		$s3, 0x3C($sp)
		move	$s3, $a0
		sw		$s4, 0x40($sp)
		move	$s4, $a1
		sw		$s5, 0x44($sp)
		sw		$ra, 0x48($sp)
		sw		$s2, 0x38($sp)
		sw		$s1, 0x34($sp)
		sw		$s0, 0x30($sp)
		li		$v0, 0xFFFFFE3E
		sh		$v0, 0x10($sp)
		li		$v0, 0xFA
		sh		$v0, 0x12($sp)
		li		$v0, 2
		sb		$v0, 0x20($sp)
		li		$v0, 1
		sb		$v0, 0x21($sp)
		lbu		$v1, 0x231($s3)
		li		$v0, 1
		bne		$v1, $v0, loc_80115C54
		move	$s5, $a2
		jal		Em10Die04
		nop
		j		loc_8011629C
		nop
loc_80115C54:
		lbu		$v1, 6($s3)
		nop
		sltiu	$v0, $v1, 7
		beqz	$v0, loc_8011629C
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, $v0
		lw      $v0, -0x2ED4(at)		;; off_8010D12C
		nop
		jr		$v0
		nop
loc_80115C80:
		jal		Rnd
		nop
		andi	$v0, 3
		beqz	$v0, loc_80115CC0
		nop
		lw		$v0, Player_Be_flg
		nop
		bltz	$v0, loc_80115CC0
		li		$v0, 9
		lbu		$v1, 5($s3)
		nop
		beq		$v1, $v0, loc_80115CD8
		li		$v0, 0x11
		bne		$v1, $v0, loc_80115D28
		li		$v0, 1
loc_80115CC0:
		lbu		$v1, 5($s3)
		li		$v0, 9
		beq		$v1, $v0, loc_80115CD8
		li		$v0, 0x11
		bne		$v1, $v0, loc_80115CF4
		nop
loc_80115CD8:
		lhu		$v0, 0x10E($s3)
		nop
		andi	$v0, 0x80
		bnez	$v0, loc_80115CF4
		nop
		jal		Em10Tudm
		move	$a0, $s3
loc_80115CF4:
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 7
		srav	$s0, $v0
		andi	$s0, 3
		beqz	$s0, loc_80115D44
		li		$v0, 9
		lbu		$v1, 5($s3)
		nop
		bne		$v1, $v0, loc_80115D44
		li		$v0, 1
loc_80115D28:
		sb		$v0, 0x231($s3)
		move	$a0, $s3
		move	$a1, $s4
		jal		Em10Die04
		move	$a2, $s5
		j		loc_8011629C
		nop
loc_80115D44:
		lhu		$v0, 0x1D0($s3)
		nop
		andi	$v0, 0x20
		srl		$v0, 5
		sb		$v0, 0x16B($s3)
		lhu		$v0, 0x21A($s3)
		lb		$v1, 0x16B($s3)
		andi	$v0, 0xFFFB
		bnez	$v1, loc_80115D74
		sh		$v0, 0x21A($s3)
		ori		$v0, 4
		sh		$v0, 0x21A($s3)
loc_80115D74:
		lui     $a1, 3
		ori     $a1, 4
		move	$a0, $s3
		li		$s0, 1
		lb		$v1, 0x16B($s3)
		lb		$v0, 0x16B($s3)
		li		$s1, 0xA
		sb		$s0, 6($s3)
		sh		$s1, 0x15A($s3)
		subu	$a1, $v1
		sll		$v0, 1
		addu	$v0, $sp, $v0
		sw		$a1, 0x14C($s3)
		lhu		$v0, 0x10($v0)
		move	$a1, $0
		sh		$0, 0x148($s3)
		jal		Add_speedXZ
		sh		$v0, 0x144($s3)
		lbu		$v0, 0x1D3($s3)
		lui		$a0, 0x10
		sb		$s0, 0x1C0($s3)
		lw		$s0, 0x198($s3)
		ori		$v0, 0x80
		sb		$v0, 0x1D3($s3)
		lw		$v0, 0x560($s0)
		ori     $a0, 0x1030
		ori		$v0, 0x4A
		sw		$v0, 0x560($s0)
		lhu		$v1, 0x76($s3)
		li		$v0, 0x190
		sh		$v0, 0x5FC($s0)
		li		$v0, 0xFFFFFF9C
		sh		$v0, 0x5FA($s0)
		li		$v0, 0xFFFFFFCE
		sh		$0, 0x600($s0)
		sh		$s1, 0x5FE($s0)
		sh		$v0, 0x604($s0)
		sw		$a0, 0x5D0($s0)
		addiu	$v1, 0x800
		jal		Rnd
		sh		$v1, 0x5F8($s0)
		li		$a0, 0xBB8
		sll		$a1, $v0, 4
		addiu	$s0, 0x5A8
		move	$a2, $s0
		jal		Esp_call
		move	$a3, $0
		li		$a0, 5
		li		$a1, 3
		jal		Esp_kill
		move	$a2, $s0
		lhu		$v0, 0x21A($s3)
		lw		$s0, 0x198($s3)
		andi	$v0, 0x20
		bnez	$v0, loc_80115EC0
		li		$a0, 5
		lw		$v0, 0x60C($s0)
		lui		$a1, 0x10
		ori		$v0, 0x1062
		sw		$v0, 0x60C($s0)
		lhu		$v1, 0x76($s3)
		li		$v0, 0x64
		sh		$v0, 0x648($s0)
		li		$v0, 0x1E
		sh		$0, 0x692($s0)
		sh		$0, 0x646($s0)
		sb		$v0, 0x685($s0)
		sh		$0, 0x64A($s0)
		addiu	$v1, 0x800
		sh		$v1, 0x644($s0)
		lhu		$v1, 0x76($s3)
		li		$v0, 0x400
		sh		$v0, 0x64E($s0)
		sh		$v1, 0x64C($s0)
		lw		$a0, 0x198($s3)
		ori		$a1, 0x1010
		lw		$v1, 0x6B8($a0)
		li		$v0, 0x40
		sw		$v0, 0x750($a0)
		sw		$a1, 0x754($a0)
		ori		$v1, 0x80
		j		loc_80115EE8
		sw		$v1, 0x6B8($a0)
loc_80115EC0:
		li		$a1, 3
		addiu	$a2, $s0, 0x700
		sw		$0, 0x60C($s0)
		jal		Esp_kill
		sw		$0, 0x6B8($s0)
		li		$a0, 5
		li		$a1, 3
		addiu	$a2, $s0, 0x7AC
		jal		Esp_kill
		sw		$0, 0x764($s0)
loc_80115EE8:
		lhu		$v0, 0x21A($s3)
		lw		$s0, 0x198($s3)
		andi	$v0, 0x40
		bnez	$v0, loc_80115F78
		lui		$a1, 0x10
		jal		Rnd
		nop
		andi	$v0, 1
		bnez	$v0, loc_80115F74
		nop
		lw		$v0, 0x810($s0)
		lui		$a1, 0x10
		ori		$v0, 0x1062
		sw		$v0, 0x810($s0)
		lhu		$v1, 0x76($s3)
		li		$v0, 0x64
		sh		$v0, 0x84C($s0)
		li		$v0, 0x1E
		sb		$v0, 0x889($s0)
		lw		$v0, 0x8BC($s0)
		ori     $a1, 0x1010
		sh		$0, 0x896($s0)
		sh		$0, 0x84A($s0)
		sh		$0, 0x84E($s0)
		addiu	$v1, 0x800
		sh		$v1, 0x848($s0)
		li		$v1, 0x400
		lhu		$a0, 0x76($s3)
		ori		$v0, 0x80
		sw		$v0, 0x8BC($s0)
		li		$v0, 0x40
		sh		$v1, 0x852($s0)
		sw		$v0, 0x954($s0)
		sw		$a1, 0x958($s0)
		sh		$a0, 0x850($s0)
loc_80115F74:
		lui		$a1, 0x10
loc_80115F78:
		lw		$a0, 0x198($s3)
		ori		$a1, 0x1010
		lw		$v1, 0x764($a0)
		li		$v0, 0x40
		sw		$v0, 0x7FC($a0)
		sw		$a1, 0x800($a0)
		ori		$v1, 0x80
		sw		$v1, 0x764($a0)
		lw		$s1, 0x198($s3)
		nop
		lw		$v0, 0($s1)
		li		$v1, 0x20
		sw		$v1, 0x98($s1)
		sw		$v1, 0x9C($s1)
		ori		$v0, 0x80
		sw		$v0, 0($s1)
		lw		$v0, 0x198($s3)
		nop
		lw		$v1, 0xAC8($v0)
		lw		$a0, 0xAD0($v0)
		lw		$a1, 0xACC($v0)
		lw		$a2, 0xAD4($v0)
		sw		$v1, 8($v0)
		sw		$a0, 0x10($v0)
		sw		$a1, 0xC($v0)
		sw		$a2, 0x14($v0)
		lw		$s1, 0x198($s3)
		li		$v0, 0xFFFFFE0C
		sh		$0, 0x18($sp)
		sh		$v0, 0x1A($sp)
		jal		Rnd
		sh		$0, 0x1C($sp)
		jal		Rnd
		move	$s0, $v0
		li		$a0, 0x1F40
		addiu	$s2, $sp, 0x18
		move	$a3, $s2
		sll		$s0, 4
		lh		$a1, 0x76($s3)
		sll		$v0, 4
		addu	$a1, $s0
		subu	$a1, $v0
		addiu	$s1, 0x48
		jal		Esp_call
		move	$a2, $s1
		jal		Rnd
		nop
		addiu	$s0, $v0, 0xFA0
		sll		$s0, 2
		lui		$v0, 0x800
		jal		Rnd
		or		$s0, $v0
		move	$a0, $s0
		sll		$a1, $v0, 4
		move	$a2, $s1
		jal		Esp_call
		move	$a3, $s2
		li		$a0, 2
		jal		Snd_se_enem
		move	$a1, $s3
		jal		Em_dead_flg_on
		move	$a0, $s3
		li		$v0, 0xB
		sh		$v0, 0x144($s3)
loc_80116078:
		move	$a0, $s3
		move	$a1, $s4
		move	$a2, $s5
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s3
		move	$a1, $s4
		move	$a2, $s5
		jal		Joint_move
		li		$a3, 0x400
		move	$a0, $s3
		lbu		$v1, 6($s3)
		move	$a1, $0
		addu	$v1, $v0
		jal		Add_speedXZ
		sb		$v1, 6($s3)
		lh		$v0, 0x15A($s3)
		nop
		beqz	$v0, loc_8011629C
		move	$v1, $v0
		andi	$v0, $v1, 1
		bnez	$v0, loc_80116144
		nop
		lw		$s1, 0x198($s3)
		jal		Rnd
		addiu	$s2, $s3, 0x144
		jal		Rnd
		move	$s0, $v0
		li		$a0, 0x1F40
		move	$a3, $s2
		sll		$s0, 4
		lh		$a1, 0x76($s3)
		sll		$v0, 4
		addu	$a1, $s0
		subu	$a1, $v0
		addiu	$s1, 0x48
		jal		Esp_call
		move	$a2, $s1
		jal		Rnd
		nop
		jal		Rnd
		move	$s0, $v0
		li		$a0, 0x1F40
		move	$a2, $s1
		move	$a3, $s2
		sll		$s0, 4
		lh		$a1, 0x76($s3)
		sll		$v0, 4
		addu	$a1, $s0
		jal		Esp_call
		subu	$a1, $v0
loc_80116144:
		lhu		$v0, 0x15A($s3)
		nop
		addiu	$v0, -1
		j		loc_8011629C
		sh		$v0, 0x15A($s3)
loc_80116158:
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80116174
		li		$v0, 5
		j		loc_8011629C
		sb		$v0, 6($s3)
loc_80116174:
		lb		$v1, 0x16B($s3)
		nop
		addu	$v0, $sp, $v1
		lbu		$a0, 0x20($v0)
		li		$v0, 3
		sb		$v0, 6($s3)
		sll		$v0, $v1, 4
		subu	$v0, $v1
		addiu	$v0, 0xA
		sll		$v0, 8
		lui		$v1, 7
		addu	$a0, $v1
		addu	$v0, $a0
		sw		$v0, 0x14C($s3)
loc_801161AC:
		move	$a0, $s3
		move	$a1, $s4
		move	$a2, $s5
		jal		Joint_move
		li		$a3, 0x200
		lbu		$v1, 6($s3)
		lbu		$a0, 0x14E($s3)
		addu	$v1, $v0
		bnez	$a0, loc_8011629C
		sb		$v1, 6($s3)
		move	$a0, $s3
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
		j		loc_8011629C
		nop
loc_801161EC:
		li		$v0, 7
		j		loc_8011629C
		sw		$v0, 4($s3)
loc_801161F8:
		li		$v0, 6
		sb		$v0, 6($s3)
		lbu		$v0, 0x218($s3)
		lui		$v1, 0xF
		addu	$v0, $v1
		jal		Rnd
		sw		$v0, 0x14C($s3)
		andi	$v0, 0x1F
		addiu	$v0, 0xF
		sh		$v0, 0x158($s3)
loc_80116220:
		lhu		$v1, 0x158($s3)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80116254
		sh		$v0, 0x158($s3)
		li		$a0, 0x70001
		lhu		$v1, 0x21A($s3)
		li		$v0, 3
		sb		$v0, 6($s3)
		sw		$a0, 0x14C($s3)
		andi	$v1, 0xFFFB
		sh		$v1, 0x21A($s3)
loc_80116254:
		move	$a0, $s3
		lh		$a1, 0x1C4($s3)
		lh		$a2, 0x1C6($s3)
		jal		Goto00
		li		$a3, 8
		move	$a0, $s3
		lw		$a1, 0x108($s3)
		lw		$a2, 0x17C($s3)
		jal		Spd_get
		move	$a3, $0
		move	$a0, $s3
		lw		$a1, 0x108($s3)
		lw		$a2, 0x17C($s3)
		jal		Joint_move
		li		$a3, 0x100
		move	$a0, $s3
		jal		Add_speedXZ
		move	$a1, $0
loc_8011629C:
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