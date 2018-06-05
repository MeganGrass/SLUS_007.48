
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

@Main:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_DEBUG
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @Initiate
				li		$v0, PAD_UP
				beq		$v0, $v1, @CursorUp
				li		$v0, PAD_DOWN
				beq		$v0, $v1, @CursorDown
				nop

@Print:			;; Print Cursor
				la		$a0, @CursorStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				lbu		$a1, @CursorPos
				move    $a2, $0
				jal		Print8
				li      $a3, 2

				;; Option
				la		$a0, @GameChangeStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x18
				li		$a1, 0x08
				li		$a2, PRINT_GREY
				jal		Print8
				li      $a3, 2
				la		$a0, @NoStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x18
				li		$a1, 0x10
				li		$a2, PRINT_GREY
				jal		Print8
				li      $a3, 2
				la		$a0, @YesStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x18
				li		$a1, 0x18
				li		$a2, PRINT_GREY
				jal		Print8
				li      $a3, 2

				@Loop:
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@CursorUp:		lbu		$v0, @CursorPos
				li		$v1, 0x10
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
@CursorDown:	lbu		$v0, @CursorPos
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
				li		$v0, 0x10
				sb		$v0, @CursorPos
				j		@Print
				nop

@Initiate:		lbu		$v0, @iCursor
				nop
				beqz	$v0, @Terminate
				nop
				lw		$v0, G_System_flg
				nop
				ori		$v0, 0x2000
				sw		$v0, G_System_flg
				nop
				lw		$v0, G_System_flg
				nop
				andi	$v0, 0x2000
				sw		$v0, G_System_flg
@Terminate:		lw      $ra, 0x50+-0x08($sp)
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

@iCursor:		.byte	0x00
@CursorPos:		.byte	0x10
				.align
@CursorStr:		.ascii	">",0x00
				.align
@GameChangeStr:	.ascii	"System Reset?",0x00
				.align
@NoStr:			.ascii	"No",0x00
				.align
@YesStr:		.ascii	"Yes",0x00
				.align
