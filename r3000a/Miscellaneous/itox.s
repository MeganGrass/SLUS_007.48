

.org Doitox
                addiu   $a1, 4
                sb      $0,  0($a1)
                li      $v1, 4
                li		$a2, 0x800A2094		;; ascii_tbl

loc_80160028:
                addiu   $a1, -1
                andi    $v0, $a0, 0xF
                addu    $v0, $a2
                lbu     $v0, 0($v0)
                addiu   $v1, -1
                sb      $v0, 0($a1)
                andi    $v0, $v1, 0xFF
                bnez    $v0, loc_80160028
                srl     $a0, 4

				;; Terminate
                jr      $ra
                nop
