

.org 0x80190000
				.word 0x4D
DIEDEMO_LOAD:	.ascii "YOUDIED.TIM",0x00
DIEDEMO_CNT0:	.dh 0	;; Die_move
DIEDEMO_CNT1:	.dh 0	;; Die_spr
DIEDEMO_MOVE:	.word DIEDEMO_FCN00
				.word DIEDEMO_FCN01
				.word DIEDEMO_FCN02
				.word DIEDEMO_FCN03
				.word DIEDEMO_FCN04
				.word DIEDEMO_FCN05
				.word DIEDEMO_FCN06
DIEDEMO_SPR:	.word DIEDEMO_FCN10
				.word DIEDEMO_FCN11
				.word DIEDEMO_FCN12
				.word DIEDEMO_FCN13
.org 0x8019009C
				;; Boot
                addiu   $sp, -0x18
                sw      $ra, 0x10($sp)

				MainLoop:
                jal     0x801900CC
                nop
                jal     Task_sleep
                li      $a0, 1
                j       MainLoop
                nop

				;; Terminate
                lw      $ra, 0x10($sp)
                addiu   $sp, 0x18
                jr      $ra
				nop
.org 0x801900CC
				;; Boot
                addiu   $sp, -0x18
                sw      $ra, 0x10($sp)
				
				;; Execute
                la		$v0, DIEDEMO_MOVE
                lhu     $v1, DIEDEMO_CNT0
				nop
                sll     $v1, 2
				addu	$v0, $v1
                lw      $v0, 0($v0)
                nop
                jalr    $v0
                nop

				;; Terminate
                lw      $ra, 0x10($sp)
                addiu   $sp, 0x18
                jr      $ra
                nop
DIEDEMO_FCN00:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_init.s"
DIEDEMO_FCN01:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_fade_out.s"
DIEDEMO_FCN02:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_wait.s"
DIEDEMO_FCN03:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_pause.s"
DIEDEMO_FCN04:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_main.s"
DIEDEMO_FCN05:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_out.s"
DIEDEMO_FCN06:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_move_end.s"

DIEDEMO_FCN0E:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_light_set.s"
DIEDEMO_FCN0F:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_vcut_set.s"

DIEDEMO_FCN10:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_spr_move_main.s"
DIEDEMO_FCN11:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_spr_move_hold.s"
DIEDEMO_FCN12:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_spr_move_erase.s"
DIEDEMO_FCN13:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_spr_move_end.s"

DIEDEMO_FCN1F:	.include ".\\r3000a\\Bio2P\\DIEDEMO\\Die_spr_load.s"