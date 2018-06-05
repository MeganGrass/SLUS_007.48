
				;; Stack
				addiu	$sp, -0x50
				sw		$ra, 0x50+-0x04($sp)
				sw		$s0, 0x50+-0x08($sp)
				sw		$s1, 0x50+-0x0C($sp)
				sw		$s2, 0x50+-0x10($sp)
				sw		$s3, 0x50+-0x14($sp)
				sw		$s4, 0x50+-0x18($sp)
				sw		$s5, 0x50+-0x1C($sp)
				sw		$s6, 0x50+-0x20($sp)
				sw		$s7, 0x50+-0x24($sp)

@PadReset:		sh		$0, G_Padd1
				sh		$0, G_Padd1Trg
				lui     $v0, 0xFFFF
				sw      $v0, G_PaddData
				sw      $v0, G_PaddData+0x24

				li		$v0, 31
				sb		$v0, @iCounter
				sb		$0, @iCounterTwo

@GetBitfield:	lb		$v0, @iCounter
				nop
				li		$v1, -1
				beq		$v0, $v1, @Main
				nop

				;; AND
				la		$a0, @iBitFlags
				lbu		$a1, @iCounterTwo
				nop
				addu	$a0, $a1
				lw		$a1, 0($a0)
				lw		$v0, @PtrFlg
				lw		$v1, @iCntFlgStr
				nop
				addu	$v0, $v1
				lw		$v0, 0($v0)
				nop
				lw		$v0, 0($v0)
				nop
				and		$v0, $a1
				beqz	$v0, @BitOff
				nop

				;; BITS
				la		$v0, @iBit0
				lbu		$v1, @iCounter
				nop
				addu	$v0, $v1
				li		$v1, 1
				sb		$v1, 0($v0)
				j		@BitPlus
				nop

				@BitOff:
				la		$v0, @iBit0
				lbu		$v1, @iCounter
				nop
				addu	$v0, $v1
				li		$v1, 0
				sb		$v1, 0($v0)
				j		@BitPlus
				nop

				@BitPlus:
				lbu		$v0, @iCounter
				nop
				addiu	$v0, -1
				sb		$v0, @iCounter
				lbu		$v0, @iCounterTwo
				nop
				addiu	$v0, 4
				sb		$v0, @iCounterTwo
				j		@GetBitfield
				nop

@Main:			la		$v0, @iBit0
				lbu		$v1, @iBitSelection
				nop
				addu	$v0, $v1
				nop
				lbu		$v0, 0($v0)
				nop
				sb		$v0, @iBitBuffer

				lhu		$v1, G_Padd1Trg
				li		$v0, PAD_DEBUG
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @Initiate
				li		$v0, PAD_RIGHT
				beq		$v0, $v1, @NextBit
				li		$v0, PAD_LEFT
				beq		$v0, $v1, @PrevBit
				li		$v0, PAD_UP
				beq		$v0, $v1, @PadUp
				li		$v0, PAD_DOWN
				beq		$v0, $v1, @PadDown
				li		$v0, PAD_R1
				beq		$v0, $v1, @NextFlag
				li		$v0, PAD_L1
				beq		$v0, $v1, @PrevFlag
				nop

