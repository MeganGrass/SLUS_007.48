

;; Cd_read_s
.org 0x800132B0
				addiu	$sp, -0x30
				sw		$s3, 0x30+-0x14($sp)
				move	$s3, $a0					;; File_no
				sw		$s5, 0x30+-0x0C($sp)
				move	$s5, $a2					;; Address
				sw		$s2, 0x30+-0x18($sp)
				move	$s2, $a3					;; Vab_id
				sw		$s1, 0x30+-0x1C($sp)
				la		$s1, 0x800D5300				;; CD
				sw		$s4, 0x30+-0x10($sp)
				move	$s4, $a1					;; Mode
				sw		$ra, 0x30+-0x08($sp)
				sw		$s0, 0x30+-0x20($sp)
@ReadFilePos:
				bnez	$s4, @ArchiveMode			;; Is CD.Fsize and CD.Fsector Already Set?
				move	$s0, $0
				sll		$v0, $s3, 3
				li		$v1, pDiscTable				;; fpos[0]
				addu	$v1, $v0, $v1				;; fpos[File_no]
				lw		$v0, 0x00($v1)				;; fpos[File_no].size
				lw		$v1, 0x04($v1)				;; fpos[File_no].sector
				sw		$v0, 0x08($s1)				;; CD.Fsize
				sw		$v1, 0x14($s1)				;; CD.Fsector
@ArchiveMode:
				move	$v1, $s1					;; CD
@Initialize:
				addu	$v0, $s1, $s0
				sb		$0,  0x85C($v0)				;; CD.Ring_status
				sh		$0,  0x868($v1)				;; CD.Ring_size
				addiu	$s0, 1
				slti	$v0, $s0, 0xC
				bnez	$v0, @Initialize
				addiu	$v1, 2
				lw		$v1, 0x08($s1)				;; CD.Fsize
				li		$v0, 1
				sw		$0,  0x800D7668
				sb		$v0, 0x00($s1)				;; CD.Cd_rtn_no
				li		$v0, 2
				sb		$v0, 0x03($s1)				;; CD.Type
				lw		$v0, 0x14($s1)				;; CD.Fsector
				lw		$a0, 0x08($s1)				;; CD.Fsize
				sh		$s3, 0x1C($s1)				;; CD.Fno
				sw		$s5, 0x854($s1)				;; CD.Buff_adr
				sh		$0,  0x1A($s1)				;; CD.Fsector_read
				sw		$0,  0x10($s1)				;; CD.Fsize_read
				sb		$0,  0x35($s1)				;; CD.Limit_break
				sb		$0,  0x859($s1)				;; CD.Write_ctr
				sb		$0,  0x858($s1)				;; CD.Read_ctr
				sb		$0,  0x85A($s1)				;; CD.First_flg
				sb		$0,  0x36($s1)				;; CD.Time_ctr
				addiu	$v1, 0x7FF
				srl		$v1, 11
				sh		$v1, 0x18($s1)				;; CD.Fsector_num
				sw		$v0, 0x28($s1)				;; CD.Current_sector

				;; Prepare
				jal		DsFlush						;; Flush the Command Queue
				sw		$a0, 0x0C($s1)				;; CD.Fsize_now
				lw		$a0, 0x28($s1)				;; CD.Current_sector
				la		$a1, 0x800D5304				;; CD.Fpos
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
				la		$a1, 0x8009A42A				;; Command Argument :: DslModeSpeed | DslModeSize1
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
				la		$a0, Cd_ready_cb
				jal		DsReadyCallback
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
				bne		$v0, $v1, loc_8001366C		;; DsSystemStatus = DslReady?
				nop
				jal		DsStatus					;; Get Status of CD SubSystem
				nop
				andi	$v0, 0x20					;; DslStatRead
				bnez	$v0, loc_800134A8			;; DsStatus() = DslStatRead?
				li		$v0, 6
				j		loc_8001366C
				sb		$v0, 0x00($s1)				;; CD.Cd_rtn_no
loc_800134A8:
				lw		$v0, 0x0C($s1)				;; CD.Fsize_now
				nop
				bnez	$v0, loc_8001366C
				nop
				lhu		$v0, 0x18($s1)				;; CD.Fsector_num
				nop
				bnez	$v0, loc_8001366C
				nop
				sb		$0,  0x00($s1)				;; CD.Cd_rtn_no
				sb		$0,  0x35($s1)				;; CD.Limit_break
				nop
@DoDsCommand04:
				li		$a0, 0x09					;; Command Code :: DslPause
				move	$a1, $0						;; Command Argument
				move	$a2, $0						;; Callback Function
				jal		DsCommand					;; Add Primitive Command to Command Queue
				li		$a3, 0xFFFFFFFF				;; Number of Retries (-1)
				beqz	$v0, @DoDsCommand04			;; Retry
				nop
				j		loc_8001366C				;; Complete
				nop
