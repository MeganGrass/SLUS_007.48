
				;; Stack
				addiu   $sp, -0x18
				sw      $ra, 0x18+-0x08($sp)

				li		$v0, pDiscTable+(ZERO_DO2_FILES*8)
				sw		$v0, GAME_DO2_LBA					;; DO2
				li		$v0, pDiscTable+(ZERO_EMD0_FILES*8)
				sw		$v0, GAME_EMD0_LBA					;; EMD0
				li		$v0, pDiscTable+(ZERO_EMD1_FILES*8)
				sw		$v0, GAME_EMD1_LBA					;; EMD1
				li		$v1, ZERO_EMD0_FILES				;; LBA
				sh		$v1, 0x8001B960						;; EMS0 sub_8001B934
				sh		$v1, 0x8001B990						;; EMS0 sub_8001B934
				sh		$v1, 0x8001B9AC						;; EMS0 sub_8001B934
				sh		$v1, 0x8001B86C						;; EMS0 Em_bin_load
				sh		$v1, 0x8001B90C						;; EMS0 Em_bin_load
				li		$v0, 8								;; EMS0 pDiscTable
				multu	$v0, $v1							;; EMS0 pDiscTable
				mflo	$v0									;; EMS0 pDiscTable
				li		$v1, 0x88A4							;; EMS0 pDiscTable
				addu	$v0, $v0, $v1						;; EMS0 pDiscTable
				li		$v1, 4								;; EMS0 sector
				addu	$a0, $v0, $v1						;; EMS0 sector
				li		$v1, 6								;; EMS0 sec_high
				addu	$a1, $v0, $v1						;; EMS0 sec_high
				sh		$a0, 0x8001B89C						;; EMS0 sector
				sh		$a1, 0x8001B8E4						;; EMS0 sec_high
				sh		$a0, 0x8001B9F4						;; EMS0 sector
				sh		$a1, 0x8001B9EC						;; EMS0 sec_high
				li		$v0, ZERO_EMD1_FILES				;; LBA
				sh		$v0, 0x8001B974						;; EMS1 sub_8001B934
				sh		$v0, 0x8001B98C						;; EMS1 sub_8001B934
				sh		$v0, 0x8001BA2C						;; EMS1 sub_8001B934
				li		$v0, 8
				addu	$a0, $a0, $v0						;; EMS1 sector
				addu	$a1, $a1, $v0						;; EMS1 sec_high
				sh		$a0, 0x8001BA78						;; EMS1 sector
				sh		$a1, 0x8001BA70						;; EMS1 sec_high
				li		$v0, pDiscTable+(ZERO_PLD_FILES*8)
				sw		$v0, GAME_PLD_LBA					;; PLD
				li		$v0, pDiscTable+(ZERO_PLW_FILES*8)
				sw		$v0, GAME_PLW_LBA					;; PLW
				li		$v0, pDiscTable+(ZERO_SNDARMS_FILES*8)
				sw		$v0, GAME_SNDARMS_LBA				;; SNDARMS
				li		$v0, pDiscTable+(ZERO_SNDCORE_FILES*8)
				sw		$v0, GAME_SNDCORE_LBA				;; SNDCORE
				li		$v0, pDiscTable+(ZERO_SNDEMD_FILES*8)
				sw		$v0, GAME_SNDEMD_LBA				;; SNDEMD
				li		$v1, ZERO_SNDEMD_FILES				;; OPCODE: li      $a0, ZERO_SNDEMD_FILES
				sh		$v1, 0x8005A128						;; OPCODE: li      $a0, ZERO_SNDEMD_FILES
				sh		$v1, 0x8005A14C						;; OPCODE: li      $a0, ZERO_SNDEMD_FILES
				sh		$v1, 0x8005A228						;; OPCODE: li      $a0, ZERO_SNDEMD_FILES
				sh		$v1, 0x8005A278						;; OPCODE: li      $a0, ZERO_SNDEMD_FILES
				li		$v0, 8
				multu	$v0, $v1
				mflo	$v0
				li		$v1, 0x88A4							;; pDiscTable
				addu	$v0, $v0, $v1
				li		$v1, 4
				addu	$a0, $v0, $v1
				li		$v1, 6
				addu	$a1, $v0, $v1
				sh		$a0, 0x8005A164						;; sector
				sh		$a0, 0x8005A290						;; sector
				sh		$a1, 0x8005A15C						;; sec_high
				sh		$a1, 0x8005A288						;; sec_high
				li		$v0, pDiscTable+(ZERO_SNDMAIN_FILES*8)
				sw		$v0, GAME_SNDMAIN_LBA				;; SNDMAIN
				li		$v0, pDiscTable+(ZERO_SNDSUB_FILES*8)
				sw		$v0, GAME_SNDSUB_LBA				;; SNDSUB
				li		$v0, pDiscTable+(ZERO_BSS_FILES*8)
				sw		$v0, GAME_BSS_LBA					;; BSS LBA
				li		$v0, pDiscTable+(ZERO_RDT_FILES*8)
				sw		$v0, GAME_RDT_LBA					;; RDT LBA

				;; DO2 Table
				lw		$v0, GAME_DO2_LBA
				li		$a1, 0x200				;; Size
				lw		$a0, 0x04($v0)			;; Disc.fpos.sector
				li		$a2, Do2ArchiveTable	;; Address
				jal		CdReadEx
				li		$a3, 64					;; Auto-Parse Index

				;; ARMS Table
				lw		$v0, GAME_SNDARMS_LBA
				li		$a1, 0x140				;; Size
				lw		$a0, 0x04($v0)			;; Disc.fpos.sector
				li		$a2, ArmsArchiveTable	;; Address
				jal		CdReadEx
				li		$a3, 40					;; Auto-Parse Index

				;; CORE Table
				lw		$v0, GAME_SNDCORE_LBA
				li		$a1, 0x160				;; Size
				lw		$a0, 0x04($v0)			;; Disc.fpos.sector
				li		$a2, CoreArchiveTable	;; Address
				jal		CdReadEx
				li		$a3, 44					;; Auto-Parse Index

				;; BGM Table
				lw		$v0, GAME_SNDMAIN_LBA
				li		$a1, 0x200				;; Size
				lw		$a0, 0x04($v0)			;; Disc.fpos.sector
				li		$a2, BgmMainTbl			;; Address
				jal		CdReadEx
				li		$a3, 64					;; Auto-Parse Index
				lw		$v0, GAME_SNDSUB_LBA
				li		$a1, 0x200				;; Size
				lw		$a0, 0x04($v0)			;; Disc.fpos.sector
				li		$a2, BgmSub_Tbl			;; Address
				jal		CdReadEx
				li		$a3, 64					;; Auto-Parse Index

				;; PLD Table
				lw		$v0, GAME_PLD_LBA
				li		$a1, 0x80				;; Size
				lw		$a0, 0x04($v0)			;; Disc.fpos.sector
				li		$a2, PldArchiveTbl		;; Address
				jal		CdReadEx
				li		$a3, 16					;; Auto-Parse Index

				;; Terminate
				lw      $ra, 0x18+-0x08($sp)
				addiu   $sp, 0x18
				jr      $ra
				nop
