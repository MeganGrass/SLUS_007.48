

		addiu	$sp, -0x38
		sw		$s2, 0x28($sp)
		move	$s2, $a0
		sw		$s1, 0x24($sp)
		addiu	$s1, $s2, 0x24
		sw		$ra, 0x34($sp)
		sw		$s4, 0x30($sp)
		sw		$s3, 0x2C($sp)
		sw		$s0, 0x20($sp)
		lw		$s0, 0x198($s2)
		move	$a0, $s1
		addiu	$a1, $s0, 0x18
		jal		CompM
		addiu	$a2, $s0, 0x48
		move	$a0, $s1
		addiu	$s4, $sp, 0x18
		lw		$v0, 0x5C($s0)
		move	$a1, $s4
		sh		$v0, 0x10($sp)
		lhu		$v0, 0x10C($s2)
		move	$a2, $s4
		sh		$v0, 0x12($sp)
		lw		$v1, 0x64($s0)
		li		$v0, 0x12C
		sh		$v0, 0x18($sp)
		sh		$0, 0x1A($sp)
		sh		$0, 0x1C($sp)
		jal		ApplyMatrixSV
		sh		$v1, 0x14($sp)
		lhu		$v0, 0x18($sp)
		lhu		$v1, 0x10($sp)
		lhu		$a0, 0x12($sp)
		lhu		$a1, 0x14($sp)
		addu	$v0, $v1
		sh		$v0, 0x18($sp)
		lhu		$v0, 0x1A($sp)
		lhu		$v1, 0x1C($sp)
		addu	$v0, $a0
		addu	$v1, $a1
		sh		$v0, 0x1A($sp)
		jal		Rnd
		sh		$v1, 0x1C($sp)
		sll		$s0, $v0, 2
		addiu	$s0, 0xC00
		lui		$s3, 0x1A00
		jal		Rnd
		or		$s0, $s3
		move	$a0, $s0
		la		$s1, GsIDMATRIX
		move	$a2, $s1
		move	$a3, $s4
		lh		$a1, 0x76($s2)
		sll		$v0, 2
		jal		Esp_call
		subu	$a1, $v0
		jal		Rnd
		nop
		sll		$s0, $v0, 2
		addiu	$s0, 0xC00
		jal		Rnd
		or		$s0, $s3
		move	$a0, $s0
		move	$a2, $s1
		move	$a3, $s4
		sll		$v0, 2
		lh		$a1, 0x76($s2)
		addiu	$v0, -0x400
		jal		Esp_call
		subu	$a1, $v0
		jal		Rnd
		nop
		sll		$s0, $v0, 2
		addiu	$s0, 0xC00
		jal		Rnd
		or		$s0, $s3
		move	$a0, $s0
		move	$a2, $s1
		addiu	$a3, $sp, 0x10
		sll		$v0, 2
		lh		$a1, 0x76($s2)
		addiu	$v0, -0x800
		jal		Esp_call
		subu	$a1, $v0
		jal		Rnd
		nop
		sll		$s0, $v0, 2
		addiu	$s0, 0xC00
		jal		Rnd
		or		$s0, $s3
		move	$a0, $s0
		move	$a2, $s1
		addiu	$a3, $sp, 0x10
		sll		$v0, 2
		lh		$a1, 0x76($s2)
		addiu	$v0, -0xC00
		jal		Esp_call
		subu	$a1, $v0
		lw		$ra, 0x34($sp)
		lw		$s4, 0x30($sp)
		lw		$s3, 0x2C($sp)
		lw		$s2, 0x28($sp)
		lw		$s1, 0x24($sp)
		lw		$s0, 0x20($sp)
		addiu	$sp, 0x38
		jr		$ra
		nop