loc_80013518:
				lbu		$v0, 0x85A($s1)				;; CD.First_flg
				nop
				beqz	$v0, loc_80013590
				li		$v0, 1
				sw		$0,  0x800D7668
loc_80013530:
				jal		SsVabTransCompleted
				move	$a0, $0
				sll		$v0, 16
				bnez	$v0, loc_80013598
				sll		$a2, $s2, 16
				lw		$v1, 0x800D7668
				nop
				addiu	$v0, $v1, 1
				sltiu	$v1, 0xBB9
				sw		$v0, 0x800D7668
				bnez	$v1, loc_80013530
				nop
				jal		EnterCriticalSection
				nop
				li		$a0, 0xF0000009
				jal		DeliverEvent
				li		$a1, 0x20
				jal		ExitCriticalSection
				nop
				j		loc_80013530
				nop
loc_80013590:
				sb		$v0, 0x85A($s1)				;; CD.First_flg
				sll		$a2, $s2, 16
loc_80013598:
				lbu		$a0, 0x859($s1)				;; CD.Write_ctr
				sra		$a2, 16
				sll		$v0, $a0, 1
				addu	$v0, $s1
				lhu		$a1, 0x868($v0)				;; CD.Ring_size
				lw		$v0, 0x854($s1)				;; CD.Buff_adr
				sll		$a0, 11
				jal		SsVabTransBodyPartly
				addu	$a0, $v0, $a0
				sll		$v0, 16
				sra		$s0, $v0, 16
				bne		$s0, $s2, loc_80013634
				li		$v0, 0xFFFFFFFF
				sw		$0,  0x800D7668
loc_800135D4:
				jal		SsVabTransCompleted
				move	$a0, $0
				sll		$v0, 16
				bnez	$v0, loc_80013634
				li		$v0, 0xFFFFFFFF
				lw		$v1, 0x800D7668
				nop
				addiu	$v0, $v1, 1
				sltiu	$v1, 0xBB9
				sw		$v0, 0x800D7668
				bnez	$v1, loc_800135D4
				nop
				jal		EnterCriticalSection
				nop
				li		$a0, 0xF0000009
				jal		DeliverEvent
				li		$a1, 0x20
				jal		ExitCriticalSection
				nop
				j		loc_800135D4
				nop
loc_80013634:
				beq		$s0, $v0, loc_800136B8
				li		$v1, 0xC
				lbu		$v0, 0x859($s1)				;; CD.Write_ctr
				nop
				addu	$v0, $s1, $v0
				sb		$0,  0x85C($v0)				;; CD.Ring_status
				lbu		$v0, 0x859($s1)				;; CD.Write_ctr
				nop
				addiu	$v0, 1
				sb		$v0, 0x859($s1)				;; CD.Write_ctr
				andi	$v0, 0xFF
				bne		$v0, $v1, loc_8001366C
				nop
				sb		$0,  0x859($s1)				;; CD.Write_ctr
loc_8001366C:
				lbu		$v0, 0x859($s1)				;; CD.Write_ctr
				nop
				addu	$v0, $s1, $v0
				lbu		$v0, 0x85C($v0)				;; CD.Ring_status
				nop
				bnez	$v0, loc_80013518
				nop
				jal		Task_sleep
				li		$a0, 1
				lbu		$v1, 0x00($s1)				;; CD.Cd_rtn_no
				nop
				sltiu	$v0, $v1, 2
				beqz	$v0, @ReadFilePos
				nop
				bnez	$v1, @DoDsSystemStatus
				nop
				lw		$v0, 0x10($s1)				;; CD.Fsize_read
				j		loc_800136EC
				nop
loc_800136B8:
				jal		DsSyncCallback
				move	$a0, $0
				jal		DsReadyCallback
				move	$a0, $0
loc_800136C8:
				jal		SsVabTransCompleted
				move	$a0, $0
				sll		$v0, 16
				beqz	$v0, loc_800136C8
				nop
				jal		Task_sleep
				li		$a0, 0x1E
				sb		$0,  0x00($s1)				;; CD.Cd_rtn_no
				li		$v0, 0xFFFFFFFF
loc_800136EC:
				lw		$ra, 0x30+-0x08($sp)
				lw		$s5, 0x30+-0x0C($sp)
				lw		$s4, 0x30+-0x10($sp)
				lw		$s3, 0x30+-0x14($sp)
				lw		$s2, 0x30+-0x18($sp)
				lw		$s1, 0x30+-0x1C($sp)
				lw		$s0, 0x30+-0x20($sp)
				addiu	$sp, 0x30
				jr		$ra
				nop