@Print:			;; Selected Bit
				la		$a0, @BitSelStr
				lbu		$s0, @iBitBuffer
				sw		$a0, 0x50+-0x40($sp)
				sw		$s0, 0x50+-0x3C($sp)
				lbu		$a0, @iBitSelX
				lbu		$a1, @iBitSelY
				li		$a2, 0x01
				jal		Print8
				move    $a3, $0
				
				;; Bitfield
				la		$a0, @CursorStr
				lbu		$s0, @iBit0
				lbu		$s1, @iBit0+1
				lbu		$s2, @iBit0+2
				lbu		$s3, @iBit0+3
				lbu		$s4, @iBit0+4
				lbu		$s5, @iBit0+5
				lbu		$s6, @iBit0+6
				lbu		$s7, @iBit0+7
				sw		$a0, 0x50+-0x40($sp)
				sw		$s0, 0x50+-0x3C($sp)
				sw		$s1, 0x50+-0x38($sp)
				sw		$s2, 0x50+-0x34($sp)
				sw		$s3, 0x50+-0x30($sp)
				sw		$s4, 0x50+-0x2C($sp)
				sw		$s5, 0x50+-0x28($sp)
				sw		$s6, 0x50+-0x24($sp)
				sw		$s7, 0x50+-0x20($sp)
				li		$a0, 0x62
				li		$a1, 0x10
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @CursorStr
				lbu		$s0, @iBit1
				lbu		$s1, @iBit1+1
				lbu		$s2, @iBit1+2
				lbu		$s3, @iBit1+3
				lbu		$s4, @iBit1+4
				lbu		$s5, @iBit1+5
				lbu		$s6, @iBit1+6
				lbu		$s7, @iBit1+7
				sw		$a0, 0x50+-0x40($sp)
				sw		$s0, 0x50+-0x3C($sp)
				sw		$s1, 0x50+-0x38($sp)
				sw		$s2, 0x50+-0x34($sp)
				sw		$s3, 0x50+-0x30($sp)
				sw		$s4, 0x50+-0x2C($sp)
				sw		$s5, 0x50+-0x28($sp)
				sw		$s6, 0x50+-0x24($sp)
				sw		$s7, 0x50+-0x20($sp)
				li		$a0, 0xA2
				li		$a1, 0x10
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @CursorStr
				lbu		$s0, @iBit2
				lbu		$s1, @iBit2+1
				lbu		$s2, @iBit2+2
				lbu		$s3, @iBit2+3
				lbu		$s4, @iBit2+4
				lbu		$s5, @iBit2+5
				lbu		$s6, @iBit2+6
				lbu		$s7, @iBit2+7
				sw		$a0, 0x50+-0x40($sp)
				sw		$s0, 0x50+-0x3C($sp)
				sw		$s1, 0x50+-0x38($sp)
				sw		$s2, 0x50+-0x34($sp)
				sw		$s3, 0x50+-0x30($sp)
				sw		$s4, 0x50+-0x2C($sp)
				sw		$s5, 0x50+-0x28($sp)
				sw		$s6, 0x50+-0x24($sp)
				sw		$s7, 0x50+-0x20($sp)
				li		$a0, 0x62
				li		$a1, 0x18
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				la		$a0, @CursorStr
				lbu		$s0, @iBit3
				lbu		$s1, @iBit3+1
				lbu		$s2, @iBit3+2
				lbu		$s3, @iBit3+3
				lbu		$s4, @iBit3+4
				lbu		$s5, @iBit3+5
				lbu		$s6, @iBit3+6
				lbu		$s7, @iBit3+7
				sw		$a0, 0x50+-0x40($sp)
				sw		$s0, 0x50+-0x3C($sp)
				sw		$s1, 0x50+-0x38($sp)
				sw		$s2, 0x50+-0x34($sp)
				sw		$s3, 0x50+-0x30($sp)
				sw		$s4, 0x50+-0x2C($sp)
				sw		$s5, 0x50+-0x28($sp)
				sw		$s6, 0x50+-0x24($sp)
				sw		$s7, 0x50+-0x20($sp)
				li		$a0, 0xA2
				li		$a1, 0x18
				move    $a2, $0
				jal		Print8
				move    $a3, $0

				;; Flag Name
				lw		$a0, @PtrStr
				lw		$a1, @iCntFlgStr
				nop
				addu	$a0, $a1
				nop
				lw		$a0, 0($a0)
				nop
				sw		$a0, 0x50+-0x40($sp)
				li		$a0, 0x62
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0

				;; Loop
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@NextBit:		lbu		$v0, @iBitSelection
				nop
				li		$v1, 31
				beq		$v0, $v1, @NextBit00
				addiu	$v0, 1
				sb		$v0, @iBitSelection
				j		@NextBitXY
				nop
				@NextBit00:
				li		$v0, 0
				sb		$v0, @iBitSelection
				j		@NextBitXY
				nop
				@NextBitXY:
				lbu		$v0, @iBitSelX
				nop
				li		$v1, 0xDA
				beq		$v0, $v1, @NextBitXY00
				addiu	$v0, 0x08
				sb		$v0, @iBitSelX
				j		@SetBitBuffer
				nop
				@NextBitXY00:
				lbu		$v0, @iBitSelY
				nop
				li		$v1, 0x10
				beq		$v0, $v1, @NextBitXY01
				li		$v0, 0x62
				sb		$v0, @iBitSelX
				li		$v0, 0x10
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop
				@NextBitXY01:
				li		$v0, 0x62
				sb		$v0, @iBitSelX
				li		$v0, 0x18
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop

