

.if DebugRelease
.org DebugMenuHook
				jal		DebugMenu
				nop
.org DebugMenu
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
				
				;; Health
				.if InfHealth
				lhu		$v0, Player_Max_life
				sh		$v0, Player_Life
				.endif

@RDT:			lbu		$v0, DBG_PRINT_RDT
				nop
				beqz	$v0, @Position
				nop
				la		$a0, @StageStr			;; "Stage"
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x08
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				lhu		$a0, G_Stage_no
				nop
				addiu	$a0, 1
				li		$a1, 0x80032C60
				jal		Doitox
				nop
				la		$a0, 0x80032C63
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x38
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				
				la		$a0, @RoomStr			;; "Room"
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x48
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				lhu		$a0, G_Room_no
				li		$a1, 0x80032C60
				jal		Doitox
				nop
				la		$a0, 0x80032C62
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x70
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				
				la		$a0, @CutStr			;; "Cut"
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x88
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0
				lbu		$a0, G_Cut_no
				li		$a1, 0x80032C60
				jal		Doitox
				nop
				la		$a0, 0x80032C63
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0xA8
				li		$a1, 0x08
				move    $a2, $0
				jal		Print8
				move    $a3, $0

@Position:		lbu		$v0, DBG_PRINT_PLPOS
				nop
				beqz	$v0, @Direction
				nop
				la		$a0, @PositionStr		;; "Pos %d/%d/%d"
				lw		$a1, Player_Pos_x
				lw		$a2, Player_Pos_y
				lw		$a3, Player_Pos_z
				sw		$a0, 0x50+-0x40($sp)
				sw		$a1, 0x50+-0x3C($sp)
				sw		$a2, 0x50+-0x38($sp)
				sw		$a3, 0x50+-0x34($sp)
				li		$a0, 0x08
				li		$a1, 0x10
				move    $a2, $0
				jal		Print8
				li      $a3, 2

@Direction:		lbu		$v0, DBG_PRINT_PLROT
				nop
				beqz	$v0, @WeaponSelect
				nop
				la		$a0, @RotationStr		;; "Rot %d/%d/%d"
				lh		$a1, Player_Cdir_x
				lh		$a2, Player_Cdir_y
				lh		$a3, Player_Cdir_z
				andi	$a1, 0xFFF
				andi	$a2, 0xFFF
				andi	$a3, 0xFFF
				sw		$a0, 0x50+-0x40($sp)
				sw		$a1, 0x50+-0x3C($sp)
				sw		$a2, 0x50+-0x38($sp)
				sw		$a3, 0x50+-0x34($sp)
				li		$a0, 0x08
				li		$a1, 0x18
				move    $a2, $0
				jal		Print8
				li      $a3, 2

@WeaponSelect:	lhu		$a0, G_Padd1Trg
				nop
				andi	$a0, PAD_L2+PAD_R2
				beqz	$a0, @AntiFreeze
				nop
				jal		ChgWeapon
				nop
				j		@OverlayExit
				nop

@AntiFreeze:	lhu		$v0, G_Padd1Trg
				li		$v1, PAD_ANTI_FREEZE
				and     $v0, $v0, $v1
				bne		$v0, $v1, @Overlay
				nop
				sw		$0, G_Stop_flg
				sw		$0, Stop_bak
				sw		$0, G_Status_flg
				nop
				j		@OverlayExit
				nop

@Overlay:		lhu		$v0, G_Padd1Trg
				li		$v1, PAD_DEBUG
				and     $v0, $v0, $v1
				bne		$v0, $v1, @Terminate
				nop
				li		$a0, LoadTaskFileDebug
				li		$a1, LoadTaskAddrDebug
				la		$a3, 0x800110C8
				jal		Cd_read
				move	$a2, $0
				jal		LoadTaskFuncDebug
				nop

				;; Area Jump
				li		$v0, TRUE
				lbu		$v1, DBG_AREA_JUMP
				nop
				bne		$v0, $v1, @OverlayExit
				nop
				lhu		$s1, G_Stage_no			;; Old Stage Id
				sb		$0,  DBG_AREA_JUMP
				li		$a0, LoadTaskFileArea
				li		$a1, LoadTaskAddrArea
				la		$a3, 0x800110C8
				jal		Cd_read
				move	$a2, $0
				jal		LoadTaskFuncArea
				nop
				lhu		$v0, G_Stage_no
				nop
				beq     $v0, $s1, @SkipSetStage
				nop
				jal		Set_stage
				nop
				@SkipSetStage:
				jal		Kage_work_init
				nop
				jal		Kage_work9_init
				nop
				jal		Sce_test_init
				nop
				jal		Set_room
				nop
				lw      $v0, G_System_flg
				nop
				ori		$v0, 0x4000
				sw      $v0, G_System_flg
				move    $a0, $0
				jal     Bg_set_mode
				move    $a1, $0
				li      $v0, 1
				sb		$v0, 0x800DFC1B			;; Main.Bg_chg_flg
				jal		Cut_change
				move	$a0, $0
				jal     Cut_check
				li      $a0, 1

				@OverlayExit:
				jal     Task_sleep
				li      $a0, 1
				jal     Pl_set_packet
				nop
				li      $v0, 3
				sb      $v0, 0x800DF348			;; Game.Doordemo_flg

				@Terminate:
				jal     Sce_scheduler
				nop
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

@StageStr:		.ascii	"Stage",0x00
				.align
@RoomStr:		.ascii	"Room",0x00
				.align
@CutStr:		.ascii	"Cut",0x00
				.align
@PositionStr:	.ascii	"Pos %d/%d/%d",0x00
				.align
@RotationStr:	.ascii	"Rot %d/%d/%d",0x00
				.align
.endif
