
iNewGame:			equ 0
NewGameStrX:		equ 0x80
NewGameStrY:		equ 0xA0
iDebugOption:		equ 1
DebugOptionStrX:	equ 0x70
DebugOptionStrY:	equ 0xA8
iDebugDisplay:		equ 2
DebugDisplayStrX:	equ 0x6C
DebugDisplayStrY:	equ 0xB0
iSoundTest:			equ 3
SoundTestStrX:		equ 0x78
SoundTestStrY:		equ 0xB8
iCopyright:			equ 4
CopyrightStrX:		equ 0x7C
CopyrightStrY:		equ 0xC0

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
				li      $a0, 0x0D
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

@Print:			;; New Game
				la		$a0, NewGameStr
				li		$a1, NewGameStrX
				li		$a2, NewGameStrY
				lbu		$v0, @iCursor
				li		$v1, iNewGame
				beq		$v0, $v1, @PrintNewGame
				li		$a3, PRINT_GREEN
				li		$a3, PRINT_GREY
				@PrintNewGame:
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
				li		$a1, 0xC4
				li		$a2, 0x78
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
				li		$a2, 0x04
				j		@Print
				nop
@CursorDown:	lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				li		$a0, @iCursor
				li		$a1, 0x00
				jal		BOOT_CursorDown
				li		$a2, 0x04
				j		@Print
				nop

@Initiate:		lui     $a0, 0x406
				jal     Snd_se_stad
				move    $a1, $0
				lbu		$v0, @iCursor
				nop
				li		$v1, 0x00
				beq		$v0, $v1, @NewGame
				li		$v1, 0x01
				beq		$v0, $v1, @DebugOption
				li		$v1, 0x02
				beq		$v0, $v1, @DebugDisplay
				li		$v1, 0x03
				beq		$v0, $v1, @SoundTest
				li		$v1, 0x04
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

				;; Title Screen
				move    $a0, $0
				jal     Bg_set_mode
				move    $a1, $0
				li      $a0, 0x0D
				la      $a1, 0x80198000
				la      $a3, 0x80010A14
				jal     Cd_read
				move    $a2, $0

				jal		BOOT_FadeIn
				nop
				j		@Print
				nop

@NewGame:		jal		BOOT_NewGame
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
				li		$a0, ZERO_OVERLAY
				li		$a1, 0x801BFA18
				la		$a3, 0x800110C8
				jal		Cd_read
				move	$a2, $0
				jal		0x801BFA18
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