@PrevBit:		lbu		$v0, @iBitSelection
				nop
				li		$v1, 0
				beq		$v0, $v1, @PrevBit00
				addiu	$v0, -1
				sb		$v0, @iBitSelection
				j		@PrevBitXY
				nop
				@PrevBit00:
				li		$v0, 31
				sb		$v0, @iBitSelection
				j		@PrevBitXY
				nop
				@PrevBitXY:
				lbu		$v0, @iBitSelX
				nop
				li		$v1, 0x62
				beq		$v0, $v1, @PrevBitXY00
				addiu	$v0, -0x08
				sb		$v0, @iBitSelX
				j		@SetBitBuffer
				nop
				@PrevBitXY00:
				lbu		$v0, @iBitSelY
				nop
				li		$v1, 0x10
				beq		$v0, $v1, @PrevBitXY01
				li		$v0, 0xDA
				sb		$v0, @iBitSelX
				li		$v0, 0x10
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop
				@PrevBitXY01:
				li		$v0, 0xDA
				sb		$v0, @iBitSelX
				li		$v0, 0x18
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop

@SetBitBuffer:	la		$v0, @iBit0
				lbu		$v1, @iBitSelection
				nop
				addu	$v0, $v1
				nop
				lbu		$v0, 0($v0)
				nop
				sb		$v0, @iBitBuffer
				j		@Print
				nop

@NextFlag:		lw		$v0, @iCntFlgStr
				nop
				li		$v1, 296
				bne		$v0, $v1, @NextFlag00
				nop
				sw		$0, @iCntFlgStr
				j		@PadReset
				nop
				@NextFlag00:
				addiu	$v0, 4
				sw		$v0, @iCntFlgStr
				j		@PadReset
				nop

@PrevFlag:		lw		$v0, @iCntFlgStr
				nop
				bne		$v0, $0, @PrevFlag00
				nop
				li		$v0, 296
				sw		$v0, @iCntFlgStr
				j		@PadReset
				nop
				@PrevFlag00:
				addiu	$v0, -4
				sw		$v0, @iCntFlgStr
				j		@PadReset
				nop

@Initiate:		lw		$v0, @PtrFlg
				lw		$v1, @iCntFlgStr
				nop
				addu	$v0, $v1
				lw		$v0, 0($v0)		;; Pointer to Flag
				nop
				move	$a0, $v0
				lbu		$a1, @iBitSelection

				;; Get Status
				jal		Flg_ck
				nop
				beqz	$v0, @TurnBitOn
				nop
				jal		Flg_off
				nop
				lw		$v0, G_Stop_flg
				sw		$v0, 0x800C3A88
				j		@PadReset
				nop

				@TurnBitOn:
				jal		Flg_on
				nop
				lw		$v0, G_Stop_flg
				sw		$v0, 0x800C3A88
				j		@PadReset
				nop

@PadUp:			lbu		$v0, @iBitSelY
				nop
				li		$v1, 0x10
				beq		$v0, $v1, @PadUp01

				li		$v0, -16
				lbu		$v1, @iBitSelection
				nop
				addu	$v0, $v1
				nop
				sb		$v0, @iBitSelection
				li		$v0, 0x10
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop

				@PadUp01:
				li		$v0, 16
				lbu		$v1, @iBitSelection
				nop
				addu	$v0, $v1
				nop
				sb		$v0, @iBitSelection
				li		$v0, 0x18
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop

