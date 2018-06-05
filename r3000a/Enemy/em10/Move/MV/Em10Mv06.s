

		addiu	$sp, -0x60
		sw		$s2, 0x50($sp)
		move	$s2, $a0
		sw		$s3, 0x54($sp)
		move	$s3, $a1
		sw		$ra, 0x5C($sp)
		sw		$s4, 0x58($sp)
		sw		$s1, 0x4C($sp)
		sw		$s0, 0x48($sp)
		la		$a1, 0x8010D044
		lwl		$v0, 3($a1)
		lwr		$v0, 0($a1)
		lb		$v1, 4($a1)
		lb		$a0, 5($a1)
		swl		$v0, 0x13($sp)
		swr		$v0, 0x10($sp)
		sb		$v1, 0x14($sp)
		sb		$a0, 0x15($sp)
		la		$a1, 0x8010D04C
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
		lwl		$v0, 0xF($a1)
		lwr		$v0, 0xC($a1)
		lwl		$v1, 0x13($a1)
		lwr		$v1, 0x10($a1)
		lwl		$a0, 0x17($a1)
		lwr		$a0, 0x14($a1)
		swl		$v0, 0x2F($sp)
		swr		$v0, 0x2C($sp)
		swl		$v1, 0x33($sp)
		swr		$v1, 0x30($sp)
		swl		$a0, 0x37($sp)
		swr		$a0, 0x34($sp)
		lwl		$v0, 0x1B($a1)
		lwr		$v0, 0x18($a1)
		lwl		$v1, 0x1F($a1)
		lwr		$v1, 0x1C($a1)
		swl		$v0, 0x3B($sp)
		swr		$v0, 0x38($sp)
		swl		$v1, 0x3F($sp)
		swr		$v1, 0x3C($sp)
		lbu		$v1, 6($s2)
		nop
		sltiu	$v0, $v1, 9
		beqz	$v0, loc_80110754
		move	$s4, $a2
		sll		$v0, $v1, 2
		lui     at, 0x8011
		addu    at, at, $v0
		lw      $v0, -0x2F94(at)		;; off_8010D06C
		nop
		jr		$v0
		nop
loc_8011028C:
		jal		Rnd
		nop
		andi	$v0, 1
		sb		$v0, 0x16A($s2)
		lhu		$v0, 0x21A($s2)
		lb		$v1, 0x16A($s2)
		andi	$v0, 0xFFFB
		beqz	$v1, loc_801102B8
		sh		$v0, 0x21A($s2)
		ori		$v0, 4
		sh		$v0, 0x21A($s2)
loc_801102B8:
		li		$a2, 0xF3FFFFFF
		lb		$a0, 0x16A($s2)
		lw		$v1, 0($s2)
		addu	$v0, $sp, $a0
		lbu		$a1, 0x10($v0)
		li		$v0, 1
		sb		$v0, 6($s2)
		lhu		$v0, 0x21A($s2)
		and		$v1, $a2
		ori		$v0, 0x202
		sh		$v0, 0x21A($s2)
		lui		$v0, 0x400
		or		$v1, $v0
		lbu		$v0, 0x1D3($s2)
		sb		$0, 0x222($s2)
		sb		$0, 0x16B($s2)
		sw		$v1, 0($s2)
		lhu		$v1, 0x10E($s2)
		ori		$v0, 0x80
		ori		$v1, 0x2000
		sb		$v0, 0x1D3($s2)
		sll		$v0, $a0, 2
		addu	$v0, $a0
		addiu	$v0, 0xA
		sll		$v0, 8
		sh		$v1, 0x10E($s2)
		lui		$v1, 0xF
		addu	$a1, $v1
		lbu		$v1, 0x239($s2)
		addu	$v0, $a1
		bnez	$v1, loc_80110364
		sw		$v0, 0x14C($s2)
		jal		Rnd
		nop
		andi	$v0, 1
		beqz	$v0, loc_80110354
		li		$a0, 0xD
		li		$a0, 0xC
loc_80110354:
		jal		Snd_se_enem
		move	$a1, $s2
		li		$v0, 0x96
		sb		$v0, 0x239($s2)
loc_80110364:
		li		$v0, 0xB
		sh		$0, 0x158($s2)
		sh		$v0, 0x144($s2)
