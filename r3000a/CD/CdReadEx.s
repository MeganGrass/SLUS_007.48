


;; ULONG CdReadEx(ULONG Sector, ULONG Size, ULONG Address, UINT Parse)
.org CdReadEx

				;; Stack
				addiu   $sp, -0x38
				sw      $s7, 0x38+-0x0C($sp)
				sw      $s6, 0x38+-0x10($sp)
				sw      $s5, 0x38+-0x14($sp)
				sw      $s4, 0x38+-0x18($sp)
				sw      $s3, 0x38+-0x1C($sp)
				sw      $s2, 0x38+-0x20($sp)
				sw      $s1, 0x38+-0x24($sp)
				sw      $s0, 0x38+-0x28($sp)
				sw      $ra, 0x38+-0x08($sp)

				;; Optional
				move	$s2, $a2				;; Address
				move	$s3, $a3				;; Auto-Parse Counter

				;; Initialize
				li		$s1, 0x800D5300			;; CD
				sw		$a0, 0x14($s1)			;; CD.Fsector
				sw		$a1, 0x08($s1)			;; CD.Fsize
				sw		$a0, 0x28($s1)			;; CD.Current_sector
				sw		$a1, 0x0C($s1)			;; CD.Fsize_now
				addiu	$a1, 0x7FF
				srl		$a1, 11
				sh		$a1, 0x18($s1)			;; CD.Fsector_num
				sw		$a2, 0x30($s1)			;; CD.Read_adr
				li		$v0, 1
				sb		$v0, 0x00($s1)			;; CD.Cd_rtn_no
				sb		$v0, 0x03($s1)			;; CD.Type
				sw		$0,  0x10($s1)			;; CD.Fsize_read
				sh		$0,  0x1A($s1)			;; CD.Fsector_read
				sh		$0,  0x1C($s1)			;; CD.Fno
				sb		$0,  0x35($s1)			;; CD.Limit_break
				sb      $0,  0x36($s1)			;; CD.Time_ctr
				sw		$0,  0x8009A410

				;; Prepare
				jal     DsFlush					;; DsFlush
				nop
				lw      $a0, 0x28($s1)			;; Absolute Sector
				la      $a1, 0x800D5304			;; Result Buffer
				jal     DsIntToPos				;; DsIntToPos
				nop
				la      $a0, Cd_seek			;; Callback Function
				jal     DsSyncCallback			;; DsSyncCallback
				nop

@DoDsCommand00:
				li      $a0, 0x09				;; Command Code
				move    $a1, $0					;; Command Argument
				move    $a2, $0					;; Callback Function
				jal     DsCommand				;; DsCommand
				li      $a3, 0xFFFFFFFF			;; Number of Retries
				beqz    $v0, @DoDsCommand00		;; Retry
				nop

@DoDsCommand01:
				li      $a0, 0x0E				;; Command Code
				la      $a1, 0x8009A429			;; Command Argument
				move    $a2, $0					;; Callback Function
				jal     DsCommand				;; DsCommand
				li      $a3, 0xFFFFFFFF			;; Number of Retries
				beqz    $v0, @DoDsCommand01		;; Retry
				nop

@DoDsCommand02:
				li      $a0, 0x15				;; Command Code
				la      $a1, 0x800D5304			;; Command Argument
				move    $a2, $0					;; Callback Function
				jal     DsCommand				;; DsCommand
				li      $a3, 0xFFFFFFFF			;; Number of Retries
				beqz    $v0, @DoDsCommand02		;; Retry
				nop

				;; Ready Callback
				la      $a0, Cd_ready_cb		;; Callback Function
				jal     DsReadyCallback			;; DsReadyCallback
				nop

@DoDsCommand03:
				li      $a0, 0x06				;; Command Code
				la      $a1, 0x800D5304			;; Command Argument
				move    $a2, $0					;; Callback Function
				jal     DsCommand				;; DsCommand
				li      $a3, 0xFFFFFFFF			;; Number of Retries
				beqz    $v0, @DoDsCommand03		;; Retry
				nop

@DoDsSystemStatus:
				jal     DsSystemStatus			;; Get Status of Command Queue
				nop
				jal     DsStatus				;; Get Status of CD SubSystem
				nop
				lw      $v0, 0x0C($s1)			;; CD.Fsize_now
				lhu		$v1, 0x18($s1)			;; CD.Fsector_num
				beqz    $v0, @DoDsCommand04		;; Complete
				nop
				bnez    $v1, @DoDsSystemStatus	;; Retry
				nop

@DoDsCommand04:
				li      $a0, 0x09				;; Command Code
				move    $a1, $0					;; Command Argument
				move    $a2, $0					;; Callback Function
				jal     DsCommand				;; DsCommand
				li      $a3, 0xFFFFFFFF			;; Number of Retries
				beqz    $v0, @DoDsCommand04		;; Retry
				nop

@ParseIndex:
				beqz	$s3, @Terminate
				nop
				lw		$a0, 0x04($s2)			;; Sector (Relative)
				lw		$v0, 0x14($s1)			;; Memory Pointer
				nop
				addu	$a0, $v0, $a0			;; Sector (Absolute)
				sw		$a0, 0x04($s2)			;; Write Sector
				addiu	$s2, 8					;; Address
				addiu	$s3, -1					;; Counter
				j		@ParseIndex
				nop

@Terminate:
				sb		$0,  0x00($s1)			;; CD.Cd_rtn_no
				lw		$v0, 0x10($s1)			;; CD.Fsize_read (return value)
				lw      $ra, 0x38+-0x08($sp)
				lw      $s7, 0x38+-0x0C($sp)
				lw      $s6, 0x38+-0x10($sp)
				lw      $s5, 0x38+-0x14($sp)
				lw      $s4, 0x38+-0x18($sp)
				lw      $s3, 0x38+-0x1C($sp)
				lw      $s2, 0x38+-0x20($sp)
				lw      $s1, 0x38+-0x24($sp)
				lw      $s0, 0x38+-0x28($sp)
				jr      $ra
				addiu   $sp, 0x38