@PadDown:		lbu		$v0, @iBitSelY
				nop
				li		$v1, 0x18
				beq		$v0, $v1, @PadDown01

				li		$v0, 16
				lbu		$v1, @iBitSelection
				nop
				addu	$v0, $v1
				nop
				sb		$v0, @iBitSelection
				li		$v0, 0x18
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop

				@PadDown01:
				li		$v0, -16
				lbu		$v1, @iBitSelection
				nop
				addu	$v0, $v1
				nop
				sb		$v0, @iBitSelection
				li		$v0, 0x10
				sb		$v0, @iBitSelY
				j		@SetBitBuffer
				nop

@Terminate:		lw		$ra, 0x50+-0x04($sp)
				lw		$s0, 0x50+-0x08($sp)
				lw		$s1, 0x50+-0x0C($sp)
				lw		$s2, 0x50+-0x10($sp)
				lw		$s3, 0x50+-0x14($sp)
				lw		$s4, 0x50+-0x18($sp)
				lw		$s5, 0x50+-0x1C($sp)
				lw		$s6, 0x50+-0x20($sp)
				lw		$s7, 0x50+-0x24($sp)
				jr		$ra
				addiu	$sp, 0x50

@CursorStr:		.ascii	"%d%d%d%d%d%d%d%d",0x00
				.align
@BitSelStr:		.ascii	"%d",0x00
				.align
@System:		.ascii	"SYSTEM",0x00		;; 0
				.align
@Status:		.ascii	"STATUS",0x00		;; 1
				.align
@Stop:			.ascii	"STOP",0x00			;; 2
				.align
@Use00:			.ascii	"USE 1/4",0x00		;; 3
				.align
@Use01:			.ascii	"USE 2/4",0x00		;; 4
				.align
@Use02:			.ascii	"USE 3/4",0x00		;; 5
				.align
@Use03:			.ascii	"USE 4/4",0x00		;; 6
				.align
@RoomEntity:	.ascii	"ROOM ENTITY",0x00	;; 7
				.align
@Scenario00:	.ascii	"SCENARIO 1/8",0x00	;; 8
				.align
@Scenario01:	.ascii	"SCENARIO 2/8",0x00	;; 9
				.align
@Scenario02:	.ascii	"SCENARIO 3/8",0x00	;; 10
				.align
@Scenario03:	.ascii	"SCENARIO 4/8",0x00	;; 11
				.align
@Scenario04:	.ascii	"SCENARIO 5/8",0x00	;; 12
				.align
@Scenario05:	.ascii	"SCENARIO 6/8",0x00	;; 13
				.align
@Scenario06:	.ascii	"SCENARIO 7/8",0x00	;; 14
				.align
@Scenario07:	.ascii	"SCENARIO 8/8",0x00	;; 15
				.align
@Common00:		.ascii	"COMMON 1/8",0x00	;; 16
				.align
@Common01:		.ascii	"COMMON 2/8",0x00	;; 17
				.align
@Common02:		.ascii	"COMMON 3/8",0x00	;; 18
				.align
@Common03:		.ascii	"COMMON 4/8",0x00	;; 19
				.align
@Common04:		.ascii	"COMMON 5/8",0x00	;; 20
				.align
@Common05:		.ascii	"COMMON 6/8",0x00	;; 21
				.align
@Common06:		.ascii	"COMMON 7/8",0x00	;; 22
				.align
@Common07:		.ascii	"COMMON 8/8",0x00	;; 23
				.align
@Room00:		.ascii	"ROOM 1/2",0x00		;; 24
				.align
@Room01:		.ascii	"ROOM 2/2",0x00		;; 25
				.align
@Enemy00:		.ascii	"ENEMY 1/16",0x00	;; 26
				.align
@Enemy01:		.ascii	"ENEMY 2/16",0x00	;; 27
				.align
@Enemy02:		.ascii	"ENEMY 3/16",0x00	;; 28
				.align
@Enemy03:		.ascii	"ENEMY 4/16",0x00	;; 29
				.align
@Enemy04:		.ascii	"ENEMY 5/16",0x00	;; 30
				.align
@Enemy05:		.ascii	"ENEMY 6/16",0x00	;; 31
				.align
