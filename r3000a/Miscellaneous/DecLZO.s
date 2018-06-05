
.org DecLZO
                lui     $t6, 0x1F80
                move    $t3, $0
                li      $v1, 0x20

loc_20C:
                addu    $v0, $t6, $t3
                sb      $v1, 0($v0)
                addiu   $t3, 1
                sltiu   $v0, $t3, 0x1EF
                bnez    $v0, loc_20C
                move    $a3, $0
                li      $t3, 0x1EF
                lw      $t7, 0($a0)
                addiu   $a0, 4
                beqz    $t7, locret_374
                move    $t1, $0

loc_238:
                bnez    $a3, loc_250
                and     $v1, $t2, $a3
                lbu     $t2, 0($a0)
                addiu   $a0, 1
                li      $a3, 0x80
                and     $v1, $t2, $a3

loc_250:
                beqz    $v1, loc_2B4
                srl     $a3, 1
                li      $a2, 8
                move    $v1, $0
                addu    $t5, $t6, $t3
                addiu   $t3, 1
                addu    $t4, $a1, $t1
                addiu   $t0, $t1, 1

loc_270:
                bnez    $a3, loc_288
                and     $v0, $t2, $a3
                lbu     $t2, 0($a0)
                addiu   $a0, 1
                li      $a3, 0x80
                and     $v0, $t2, $a3

loc_288:
                beqz    $v0, loc_294
                sll     $v1, 1
                ori     $v1, 1

loc_294:
                addiu   $a2, 0xFFFF
                bnez    $a2, loc_270
                srl     $a3, 1
                move    $t1, $t0
                andi    $t3, 0x1FF
                sb      $v1, 0($t4)
                j       loc_368
                sb      $v1, 0($t5)

loc_2B4:
                li      $v1, 9
                move    $t4, $0

loc_2BC:
                bnez    $a3, loc_2D4
                and     $v0, $t2, $a3
                lbu     $t2, 0($a0)
                addiu   $a0, 1
                li      $a3, 0x80
                and     $v0, $t2, $a3

loc_2D4:
                beqz    $v0, loc_2E0
                sll     $t4, 1
                ori     $t4, 1

loc_2E0:
                addiu   $v1, 0xFFFF
                bnez    $v1, loc_2BC
                srl     $a3, 1
                li      $a2, 4
                move    $v1, $0

loc_2F4:
                bnez    $a3, loc_30C
                and     $v0, $t2, $a3
                lbu     $t2, 0($a0)
                addiu   $a0, 1
                li      $a3, 0x80
                and     $v0, $t2, $a3

loc_30C:
                beqz    $v0, loc_318
                sll     $v1, 1
                ori     $v1, 1

loc_318:
                addiu   $a2, 0xFFFF
                bnez    $a2, loc_2F4
                srl     $a3, 1
                move    $t0, $0
                addiu   $t5, $v1, 1
                addu    $a2, $t1, $a1

loc_330:
                addiu   $t1, 1
                addu    $v0, $t6, $t3
                addiu   $t3, 1
                andi    $t3, 0x1FF
                addu    $v1, $t4, $t0
                andi    $v1, 0x1FF
                addu    $v1, $t6, $v1
                lbu     $v1, 0($v1)
                addiu   $t0, 1
                sb      $v1, 0($a2)
                sb      $v1, 0($v0)
                sltu    $v1, $t5, $t0
                beqz    $v1, loc_330
                addiu   $a2, 1

loc_368:
                sltu    $v0, $t1, $t7
                bnez    $v0, loc_238
                nop

locret_374:
                jr      $ra
                nop