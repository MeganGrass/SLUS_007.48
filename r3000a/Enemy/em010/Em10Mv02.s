
.org 0x8010F260
				addiu   $sp, -0x18
                sw      $s0, 0x10($sp)
                move    $s0, $a0
                sw      $ra, 0x14($sp)
                lbu     $v1, 0x06($s0)		;; Routine_2
                nop
                beqz    $v1, loc_8010F290
                li      $v0, 1
                beq     $v1, $v0, TurnRight
                nop
                j       Terminate
                nop
loc_8010F290:
                li      $a0, 0xF0004
                lbu     $v0, 0x218($s0)
                li      $v1, 1
                sb      $v1, 0x06($s0)		;; Routine_2
                addu    $v0, $a0
                jal     Rnd
                sw      $v0, 0x14C($s0)		;; Move_no
                andi    $v0, 0x3F
                lbu     $v1, 0x239($s0)
                addiu   $v0, 0xB4
                bnez    $v1, loc_8010F2EC
                sh      $v0, 0x158($s0)		;; Timer0
                jal     Rnd
                nop
                andi    $v0, 1
                bnez    $v0, SoundEffect
                li      $a0, 0xB
                li      $a0, 0xA

SoundEffect:	jal     Snd_se_enem
                move    $a1, $s0
                li      $v0, 0x96
                sb      $v0, 0x239($s0)

loc_8010F2EC:
                move    $a0, $s0
                lw      $a1, 0x108($s0)		;; pKan_t_ptr
                lw      $a2, 0x17C($s0)		;; pSeq_t_ptr
                jal     Spd_get
                move    $a3, $0
                jal     Rnd
                nop
                move    $a0, $s0
                move    $a3, $0
                lw      $a1, 0x108($s0)		;; pKan_t_ptr
                lw      $a2, 0x17C($s0)		;; pSeq_t_ptr
                andi    $v0, 0x1F
                jal     Spd_get
                sb      $v0, 0x14D($s0)		;; Move_cnt
                jal     Rnd
                nop
                andi    $v0, 0x1F
                addiu   $v0, 0x2D
                sh      $v0, 0x15A($s0)		;; Timer1
                sb      $0, 0x16A($s0)		;; Timer2

TurnRight:		lb      $v0, 0x16A($s0)		;; Timer2
                nop
                bnez    $v0, TurnLeft
                move    $a0, $s0
                lh      $a1, 0x1C4($s0)		;; Dest_x
                lh      $a2, 0x1C6($s0)		;; Dest_z
                jal     Goto00
                li      $a3, 0x20			;; li      $a3, 0x10
                j       loc_8010F384
                nop

TurnLeft:		lh      $a1, 0x1C4($s0)		;; Dest_x
                lh      $a2, 0x1C6($s0)		;; Dest_z
                jal     Goto00
                li      $a3, 0xFFFFFFE0		;; li      $a3, 0xFFFFFFF0
                lbu     $v0, 0x16A($s0)		;; Timer2
                nop
                addiu   $v0, -1
                sb      $v0, 0x16A($s0)		;; Timer2

loc_8010F384:
                lw      $v0, 0x110($s0)		;; Sca_info
                nop
                andi    $v0, 1
                beqz    $v0, loc_8010F3D4
                move    $a0, $s0
                lhu     $v1, 0x15A($s0)		;; Timer1
                nop
                addiu   $v0, $v1, -1
                bnez    $v1, loc_8010F3D4
                sh      $v0, 0x15A($s0)		;; Timer1
                jal     Rnd
                nop
                andi    $v0, 0x1F
                addiu   $v0, 0x2D
                jal     Rnd
                sh      $v0, 0x15A($s0)		;; Timer1
                andi    $v0, 7
                addiu   $v0, 5
                sb      $v0, 0x16A($s0)		;; Timer2
                move    $a0, $s0
loc_8010F3D4:
                lw      $a1, 0x108($s0)		;; pKan_t_ptr
                lw      $a2, 0x17C($s0)		;; pSeq_t_ptr
                jal     Spd_get
                move    $a3, $0
                move    $a0, $s0
                lw      $a1, 0x108($s0)		;; pKan_t_ptr
                lw      $a2, 0x17C($s0)		;; pSeq_t_ptr
                jal     Joint_move
                li      $a3, 0x100
                lhu     $v0, 0x10E($s0)		;; Type
                nop
                andi    $v0, 0x80
                bnez    $v0, loc_8010F420
                nop
                lhu     $v0, 0x21A($s0)
                nop
                andi    $v0, 0x8000
                beqz    $v0, loc_8010F46C
                nop

