

.org 0x801136FC
                addiu   $sp, -0x80
                sw      $s2, 0x68($sp)
                move    $s2, $a0
                sw      $s4, 0x70($sp)
                move    $s4, $a1
                sw      $s5, 0x74($sp)
                sw      $ra, 0x7C($sp)
                sw      $s6, 0x78($sp)
                sw      $s3, 0x6C($sp)
                sw      $s1, 0x64($sp)
                sw      $s0, 0x60($sp)
                li      $v0, 0xFFFFFF06
                sh      $v0, 0x10($sp)
                li      $v0, 0x64
                sh      $v0, 0x12($sp)
                lbu     $v0, 0x231($s2)
                li      $t2, 1
                bne     $v0, $t2, loc_80113758
                move    $s5, $a2
                jal     Em10Die04
                nop
                j       loc_80113F14
                nop
loc_80113758:
                li      $a0, 2
                beq     $v0, $a0, loc_801137B4
                nop
                lbu     $v1, 6($s2)
                nop
                beq     $v1, $t2, loc_801139B4
                slti    $v0, $v1, 2
                beqz    $v0, loc_8011378C
                nop
                beqz    $v1, loc_8011379C
                nop
                j       loc_80113B5C
                nop
loc_8011378C:
                beq     $v1, $a0, loc_80113A8C
                nop
                j       loc_80113B5C
                nop
loc_8011379C:
                lw      $v0, Player_Be_flg
                nop
                bgez    $v0, loc_801137CC
                li      $v0, 2
                sb      $v0, 0x231($s2)
loc_801137B4:
                move    $a0, $s2
                move    $a1, $s4
                jal     Em10Die03
                move    $a2, $s5
                j       loc_80113F14
                nop
loc_801137CC:
                lh      $v0, 0x10C($s2)
                nop
                bnez    $v0, loc_8011381C
                li      $v0, 1
                lw      $v0, G_Status_flg
                lui     $v1, 0x1000
                and     $v0, $v1
                bnez    $v0, loc_8011381C
                li      $v0, 1
                jal     Rnd
                nop
                andi    $v0, 3
                beqz    $v0, loc_80113838
                li      $v0, 3
                lbu     $v1, 4($s2)
                nop
                bne     $v1, $v0, loc_8011383C
                lui     $a2, 3
                li      $v0, 1
loc_8011381C:
                sb      $v0, 0x231($s2)
                move    $a0, $s2
                move    $a1, $s4
                jal     Em10Die04
                move    $a2, $s5
                j       loc_80113F14
                nop
loc_80113838:
                lui     $a2, 3
loc_8011383C:
                ori     $a2, 4
                move    $a0, $s2
                lhu     $v1, 0x1D0($s2)
                li      $v0, 1
                sb      $v0, 6($s2)
                lhu     $v0, 0x1D0($s2)
                move    $a1, $0
                sh      $0, 0x13C($s2)
                sh      $0, 0x13E($s2)
                sh      $0, 0x140($s2)
                sh      $0, 0x158($s2)
                sb      $0, 0x16B($s2)
                andi    $v1, 0x20
                sltu    $v1, $0, $v1
                subu    $a2, $v1
                srl     $v0, 4
                andi    $v0, 2
                addiu   $v1, $sp, 0x10
                addu    $v0, $v1
                sw      $a2, 0x14C($s2)
                lhu     $v0, 0($v0)
                lui     $s6, 0x902
                sh      $0, 0x148($s2)
                jal     Add_speedXZ
                sh      $v0, 0x144($s2)
                lui     $a0, 0x10
                lw      $s3, 0x198($s2)
                li      $a0, 0x101030
                lw      $v1, 0($s3)
                li      $v0, 0x40
                sw      $v0, 0x98($s3)
                sw      $a0, 0x9C($s3)
                ori     $v1, 0x80
                jal     Rnd
                sw      $v1, 0($s3)
                li      $a0, 0x1770
                sll     $a1, $v0, 4
                addiu   $s1, $s3, 0x48
                move    $a2, $s1
                jal     Esp_call
                move    $a3, $0
                jal     Rnd
                nop
                addiu   $s0, $v0, 0x7D0
                sll     $s0, 1
                lui     $v0, 0x800
                jal     Rnd
                or      $s0, $v0
                move    $a0, $s0
                sll     $a1, $v0, 4
                move    $a2, $s1
                jal     Esp_call
                move    $a3, $0
                jal     Rnd
                nop
                andi    $v0, 3
                addiu   $s1, $v0, 2
