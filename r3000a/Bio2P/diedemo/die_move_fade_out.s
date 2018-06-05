
				;; Boot
                addiu   $sp, -0x18
                sw      $ra, 0x10($sp)

				jal     Snd_bgm_fade_ON
				li      $a0, 0x3C

				li      $a0, 2
				jal     Bg_set_mode
				move    $a1, $0

				;; Complete
				lhu     $v0, DIEDEMO_CNT0
				nop
				addiu   $v0, 1
				sh      $v0, DIEDEMO_CNT0

				;; Terminate
                lw      $ra, 0x10($sp)
                addiu   $sp, 0x18
                jr      $ra
                nop