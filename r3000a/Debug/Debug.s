

;; VOID DebugMenu(VOID)
					addiu   $sp, -0x50
					sw      $ra, 0x50+-0x08($sp)
					sw      $s7, 0x50+-0x0C($sp)
					sw      $s6, 0x50+-0x10($sp)
					sw      $s5, 0x50+-0x14($sp)
					sw      $s4, 0x50+-0x18($sp)
					sw      $s3, 0x50+-0x1C($sp)
					sw      $s2, 0x50+-0x20($sp)
					sw      $s1, 0x50+-0x24($sp)
					sw      $s0, 0x50+-0x28($sp)
.if DebugRelease
					;; Pad Buffer
					sh		$0, G_Padd1
					sh		$0, G_Padd1Trg
					lui     $v0, 0xFFFF
					sw      $v0, G_PaddData
					sw      $v0, G_PaddData+0x24

@GetPadInput:		lhu		$v1, G_Padd1Trg
					li		$v0, PAD_DEBUG
					beq		$v0, $v1, @Terminate
					li		$v0, PAD_CANCEL
					beq		$v0, $v1, @Terminate
					li		$v0, PAD_CONFIRM
					beq		$v0, $v1, @MenuSelect
					li		$v0, PAD_UP
					beq		$v0, $v1, @CursorUp
					li		$v0, PAD_DOWN
					beq		$v0, $v1, @CursorDown
					nop

@DebugMain:			;; Print Cursor
					la		$a0, @CursorStr
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x08
					lbu		$a1, @CursorPos
					move    $a2, $0
					jal		Print8
					li      $a3, 2

					;; Print Menu
					la		$a0, @String00
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x08
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String01
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x10
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String02
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x18
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String03
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x20
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String04
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x28
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String05
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x30
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String06
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x38
					move    $a2, $0
					jal		Print8
					li      $a3, 2
					la		$a0, @String07
					sw		$a0, 0x50+-0x40($sp)
					li		$a0, 0x18
					li		$a1, 0x40
					move    $a2, $0
					jal		Print8
					li      $a3, 2

					;; Print Time
					jal		@PrintTime
					nop

					;; Retry
					jal     Task_sleep
					li      $a0, 1
					j		@GetPadInput
					nop

@CursorUp:			lbu		$v0, @CursorPos
					li		$v1, 0x08
					beq		$v0, $v1, @CursorUp01
					addiu	$v0, -0x08
					sb		$v0, @CursorPos
					lbu		$v0, @iCursor
					nop
					addiu	$v0, -0x01
					sb		$v0, @iCursor
					j		@DebugMain
					nop
					@CursorUp01:
					li		$v0, 0x07
					sb		$v0, @iCursor
					li		$v0, 0x40
					sb		$v0, @CursorPos
					j		@DebugMain
					nop
@CursorDown:		lbu		$v0, @CursorPos
					li		$v1, 0x40
					beq		$v0, $v1, @CursorDown01
					addiu	$v0, 0x08
					sb		$v0, @CursorPos
					lbu		$v0, @iCursor
					nop
					addiu	$v0, 0x01
					sb		$v0, @iCursor
					j		@DebugMain
					nop
					@CursorDown01:
					li		$v0, 0x00
					sb		$v0, @iCursor
					li		$v0, 0x08
					sb		$v0, @CursorPos
					j		@DebugMain
					nop
@MenuSelect:		lbu		$v1, @iCursor
					li		$v0, 0x00
					beq		$v0, $v1, @AreaJump
					li		$v0, 0x01
					beq		$v0, $v1, @GameVersion
					li		$v0, 0x02
					beq		$v0, $v1, @DebugOption
					li		$v0, 0x03
					beq		$v0, $v1, @FlagEdit
					li		$v0, 0x04
					beq		$v0, $v1, @EventTest
					li		$v0, 0x05
					beq		$v0, $v1, @MessageTest
					li		$v0, 0x06
					beq		$v0, $v1, @SoundTest
					li		$v0, 0x07
					beq		$v0, $v1, @StatDisplay
					nop
					j		@DebugMain
					nop
@AreaJump:			li		$v0, TRUE
					sb		$v0, DBG_AREA_JUMP
					j		@Complete
					nop
@GameVersion:		jal		@InitGameVersion
					nop
					j		@Terminate
					nop
@DebugOption:		jal		@InitOption
					nop
					j		@DebugMain
					nop
@FlagEdit:			jal		@InitFlagEdit
					nop
					j		@DebugMain
					nop
@EventTest:			jal		@InitEventTest
					nop
					j		@Terminate
					nop
@MessageTest:		jal		@InitMessageTest
					nop
					j		@Terminate
					nop
@SoundTest:			jal		@InitSoundTest
					nop
					j		@DebugMain
					nop
@StatDisplay:		jal		@InitStatDisplay
					nop
					j		@DebugMain
					nop

@Terminate:
@Complete:
					lw      $ra, 0x50+-0x08($sp)
					lw      $s7, 0x50+-0x0C($sp)
					lw      $s6, 0x50+-0x10($sp)
					lw      $s5, 0x50+-0x14($sp)
					lw      $s4, 0x50+-0x18($sp)
					lw      $s3, 0x50+-0x1C($sp)
					lw      $s2, 0x50+-0x20($sp)
					lw      $s1, 0x50+-0x24($sp)
					lw      $s0, 0x50+-0x28($sp)
					jr      $ra
					addiu   $sp, 0x50

@iCursor:			.byte	0x00
					.align
@CursorPos:			.byte	0x08
					.align
@CursorStr:			.ascii	">",0x00
					.align
@String00:			.ascii	"Area Jump",0x00
					.align
@String01:			.ascii	"System Reset",0x00
					.align
@String02:			.ascii	"Debug Option",0x00
					.align
@String03:			.ascii	"Flag Test",0x00
					.align
@String04:			.ascii	"Event Test",0x00
					.align
@String05:			.ascii	"Message Test",0x00
					.align
@String06:			.ascii	"Sound Test",0x00
					.align
@String07:			.ascii	"Debug Display",0x00
					.align
@InitGameVersion:	.include ".\\r3000a\\Debug\\GameVersion.s"
@InitOption:		.include ".\\r3000a\\Debug\\Option.s"
@InitFlagEdit:		.include ".\\r3000a\\Debug\\FlagEdit.s"
@InitEventTest:		.include ".\\r3000a\\Debug\\EventTest.s"
@InitMessageTest:	.include ".\\r3000a\\Debug\\MessageTest.s"
@InitSoundTest:		.include ".\\r3000a\\Debug\\SoundTest.s"
@InitStatDisplay:	.include ".\\r3000a\\Debug\\StatDisplay.s"
@PrintTime:			.include ".\\r3000a\\Debug\\PrintTime.s"

.else
					lw      $ra, 0x50+-0x08($sp)
					lw      $s7, 0x50+-0x0C($sp)
					lw      $s6, 0x50+-0x10($sp)
					lw      $s5, 0x50+-0x14($sp)
					lw      $s4, 0x50+-0x18($sp)
					lw      $s3, 0x50+-0x1C($sp)
					lw      $s2, 0x50+-0x20($sp)
					lw      $s1, 0x50+-0x24($sp)
					lw      $s0, 0x50+-0x28($sp)
					addiu   $sp, 0x50
					jr      $ra
					nop
.endif
