

				;; Stack
				addiu	$sp, -0x28
				sw		$s0, 0x28+-0x10($sp)
				sw		$s1, 0x28+-0x0C($sp)
				sw		$s2, 0x28+-0x08($sp)
				sw		$ra, 0x28+-0x04($sp)

				;; Pad Buffer
				sh		$0, G_Padd1
				sh		$0, G_Padd1Trg
				lui     $v0, 0xFFFF
				sw      $v0, G_PaddData
				sw      $v0, G_PaddData+0x24

				;; Script ID
				sw		$0, @iAmount

				;; Get Script Amount
				lw      $v0, G_pRoom
				nop
				lw      $a1, 0x4C($v0)
				nop
				lhu     $v0, 0($a1)
				li		$v1, 2
				divu	$v0, $v1
				mflo	$v0
				li		$v1, 1
				subu	$v0, $v1
				sw		$v0, @iAmount
				beqz	$v0, @Error
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
				lbu		$a1, DBG_LAST_EVENT
				lw		$a2, @iAmount
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

@Next:			lbu		$v0, DBG_LAST_EVENT
				lw		$v1, @iAmount
				nop
				beq		$v0, $v1, @Next01
				addiu	$v0, 1
				sb		$v0, DBG_LAST_EVENT
				j		@Print
				nop
				@Next01:
				sb		$0, DBG_LAST_EVENT
				j		@Print
				nop

@Prev:			lbu		$v0, DBG_LAST_EVENT
				nop
				beqz	$v0, @Prev01
				addiu	$v0, -1
				sb		$v0, DBG_LAST_EVENT
				j		@Print
				nop
				@Prev01:
				lw		$v0, @iAmount
				sb		$v0, DBG_LAST_EVENT
				j		@Print
				nop

@Initiate:		lbu		$a1, DBG_LAST_EVENT
				jal     Event_exec
				li		$a0, 1
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

				;; Loop
				jal     Task_sleep
				li      $a0, 1
				j		@Error
				nop

@Terminate:		lw		$ra, 0x28+-0x04($sp)
				lw		$s2, 0x28+-0x08($sp)
				lw		$s1, 0x28+-0x0C($sp)
				lw		$s0, 0x28+-0x10($sp)
				jr		$ra
				addiu	$sp, 0x28

@iAmount:		.word	0x00000000
				.align
@CursorStr:		.ascii	"%d/%d",0x00
				.align
@PrevStr:		.ascii	"< Prev SCD",0x00
				.align
@NextStr:		.ascii	"> Next SCD",0x00
				.align
@ExecStr:		.ascii	ASCII_CONFIRM," Init SCD",0x00
				.align
@ExitStr:		.ascii	ASCII_CANCEL," Exit",0x00
				.align
@ErrorStr:		.ascii	"No Script Data!",0x00
				.align
