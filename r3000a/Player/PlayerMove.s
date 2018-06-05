

;; Pad
.org 0x8003C5A4
				lui     $v1, 0x8001
				addu    $v1, $v0
				lw      $v0, 0x0048($v1)	;; UPDATE THIS IF PlMvPadTbl CHANGES
.org 0x80010048
				.word pl_mv0c_pad	;; pl_mv00_pad	;; Idle
				.word 0x8003C924	;; pl_mv01_pad	;; Walk-Forward
				.word 0x8003CE24	;; pl_mv02_pad	;; Run
				.word 0x8003D3E0	;; pl_mv03_pad	;; Walk-Backward
				.word 0x8003DD48	;; pl_mv04_pad	;; Turn
				.word 0x80042C20	;; pl_mv05_pad	;; Aim
				.word 0x8003E1D4	;; pl_mv06_pad	;; Kneel to pickup Item
				.word 0x8003E314	;; pl_mv07_pad	;; Turn (Auto)
				.word 0x8003E8CC	;; pl_mv08_pad	;; Climb Up
				.word 0x8003EC60	;; pl_mv09_pad	;; Jump Down
				.word 0x8003F0FC	;; pl_mv0a_pad	;; Push Object
				.word 0x8003F420	;; pl_mv0b_pad	;; Rotate to divisible of 1024, walk forward
				.word 0x8003E1D4	;; pl_mv0c_pad	;; Quick-Turn

;; Move
.org 0x8003C5CC
				lui     $v1, 0x8001
				addu    $v1, $v0
				lw      $v0, 0x007C($v1)	;; UPDATE THIS IF pPlMvTbl CHANGES
.org 0x8001007C
				.word 0x8003C780	;; pl_mv00		;; Idle
				.word 0x8003CBDC	;; pl_mv01		;; Walk-Forward
				.word 0x8003D0E8	;; pl_mv02		;; Run
				.word 0x8003D5F4	;; pl_mv03		;; Walk-Backward
				.word 0x8003DFF4	;; pl_mv04		;; Turn
				.word 0x80043DF8	;; pl_mv05		;; Aim
				.word 0x8003E1DC	;; pl_mv06		;; Kneel to pickup Item
				.word 0x8003E31C	;; pl_mv07		;; Turn (Auto)
				.word 0x8003E8DC	;; pl_mv08		;; Climb Up
				.word 0x8003EC70	;; pl_mv09		;; Jump Down
				.word 0x8003F174	;; pl_mv0a		;; Push Object
				.word 0x8003F428	;; pl_mv0b		;; Rotate to divisible of 1024, walk forward
				.word @pl_mv0c		;; pl_mv0c		;; Quick-Turn

;; Trigger
.org pl_mv0c_pad
                addiu   $sp, -0x20
                sw      $s0, 0x20+-0x10($sp)
                move    $s0, $a0
                sw      $s1, 0x20+-0x0C($sp)
                move    $s1, $a1
                sw      $ra, 0x20+-0x04($sp)
                sw      $s2, 0x20+-0x08($sp)
                lbu     $v0, 6($s0)
                nop
                beqz    $v0, @loc_8003C634
                move    $s2, $a2
                lbu     $v0, 0x14D($s0)
                nop
                bnez    $v0, @loc_8003C68C
                andi    $v0, $s1, 0xA
@loc_8003C634:
                lh      $v1, 0x156($s0)
                lb      $a0, 0x151($s0)
                slti    $v0, $v1, 0x65
                beqz    $v0, @loc_8003C650
                sb      $0, 0x151($s0)
                li      $v0, 1
                sb      $v0, 0x151($s0)
@loc_8003C650:
                lhu     $v0, Player_Poison_Flg0
                nop
                beqz    $v0, @loc_8003C668
                li      $v0, 1
                sb      $v0, 0x151($s0)
@loc_8003C668:
                slti    $v0, $v1, 0x15
                beqz    $v0, @loc_8003C678
                li      $v0, 2
                sb      $v0, 0x151($s0)
@loc_8003C678:
                lb      $v0, 0x151($s0)
                nop
                beq     $a0, $v0, @loc_8003C68C
                andi    $v0, $s1, 0xA
                sb      $0, 6($s0)
@loc_8003C68C:
                beqz    $v0, @loc_8003C698
                li      $v0, 0x401
                sw      $v0, 4($s0)
@loc_8003C698:
                andi    $v0, $s1, 4
                beqz    $v0, @loc_8003C6A8
                li      $v0, 0x301
                sw      $v0, 4($s0)
@loc_8003C6A8:
                andi    $v0, $s1, 1
                beqz    $v0, @loc_8003C6C8
                li      $v0, 0x101
                sw      $v0, 4($s0)
                andi    $v0, $s1, 0x200
                beqz    $v0, @loc_8003C6C8
                li      $v0, 0x201
                sw      $v0, 4($s0)
@loc_8003C6C8:
                andi    $v0, $s1, 0x80
                bnez    $v0, @loc_8003C6DC
                andi    $v0, $s2, 0x80
                beqz    $v0, @loc_8003C744
                andi    $v0, $s1, 0x100
@loc_8003C6DC:
                lhu     $v0, 0x112($s0)
                nop
                andi    $v0, 0x10
                beqz    $v0, @loc_8003C70C
                nop
                move    $a0, $s0
                lw      $a2, 0x800D7694			;; pStairs
                jal     Sca_hit_stairs
                li      $a1, 0x1C2
                j       @loc_8003C764
                nop
