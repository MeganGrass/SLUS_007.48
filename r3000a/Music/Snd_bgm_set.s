

.org 0x8005A470
		nop
		lhu		$v0, G_Room_no
		li		$v1, 2
		multu	$v0, $v1
		mflo	$a0
		li		$v0, pBgmTable
		addu	$a0, $v0
		sw		$a0, pBgmCtr
		lbu		$s0, 0($a0)
		lbu		$s1, 1($a0)
		lbu     $v1, 0x800DBB70			;; pEdt_adr.id_check
		nop
		beqz    $v1, 0x8005A4E4
		nop
		j		0x8005A4C8
		nop
