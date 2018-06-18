

;; Cd_read
.org 0x80012FB8
				addiu	$sp, -0x38
				sw		$s5, 0x38+-0x14($sp)
				move	$s5, $a0					;; File_no
				sw		$s7, 0x38+-0x0C($sp)
				move	$s7, $a1					;; Address
				sw		$s1, 0x38+-0x24($sp)
				la		$s1, 0x800D5300				;; CD
				sw		$s6, 0x38+-0x10($sp)
				move	$s6, $a2					;; Mode
				sw		$ra, 0x38+-0x08($sp)
				sw		$s4, 0x38+-0x18($sp)
				sw		$s3, 0x38+-0x1C($sp)
				sw		$s2, 0x38+-0x20($sp)
				sw		$s0, 0x38+-0x28($sp)

				;; Address
				la		$a0, @Str00
				jal		pSXPrint
				move	$a1, $s7

				;; File_no
				la		$a0, @Str01
				jal		pSXPrint
				move	$a1, $s5

@ReadFilePos:
				move	$s2, $s6					;; Mode Copy
				sltiu	$v0, $s6, 2					;; Mode Test
				beqz	$v0, @ArchiveMode			;; Is CD.Fsize and CD.Fsector Already Set?
				sll		$v0, $s5, 3					;; File_no
				li		$v1, pDiscTable				;; fpos[0]
				addu	$v1, $v0, $v1				;; fpos[File_no]
				lw		$v0, 0x00($v1)				;; fpos[File_no].size
				lw		$v1, 0x04($v1)				;; fpos[File_no].sector
				sw		$v0, 0x08($s1)				;; CD.Fsize
				j		@Initialize
				sw		$v1, 0x14($s1)				;; CD.Fsector
@ArchiveMode:
				addiu	$s2, -2						;; CD.Fsize and CD.Fsector Is Already Set
@Initialize:
				lw		$v0, 0x14($s1)				;; CD.Fsector
				lw		$v1, 0x08($s1)				;; CD.Fsize
				sw		$v0, 0x28($s1)				;; CD.Current_sector
				sw		$v1, 0x0C($s1)				;; CD.Fsize_now
				addiu	$v1, 0x7FF
				srl		$v1, 11
				sh		$v1, 0x18($s1)				;; CD.Fsector_num
				sw		$s7, 0x30($s1)				;; CD.Read_adr
				li		$v0, 1
				sb		$v0, 0x00($s1)				;; CD.Cd_rtn_no
				sb		$v0, 0x03($s1)				;; CD.Type
				sw		$0,  0x10($s1)				;; CD.Fsize_read
				sh		$0,  0x1A($s1)				;; CD.Fsector_read
				sh		$s5, 0x1C($s1)				;; CD.Fno
				sb		$0,  0x35($s1)				;; CD.Limit_break
				sb		$0,  0x36($s1)				;; CD.Time_ctr
				sw		$0,  0x8009A410				;; UNKNOWN

				;; Prepare
				jal		DsFlush						;; Flush the Command Queue
				nop
				lw		$a0, 0x28($s1)				;; Absolute Sector
				la		$a1, 0x800D5304				;; Result Buffer :: CD.Fpos
				jal		DsIntToPos					;; Get Minutes, Seconds and Sectors from Absolute Sector Number
				nop
				la		$a0, Cd_seek				;; Callback Function
				jal		DsSyncCallback				;; Set Sync Callback Function
				nop
@DoDsCommand00:
				li		$a0, 0x09					;; Command Code :: DslPause
				move	$a1, $0						;; Command Argument
				move	$a2, $0						;; Callback Function
				jal		DsCommand					;; Add Primitive Command to Command Queue
				li		$a3, 0xFFFFFFFF				;; Number of Retries (-1)
				beqz	$v0, @DoDsCommand00			;; Retry
				nop
@DoDsCommand01:
				li		$a0, 0x0E					;; Command Code :: DslSetmode
				la		$a1, 0x8009A429				;; Command Argument :: DslModeSpeed | DslModeSize1
				move	$a2, $0						;; Callback Function
				jal		DsCommand					;; Add Primitive Command to Command Queue
				li		$a3, 0xFFFFFFFF				;; Number of Retries (-1)
				beqz	$v0, @DoDsCommand01			;; Retry
				nop
