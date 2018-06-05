

                lh      $v1, 0x800D4820		;; G.Save.Cut_no
                lw      $a0, 0x800CE324		;; G.pRoom
                sll     $v0, $v1, 2
                addu    $v0, $v1
                lw      $v1, 0x2C($a0)
                sll     $v0, 3
                addu    $v1, $v0
                lw      $v0, 0x80193888
                lw      $a1, 0x800CFD90		;; G.Player.pSin_parts_ptr
                addiu   $v0, 0x1F4
                sh      $v0, 0x1C($v1)
                lw      $v0, 0x8019388C
                nop
                addiu   $v0, 0xBB8
                sh      $v0, 0x1E($v1)
                lw      $a0, 0x80193890
                li      $v0, 0x84
                sb      $v0, 0xA($v1)
                sb      $v0, 0xB($v1)
                sb      $v0, 0xC($v1)
                li      $v0, 0x1F40
                sh      $v0, 0x26($v1)
                addiu   $a0, 0x1F4
                sh      $a0, 0x20($v1)
                lw      $v0, 0x5C($a1)
                nop
                sh      $v0, 0x10($v1)
                lw      $v0, 0x60($a1)
                nop
                addiu   $v0, -0x12C
                sh      $v0, 0x12($v1)
                lw      $a0, 0x64($a1)
                li      $v0, 0x78
                sb      $v0, 4($v1)
                sb      $v0, 5($v1)
                sb      $v0, 6($v1)
                li      $v0, 0xFA0
                sh      $v0, 0x22($v1)
                sb      $0, 1($v1)
                sb      $0, 7($v1)
                sb      $0, 8($v1)
                sb      $0, 9($v1)
                jr      $ra
                sh      $a0, 0x14($v1)