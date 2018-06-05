

				;; Stack
				addiu   $sp, -0x18
				sw      $ra, 0x10($sp)

				;; Print
				sw		$a0, 0x28($sp)	;; String
				move	$a0, $a1		;; X
				move	$a1, $a2		;; Y
				move	$a2, $a3		;; Color
				move    $a3, $0			;; Character Spacing (8x8/Standard)
				sll     $a2, 4
				or      $a2, $a3
                jal     Print_main
                addiu   $a3, $sp, 0x28

				;; Stack
				lw      $ra, 0x10($sp)
				addiu   $sp, 0x18
				jr      $ra
				nop
