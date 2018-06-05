
                addiu   $sp, -0x18
                li      $a0, 0x11			;; File_no
                li      $a1, 0x80198000
                li      $a3, DIEDEMO_LOAD	;; "YOUDIED.TIM"
                sw      $ra, 0x10($sp)
                jal     Cd_read
                move    $a2, $0
                li      $v0, 0x1F15
                sh      $v0, 0x800CFBF0		;; G_Ctpage
                li      $a0, 0x80198000
                jal     Mapping_tim
				nop
                lw      $ra, 0x10($sp)
                addiu   $sp, 0x18
                jr      $ra
                nop