loc_8010F420:	lbu     $v1, 0x14D($s0)		;; Move_cnt
                li      $v0, 0xAAAAAAAB
                multu   $v1, $v0
                mfhi    $t0
                srl     $a0, $t0, 1
                sll     $v0, $a0, 1
                addu    $v0, $a0
                subu    $v1, $v0
                andi    $v1, 0xFF
                li      $v0, 2
                bne     $v1, $v0, loc_8010F46C
                nop
                jal     0x8010E6C8
                move    $a0, $s0
                lw      $a1, 0x17C($s0)		;; pSeq_t_ptr
                jal     0x8002A9C8
                move    $a0, $s0

loc_8010F46C:	move    $a0, $s0
                jal     Add_speedXZ
                move    $a1, $0
                lhu     $v0, 0x10E($s0)		;; Type
                nop
                andi    $v0, 0x80
                bnez    $v0, loc_8010F49C
                nop
                lhu     $v0, 0x21A($s0)
                nop
                andi    $v0, 0x1000
                beqz    $v0, loc_8010F550
                nop
loc_8010F49C:
                lhu     $v0, 0x236($s0)
                nop
                andi    $v0, 7
                bnez    $v0, loc_8010F520
                nop
                lhu     $v0, 0x21A($s0)
                nop
                andi    $v0, 0x800
                beqz    $v0, loc_8010F520
                nop
                lhu     $v0, 0x156($s0)		;; Life
                nop
                addiu   $v0, -1
                sh      $v0, 0x156($s0)		;; Life
                sll     $v0, 16
                bgez    $v0, loc_8010F520
                li      $v1, 0xA03
                lhu     $v0, 0x21A($s0)
                nop
                andi    $v0, 0x1000
                beqz    $v0, loc_8010F4FC
                sw      $v1, 0x04($s0)		;; Routine_0
                li      $v0, 0xB03
                sw      $v0, 0x04($s0)		;; Routine_0
loc_8010F4FC:
                li      $v0, 4
                sb      $v0, 0x1D2($s0)		;; Damage_no
                lbu     $v0, 0x1D3($s0)		;; Damage_cnt
                lhu     $v1, 0x21A($s0)
                ori     $v0, 0x80
                ori     $v1, 0x2000
                sb      $v0, 0x1D3($s0)		;; Damage_cnt
                j       Terminate
                sh      $v1, 0x21A($s0)
loc_8010F520:
                lhu     $v0, 0x21A($s0)
                nop
                andi    $v0, 0x1000
                beqz    $v0, loc_8010F550
                nop
                jal     Rnd
                nop
                lhu     $v1, 0x76($s0)		;; Cdir_y
                sra     $v0, 1
                addiu   $v1, 0x40
                subu    $v1, $v0
                sh      $v1, 0x76($s0)		;; Cdir_y
loc_8010F550:
                lhu     $v1, 0x158($s0)		;; Timer0
                nop
                addiu   $v0, $v1, -1
                beqz    $v1, loc_8010F57C
                sh      $v0, 0x158($s0)		;; Timer0
                lbu     $v0, Player_Damage_cnt
                nop
                andi    $v0, 0x80
                beqz    $v0, loc_8010F584
                nop
loc_8010F57C:
                li      $v0, 0x101
                sw      $v0, 0x04($s0)		;; Routine_0
loc_8010F584:
                lw      $v0, 0x1F0($s0)		;; L_pl
                nop
                sltiu   $v0, 0x1389
                beqz    $v0, loc_8010F5B8
                move    $a0, $s0
                lw      $a1, Player_Pos_x
                lw      $a2, Player_Pos_z
                jal     Goto00_ck
                li      $a3, 0x800
                beqz    $v0, Terminate
                nop
loc_8010F5B8:
                lh      $v0, 0x158($s0)		;; Timer0
                nop
                slti    $v0, 0x78
                beqz    $v0, Terminate
                li      $v0, 0x101
                sw      $v0, 0x04($s0)		;; Routine_0

Terminate:		lw      $ra, 0x14($sp)
                lw      $s0, 0x10($sp)
                jr      $ra
                addiu   $sp, 0x18