@loc_8003C70C:
                lbu     $a0, 8($s0)
                jal     Oma_pl_updown_ck
                addiu   $a0, 4
                bnez    $v0, @loc_8003C764
                andi    $v0, $s2, 0x80
                beqz    $v0, @loc_8003C740
                lui     $a0, 0x20
                la      $v0, G_Status_flg
                lw      $v1, (G_Status_flg - 0x800CFBD8)($v0)
                nop
                or      $v1, $a0
                sw      $v1, (G_Status_flg - 0x800CFBD8)($v0)
@loc_8003C740:
                andi    $v0, $s1, 0x100
@loc_8003C744:
                beqz    $v0, @loc_8003C764
                nop
                lhu     $v0, 0x10E($s0)
                nop
                andi    $v0, 0xFFF
                beqz    $v0, @loc_8003C764
                li      $v0, 0x501
                sw      $v0, 4($s0)
@loc_8003C764:
@MoveQuickTurn:
                lb		$a0, DBG_QTURN_FLAG
                nop
                beqz	$a0, @Terminate
                nop
                lhu		$v1, G_Padd1Trg
                li		$a1, 1
                lbu		$a0, CONTROLLER_TYPE
                nop
                beq		$a0, $a1, @QTUSA
                nop
                @QTJPN:
				li		$v0, PAD_DOWN+PAD_X
				bne		$v0, $v1, @Terminate
				nop
				j		@QUICKTURN
				nop
                @QTUSA:
				li		$v0, PAD_DOWN+PAD_SQUARE
				bne		$v0, $v1, @Terminate
				nop
                @QUICKTURN:
				li      $v0, 0xC01				;; Quick-Turn
                sw      $v0, 0x04($s0)			;; Routine_0
				li		$v0, TRUE
				sb		$v0, GAME_QUICKTURN		;; Flag
                sb		$0,  CNT_QUICKTURN		;; Timer
@Terminate:
                lw      $ra, 0x20+-0x04($sp)
                lw      $s2, 0x20+-0x08($sp)
                lw      $s1, 0x20+-0x0C($sp)
                lw      $s0, 0x20+-0x10($sp)
                addiu   $sp, 0x20
                jr      $ra
                nop

;; Quick-Turn
@pl_mv0c:

				;; Stack
				addiu   $sp, -0x20
				sw      $s0, 0x18($sp)
				sw      $ra, 0x1C($sp)
				lwl     $v0, 0x03($a1)
				lwr     $v0, 0x00($a1)
				lh      $v1, 0x04($a1)
				swl     $v0, 0x13($sp)
				swr     $v0, 0x10($sp)
				sh      $v1, 0x14($sp)

				move    $s0, $a0					;; G_Player
				sw      $s0, G_pEm					;; Fail-Safe

				;; Flag
				li		$a0, TRUE
				lbu		$a1, GAME_QUICKTURN
				nop
				bne		$a0, $a1, @Terminate00		;; Is Quick-Turn active?
				nop

				;; Rotation
				lh		$v0, Player_Cdir_y
				nop
				addi	$v0, -256
				sh		$v0, Player_Cdir_y

				;; Animation
				sw      $0,  0x14C($s0)				;; Move_no
				lbu     $v0, CNT_QUICKTURN
				nop
				addiu	$v0, 6
				sb      $v0, 0x14D($s0)				;; Move_cnt
				li		$v0, 6
				sb      $v0, 0x14E($s0)				;; Hokan_flg

				;; Work
				move    $a0, $s0					;; G_Player
				lw      $a1, 0x180($s0)				;; pSub0_kan_t_ptr
				lw      $a2, 0x184($s0)				;; pSub0_seq_t_ptr
				jal     Spd_get
				move    $a3, $0						;; R_flg
				move    $a0, $s0					;; G_Player
				lw      $a1, 0x180($s0)				;; pSub0_kan_t_ptr
				lw      $a2, 0x184($s0)				;; pSub0_seq_t_ptr
				jal     Joint_move
				li      $a3, 0x200					;; Late_flg

				;; Timer
				lbu		$v0, CNT_QUICKTURN			;; Timer
				nop
				addiu	$v0, 1
				sb		$v0, CNT_QUICKTURN			;; Timer Increase
				li		$v0, 8
				lbu		$v1, CNT_QUICKTURN			;; Timer Check
				nop
				bne		$v0, $v1, @Terminate00
				nop
				
				;; Complete
				lw      $v0, Player_pNow_seq
				nop
				lw      $v1, 0($v0)
				nop
				andi    $v0, $v1, 0x4000
				andi    $v0, $v1, 0x2000
				srl     $v0, 13
				sll     $a1, $v0, 1
				addu    $a1, $v0
				addiu   $a1, 4
				move    $a0, $0
				li		$a2, G_Player
				jal     Snd_se_walk
				nop
				lhu     $v0, G_Room_player_flg
				nop
				ori     $v0, 2
				sh      $v0, G_Room_player_flg
				sb		$0,  GAME_QUICKTURN			;; Quick-Turn is complete
				li      $v0, 0x01					;; Quick-Turn
                sw      $v0, 0x04($s0)				;; Routine_0

				@Terminate00:
				lw      $ra, 0x20+-0x04($sp)
				lw      $s0, 0x20+-0x08($sp)
				jr      $ra
				addiu   $sp, 0x20