@Enemy06:		.ascii	"ENEMY 7/16",0x00	;; 32
				.align
@Enemy07:		.ascii	"ENEMY 8/16",0x00	;; 33
				.align
@Enemy08:		.ascii	"ENEMY 9/16",0x00	;; 34
				.align
@Enemy09:		.ascii	"ENEMY 10/16",0x00	;; 35
				.align
@Enemy10:		.ascii	"ENEMY 11/16",0x00	;; 36
				.align
@Enemy11:		.ascii	"ENEMY 12/16",0x00	;; 37
				.align
@Enemy12:		.ascii	"ENEMY 13/16",0x00	;; 38
				.align
@Enemy13:		.ascii	"ENEMY 14/16",0x00	;; 39
				.align
@Enemy14:		.ascii	"ENEMY 15/16",0x00	;; 40
				.align
@Enemy15:		.ascii	"ENEMY 16/16",0x00	;; 41
				.align
@Item00:		.ascii	"ITEM 1/19",0x00		;; 42
				.align
@Item01:		.ascii	"ITEM 2/19",0x00		;; 43
				.align
@Item02:		.ascii	"ITEM 3/19",0x00		;; 44
				.align
@Item03:		.ascii	"ITEM 4/19",0x00		;; 45
				.align
@Item04:		.ascii	"ITEM 5/19",0x00		;; 46
				.align
@Item05:		.ascii	"ITEM 6/19",0x00		;; 47
				.align
@Item06:		.ascii	"ITEM 7/19",0x00		;; 48
				.align
@Item07:		.ascii	"ITEM 8/19",0x00		;; 49
				.align
@Item08:		.ascii	"ITEM 9/19",0x00		;; 50
				.align
@Item09:		.ascii	"ITEM 10/19",0x00	;; 51
				.align
@Item10:		.ascii	"ITEM 11/19",0x00	;; 52
				.align
@Item11:		.ascii	"ITEM 12/19",0x00	;; 53
				.align
@Item12:		.ascii	"ITEM 13/19",0x00	;; 54
				.align
@Item13:		.ascii	"ITEM 14/19",0x00	;; 55
				.align
@Item14:		.ascii	"ITEM 15/19",0x00	;; 56
				.align
@Item15:		.ascii	"ITEM 16/19",0x00	;; 57
				.align
@Item16:		.ascii	"ITEM 17/19",0x00	;; 58
				.align
@Item17:		.ascii	"ITEM 18/19",0x00	;; 59
				.align
@Item18:		.ascii	"ITEM 19/19",0x00	;; 60
				.align
@Map00:			.ascii	"MAP 1/8",0x00		;; 61
				.align
@Map01:			.ascii	"MAP 2/8",0x00		;; 62
				.align
@Map02:			.ascii	"MAP 3/8",0x00		;; 63
				.align
@Map03:			.ascii	"MAP 4/8",0x00		;; 64
				.align
@Map04:			.ascii	"MAP 5/8",0x00		;; 65
				.align
@Map05:			.ascii	"MAP 6/8",0x00		;; 66
				.align
@Map06:			.ascii	"MAP 7/8",0x00		;; 67
				.align
@Map07:			.ascii	"MAP 8/8",0x00		;; 68
				.align
@File:			.ascii	"FILE",0x00			;; 69
				.align
@Zapping00:		.ascii	"ZAPPING 1/2",0x00	;; 70
				.align
@Zapping01:		.ascii	"ZAPPING 2/2",0x00	;; 71
				.align
@Key00:			.ascii	"KEY 1/2",0x00		;; 72
				.align
@Key01:			.ascii	"KEY 2/2",0x00		;; 73
				.align
@RbjSet:		.ascii	"RBJ SET",0x00		;; 74
				.align
@MojiMsg:		.ascii	"MESSAGE",0x00		;; 75
				.align