@DoDsCommand02:
				li		$a0, 0x15					;; Command Code :: DslSeekL
				la		$a1, 0x800D5304				;; Command Argument :: CD.Fpos
				move	$a2, $0						;; Callback Function
				jal		DsCommand					;; Add Primitive Command to Command Queue
				li		$a3, 0xFFFFFFFF				;; Number of Retries (-1)
				beqz	$v0, @DoDsCommand02			;; Retry
				nop

				;; Ready Callback
				la		$a0, Cd_ready_cb			;; Callback Function
				jal		DsReadyCallback				;; Set Ready Callback Function
				nop
@DoDsCommand03:
				li		$a0, 0x06					;; Command Code :: DslReadN
				la		$a1, 0x800D5304				;; Command Argument :: CD.Fpos
				move	$a2, $0						;; Callback Function
				jal		DsCommand					;; Add Primitive Command to Command Queue
				li		$a3, 0xFFFFFFFF				;; Number of Retries (-1)
				beqz	$v0, @DoDsCommand03			;; Retry
				nop
@DoDsSystemStatus:
				jal		DsSystemStatus				;; Get Status of Command Queue
				nop
				li		$v1, 1						;; DslReady
				bne		$v0, $v1, loc_80013210		;; DsSystemStatus = DslReady?
				nop
				jal		DsStatus					;; Get Status of CD SubSystem
				nop
				andi	$v0, 0x20					;; DslStatRead
				beqz	$v0, loc_8001323C			;; DsStatus() = DslStatRead?
				nop
				lw		$v0, 0x0C($s1)				;; CD.Fsize_now
				lhu		$v1, 0x18($s1)				;; CD.Fsector_num
				bnez	$v0, @Task_sleep			;; Was the entire file loaded?
				nop
				bnez	$v1, @Task_sleep			;; Were all sectors parsed?
				nop

				;; Operation Complete
				sb		$0,  0x00($s1)				;; CD.Cd_rtn_no
				sb		$0,  0x35($s1)				;; CD.Limit_break

@DoDsCommand04:
				li		$a0, 0x09					;; Command Code :: DslPause
				move	$a1, $0						;; Command Argument
				move	$a2, $0						;; Callback Function
				jal		DsCommand					;; Add Primitive Command to Command Queue
				li		$a3, 0xFFFFFFFF				;; Number of Retries (-1)
				beqz	$v0, @DoDsCommand04			;; Retry
				nop
				j		@Task_sleep					;; Complete
				nop
loc_80013210:
				lw		$v0, 0x8009A410				;; UNKNOWN
				nop
				addiu	$v0, 1
				sw		$v0, 0x8009A410				;; UNKNOWN
				slti	$v0, 0x259
				bnez	$v0, @Task_sleep
				nop
				sw		$0,  0x8009A40C				;; UNKNOWN
loc_8001323C:
				li		$v0, 6						;; CD Return Fail
				sb		$v0, 0x00($s1)				;; CD.Cd_rtn_no
@Task_sleep:
				beqz	$s2, @VSync					;; 
				nop
				jal		Task_sleep					;; Rest System
				li		$a0, 1						;; One (1) Cycle
				j		@TestResults
				nop
@VSync:
				jal		VSync						;; Wait for Next Vertical Blank
				move	$a0, $0						;; Mode :: Wait Until Vertical Sync is Generated
@TestResults:
				lbu		$v1, 0x00($s1)				;; CD.Cd_rtn_no
				nop
				sltiu	$v0, $v1, 2					;; CD Return Test
				beqz	$v0, @ReadFilePos			;; Is CD Return Flag Zero(0)?
				nop
				bnez	$v1, @DoDsSystemStatus		;; Is CD Return Flag Zero(0)?
				nop
				lw		$v0, 0x10($s1)				;; Return Value :: CD.Fsize_read
				lw		$ra, 0x38+-0x08($sp)
				lw		$s7, 0x38+-0x0C($sp)
				lw		$s6, 0x38+-0x10($sp)
				lw		$s5, 0x38+-0x14($sp)
				lw		$s4, 0x38+-0x18($sp)
				lw		$s3, 0x38+-0x1C($sp)
				lw		$s2, 0x38+-0x20($sp)
				lw		$s1, 0x38+-0x24($sp)
				lw		$s0, 0x38+-0x28($sp)
				addiu	$sp, 0x38
				jr		$ra
				nop
				
@Str00:			.ascii	"Cd_read:",0x09,"addr=%x",0x09,0x00
				.align
@Str01:			.ascii	"file=%x",0x0D,0x0A,0x00
				.align