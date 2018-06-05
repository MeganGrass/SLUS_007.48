

.org LoadStage

		;; Stack
		addiu   $sp, -0x18
		sw      $ra, 0x18+-0x08($sp)

		;; BSS Index
		lw		$v0, GAME_BSS_LBA
		lhu		$a3, G_Stage_no
		li		$v1, 8
		multu	$v1, $a3
		mflo	$v1
		addu	$a3, $v0, $v1
		lw		$a0, 0x04($a3)				;; Disc.fpos.sector
		li		$a1, 0x1E0					;; Size
		li		$a2, BssArchiveTbl			;; Address
		jal		CdReadEx					;; Load File
		li		$a3, 48						;; Auto-Parse Index

		;; BGM Table
		li		$a0, pBGMTable				;; Destination
		li		$a1, BssArchiveTbl+0x180	;; Source
		jal		memcpy16					;; Copy
		li		$a2, 0x60					;; Size

		;; RDT Index
		lw		$v0, GAME_RDT_LBA
		lbu		$a0, DISK_ID
		nop
		beqz	$a0, @FileSector
		nop
		addiu	$v0, 0x38
		@FileSector:
		lhu		$a3, G_Stage_no
		li		$v1, 8
		multu	$v1, $a3
		mflo	$v1
		addu	$a3, $v0, $v1
		lw		$a0, 0x04($a3)				;; Disc.fpos.sector
		li		$a1, 0x180					;; Size
		li		$a2, RdtArchiveTbl			;; Address
		jal		CdReadEx					;; Load File
		li		$a3, 48						;; Auto-Parse Index

		;; Free Work
		sw		$0,  G_pBs_size
		li		$v0, RDTFile
		sw		$v0, G_pFree_work_head

		@Terminate:
		lw      $ra, 0x18+-0x08($sp)
		addiu   $sp, 0x18
		jr      $ra
		nop
