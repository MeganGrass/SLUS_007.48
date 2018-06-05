

;; G.pBs_size
.org 0x8002BE9C
		nop
		nop

;; Bg_draw
.org 0x8002BEC0

		;; Read Index
		la		$s5, BssArchiveTbl		;; 0x80032150
		lh		$v0, G_Room_no
		li		$v1, 8
		multu	$v1, $v0
		mflo	$v1
		addu	$v0, $v1, $s5			;; Index Pointer
		lw		$a0, 0x04($v0)			;; Archive Sector
		lh		$a2, G_Cut_no
		li		$a3, 0x20
		multu	$a2, $a3
		mflo	$v1

		;; Load Bit-Stream File
		addu	$a0, $v1, $a0			;; Sector
		li		$a1, 0x10000			;; Size
		la		$a2, 0x80190000			;; Address
		jal		CdReadEx
		li		$a3, 0					;; Auto-Parse Index
		jal     VSync
		move    $a0, $0

		;; Z-Buffer Sprite Flag
		la		$a0, 0x80198000
		lw		$v0, 0($a0)
		nop
		beqz	$v0, @Complete
		nop
		
		;; Z-Buffer Sprite Initialize
		la		$a0, 0x80198000
		la		$a1, 0x801A5800
		jal		DecLZO
		nop
		lhu     $s0, G_Ctpage
		li      $v0, 0x15
		sh      $v0, G_Ctpage
		la      $a0, 0x801A5800
		jal     Mapping_tim
		nop
		sh      $s0, G_Ctpage

		@Complete:
		j		0x8002C064
		nop