loc_80113920:
                jal     Rnd
                addiu   $s1, -1
                addiu   $s0, $v0, 0xC00
                jal     Rnd
                or      $s0, $s6
                move    $a0, $s0
                sll     $a1, $v0, 4
                addiu   $a2, $s3, 0x48
                jal     Esp_call
                move    $a3, $0
                bnez    $s1, loc_80113920
                nop
                lbu     $v0, 0x239($s2)
                nop
                bnez    $v0, loc_80113988
                nop
                jal     Rnd
                nop
                andi    $v0, 1
                beqz    $v0, loc_80113978
                li      $a0, 0xD
                li      $a0, 0xC
loc_80113978:
                jal     Snd_se_enem
                move    $a1, $s2
                li      $v0, 0x96
                sb      $v0, 0x239($s2)
loc_80113988:
                li      $a0, 9
                jal     Snd_se_enem
                move    $a1, $s2
                lhu     $v0, 0x1C2($s2)
                move    $a0, $s2
                jal     Em_dead_flg_on
                sh      $v0, 0x232($s2)
                lbu     $v0, 0x1D3($s2)
                nop
                ori     $v0, 0x80
                sb      $v0, 0x1D3($s2)
loc_801139B4:
                move    $a0, $s2
                move    $a1, $s4
                move    $a2, $s5
                jal     Spd_get
                move    $a3, $0
                move    $a0, $s2
                move    $a1, $s4
                move    $a2, $s5
                jal     Joint_move
                li      $a3, 0x400
                move    $a0, $s2
                lbu     $v1, 6($s2)
                move    $a1, $0
                addu    $v1, $v0
                jal     Add_speedXZ
                sb      $v1, 6($s2)
                lbu     $v1, 6($s2)
                li      $v0, 2
                bne     $v1, $v0, loc_80113A40
                addiu   $a0, $s2, 0x13C
                lw      $s3, 0x198($s2)
                addiu   $s0, $sp, 0x20
                jal     RotMatrix
                move    $a1, $s0
                move    $a1, $s0
                jal     MulMatrix
                addiu   $a0, $s3, 0x18
                addiu   $s3, 0xAC
                move    $a0, $s0
                addiu   $s0, $sp, 0x40
                jal     TransposeMatrix
                move    $a1, $s0
                move    $a0, $s0
                jal     MulMatrix2
                addiu   $a1, $s3, 0x18
loc_80113A40:
                lbu     $v0, 0x14D($s2)
                nop
                beqz    $v0, loc_80113B5C
                andi    $v0, 3
                bnez    $v0, loc_80113B5C
                nop
                lw      $s3, 0x198($s2)
                jal     Rnd
                nop
                sll     $s0, $v0, 3
                jal     Rnd
                addiu   $s0, 0x1770
                move    $a0, $s0
                sll     $a1, $v0, 4
                addiu   $a3, $s2, 0x144
                jal     Esp_call
                addiu   $a2, $s3, 0x48
                j       loc_80113B5C
                nop
loc_80113A8C:
                lw      $s3, 0x198($s2)
                lhu     $v0, 0x21A($s2)
                lbu     $v1, 0x1D3($s2)
                andi    $v0, 0xFFFB
                andi    $v1, 0x7F
                sh      $v0, 0x21A($s2)
                li      $v0, 0xFFFFFF38
                sb      $v1, 0x1D3($s2)
                sh      $v0, 0x3A($s3)
                li      $v0, 0x400
                sh      $0, 0x68($s3)
                sh      $0, 0x6A($s3)
                sh      $v0, 0x6C($s3)
                lh      $v1, 0x232($s2)
                lhu     $v0, 0x21A($s2)
                sw      $v1, 0x3C($s2)
                lbu     $v1, 4($s2)
                ori     $v0, 1
                sh      $v0, 0x21A($s2)
                li      $v0, 3
                bne     $v1, $v0, loc_80113AEC
                lui     $t1, 0xF3FF
                li      $v0, 0xA
                sh      $v0, 0x156($s2)
loc_80113AEC:
                ori     $t1, 0xFFFF
                li      $t0, 0xF0005
                move    $a0, $s2
                move    $a1, $s4
                move    $a2, $s5
                li      $a3, 0x100
                lw      $v1, 0($a0)
                li      $v0, 0x2001
                sh      $v0, 0x10E($a0)
                li      $v0, 0xC8
                sh      $v0, 0x9A($a0)
                sh      $v0, 0x9C($a0)
                sh      $v0, 0x90($a0)
                sh      $v0, 0x92($a0)
                li      $v0, 0xFFFFFEA2
                sh      $v0, 0x98($a0)
                li      $v0, 0x15E
                sh      $v0, 0x9E($a0)
                lui     $v0, 0x400
                sw      $t2, 4($a0)
                sw      $t0, 0x14C($a0)
                and     $v1, $t1
                or      $v1, $v0
                jal     Joint_move
                sw      $v1, 0($a0)
                j       loc_80113F14
                nop
