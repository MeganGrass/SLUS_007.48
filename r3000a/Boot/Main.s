

BOOT_Main:
.org 0x80190000

					;; Stack
					addiu   $sp, -0x18
					sw      $ra, 0x18+-0x08($sp)

					;; File System
					jal		BOOT_FileSystem
					nop

					;; Controller
					li      $a0, 0xF000
					li      $a1, 0x60A
					jal     Pad_rep_set
					nop

					;; Flag
					li		$v0, 0x40020040
					sw      $v0, G_System_flg
					nop

					;; Game Loop
					la      $a0, Game_loop
					jal     Task_chain
					nop

					;; Terminate
					lw      $ra, 0x18+-0x08($sp)
					addiu   $sp, 0x18
					jr      $ra
					nop
					
BOOT_Print8:		.include ".\\r3000a\\Miscellaneous\\Print8.s"
BOOT_Print14:		.include ".\\r3000a\\Miscellaneous\\Print14.s"
BOOT_CursorUp:		.include ".\\r3000a\\Miscellaneous\\CursorUp.s"
BOOT_CursorDown:	.include ".\\r3000a\\Miscellaneous\\CursorDown.s"
BOOT_FadeIn:		.include ".\\r3000a\\Miscellaneous\\FadeIn.s"
BOOT_FadeOut:		.include ".\\r3000a\\Miscellaneous\\FadeOut.s"
ControllerReset:	.include ".\\r3000a\\Miscellaneous\\ControllerReset.s"
BOOT_FileSystem:	.include ".\\r3000a\\Boot\\FileSystem.s"
BOOT_Initialize:	.include ".\\r3000a\\Boot\\Initialize.s"
BOOT_TitleScreen:	.include ".\\r3000a\\Boot\\TitleScreen.s"
BOOT_NewGame:		.include ".\\r3000a\\Boot\\NewGame.s"
BOOT_DebugOption:	.include ".\\r3000a\\Debug\\Option.s"
BOOT_StatDisplay:	.include ".\\r3000a\\Debug\\StatDisplay.s"
BOOT_SoundTest:		.include ".\\r3000a\\Boot\\SoundTest.s"
BOOT_Copyright:		.include ".\\r3000a\\Boot\\Copyright.s"
BOOT_AreaJump:		.include ".\\r3000a\\Zero\\AreaJump.s"
NewGameStr:			.ascii	"New Game",0x00
					.align
DebugOptionStr:		.ascii	"Debug Option",0x00
					.align
DebugDisplayStr:	.ascii	"Debug Display",0x00
					.align
SoundTestStr:		.ascii	"Sound Test",0x00
					.align
CopyrightStr:		.ascii	"Copyright",0x00
					.align
BOOT_CopyStr00:		.ascii	"All rights, including the copyrights",0x00
					.align
BOOT_CopyStr01:		.ascii	"of game, scenario, music and program",0x00
					.align
BOOT_CopyStr02:		.ascii	"are reserved by CAPCOM Co., Ltd.",0x00
					.align
BOOT_DevWarning:	.ascii	"*** Work In Progress ***",0x00
					.align
BOOT_BioTitleFail:	.word	FALSE
BOOT_PADJPN:		.include ".\\r3000a\\Miscellaneous\\ControllerDataJPN.s"
BOOT_PADUSA:		.include ".\\r3000a\\Miscellaneous\\ControllerDataUSA.s"
BOOT_InitTable:		.import ".\\r3000a\\Boot\\INIT_TBL.DAT"
					.align
