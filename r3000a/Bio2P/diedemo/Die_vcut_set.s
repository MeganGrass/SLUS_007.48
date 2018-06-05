
                lw      $v0, 0x800CFB74		;; G.System_flg
                la      $a1, 0x801938B0
                andi    $v0, 0x800
                beqz    $v0, loc_80190EAC
                li      $v1, 0xFFFFFFFF
                li      $v0, 1
                sh      $v1, 0x801938B4
                sh      $v0, 0x801938B6
                sh      $v1, 0x801938B8
                sh      $v1, 0x801938BA
                sh      $v0, 0x801938BC
                sh      $v0, 0x801938BE
                sh      $v0, 0x801938C0
                sh      $v1, 0x801938C2
                j       loc_80190EDC
                nop
loc_80190EAC:
                move    $a0, $0
loc_80190EB0:
                sll     $v1, $a0, 16
                addiu   $v0, $a0, 1
                move    $a0, $v0
                sra     $v1, 14
                addu    $v1, $a1, $v1
                sll     $v0, 16
                sra     $v0, 16
                slti    $v0, 4
                sh      $0, 4($v1)
                bnez    $v0, loc_80190EB0
                sh      $0, 6($v1)
loc_80190EDC:
                sw      $a1, 0x800CE338		;; G.Cccut
                jr      $ra
                nop