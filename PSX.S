

;; ZERO
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
.include ".\\r3000a\\Miscellaneous\\LoadTask.s"	;; Overlay Table
.include ".\\r3000a\\Miscellaneous\\itox.s"		;; Integer -> String (Hexdecimal Printing)
.include ".\\r3000a\\Miscellaneous\\FileTable.s";; DO2, CORE and ARMS file IDs (deprecated)

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

;; pl_mv05
.org 0x80043E84
		la		$a1, 0x800A6D74

.close

;; BOOT
.open "BOOT.BIN",0x80190000
.include ".\\r3000a\\Boot\\Main.s"				;; Boot/Reset Game
.close

;; DEBUG
.open "DEBUG.BIN",0x801BFA18
.include ".\\r3000a\\Debug\\Debug.s"			;; Debug Engine
.close

;; DIEDEMO
.open "DIEDEMO.BIN",0x80190000
.org 0x80190278
	nop			;; Xa_play
.close