loc_80110370:
		move	$a0, $s2
		move	$a1, $s3
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s2)
		lhu		$a0, 0x9A($s2)
		addu	$v1, $v0
		sltiu	$v0, $a0, 0x15
		bnez	$v0, loc_801103D0
		sb		$v1, 6($s2)
		addiu	$v0, $a0, -0xA
		sh		$v0, 0x9A($s2)
		lhu		$v0, 0x9C($s2)
		lhu		$v1, 0x90($s2)
		addiu	$v0, -0xA
		sh		$v0, 0x9C($s2)
		sltiu	$v0, $v1, 0xC9
		bnez	$v0, loc_801103D0
		addiu	$v1, -0xA
		lhu		$v0, 0x92($s2)
		sh		$v1, 0x90($s2)
		addiu	$v0, -0xA
		sh		$v0, 0x92($s2)
loc_801103D0:
		lbu		$v0, 0x14E($s2)
		nop
		beqz	$v0, loc_801103F0
		move	$a0, $s2
		lh		$v0, 0x158($s2)
		nop
		beqz	$v0, loc_80110754
		nop
loc_801103F0:
		move	$a1, $0
		jal		Foot_set_pl
		li		$a2, 1
		j		loc_80110754
		nop
loc_80110404:
		lb		$v1, 0x16A($s2)
		li		$v0, 3
		sb		$v0, 6($s2)
		addu	$v0, $sp, $v1
		lbu		$v0, 0x12($v0)
		lui		$v1, 0xF
		addu	$v0, $v1
		jal		Rnd
		sw		$v0, 0x14C($s2)
		jal		Rnd
		move	$s0, $v0
		jal		Rnd
		move	$s1, $v0
		andi	$s1, 3
		srav	$s0, $s1
		andi	$s0, 0xF
		sll		$s0, 1
		addiu	$s1, $sp, 0x10
		addu	$s0, $s1
		lhu		$a0, 0x10($s0)
		li		$v1, 0xC8
		sh		$v1, 0x90($s2)
		sh		$v1, 0x92($s2)
		li		$v1, 0xFFFFFEA2
		sh		$v1, 0x98($s2)
		li		$v1, 0x15E
		sh		$v1, 0x9E($s2)
		lbu		$v1, 0x1D3($s2)
		andi	$v0, 0xF
		sh		$0, 0x9A($s2)
		sh		$0, 0x9C($s2)
		addu	$a0, $v0
		andi	$v1, 0x7F
		sh		$a0, 0x15A($s2)
		jal		Rnd
		sb		$v1, 0x1D3($s2)
		lhu		$v1, 0x10E($s2)
		andi	$v0, 3
		andi	$v1, 0x80
		beqz	$v1, loc_801104DC
		sh		$v0, 0x144($s2)
		jal		Rnd
		sh		$0, 0x144($s2)
		jal		Rnd
		move	$s0, $v0
		andi	$v0, 3
		srav	$s0, $v0
		andi	$s0, 0xF
		sll		$s0, 1
		addu	$s0, $s1
		lhu		$v0, 0x10($s0)
		nop
		srl		$v0, 1
		sh		$v0, 0x15A($s2)
loc_801104DC:
		lh		$v0, 0x144($s2)
		nop
		bnez	$v0, loc_80110548
		move	$a0, $s2
		move	$a1, $s3
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x100
		lbu		$v1, 6($s2)
		nop
		addu	$v1, $v0
		j		loc_80110548
		sb		$v1, 6($s2)
loc_80110510:
		jal		Rnd
		nop
		andi	$v0, 0xF
		addiu	$v0, 3
		sh		$v0, 0x158($s2)
		li		$v0, 5
		sb		$v0, 6($s2)
loc_8011052C:
		lhu		$v1, 0x158($s2)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80110548
		sh		$v0, 0x158($s2)
		li		$v0, 3
		sb		$v0, 6($s2)
loc_80110548:
		lhu		$v1, 0x15A($s2)
		nop
		addiu	$v0, $v1, -1
		bnez	$v1, loc_80110754
		sh		$v0, 0x15A($s2)
		li		$v0, 6
		j		loc_80110754
		sb		$v0, 6($s2)
loc_80110568:
		lb		$v0, 0x16A($s2)
		nop
		addu	$v0, $sp, $v0
		lbu		$a0, 0x14($v0)
		lhu		$v0, 0x21A($s2)
		li		$v1, 7
		sb		$v1, 6($s2)
		lui		$v1, 0xF
		ori		$v0, 0x10
		sh		$v0, 0x21A($s2)
		li		$v0, 1
		sb		$v0, 0x234($s2)
		lhu		$v0, 0x21A($s2)
		addu	$a0, $v1
		andi	$v0, 4
		beqz	$v0, loc_801105B0
		sw		$a0, 0x14C($s2)
		sb		$0, 0x234($s2)