loc_80113B5C:
                lbu     $v0, 6($s2)
                nop
                sltiu   $v0, 2
                beqz    $v0, loc_80113CD8
                nop
                lbu     $v0, 0x14D($s2)
                lw      $s3, 0x198($s2)
                sltiu   $v0, 0xA
                beqz    $v0, loc_80113BC4
                nop
                lbu     $a1, 0x16B($s2)
                lb      $v1, 0x16B($s2)
                lhu     $v0, 0x13C($s2)
                lb      $a0, 0x16B($s2)
                sh      $0, 0x13E($s2)
                addiu   $a1, 1
                sll     $v1, 4
                subu    $v0, $v1
                sh      $v0, 0x13C($s2)
                sll     $v0, $a0, 1
                addu    $v0, $a0
                lhu     $v1, 0x140($s2)
                sll     $v0, 3
                sb      $a1, 0x16B($s2)
                addu    $v1, $v0
                sh      $v1, 0x140($s2)
loc_80113BC4:
                lbu     $v0, 0x14D($s2)
                nop
                addiu   $v0, -0xB
                sltiu   $v0, 0x13
                beqz    $v0, loc_80113C30
                nop
                lbu     $a0, 0x16B($s2)
                lhu     $a1, 0x158($s2)
                lb      $v0, 0x16B($s2)
                lhu     $v1, 0x13C($s2)
                sll     $v0, 3
                addu    $v1, $v0
                lh      $v0, 0x158($s2)
                sh      $v1, 0x13C($s2)
                lhu     $v1, 0x13E($s2)
                sll     $v0, 1
                subu    $v1, $v0
                lb      $v0, 0x16B($s2)
                addiu   $a0, -1
                sh      $v1, 0x13E($s2)
                lhu     $v1, 0x140($s2)
                addiu   $a1, 1
                sh      $a1, 0x158($s2)
                sb      $a0, 0x16B($s2)
                sll     $v0, 1
                subu    $v1, $v0
                sh      $v1, 0x140($s2)
loc_80113C30:
                lbu     $v0, 0x14D($s2)
                nop
                addiu   $v0, -0x1F
                sltiu   $v0, 0x13
                beqz    $v0, loc_80113CA0
                addiu   $a0, $s2, 0x13C
                lbu     $a0, 0x16B($s2)
                lhu     $a1, 0x158($s2)
                lb      $v0, 0x16B($s2)
                lhu     $v1, 0x13C($s2)
                sll     $v0, 2
                subu    $v1, $v0
                lh      $v0, 0x158($s2)
                sh      $v1, 0x13C($s2)
                lhu     $v1, 0x13E($s2)
                sll     $v0, 1
                addu    $v1, $v0
                lb      $v0, 0x16B($s2)
                addiu   $a0, 1
                sh      $v1, 0x13E($s2)
                lhu     $v1, 0x140($s2)
                addiu   $a1, -1
                sh      $a1, 0x158($s2)
                sb      $a0, 0x16B($s2)
                sll     $v0, 1
                subu    $v1, $v0
                sh      $v1, 0x140($s2)
                addiu   $a0, $s2, 0x13C
loc_80113CA0:
                addiu   $s0, $sp, 0x20
                jal     RotMatrix
                move    $a1, $s0
                addiu   $a0, $s3, 0x18
                jal     MulMatrix
                move    $a1, $s0
                addiu   $s3, 0xAC
                move    $a0, $s0
                addiu   $s0, $sp, 0x40
                jal     TransposeMatrix
                move    $a1, $s0
                move    $a0, $s0
                jal     MulMatrix2
                addiu   $a1, $s3, 0x18
loc_80113CD8:
                lbu     $v1, 0x14D($s2)
                li      $v0, 0x14
                bne     $v1, $v0, loc_80113D90
                li      $v0, 1
                lbu     $v1, 6($s2)
                nop
                bne     $v1, $v0, loc_80113D90
                addiu   $v0, $s2, 0x11C
                lw      $v1, 0x198($s2)
                nop
                sw      $v0, 0x120($v1)
                lw      $v0, 0x48($v1)
                lw      $a0, 0x4C($v1)
                lw      $a1, 0x50($v1)
                lw      $a2, 0x54($v1)
                sw      $v0, 0x11C($s2)
                sw      $a0, 0x120($s2)
                sw      $a1, 0x124($s2)
                sw      $a2, 0x128($s2)
                lw      $v0, 0x58($v1)
                lw      $a0, 0x5C($v1)
                lw      $a1, 0x60($v1)
                lw      $a2, 0x64($v1)
                sw      $v0, 0x12C($s2)
                sw      $a0, 0x130($s2)
                sw      $a1, 0x134($s2)
                sw      $a2, 0x138($s2)
                lw      $v1, 0x38($s2)
                lw      $a0, 0x40($s2)
                lw      $s0, 0x198($s2)
                li      $v0, 0xA
                sh      $v0, 0x15A($s2)
                li      $v0, 2
                sb      $v0, 0x16A($s2)
                sw      $v1, 0x130($s2)
                jal     Rnd
                sw      $a0, 0x138($s2)
                li      $a0, 0x31000
                sll     $a1, $v0, 4
                addiu   $a2, $s0, 0xF4
                jal     Esp_call
                move    $a3, $0
                li      $a0, 9
                jal     Snd_se_enem
                move    $a1, $s2
