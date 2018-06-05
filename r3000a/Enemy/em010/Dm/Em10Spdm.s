

.org 0x80113510
                addiu   $sp, -0x30
                sw      $s1, 0x1C($sp)
                move    $s1, $a0
                sw      $ra, 0x28($sp)
                sw      $s3, 0x24($sp)
                sw      $s2, 0x20($sp)
                sw      $s0, 0x18($sp)
                lw      $s3, 0x198($s1)
                jal     Rnd
                li      $s0, 0x80
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x10($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x12($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x14($sp)
                sll     $v0, 3
                addiu   $v0, 0x13E8
                lui     $s2, 0x600
                or      $a0, $v0, $s2
                addiu   $a3, $sp, 0x10
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s3, 0x48
                lw      $s3, 0x198($s1)
                jal     Rnd
                nop
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x10($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x12($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x14($sp)
                sll     $v0, 3
                addiu   $v0, 0x1000
                or      $a0, $v0, $s2
                addiu   $a3, $sp, 0x10
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s3, 0x48
                lw      $s3, 0x198($s1)
                jal     Rnd
                nop
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x10($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x12($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x14($sp)
                sll     $v0, 3
                addiu   $v0, 0x1000
                or      $a0, $v0, $s2
                addiu   $a3, $sp, 0x10
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s3, 0x48
                lw      $s3, 0x198($s1)
                jal     Rnd
                nop
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x10($sp)
                subu    $v0, $s0, $v0
                jal     Rnd
                sh      $v0, 0x12($sp)
                subu    $s0, $v0
                jal     Rnd
                sh      $s0, 0x14($sp)
                sll     $v0, 3
                addiu   $v0, 0xC18
                or      $a0, $v0, $s2
                addiu   $a3, $sp, 0x10
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s3, 0x48
                lw      $s3, 0x198($s1)
                jal     Rnd
                nop
                sll     $v0, 3
                addiu   $v0, 0x1000
                lui     $a0, 0x40C
                or      $a0, $v0, $a0
                move    $a3, $0
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s3, 0x48
                lw      $s0, 0x198($s1)
                jal     Rnd
                nop
                sll     $v0, 3
                addiu   $v0, 0xC18
                or      $a0, $v0, $s2
                addiu   $a3, $sp, 0x10
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s0, 0x654
                lw      $s0, 0x198($s1)
                jal     Rnd
                nop
                sll     $v0, 3
                addiu   $v0, 0xC18
                or      $a0, $v0, $s2
                addiu   $a3, $sp, 0x10
                lh      $a1, 0x76($s1)
                jal     Esp_call
                addiu   $a2, $s0, 0x24C
                lw      $ra, 0x28($sp)
                lw      $s3, 0x24($sp)
                lw      $s2, 0x20($sp)
                lw      $s1, 0x1C($sp)
                lw      $s0, 0x18($sp)
                jr      $ra
                addiu   $sp, 0x30