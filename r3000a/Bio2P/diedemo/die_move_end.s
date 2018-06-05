
                addiu   $sp, -0x18
                li      $a2, 0xFFEFFFFF
                li      $a1, 0xBFFFFFFF
                la      $a0, 0x800CFB74		;; G_System_flg
                sw      $ra, 0x10($sp)
                sh      $0, DIEDEMO_CNT0
                lw      $v0, 0($a0)
                li      $v1, 0xFFFFFEFF
                and     $v0, $v1
                and     $v0, $a2
                and     $v0, $a1
                jal     Snd_sys_init2
                sw      $v0, 0($a0)
                jal     Task_exit
                nop
                lw      $ra, 0x10($sp)
                addiu   $sp, 0x18
                jr      $ra
                nop