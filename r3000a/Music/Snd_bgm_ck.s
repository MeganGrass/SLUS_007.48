

.org 0x8005A738
		nop
		lhu		$v0, G_Room_no
		li		$v1, 2
		multu	$v0, $v1
		mflo	$a0
		li		$v0, pBgmTable
		addu	$a0, $v0
		sw		$a0, pBgmCtr
		lbu		$v0, 0($a0)		;; Table
		lbu		$v1, 1($a0)		;; Table
		li		$a2, BgmCtr
		lbu		$a0, 0($a2)		;; Current
		lbu		$a1, 1($a2)		;; Current

		;; Test
		bne		$a0, $v0, @FadeOut
		nop
		bne		$a1, $v1, @FadeOut
		nop
		j		0x8005A7C0
		nop

		@FadeOut:
		li      $a0, 0x5A
		jal     Snd_bgm_fade_ON
		li      $a1, 0x16
		j		0x8005A874
		nop
