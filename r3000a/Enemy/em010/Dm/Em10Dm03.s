
.org 0x80113F40
				addiu   $sp, -0x30
                sw      $s0, 0x20($sp)
                move    $s0, $a0
                sw      $s1, 0x24($sp)
                move    $s1, $a1
                sw      $s2, 0x28($sp)
                sw      $ra, 0x2C($sp)
                li      $v0, -450
                sh      $v0, 0x10($sp)
                li      $v0, 0xFA
                sh      $v0, 0x12($sp)
                lbu     $v1, 6($s0)
                li      $v0, 1
                beq     $v1, $v0, loc_80113FD4
                move    $s2, $a2
                slti    $v0, $v1, 2
                beqz    $v0, loc_80113F98
                nop
                beqz    $v1, loc_80113FAC
                lui     $a0, 3
                j       loc_80114020
                nop
loc_80113F98:
                li      $v0, 2
                beq     $v1, $v0, loc_8011401C
                li      $v0, 0x101
                j       loc_80114020
                nop
loc_80113FAC:
                ori     $a0, 4
                li      $v0, 1
                sb      $v0, 6($s0)
                lhu     $v0, 0x1D0($s0)
                li      $v1, 0xA
                sh      $v1, 0x15A($s0)
                andi    $v0, 0x20
                sltu    $v0, $0, $v0
                subu    $a0, $v0
                sw      $a0, 0x14C($s0)
loc_80113FD4:
                move    $a0, $s0
                move    $a1, $s1
                move    $a2, $s2
                jal     Spd_get
                move    $a3, $0
                move    $a0, $s0
                move    $a1, $s1
                move    $a2, $s2
                jal     Joint_move
                li      $a3, 0x400
                move    $a0, $s0
                lbu     $v1, 6($a0)
                move    $a1, $0
                addu    $v1, $v0
                jal     Add_speedXZ
                sb      $v1, 6($a0)
                j       loc_80114020
                nop
loc_8011401C:
                sw      $v0, 4($s0)
loc_80114020:
                lw      $ra, 0x2C($sp)
                lw      $s2, 0x28($sp)
                lw      $s1, 0x24($sp)
                lw      $s0, 0x20($sp)
                jr      $ra
                addiu   $sp, 0x30