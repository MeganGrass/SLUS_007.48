

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

			;; Pad
			sh		$0, G_Padd1
			sh		$0, G_Padd1Trg
			lui     $v0, 0xFFFF
			sw      $v0, G_PaddData
			sw      $v0, G_PaddData+0x24

			;; Stage
			lhu		$v0, G_Stage_no
			sh		$v0, @iStage

			;; Room
			lhu		$v0, G_Room_no
			sh		$v0, @iRoom

@Main:		lhu		$v1, G_Padd1Trg
			li		$v0, PAD_CONFIRM
			beq		$v0, $v1, @AreaJump
			li		$v0, PAD_UP
			beq		$v0, $v1, @StageUp
			li		$v0, PAD_DOWN
			beq		$v0, $v1, @StageDown
			li		$v0, PAD_RIGHT
			beq		$v0, $v1, @RoomUp
			li		$v0, PAD_LEFT
			beq		$v0, $v1, @RoomDown
			nop

@Body:		;; Print Room ID
			lbu		$a0, @iStage
			nop
			addiu	$a0, 1
			li		$a1, 0x80032C60
			jal		Doitox
			nop
			la		$a0, 0x80032C63
			sw		$a0, 0x28+-0x18($sp)
			li		$a0, 0x08
			li		$a1, 0x08
			move    $a2, $0
			jal		Print8
			move    $a3, $0
			lbu		$a0, @iRoom
			li		$a1, 0x80032C60
			jal		Doitox
			nop
			la		$a0, 0x80032C62
			sw		$a0, 0x28+-0x18($sp)
			li		$a0, 0x10
			li		$a1, 0x08
			move    $a2, $0
			jal		Print8
			move    $a3, $0

			;; Room Jump Table
			lw		$s0, @RoomJumpPtr
			lhu		$v0, @iStage
			li		$v1, 0x7B0				;; sizeof Stage
			multu	$v0, $v1
			mflo	$v0
			addu	$s0, $v0, $s0
			lhu		$v0, @iRoom
			li		$v1, 0x29				;; sizeof Room
			multu	$v0, $v1
			mflo	$v0
			addu	$s0, $v0, $s0
			li		$v0, 0x08
			addu	$a1, $v0, $s0

			;; Print Room Name
			la		$a0, @NameStr
			sw		$a0, 0x28+-0x18($sp)
			sw		$a1, 0x28+-0x14($sp)
			li		$a0, 0x28
			li		$a1, 0x08
			li		$a2, 1
			jal		Print8
			move    $a3, $0

			;; Main Loop
			jal     Task_sleep
			li      $a0, 1
			j		@Main
			nop

@AreaJump:	;; Initialize
			lhu		$s1, G_Stage_no		;; Old Stage
			lhu		$v0, @iStage
			lhu		$v1, @iRoom
			sh		$v0, G_Stage_no
			sh		$v1, G_Room_no
			sh      $0, G_Cut_no
			li      $v0, 0xFFFFFFFF
			sh		$v0, G_Cut_noOld
            sh      $v0, G_Room_noOld
			sb      $0, G_Next_cut_no

			;; Room Jump Table
			lw		$s0, @RoomJumpPtr
			lhu		$v0, G_Stage_no
			li		$v1, 0x7B0
			multu	$v0, $v1
			mflo	$v0
			addu	$s0, $v0, $s0		;; Pointer to Stage
			lhu		$v0, G_Room_no
			li		$v1, 0x29
			multu	$v0, $v1
			mflo	$v0
			addu	$s0, $v0, $s0		;; Pointer to Room

			;; Player Position
            lh      $v1, 0($s0)
            sh      $v1, Player_Cdir_y
            lh      $v1, 2($s0)
            sw      $v1, Player_Pos_x
            lhu     $a0, 2($s0)
            sh      $v1, Player_Sca_old_x
            sh      $a0, Player_Old_x
            lh      $v1, 4($s0)
            sw      $v1, Player_Pos_z
            lhu     $a0, 4($s0)
            sh      $v1, Player_Sca_old_z
            sh      $a0, Player_Old_z
            lhu     $v1, 6($s0)
            sb      $v1, Player_nFloor
            andi    $v1, 0xFF
            sll     $v0, $v1, 3
            subu    $v0, $v1
            sll     $v0, 5
            addu    $v0, $v1
            sll     $v0, 3
            negu    $v0, $v0
            sw      $v0, Player_Pos_y
            sh      $v0, Player_Old_y
            sh      $v0, Player_Ground

			;; Anti-Freeze
			sw		$0, G_Stop_flg
			sw		$0, Stop_bak
;;			sw		$0, G_Status_flg
			nop

			;; Complete
			j		@Terminate
			nop

@StageUp:	lhu		$a0, @iStage
			lhu		$a1, @iRoom
			li		$v1, 0x06
			beq		$a0, $v1, @StageUpSet00
			addiu	$a0, 1
			j		@StageUpSet01
			nop

			@StageUpSet00:
			li		$a0, 0x00

			@StageUpSet01:
			sh		$a0, @iStage
			j		@Body
			nop

@StageDown:	lhu		$a0, @iStage
			lhu		$a1, @iRoom
			li		$v1, 0x00
			beq		$a0, $v1, @StageDownSet00
			addiu	$a0, -1
			j		@StageDownSet01
			nop

			@StageDownSet00:
			li		$a0, 0x06

			@StageDownSet01:
			sh		$a0, @iStage
			j		@Body
			nop

@RoomUp:	lhu		$a0, @iStage
			lhu		$a1, @iRoom
			li		$v1, 0x2F
			beq		$a1, $v1, @RoomUpSet00
			addiu	$a1, 1
			j		@RoomUpSet01
			nop

			@RoomUpSet00:
			li		$a1, 0x00

			@RoomUpSet01:
			sh		$a1, @iRoom
			j		@Body
			nop

@RoomDown:	lhu		$a0, @iStage
			lhu		$a1, @iRoom
			li		$v1, 0x00
			beq		$a1, $v1, @RoomDownSet00
			addiu	$a1, -1
			j		@RoomDownSet01
			nop

			@RoomDownSet00:
			li		$a1, 0x2F

			@RoomDownSet01:
			sh		$a1, @iRoom
			j		@Body
			nop

@Terminate:		li      $a0, 0x200
				li      $a1, 0x400
				li      $a2, 7
				jal     Fade_set
				move    $a3, $0

				@loc_8002CB70:
				jal     Fade_status
				move    $a0, $0
				bnez    $v0, @loc_8002CB90
				li      $a0, 2
				jal     Task_sleep
				li      $a0, 1
				j       @loc_8002CB70
				nop

				@loc_8002CB90:
				jal     Bg_set_mode
				move    $a1, $0
				li      $a0, 0x200
				move    $a1, $0
				li      $a2, 7
				jal     Fade_set
				li      $a3, 1
				move    $a0, $0
				li      $a1, 0x7FFF
				li      $a2, 0xFFFFFF
				jal     Fade_adjust
				move    $a3, $0

			;; Terminate
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

@iStage:	.dh	0
@iRoom:		.dh	0
@RdtStr:	.ascii	"%d%02d",0x00
			.align
@NameStr:	.ascii	"%s",0x00
			.align

@RoomJumpPtr:	.word	@RoomJumpTable
@RoomJumpTable:
			.include ".\\r3000a\\Zero\\RoomJumpTable.s"
