

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

				;; Function Buffer
				sh		$0, @iAmount

				;; Get Message Amount
				lw      $v0, G_pRoom
				nop
				lw      $a1, 0x40($v0)
				nop
				lhu     $v0, 0($a1)
				li		$v1, 2
				divu	$v0, $v1
				mflo	$v0
				li		$v1, 1
				subu	$v0, $v1
				sh		$v0, @iAmount
				beqz	$v0, @Error
				nop
				li		$v1, 0xFFFF
				beq		$v0, $v1, @Error
				nop

@Main:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_DEBUG
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @Initiate
				li		$v0, PAD_RIGHT
				beq		$v0, $v1, @Next
				li		$v0, PAD_LEFT
				beq		$v0, $v1, @Prev
				nop

@Print:			la		$a0, @CursorStr
				lbu		$a1, DBG_LAST_MESSAGE
				lhu		$a2, @iAmount
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				sw		$a2, 0x28+-0x10($sp)
				li		$a0, 0x08
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @PrevStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x20
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @NextStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x28
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @ExecStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x30
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @ExitStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x38
				move    $a2, $0
				jal		Print8
				move    $a3, $0

				;; Loop
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@Next:			lbu		$v0, DBG_LAST_MESSAGE
				lhu		$v1, @iAmount
				nop
				beq		$v0, $v1, @Next01
				addiu	$v0, 1
				sb		$v0, DBG_LAST_MESSAGE
				j		@Print
				nop
				@Next01:
				sb		$0, DBG_LAST_MESSAGE
				j		@Print
				nop

@Prev:			lbu		$v0, DBG_LAST_MESSAGE
				nop
				beqz	$v0, @Prev01
				addiu	$v0, -1
				sb		$v0, DBG_LAST_MESSAGE
				j		@Print
				nop
				@Prev01:
				lhu		$v0, @iAmount
				sb		$v0, DBG_LAST_MESSAGE
				j		@Print
				nop

@Initiate:		move	$a0, $0				;; Pos_xy
				li		$a1, 0x300			;; Attr
				lbu		$a2, DBG_LAST_MESSAGE		;; Mess_no
				jal		Mess_set
				lui		$a3, 0xFFFF			;; Stop_data
				j		@Terminate
				nop

@Error:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_DEBUG
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @Terminate
				nop
				la		$a0, @ErrorStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @ExitStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x38
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				
				jal     Task_sleep
				li      $a0, 1
				j		@Error
				nop

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

@iAmount:		.dh		0x0000
				.align
@CursorStr:		.ascii	"%d/%d",0x00
				.align
@PrevStr:		.ascii	"< Prev MSG",0x00
				.align
@NextStr:		.ascii	"> Next MSG",0x00
				.align
@ExecStr:		.ascii	ASCII_CONFIRM," Show MSG",0x00
				.align
@ExitStr:		.ascii	ASCII_CANCEL," Exit",0x00
				.align
@ErrorStr:		.ascii	"No Message Data!",0x00
				.align
