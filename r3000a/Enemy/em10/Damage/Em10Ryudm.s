

		addiu	$sp, -0x20
		sw		$s0, 0x18($sp)
		move	$s0, $a0
		lui     $v1, 0x30
		ori     $v1, 0x4040
		lui		$a0, 0x40
		sw		$ra, 0x1C($sp)
		lhu		$v0, 0x21A($s0)
		lw		$a2, 0x198($s0)
		ori		$v0, 0x1800
		sh		$v0, 0x21A($s0)
		sw		$v1, 0x70($a2)
		lw		$v0, 0x198($s0)
		ori     $a0, 0x5050
		sw		$v1, 0x11C($v0)
		lw		$v0, 0x198($s0)
		lui		$a1, 0x50
		sw		$a0, 0x1C8($v0)
		lw		$v0, 0x198($s0)
		ori     $a1, 0x6060
		sw		$a0, 0x3CC($v0)
		lw		$v0, 0x198($s0)
		move	$a3, $0
		sw		$v1, 0x5D0($v0)
		lw		$v0, 0x198($s0)
		lui		$a0, 0x40F
		sw		$a1, 0x67C($v0)
		lw		$v0, 0x198($s0)
		ori     $a0, 0x1770
		sw		$a1, 0x880($v0)
		lw		$a2, 0x198($s0)
		lh		$a1, 0x76($s0)
		jal		Esp_call
		addiu	$a2, 0x48
		lw		$a2, 0x198($s0)
		nop
		lw		$v0, 0x810($a2)
		nop
		andi	$v0, 1
		beqz	$v0, loc_801133CC
		lui		$a0, 0x40F
		ori     $a0, 0xFA0
		lh		$a1, 0x76($s0)
		addiu	$a2, 0x858
		jal		Esp_call
		move	$a3, $0
		lw		$a2, 0x198($s0)
loc_801133CC:
		nop
		lw		$v0, 0x204($a2)
		nop
		andi	$v0, 1
		beqz	$v0, loc_801133F8
		lui		$a0, 0x40F
		ori     $a0, 0xFA0
		lh		$a1, 0x76($s0)
		addiu	$a2, 0x24C
		jal		Esp_call
		move	$a3, $0
loc_801133F8:
		lw		$ra, 0x1C($sp)
		lw		$s0, 0x18($sp)
		addiu	$sp, 0x20
		jr		$ra
		nop