loc_80113D90:
                lbu     $v0, 0x14D($s2)
                nop
                sltiu   $v0, 0x14
                bnez    $v0, loc_80113F14
                li      $v0, 1
                lbu     $v1, 6($s2)
                nop
                bne     $v1, $v0, loc_80113F14
                addiu   $a0, $s2, 0x74
                addiu   $s0, $s2, 0x24
                lw      $s3, 0x198($s2)
                move    $a1, $s0
                lw      $v0, 0xAC($s3)
                lw      $v1, 0x204($s3)
                ori     $v0, 0x9000
                sw      $v0, 0xAC($s3)
                lw      $v0, 0x158($s3)
                ori     $v1, 0x9000
                sw      $v1, 0x204($s3)
                lw      $v1, 0x35C($s3)
                ori     $v0, 0x9000
                sw      $v0, 0x158($s3)
                lw      $v0, 0x2B0($s3)
                ori     $v1, 0x9000
                sw      $v1, 0x35C($s3)
                lw      $v1, 0x4B4($s3)
                ori     $v0, 0x9000
                sw      $v0, 0x2B0($s3)
                lw      $v0, 0x408($s3)
                ori     $v1, 0x9000
                sw      $v1, 0x4B4($s3)
                ori     $v0, 0x9000
                jal     RotMatrix
                sw      $v0, 0x408($s3)
                move    $a0, $s0
                addiu   $a1, $s3, 0x18
                jal     CompM
                addiu   $a2, $sp, 0x20
                lw      $v0, 0x20($sp)
                lh      $v1, 0x232($s2)
                sw      $v0, 0x11C($s2)
                lw      $v0, 0x24($sp)
                nop
                sw      $v0, 0x120($s2)
                lw      $v0, 0x28($sp)
                nop
                sw      $v0, 0x124($s2)
                lw      $v0, 0x2C($sp)
                nop
                sw      $v0, 0x128($s2)
                lw      $v0, 0x30($sp)
                nop
                sw      $v0, 0x12C($s2)
                lw      $v0, 0x30($s3)
                lb      $a0, 0x16A($s2)
                addu    $v0, $v1
                beqz    $a0, loc_80113EA8
                sw      $v0, 0x134($s2)
                lh      $v1, 0x15A($s2)
                lw      $v0, 0x3C($s2)
                lhu     $a0, 0x15A($s2)
                addu    $v0, $v1
                sw      $v0, 0x3C($s2)
                lbu     $v0, 0x14D($s2)
                addiu   $v1, $a0, 5
                sltiu   $v0, 0x23
                bnez    $v0, loc_80113EA8
                sh      $v1, 0x15A($s2)
                addiu   $v0, $a0, 0x37
                sh      $v0, 0x15A($s2)
loc_80113EA8:
                lh      $v0, 0x232($s2)
                lw      $v1, 0x30($s3)
                lw      $a0, 0x3C($s2)
                addiu   $v0, -0xC8
                subu    $v0, $v1
                slt     $v0, $a0
                beqz    $v0, loc_80113F14
                nop
                lb      $v0, 0x16A($s2)
                nop
                beqz    $v0, loc_80113F14
                li      $a0, 4
                move    $a1, $s2
                lhu     $v0, 0x15A($s2)
                lh      $v1, 0x232($a1)
                sll     $v0, 16
                sra     $v0, 19
                negu    $v0, $v0
                addiu   $v1, -0x12C
                sh      $v0, 0x15A($a1)
                lbu     $v0, 0x16A($a1)
                lw      $a2, 0x30($s3)
                addiu   $v0, -1
                subu    $v1, $a2
                sb      $v0, 0x16A($a1)
                jal     Snd_se_enem
                sw      $v1, 0x3C($a1)
loc_80113F14:
                lw      $ra, 0x7C($sp)
                lw      $s6, 0x78($sp)
                lw      $s5, 0x74($sp)
                lw      $s4, 0x70($sp)
                lw      $s3, 0x6C($sp)
                lw      $s2, 0x68($sp)
                lw      $s1, 0x64($sp)
                lw      $s0, 0x60($sp)
                jr      $ra
                addiu   $sp, 0x80