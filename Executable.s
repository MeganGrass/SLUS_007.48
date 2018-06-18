

;; SLUS_007.48
.erroronwarning on
.psx
.open "PSX.EXE",0x8000F800

;; DEFAULT
.include ".\\r3000a\\Executable.map"			;; Original Variables and Prototypes
.include ".\\r3000a\\Clean.s"					;; Executable Scrubber
.include ".\\r3000a\\DualShock.map"				;; New Variables and Prototypes
.include ".\\r3000a\\Miscellaneous\\DecLZO.s"	;; Data Decompression
.include ".\\r3000a\\CD\\CdReadEx.s"			;; CdReadEx Function
.include ".\\r3000a\\CD\\CdReadSound.s"			;; CdReadSound Function
.include ".\\r3000a\\CD\\CdRead.s"				;; CdRead Function
.include ".\\r3000a\\Boot\\Logo.s"				;; Warning Screen
.include ".\\r3000a\\Miscellaneous\\FileTable.s";; DO2, CORE and ARMS file IDs (deprecated)
.include ".\\r3000a\\Miscellaneous\\LoadTask.s"	;; Overlay Table
.include ".\\r3000a\\Miscellaneous\\itox.s"		;; Integer -> String (Hexdecimal Printing)
.include ".\\r3000a\\Miscellaneous\\pSXPrint.s"	;; printf for pSX 1.14

;; DEBUG
.include ".\\r3000a\\Boot\\Inventory.s"			;; New Game Inventory
.include ".\\r3000a\\Debug\\WeaponChange.s"		;; Weapon Selector
.include ".\\r3000a\\Debug\\Main.s"				;; General Debugger
.include ".\\r3000a\\Debug\\StatusMenuItem.s"	;; Status Menu Item Select

;; ENEMY
.include ".\\asset\\Enemy\\CDEMD0\\cdemd0.s"	;; 
.include ".\\asset\\Enemy\\CDEMD1\\cdemd1.s"	;; 

;; MUSIC
.include ".\\r3000a\\Music\\LoadBGM.s"			;; BGM File Load
.include ".\\r3000a\\Music\\Snd_bgm_set.s"		;; BGM Function Patch
.include ".\\r3000a\\Music\\Snd_bgm_ck.s"		;; BGM Function Patch

;; PLAYER
.include ".\\r3000a\\Player\\LoadPlwTable.s"	;; PLW Index Setup
.include ".\\r3000a\\Player\\LoadPLD.s"			;; PLD File Load
.include ".\\r3000a\\Player\\LoadPLW.s"			;; PLW File Load
.include ".\\r3000a\\Player\\PlayerMove.s"		;; Quick-Turn
.include ".\\r3000a\\Player\\W0F_H&K MC51.s"	;; H&K MC51 Machine Gun

;; ROOM
.include ".\\r3000a\\Room\\LoadBSS.s"			;; BSS File Load
.include ".\\r3000a\\Room\\LoadRDT.s"			;; RDT File Load
.include ".\\r3000a\\Room\\LoadSTG.s"			;; STAGE Setup
.include ".\\r3000a\\Room\\SetStage.s"			;; LBA Index Setup

;; Patch Game_loop()
;; for BOOT.BIN
.org 0x80032180
				addiu   $sp, -0x18
				sw      $ra, 0x10($sp)
				li		$v1, 0x0C064015			;; jal		BOOT_Initialize
				sw		$v1, 0x800257B8
				li      $s3, 1					;; OPENING
				li      $s2, 2					;; OPENING
				lui     $v1, 0x100				;; ENDING
				and     $v0, $v1				;; ENDING
				lw      $ra, 0x10($sp)
				addiu   $sp, 0x18
				jr      $ra
				nop

;; printf for pSX 1.14
;; Output debugging strings to console window
.org PatchPrintF
	.word 0x4C444445
	jr ra
	nop

;; pl_mv05
.org 0x80043E84
		la		$a1, 0x800A6D74

;; Arms
.org 0x80059CE8
		addiu	$a0, $s2, FILE_ARMS_EDH
		nop
		nop
.org 0x80059DFC
		addiu	$a0, $s2, FILE_ARMS_VBD
		nop
		nop

;; Core
.org 0x80059A94
		addiu	$a0, $s3, FILE_CORE_EDH
		nop
		nop
.org 0x80059B58
		addiu	$a0, $s3, FILE_CORE_VBD
		nop
		nop
.org 0x80059C04
		addiu	$a0, $s3, FILE_CORE_VBD
		nop
		nop

;; Door
.org 0x80014D88
		addiu	$a0, $s6, FILE_DO2
		nop
		nop
.org 0x80015094
		addiu	$a0, $v1, FILE_DO2
		nop
		nop
		sll     $a2, $v1, 1
		addu    $v1, $a2, $v1
		sll     $v1, 2
		addu    $v1, $v0

.close

;; DO NOT MODIFY
.open "BOOT.BIN",0x80190000
.include ".\\r3000a\\Boot\\Main.s"				;; Boot/Reset Game
.close
