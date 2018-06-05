

				;; Stack
				addiu	$sp, -0x28
				sw		$s0, 0x28+-0x10($sp)
				sw		$s1, 0x28+-0x0C($sp)
				sw		$s2, 0x28+-0x08($sp)
				sw		$ra, 0x28+-0x04($sp)

				;; Pad Buffer
				sh		$0,  G_Padd1
				sh		$0,  G_Padd1Trg
				lui     $v0, 0xFFFF
				sw      $v0, G_PaddData
				sw      $v0, G_PaddData+0x24

				;; Function Buffer
				sb		$0,  @iMain
				sb		$0,  @iSub
				sb		$0,  @iCursor
				
				;; Current Room BGM
				lhu		$v0, G_Room_no
				li		$v1, 2
				multu	$v0, $v1
				mflo	$s2
				li		$v0, pBgmTable
				addu	$s2, $v0
				sw		$s2, pBgmCtr
				lbu		$v0, 0($s2)
				lbu		$v1, 1($s2)
				sb		$v0, @iMain
				sb		$v1, @iSub

@Main:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_UP
				beq		$v0, $v1, @PadUp
				li		$v0, PAD_DOWN
				beq		$v0, $v1, @PadDown
				li		$v0, PAD_LEFT
				beq		$v0, $v1, @PadLeft
				li		$v0, PAD_RIGHT
				beq		$v0, $v1, @PadRight
				li		$v0, PAD_BGM_NULL
				beq		$v0, $v1, @Nullify
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @PadConfirm
				nop

@Body:			;; MAIN BGM
				la		$a0, @MainStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x80
				li		$a1, 0xA0
				lbu		$v0, @iCursor
				li		$v1, 0x00
				beq		$v0, $v1, @PrintMain
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintMain:
				jal		Print8
				move    $a3, $0
				lbu		$a0, @iMain
				li		$a1, 0x80032C60
				jal		Doitox
				nop
				la		$a0, 0x80032C62
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0xB8
				li		$a1, 0xA0
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				
				;; SUB BGM
				la		$a0, @SubStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x84
				li		$a1, 0xA8
				lbu		$v0, @iCursor
				li		$v1, 0x01
				beq		$v0, $v1, @PrintSub
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintSub:
				jal		Print8
				move    $a3, $0
				lbu		$a0, @iSub
				li		$a1, 0x80032C60
				jal		Doitox
				nop
				la		$a0, 0x80032C62
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0xB8
				li		$a1, 0xA8
				move    $a2, $0
				jal		Print8
				move    $a3, $0

				;; Help Display
				la		$a0, @PlayStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x80
				li		$a1, 0xB8
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @NullStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x80
				li		$a1, 0xC0
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @ExitStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x80
				li		$a1, 0xC8
				move    $a2, $0
				jal		Print8
				move    $a3, $0

				;; Main Loop
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@Nullify:		lbu		$v0, @iCursor
				li		$v1, 0xFF
				beqz	$v0, @NullifyMain
				nop
				@NullifySub:
				sb		$v1, @iSub
				j		@Body
				nop
				@NullifyMain:
				sb		$v1, @iMain
				j		@Body
				nop

@BgmPrev:		lbu		$v0, @iCursor
				nop
				beqz	$v0, @SetMainPrev
				nop

				@SetSubPrev:
				lbu		$v0, @iSub
				nop
				beqz	$v0, @SubPrev
				addiu	$v0, -1
				sb		$v0, @iSub
				j		@Body
				nop
				@SubPrev:
				li		$v0, 0x3F
				sb		$v0, @iSub
				j		@Body
				nop

				@SetMainPrev:
				lbu		$v0, @iMain
				nop
				beqz	$v0, @MainPrev
				addiu	$v0, -1
				sb		$v0, @iMain
				j		@Body
				nop
				@MainPrev:
				li		$v0, 0x3F
				sb		$v0, @iMain
				j		@Body
				nop

@BgmNext:		lbu		$v0, @iCursor
				nop
				beqz	$v0, @SetMainNext
				li		$v0, 0x3F

				@SetSubNext:
				lbu		$v1, @iSub
				nop
				beq		$v0, $v1, @SubNext
				addiu	$v1, 1
				sb		$v1, @iSub
				j		@Body
				nop
				@SubNext:
				sb		$0, @iSub
				j		@Body
				nop

				@SetMainNext:
				lbu		$v1, @iMain
				nop
				beq		$v0, $v1, @MainNext
				addiu	$v1, 1
				sb		$v1, @iMain
				j		@Body
				nop
				@MainNext:
				sb		$0, @iMain
				j		@Body
				nop

@PlayBgm:		lbu		$v0, @iMain
				lbu		$v1, @iSub
				sb		$v0, 0($s2)
				sb		$v1, 1($s2)
				jal		Snd_bgm_ck
				nop
				jal     Snd_bgm_set
				nop
				jal     Snd_bgm_play_ck
				nop
				j		@Body
				nop

@PadUp:			lbu		$v0, @iCursor
				li		$v1, 0x00
				beq		$v0, $v1, @PadUp01
				nop
				li		$v0, 0x00
				sb		$v0, @iCursor
				j		@Body
				nop
				@PadUp01:
				li		$v0, 0x01
				sb		$v0, @iCursor
				j		@Body
				nop
@PadDown:		lbu		$v0, @iCursor
				li		$v1, 0x01
				beq		$v0, $v1, @PadDown01
				nop
				li		$v0, 0x01
				sb		$v0, @iCursor
				j		@Body
				nop
				@PadDown01:
				li		$v0, 0x00
				sb		$v0, @iCursor
				j		@Body
				nop
@PadLeft:		lbu		$v0, @iCursor
				li		$v1, 0
				beq		$v0, $v1, @BgmPrev
				li		$v1, 1
				beq		$v0, $v1, @BgmPrev
				nop
				j		@Body
				nop
@PadRight:		lbu		$v0, @iCursor
				li		$v1, 0
				beq		$v0, $v1, @BgmNext
				li		$v1, 1
				beq		$v0, $v1, @BgmNext
				nop
				j		@Body
				nop
@PadConfirm:	lbu		$v0, @iCursor
				li		$v1, 0
				beq		$v0, $v1, @PlayBgm
				li		$v1, 1
				beq		$v0, $v1, @PlayBgm
				nop
				j		@Body
				nop

@Terminate:		lw		$ra, 0x28+-0x04($sp)
				lw		$s2, 0x28+-0x08($sp)
				lw		$s1, 0x28+-0x0C($sp)
				lw		$s0, 0x28+-0x10($sp)
				jr		$ra
				addiu	$sp, 0x28
				
@iMain:			.byte	0x00
@iSub:			.byte	0x00
@iCursor:		.byte	0x00
@BgmString:		.ascii	"%d",0x00
				.align
@MainStr:		.ascii	"Main",0x00
				.align
@SubStr:		.ascii	"Sub",0x00
				.align
@PlayStr:		.ascii	ASCII_CONFIRM," Play",0x00
				.align
@NullStr:		.ascii	ASCII_CIRCLE," Nullify",0x00
				.align
@ExitStr:		.ascii	ASCII_CANCEL," Exit",0x00
				.align
