
					;; Stack
					addiu	$sp, -0x28
					sw		$s0, 0x28+-0x10($sp)
					sw		$s1, 0x28+-0x0C($sp)
					sw		$s2, 0x28+-0x08($sp)
					sw		$ra, 0x28+-0x04($sp)

					;; Refresh
					jal		VSync
					li		$a0, 0xFFFFFFFF

					;; Time
					lw		$s1, G_Game_play_time
					lw		$v1, G_Game_time_offset

					;; Hour
					addu	$s1, $v0
					subu	$s1, $v1
					srl		$v0, $s1, 6
					li		$a0, 0x26D60DD
					multu	$v0, $a0
					la		$s2, @TimeStr00		;; "%02d:"
					sw		$s2, 0x28+-0x18($sp)
					mfhi	$t1
					srl		$s0, $t1, 5
					sw		$s0, 0x28+-0x14($sp)
					li		$a0, 0x10			;; 0xE0
					li		$a1, 0xE0			;; 0xA0
					move	$a2, $0
					jal		Print8
					move	$a3, $0
					
					;; Minute
					sll		$a0, $s0, 3
					subu	$a0, $s0
					sll		$a0, 5
					addu	$a0, $s0
					sll		$v1, $a0, 4
					subu	$v1, $a0
					sll		$v1, 6
					subu	$v1, $s1, $v1
					li		$s0, 0x91A2B3C5
					multu	$v1, $s0
					mfhi	$t1
					srl		$a0, $t1, 11
					sw		$s2, 0x28+-0x18($sp)
					sw		$a0, 0x28+-0x14($sp)
					li		$a0, 0x28			;; 0xF8
					li		$a1, 0xE0			;; 0xA0
					move	$a2, $0
					jal		Print8
					move	$a3, $0

					;; Second
					multu	$s1, $s0
					mfhi	$t1
					srl		$v1, $t1, 11
					sll		$a0, $v1, 3
					subu	$a0, $v1
					sll		$a0, 5
					addu	$a0, $v1
					sll		$a0, 4
					subu	$s1, $a0
					li		$a0, 0x88888889
					multu	$s1, $a0
					la		$a0, @TimeStr01		;; "%02d"
					sw		$a0, 0x28+-0x18($sp)
					mfhi	$t1
					srl		$a0, $t1, 5
					sw		$a0, 0x28+-0x14($sp)
					li		$a0, 0x40			;; 0x110
					li		$a1, 0xE0			;; 0xA0
					move	$a2, $0
					jal		Print8
					move	$a3, $0

					;; Complete
					lw		$ra, 0x28+-0x04($sp)
					lw		$s2, 0x28+-0x08($sp)
					lw		$s1, 0x28+-0x0C($sp)
					lw		$s0, 0x28+-0x10($sp)
					jr		$ra
					addiu	$sp, 0x28

@TimeStr00:			.ascii	"%02d:",0x00
					.align
@TimeStr01:			.ascii	"%02d",0x00
					.align
