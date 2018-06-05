

.org 0x8006AFD8
				j		DebugStatus
				nop

.org DebugStatus
				lbu		$v0, 0x800D5BFE			;; STATUS.Mcursol0
				li		$v1, 0x02
				bne		$v0, $v1, @Terminate
				nop

				;; Test
				lhu		$v0, G_Padd1Trg
				nop
				li		$v1, PAD_WEP_PREV
				beq		$v0, $v1, @ItmPrev		;; L2 button was pressed
				li		$v1, PAD_WEP_NEXT
				beq		$v0, $v1, @ItmNext		;; R2 button was pressed
				nop
				j		@Terminate
				nop

@ItmPrev:		la		$a0, G_Item_work		;; Inventory Items
				lbu		$v0, 0x800D5BFC			;; STATUS.Icursol_main
				li		$v1, 4
				multu	$v1, $v0
				mflo	$v1
				addu	$v0, $v1, $a0
				lbu		$a1, 0x00($v0)
				nop
				beqz	$a1, @PrevItem00
				nop
				addiu	$a1, -1
				sb		$a1, 0x00($v0)
				j		@Complete
				nop
				@PrevItem00:
				li		$a1, 99
				sb		$a1, 0x00($v0)
				j		@Complete
				nop

@ItmNext:		la		$a0, G_Item_work		;; Inventory Items
				lbu		$v0, 0x800D5BFC			;; STATUS.Icursol_main
				li		$v1, 4
				multu	$v1, $v0
				mflo	$v1
				addu	$v0, $v1, $a0
				lbu		$a1, 0x00($v0)
				li		$v1, 99
				bne		$a1, $v1, @NextItem00
				nop
				li		$a1, 2
				sb		$a1, 0x00($v0)
				j		@Complete
				nop
				@NextItem00:
				addiu	$a1, 1
				sb		$a1, 0x00($v0)

@Complete:		lbu		$a0, 0x800D5BFC			;; STATUS.Icursol_main
				li      $a2, 0xFF
				jal     Set_iwork
				move    $a3, $0

@Terminate:		jal		0x80073350				;; St_disp_cursol0
				nop
				j		0x8006AFE0
				nop
