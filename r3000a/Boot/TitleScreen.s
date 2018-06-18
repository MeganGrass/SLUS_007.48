
iOriginalGame:		equ 0
OriginalGameStrX:	equ 0x6C
OriginalGameStrY:	equ 0xA0
iDebugGame:			equ 1
DebugGameStrX:		equ 0x78
DebugGameStrY:		equ 0xA8
iDebugOption:		equ 2
DebugOptionStrX:	equ 0x70
DebugOptionStrY:	equ 0xB0
iDebugDisplay:		equ 3
DebugDisplayStrX:	equ 0x6C
DebugDisplayStrY:	equ 0xB8
iSoundTest:			equ 4
SoundTestStrX:		equ 0x78
SoundTestStrY:		equ 0xC0
iCopyright:			equ 5
CopyrightStrX:		equ 0x7C
CopyrightStrY:		equ 0xC8

				;; Stack
				addiu   $sp, -0x50
				sw      $ra, 0x48($sp)
				sw      $s7, 0x44($sp)
				sw      $s6, 0x40($sp)
				sw      $s5, 0x3C($sp)
				sw      $s4, 0x38($sp)
				sw      $s3, 0x34($sp)
				sw      $s2, 0x30($sp)
				sw      $s1, 0x2C($sp)
				sw      $s0, 0x28($sp)

				;; Reset Buffer(s)
				sb		$0, @iCursor
				jal		ControllerReset
				nop
				
				;; Title Screen
				move    $a0, $0
				jal     Bg_set_mode
				move    $a1, $0
				li      $a0, DataTitleScreen
				la      $a1, 0x80198000
				la      $a3, 0x80010A14
				jal     Cd_read
				move    $a2, $0
				jal		BOOT_FadeIn
				nop

@Main:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @Initiate
				li		$v0, PAD_UP
				beq		$v0, $v1, @CursorUp
				li		$v0, PAD_DOWN
				beq		$v0, $v1, @CursorDown
				nop

@Print:			;; Original Game
				la		$a0, OriginalGameStr
				li		$a1, OriginalGameStrX
				li		$a2, OriginalGameStrY
				lbu		$v0, @iCursor
				li		$v1, iOriginalGame
				beq		$v0, $v1, @PrintOriginalGame
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@PrintOriginalGame:
				jal		BOOT_Print8
				nop
				
				;; Debug Game
				la		$a0, DebugGameStr
				li		$a1, DebugGameStrX
				li		$a2, DebugGameStrY
				lbu		$v0, @iCursor
				li		$v1, iDebugGame
				beq		$v0, $v1, @PrintDebugGame
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@PrintDebugGame:
				jal		BOOT_Print8
				nop
				
				;; Debug Option
				la		$a0, DebugOptionStr
				li		$a1, DebugOptionStrX
				li		$a2, DebugOptionStrY
				lbu		$v0, @iCursor
				li		$v1, iDebugOption
				beq		$v0, $v1, @DebugOptionPrint
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@DebugOptionPrint:
				jal		BOOT_Print8
				nop

				;; Debug Display
				la		$a0, DebugDisplayStr
				li		$a1, DebugDisplayStrX
				li		$a2, DebugDisplayStrY
				lbu		$v0, @iCursor
				li		$v1, iDebugDisplay
				beq		$v0, $v1, @DebugDisplayPrint
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@DebugDisplayPrint:
				jal		BOOT_Print8
				nop

				;; Sound Test
				la		$a0, SoundTestStr
				li		$a1, SoundTestStrX
				li		$a2, SoundTestStrY
				lbu		$v0, @iCursor
				li		$v1, iSoundTest
				beq		$v0, $v1, @SoundTestPrint
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@SoundTestPrint:
				jal		BOOT_Print8
				nop
				
				;; Copyright Information
				la		$a0, CopyrightStr
				li		$a1, CopyrightStrX
				li		$a2, CopyrightStrY
				lbu		$v0, @iCursor
				li		$v1, iCopyright
				beq		$v0, $v1, @CopyrightPrint
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@CopyrightPrint:
				jal		BOOT_Print8
				nop
				
				;; Build Date
				la		$a0, pBuildDateStr
				li		$a1, 0x65
				li		$a2, 0xE0
				jal		BOOT_Print8
				li		$a3, PRINT_GREY

				@Loop:
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@CursorUp:		lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				li		$a0, @iCursor
				li		$a1, 0x00
				jal		BOOT_CursorUp
				li		$a2, 0x05
				j		@Print
				nop
