

.org 0x80113128
                addiu   $sp, -0x28
                sw      $s0, 0x18($sp)
                move    $s0, $a0
                sw      $ra, 0x20($sp)
                sw      $s1, 0x1C($sp)
                lhu     $v0, 0x10E($s0)
                nop
                ori     $v0, 0x80
                sh      $v0, 0x10E($s0)
                li      $v0, 0xC8
                sh      $0, 0x10($sp)
                sh      $v0, 0x12($sp)
                sh      $0, 0x14($sp)
                lw      $s1, 0x198($s0)
                jal     Rnd
                nop
                andi    $v0, 1
                beqz    $v0, loc_801131E4
                lui     $a0, 0x503
                li      $a0, 0x5032710
                addiu   $a2, $s1, 0x48
                lh      $a1, 0x76($s0)
                jal     Esp_call
                addiu   $a3, $sp, 0x10
                lw      $a2, 0x198($s0)
                nop
                lw      $v0, 0x560($a2)
                nop
                andi    $v0, 1
                beqz    $v0, loc_801131BC
                lui     $a0, 0x503
                li      $a0, 0x5031388
                lh      $a1, 0x76($s0)
                addiu   $a2, 0x5A8
                jal     Esp_call
                move    $a3, $0
                lw      $a2, 0x198($s0)
loc_801131BC:
                nop
                lw      $v0, 0x204($a2)
                nop
                andi    $v0, 1
                beqz    $v0, loc_8011325C
                lui     $a0, 0x503
                li      $a0, 0x50313E8
                lh      $a1, 0x76($s0)
                j       loc_80113254
                addiu   $a2, 0x24C
loc_801131E4:
                ori     $a0, 0x2710
                addiu   $a2, $s1, 0x48
                lh      $a1, 0x76($s0)
                jal     Esp_call
                move    $a3, $0
                lw      $a2, 0x198($s0)
                nop
                lw      $v0, 0x204($a2)
                nop
                andi    $v0, 1
                beqz    $v0, loc_8011322C
                lui     $a0, 0x503
                li      $a0, 0x5031388
                lh      $a1, 0x76($s0)
                addiu   $a2, 0x24C
                jal     Esp_call
                addiu   $a3, $sp, 0x10
                lw      $a2, 0x198($s0)
loc_8011322C:
                li      $v0, 0xFFFFFF38
                sh      $v0, 0x12($sp)
                lw      $v0, 0x408($a2)
                nop
                andi    $v0, 1
                beqz    $v0, loc_8011325C
                lui     $a0, 0x503
                li      $a0, 0x50313E8
                lh      $a1, 0x76($s0)
                addiu   $a2, 0x450
loc_80113254:
                jal     Esp_call
                addiu   $a3, $sp, 0x10
loc_8011325C:
                lbu     $v1, 5($s0)
                li      $v0, 0x10
                beq     $v1, $v0, loc_801132F8
                lui     $a1, 0x40
                li      $a1, 0x404040
                lui     $a2, 0x48
                lw      $s1, 0x198($s0)
                li      $a2, 0x484848
                sw      $a1, 0x70($s1)
                lw      $v0, 0x198($s0)
                lui     $a0, 0x70
                sw      $a2, 0x11C($v0)
                lw      $v0, 0x198($s0)
                li      $a0, 0x707070
                sw      $a0, 0x1C8($v0)
                lw      $v0, 0x198($s0)
                lui     $v1, 0x50
                sw      $a0, 0x3CC($v0)
                lw      $v0, 0x198($s0)
                li      $v1, 0x505050
                sw      $v1, 0x5D0($v0)
                lw      $v0, 0x198($s0)
                nop
                sw      $v1, 0x67C($v0)
                lw      $v0, 0x198($s0)
                nop
                sw      $a2, 0x728($v0)
                lw      $v0, 0x198($s0)
                nop
                sw      $a1, 0x7D4($v0)
                lw      $v0, 0x198($s0)
                nop
                sw      $v1, 0x880($v0)
                lw      $v0, 0x198($s0)
                nop
                sw      $a1, 0x92C($v0)
                lw      $v0, 0x198($s0)
                nop
                sw      $a1, 0x9D8($v0)
loc_801132F8:
                lw      $ra, 0x20($sp)
                lw      $s1, 0x1C($sp)
                lw      $s0, 0x18($sp)
                jr      $ra
                addiu   $sp, 0x28