@Strings:		.word	@System,@Status,@Stop,@Use00,@Use01,@Use02,@Use03,@RoomEntity,@Scenario00,@Scenario01,@Scenario02,@Scenario03,@Scenario04,@Scenario05,@Scenario06,@Scenario07,@Common00,@Common01,@Common02,@Common03,@Common04,@Common05,@Common06,@Common07,@Room00,@Room01,@Enemy00,@Enemy01,@Enemy02,@Enemy03,@Enemy04,@Enemy05,@Enemy06,@Enemy07,@Enemy08,@Enemy09,@Enemy10,@Enemy11,@Enemy12,@Enemy13,@Enemy14,@Enemy15,@Item00,@Item01,@Item02,@Item03,@Item04,@Item05,@Item06,@Item07,@Item08,@Item09,@Item10,@Item11,@Item12,@Item13,@Item14,@Item15,@Item16,@Item17,@Item18,@Map00,@Map01,@Map02,@Map03,@Map04,@Map05,@Map06,@Map07,@File,@Zapping00,@Zapping01,@Key00,@Key01,@RbjSet,@MojiMsg
@Flags:			.word	G_System_flg,G_Status_flg,G_Stop_flg,G_Use_flg,G_Use_flg+4,G_Use_flg+8,G_Use_flg+12,G_Room_enemy_flg,G_Scenario_flg,G_Scenario_flg+4,G_Scenario_flg+8,G_Scenario_flg+12,G_Scenario_flg+16,G_Scenario_flg+20,G_Scenario_flg+24,G_Scenario_flg+28,G_Common_flg,G_Common_flg+4,G_Common_flg+8,G_Common_flg+12,G_Common_flg+16,G_Common_flg+20,G_Common_flg+24,G_Common_flg+28,G_Room_flg,G_Room_flg+4,G_Enemy_flg,G_Enemy_flg+4,G_Enemy_flg+8,G_Enemy_flg+12,G_Enemy_flg+16,G_Enemy_flg+20,G_Enemy_flg+24,G_Enemy_flg+28,G_Enemy_flg+32,G_Enemy_flg+36,G_Enemy_flg+40,G_Enemy_flg+44,G_Enemy_flg+48,G_Enemy_flg+52,G_Enemy_flg+56,G_Enemy_flg+60,G_Item_flg,G_Item_flg+4,G_Item_flg+8,G_Item_flg+12,G_Item_flg+16,G_Item_flg+20,G_Item_flg+24,G_Item_flg+28,G_Item_flg+32,G_Item_flg+36,G_Item_flg+40,G_Item_flg+44,G_Item_flg+48,G_Item_flg+52,G_Item_flg+56,G_Item_flg+60,G_Item_flg+64,G_Item_flg+68,G_Item_flg+70,G_Map_o_flg,G_Map_o_flg+4,G_Map_o_flg+8,G_Map_o_flg+12,G_Map_o_flg+16,G_Map_o_flg+20,G_Map_o_flg+24,G_Map_o_flg+28,G_File_flg,G_Zapping_flg,G_Zapping_flg+4,G_KeyFlg,G_KeyFlg+4,G_Rbj_set_flg,0x800D840C
@PtrStr:		.word	@Strings
@PtrFlg:		.word	@Flags
@iBitSelection:	.byte	0
				.align
@iBitBuffer:	.byte	0
				.align
@iBitSelX:		.byte	0x62
				.align
@iBitSelY:		.byte	0x10
				.align
@iCounter:		.byte	0
				.align
@iCounterTwo:	.byte	0
				.align
@iCntFlgStr:	.word	0
@iBit0:			.byte	0,0,0,0,0,0,0,0
@iBit1:			.byte	0,0,0,0,0,0,0,0
@iBit2:			.byte	0,0,0,0,0,0,0,0
@iBit3:			.byte	0,0,0,0,0,0,0,0
@iBitFlags:		.word	0x00000001, 0x00000002, 0x00000004, 0x00000008, 0x00000010, 0x00000020, 0x00000040, 0x00000080, 0x00000100, 0x00000200, 0x00000400, 0x00000800, 0x00001000, 0x00002000, 0x00004000, 0x00008000, 0x00010000, 0x00020000, 0x00040000, 0x00080000, 0x00100000, 0x00200000, 0x00400000, 0x00800000, 0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000
