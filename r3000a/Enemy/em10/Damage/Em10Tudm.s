

		addiu	$sp, -0x20
		sw		$s0, 0x18($sp)
		move	$s0, $a0
		li		$a0, 0x5032710
		addiu	$a3, $sp, 0x10
		li		$v0, 0xC8
		sw		$ra, 0x1C($sp)
		sh		$0, 0x10($sp)
		sh		$v0, 0x12($sp)
		sh		$0, 0x14($sp)
		lw		$v0, 0x198($s0)
		lh		$a1, 0x76($s0)
		jal		Esp_call
		addiu	$a2, $v0, 0x48
		lw		$a2, 0x198($s0)
		nop
		lw		$v0, 0x204($a2)
		nop
		andi	$v0, 1
		beqz	$v0, loc_80113478
		lui		$a0, 0x503
		ori     $a0, 0x13E8
		lh		$a1, 0x76($s0)
		addiu	$a2, 0x24C
		jal		Esp_call
		addiu	$a3, $sp, 0x10
loc_80113478:
		li		$a0, 0x404040
		lui		$a2, 0x48
		lw		$v0, 0x198($s0)
		ori     $a2, 0x4848
		sw		$a0, 0x70($v0)
		lw		$v0, 0x198($s0)
		lui		$v1, 0x70
		sw		$a2, 0x11C($v0)
		lw		$v0, 0x198($s0)
		ori     $v1, 0x7070
		sw		$v1, 0x1C8($v0)
		lw		$v0, 0x198($s0)
		lui		$a1, 0x50
		sw		$v1, 0x3CC($v0)
		lw		$v0, 0x198($s0)
		ori     $a1, 0x5050
		sw		$a1, 0x67C($v0)
		lw		$v0, 0x198($s0)
		nop
		sw		$a2, 0x728($v0)
		lw		$v0, 0x198($s0)
		nop
		sw		$a0, 0x7D4($v0)
		lw		$v0, 0x198($s0)
		nop
		sw		$a1, 0x880($v0)
		lw		$v0, 0x198($s0)
		nop
		sw		$a0, 0x92C($v0)
		lw		$v0, 0x198($s0)
		nop
		sw		$a0, 0x9D8($v0)
		lw		$ra, 0x1C($sp)
		lw		$s0, 0x18($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop