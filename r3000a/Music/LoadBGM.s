

;; XREF
.org 0x8005AB94
		li      $v0, 0xFFFFFFF0
		lw      $a3, G_pFree_work
		nop
		addiu   $a3, 0x10
		and     $s0, $a3, $v0
		li      $a0, 0					;; MAIN
		jal		SetMusicEx				;; Snd_bgm_main()
		nop
		j		0x8005ABDC
		nop
.org 0x8005AFB4
		li      $v0, 0xFFFFFFF0
		lw      $a3, G_pFree_work
		nop
		addiu   $a3, 0x10
		and     $s0, $a3, $v0
		li      $a0, 1					;; SUB
		jal		SetMusicEx				;; Snd_bgm_sub()
		nop
		j		0x8005B00C
		nop

;; VOID SetMusicEx(UCHAR Type);
.org SetMusicEx

		;; Stack
		addiu	$sp, -0x38
		sw		$s0, 0x38+-0x20($sp)
		sw		$s1, 0x38+-0x1C($sp)
		sw		$s2, 0x38+-0x18($sp)
		sw		$s3, 0x38+-0x14($sp)
		sw		$s4, 0x38+-0x10($sp)
		sw		$s5, 0x38+-0x0C($sp)
		sw		$ra, 0x38+-0x08($sp)

		;; BGM ID
		lhu		$v0, G_Room_no
		li		$v1, 2
		multu	$v1, $v0
		mflo	$v1
		li		$v0, pBgmTable
		addu	$v1, $v0
		lbu		$s1, 0x00($v1)				;; MAIN
		lbu		$s2, 0x01($v1)				;; SUB
		andi	$s1, 0x3F
		andi	$s2, 0x3F

		;; Memory Address
		li      $v0, 0xFFFFFFF0
		lw      $v1, G_pFree_work
		nop
		addiu   $v1, 0x10
		and     $a2, $v1, $v0				;; Address

		;; TEST
		li      $v0, 0x3F
		bne		$0,  $a0, @SUBIndex
		nop

		@MAINIndex:
		beq		$v0, $s1, @TerminateNow
		li      $v0, 0xFFFFFFFF
		la		$s0, BgmMainTbl
		li		$v1, 8
		multu	$v1, $s1
		mflo	$v1
		addu	$v0, $v1, $s0
		lw		$a0, 0x04($v0)				;; Sector
		lw		$a1, 0x00($v0)				;; Size
		nop
		beqz	$a1, @TerminateNow
		li      $v0, 0xFFFFFFFF
		j		@LoadBGM
		nop

		@SUBIndex:
		beq		$v0, $s2, @TerminateNow
		li      $v0, 0xFFFFFFFF
		la		$s0, BgmSub_Tbl
		li		$v1, 8
		multu	$v1, $s2
		mflo	$v1
		addu	$v0, $v1, $s0
		lw		$a0, 0x04($v0)				;; Sector
		lw		$a1, 0x00($v0)				;; Size
		nop
		beqz	$a1, @TerminateNow
		li      $v0, 0xFFFFFFFF

		@LoadBGM:
		jal		CdReadEx
		li		$a3, 0						;; Auto-Parse Index
		jal     Task_sleep
		li      $a0, 1

		@Terminate:
		la		$v1, 0x800D5300				;; CD
		lw		$v0, 0x10($v1)				;; CD.Fsize_read (return value)
		@TerminateNow:
		lw		$ra, 0x38+-0x08($sp)
		lw		$s5, 0x38+-0x0C($sp)
		lw		$s4, 0x38+-0x10($sp)
		lw		$s3, 0x38+-0x14($sp)
		lw		$s2, 0x38+-0x18($sp)
		lw		$s1, 0x38+-0x1C($sp)
		lw		$s0, 0x38+-0x20($sp)
		jr		$ra
		addiu	$sp, 0x38
