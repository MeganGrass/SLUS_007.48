
					;; Stack
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

					;; Pad Buffer
					sh		$0, G_Padd1
					sh		$0, G_Padd1Trg
					lui     $v0, 0xFFFF
					sw      $v0, G_PaddData
					sw      $v0, G_PaddData+0x24
				
					sb		$0, @iCursor
					li		$v0, 8
					sb		$v0, @CursorPos

@Main:				lhu		$v1, G_Padd1Trg
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

@Print:				;; CURSOR
					la		$a0, @CursorStr
					sw		$a0, 0x28+-0x18($sp)
					li		$a0, 0x08
					lbu		$a1, @CursorPos
					move    $a2, $0
					jal		Print8
					move    $a3, $0

					;; RDT ID
					la		$a0, @RdtIdStr
					sw		$a0, 0x28+-0x18($sp)
					li		$a0, 0x18
					li		$a1, 0x08
					li		$a2, PRINT_GREY
					lbu		$v0, DBG_PRINT_RDT
					nop
					beqz	$v0, @PrintRdtId
					nop
					li		$a2, PRINT_GREEN
					@PrintRdtId:
					jal		Print8
					move    $a3, $0

					;; PLAYER POSITION
					la		$a0, @PlPositionStr
					sw		$a0, 0x28+-0x18($sp)
					li		$a0, 0x18
					li		$a1, 0x10
					li		$a2, PRINT_GREY
					lbu		$v0, DBG_PRINT_PLPOS
					nop
					beqz	$v0, @PrintPlPos
					nop
					li		$a2, PRINT_GREEN
					@PrintPlPos:
					jal		Print8
					move    $a3, $0

					;; PLAYER ROTATION
					la		$a0, @PlRotationStr
					sw		$a0, 0x28+-0x18($sp)
					li		$a0, 0x18
					li		$a1, 0x18
					li		$a2, PRINT_GREY
					lbu		$v0, DBG_PRINT_PLROT
					nop
					beqz	$v0, @PrintPlRot
					nop
					li		$a2, PRINT_GREEN
					@PrintPlRot:
					jal		Print8
					move    $a3, $0

					@Loop:
					jal     Task_sleep
					li      $a0, 1
					j		@Main
					nop

@CursorUp:			lbu		$v0, @CursorPos
					li		$v1, 0x08
					beq		$v0, $v1, @CursorUp01
					addiu	$v0, -0x08
					sb		$v0, @CursorPos
					lbu		$v0, @iCursor
					nop
					addiu	$v0, -1
					sb		$v0, @iCursor
					j		@Print
					nop
					@CursorUp01:
					li		$v0, 2
					sb		$v0, @iCursor
					li		$v0, 0x18
					sb		$v0, @CursorPos
					j		@Print
					nop
@CursorDown:		lbu		$v0, @CursorPos
					li		$v1, 0x18
					beq		$v0, $v1, @CursorDown01
					addiu	$v0, 0x08
					sb		$v0, @CursorPos
					lbu		$v0, @iCursor
					nop
					addiu	$v0, 1
					sb		$v0, @iCursor
					j		@Print
					nop
					@CursorDown01:
					li		$v0, 0
					sb		$v0, @iCursor
					li		$v0, 0x08
					sb		$v0, @CursorPos
					j		@Print
					nop

@MenuSelect:		lbu		$v1, @iCursor
					li		$v0, 0x00
					beq		$v0, $v1, @RdtId
					li		$v0, 0x01
					beq		$v0, $v1, @PlPosition
					li		$v0, 0x02
					beq		$v0, $v1, @PlRotaton
					nop
					j		@Print
					nop

@RdtId:				lbu		$v0, DBG_PRINT_RDT
					li		$v1, 1
					beq		$v0, $v1, @ZeroVariableRdtId
					nop
					sb		$v1, DBG_PRINT_RDT
					j		@RdtIdComplete
					nop
					@ZeroVariableRdtId:
					sb		$0,  DBG_PRINT_RDT
					@RdtIdComplete:
					la		$a1, @VariableStr		;; String
					lbu		$v0, DBG_PRINT_RDT		;; Numerical
					li		$v1, 4
					multu	$v1, $v0
					mflo	$v1
					addu	$v0, $v1, $a1
					lw		$v0, 0($v0)
					nop
					sw		$v0, @RdtIdVar
					j		@Print
					nop

@PlPosition:		lbu		$v0, DBG_PRINT_PLPOS
					li		$v1, 1
					beq		$v0, $v1, @ZeroVariablePlPos
					nop
					sb		$v1, DBG_PRINT_PLPOS
					j		@PlPosComplete
					nop
					@ZeroVariablePlPos:
					sb		$0,  DBG_PRINT_PLPOS
					@PlPosComplete:
					la		$a1, @VariableStr		;; String
					lbu		$v0, DBG_PRINT_PLPOS		;; Numerical
					li		$v1, 4
					multu	$v1, $v0
					mflo	$v1
					addu	$v0, $v1, $a1
					lw		$v0, 0($v0)
					nop
					sw		$v0, @PlPositionVar
					j		@Print
					nop

@PlRotaton:			lbu		$v0, DBG_PRINT_PLROT
					li		$v1, 1
					beq		$v0, $v1, @ZeroVariablePlRot
					nop
					sb		$v1, DBG_PRINT_PLROT
					j		@PlRotComplete
					nop
					@ZeroVariablePlRot:
					sb		$0,  DBG_PRINT_PLROT
					@PlRotComplete:
					la		$a1, @VariableStr		;; String
					lbu		$v0, DBG_PRINT_PLROT		;; Numerical
					li		$v1, 4
					multu	$v1, $v0
					mflo	$v1
					addu	$v0, $v1, $a1
					lw		$v0, 0($v0)
					nop
					sw		$v0, @PlRotationVar
					j		@Print
					nop

@Terminate:			lw      $ra, 0x50+-0x08($sp)
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
@CursorPos:			.byte	0x08
					.align
@CursorStr:			.ascii	">",0x00
					.align
@NoStr:				.ascii	"NO",0x00
					.align
@YesStr:			.ascii	"YES",0x00
					.align
@VariableStr:		.word	@NoStr,@YesStr
@RdtIdVar:			.word	@VariableStr
@PlPositionVar:		.word	@VariableStr
@PlRotationVar:		.word	@VariableStr
@RdtIdStr:			.ascii	"RDT ID",0x00
					.align
@PlPositionStr:		.ascii	"PL Pos",0x00
					.align
@PlRotationStr:		.ascii	"PL Rot",0x00
					.align