@CursorDown:	lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				li		$a0, @iCursor
				li		$a1, 0x00
				jal		BOOT_CursorDown
				li		$a2, 0x05
				j		@Print
				nop

@Initiate:		lui     $a0, 0x406
				jal     Snd_se_stad
				move    $a1, $0
				lbu		$v0, @iCursor
				nop
				li		$v1, 0x00
				beq		$v0, $v1, @OriginalGame
				li		$v1, 0x01
				beq		$v0, $v1, @DebugGame
				li		$v1, 0x02
				beq		$v0, $v1, @DebugOption
				li		$v1, 0x03
				beq		$v0, $v1, @DebugDisplay
				li		$v1, 0x04
				beq		$v0, $v1, @SoundTest
				li		$v1, 0x05
				beq		$v0, $v1, @Copyright
				nop
				j		@Print
				nop

@DebugOption:	jal		BOOT_DebugOption
				nop
				j		@Print
				nop
@DebugDisplay:	jal		BOOT_StatDisplay
				nop
				j		@Print
				nop
@SoundTest:		jal		BOOT_SoundTest
				nop
				j		@Print
				nop
@Copyright:		jal		BOOT_FadeOut
				nop
				jal		BOOT_Copyright
				nop
				move    $a0, $0
				jal     Bg_set_mode
				move    $a1, $0
				li      $a0, DataTitleScreen
				la      $a1, 0x80198000
				la      $a3, 0x80010A14
				jal     Cd_read
				move    $a2, $0
				jal		BOOT_FadeIn
				nop
				j		@Print
				nop

@OriginalGame:	;; Player
				lbu		$v0, BOOT_PLAYER
				sb		$v0, Player_Id
				sb		$v0, G_Pl_id
				li		$v0, BOOT_HEALTH
				sh		$v0, Player_Life
				sh		$v0, G_Pl_life
				jal		LoadPlwTable
				nop

				;; Patch Game_loop()
				;; for TITLE.BIN
				li		$v0, 0x0C06568E						;; jal		0x80195A38
				sw		$v0, 0x800257B8

				;; TITLE.BIN
				li		$a0, 8
				jal     Task_lchain
				nop

@DebugGame:		jal		BOOT_DebugGame
				nop
				lw		$v0, BOOT_BioTitleFail				;; Cancel Request
				li		$v1, TRUE
				sw		$0,  BOOT_BioTitleFail
				nop
				beq		$v0, $v1, @Main
				nop
;;				lui     $a0, 0x400
;;				jal     Snd_se_stad
;;				move    $a1, $0
				li		$a0, LoadTaskFileArea
				li		$a1, LoadTaskAddrArea
				la		$a3, 0x800110C8
				jal		Cd_read
				move	$a2, $0
				jal		LoadTaskFuncArea
				nop

@Complete:		li      $v0, 3
				sb      $v0, Game_Doordemo_flg

				;; Stack
				lw      $ra, 0x48($sp)
				lw      $s7, 0x44($sp)
				lw      $s6, 0x40($sp)
				lw      $s5, 0x3C($sp)
				lw      $s4, 0x38($sp)
				lw      $s3, 0x34($sp)
				lw      $s2, 0x30($sp)
				lw      $s1, 0x2C($sp)
				lw      $s0, 0x28($sp)
				jr      $ra
				addiu   $sp, 0x50

@iCursor:		.byte	0x00
@NameStr:		.ascii	"%s",0x00
				.align