loc_801105B0:
		lb		$v1, 0x16B($s2)
		li		$v0, 1
		bne		$v1, $v0, loc_801105E0
		li		$a0, 0x1F40
		lw		$a2, 0x198($s2)
		addiu	$a3, $sp, 0x18
		sh		$0, 0x18($sp)
		sh		$0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		lh		$a1, 0x76($s2)
		jal		Esp_call
		addiu	$a2, 0x48
loc_801105E0:
		lbu		$v0, 0x239($s2)
		nop
		bnez	$v0, loc_80110614
		nop
		jal		Rnd
		nop
		andi	$v0, 3
		bnez	$v0, loc_80110614
		li		$a0, 0xB
		jal		Snd_se_enem
		move	$a1, $s2
		li		$v0, 0x96
		sb		$v0, 0x239($s2)
loc_80110614:
		lhu		$v0, 0x21A($s2)
		li		$v1, 0xB
		sh		$v1, 0x144($s2)
		andi	$v0, 0xFDFF
		sh		$v0, 0x21A($s2)
loc_80110628:
		lhu		$v1, 0x9A($s2)
		nop
		sltiu	$v0, $v1, 0x1F4
		beqz	$v0, loc_8011066C
		addiu	$v0, $v1, 0xA
		sh		$v0, 0x9A($s2)
		lhu		$v0, 0x9C($s2)
		lhu		$v1, 0x90($s2)
		addiu	$v0, 0xA
		sh		$v0, 0x9C($s2)
		sltiu	$v0, $v1, 0x1F4
		beqz	$v0, loc_8011066C
		addiu	$v1, 0xA
		lhu		$v0, 0x92($s2)
		sh		$v1, 0x90($s2)
		addiu	$v0, 0xA
		sh		$v0, 0x92($s2)
loc_8011066C:
		lh		$v0, 0x98($s2)
		nop
		move	$v1, $v0
		slti	$v0, -0x5DB
		bnez	$v0, loc_80110698
		move	$a0, $s2
		lhu		$v0, 0x9E($s2)
		addiu	$v1, -0xA
		sh		$v1, 0x98($s2)
		addiu	$v0, 0xA
		sh		$v0, 0x9E($s2)
loc_80110698:
		move	$a1, $s3
		move	$a2, $s4
		jal		Joint_move
		li		$a3, 0x100
		beqz	$v0, loc_801106D0
		li		$v1, 8
		lhu		$v0, 0x21A($s2)
		nop
		andi	$v0, 0xFFEF
		sh		$v0, 0x21A($s2)
		lhu		$v0, 0x21A($s2)
		sb		$v1, 6($s2)
		andi	$v0, 0xFFFD
		sh		$v0, 0x21A($s2)
loc_801106D0:
		lbu		$v1, 0x14D($s2)
		li		$v0, 0x37
		bne		$v1, $v0, loc_80110754
		lui		$v1, 0xC00
		lw		$v0, 0($s2)
		nop
		or		$v0, $v1
		j		loc_80110754
		sw		$v0, 0($s2)
loc_801106F4:
		li		$v0, 0x101
		sw		$v0, 4($s2)
		li		$v0, 0x1F4
		sh		$v0, 0x9A($s2)
		sh		$v0, 0x9C($s2)
		sh		$v0, 0x90($s2)
		sh		$v0, 0x92($s2)
		li		$v0, 0xFFFFFA24
		sh		$v0, 0x98($s2)
		lbu		$v0, 0x1D3($s2)
		li		$v1, 0x5DC
		sh		$v1, 0x9E($s2)
		andi	$v0, 0x7F
		sb		$v0, 0x1D3($s2)
		lw		$v0, 0($s2)
		lui		$v1, 0xC00
		or		$v0, $v1
		sw		$v0, 0($s2)
		lhu		$v0, 0x10E($s2)
		lhu		$v1, 0x21A($s2)
		andi	$v0, 0xDFFF
		andi	$v1, 0xFFED
		sh		$v0, 0x10E($s2)
		sh		$v1, 0x21A($s2)
loc_80110754:
		lw		$ra, 0x5C($sp)
		lw		$s4, 0x58($sp)
		lw		$s3, 0x54($sp)
		lw		$s2, 0x50($sp)
		lw		$s1, 0x4C($sp)
		lw		$s0, 0x48($sp)
		addiu	$sp, 0x60
		jr		$ra
		nop