

;; June 13, 2018
;;
;; Patched Task_lexecute() and Task_lchain() functions to read the Ld_adr variable
;; directly from the Ld_task_tbl structure


;; pLd_adr
.org 0x800107C0
		.fill 0x58


;; Task_lexecute
.org 0x80031EA0
		lui     at, 0x800A
		addu    at, $s0
		lw      $a1, 0x20C0(at)
.org 0x80031EB8
		nop


;; Task_lchain
.org 0x80031F18
		lui     at, 0x800A
		addu    at, $s0
		lw      $a1, 0x20C0(at)
.org 0x80031F30
		nop


;; Game_Loop
.org 0x800257B8
		jal     BOOT_Initialize		;; ".\\r3000a\\Boot\\Initialize.s"


;; Ld_task_tbl
.org 0x800A20B8						;; Task_no		;; 0
		.word	LoadTaskFileBoot	;; File_no		;; BOOT
		.word	LoadTaskFuncBoot	;; Func
		.word	LoadTaskAddrBoot	;; Ld_adr
.org 0x800A20C4						;; Task_no		;; 1
		.word	LoadTaskFileMemory	;; File_no		;; MEM_CARD
		.word	LoadTaskFuncMemory	;; Func
		.word	LoadTaskAddrMemory	;; Ld_adr
.org 0x800A20D0						;; Task_no		;; 2
		.word	LoadTaskFileDieDemo	;; File_no		;; DIEDEMO
		.word	LoadTaskFuncDieDemo	;; Func
		.word	LoadTaskAddrDieDemo	;; Ld_adr
.org 0x800A20DC						;; Task_no		;; 3
		.word	LoadTaskFileSelect	;; File_no		;; SELECT
		.word	LoadTaskFuncSelect	;; Func
		.word	LoadTaskAddrSelect	;; Ld_adr
.org 0x800A20E8						;; Task_no		;; 4
		.word	LoadTaskFileConfig	;; File_no		;; CONFIG
		.word	LoadTaskFuncConfig	;; Func
		.word	LoadTaskAddrConfig	;; Ld_adr
.org 0x800A20F4						;; Task_no		;; 5
		.word	LoadTaskFileOpening	;; File_no		;; OPENING
		.word	LoadTaskFuncOpening	;; Func
		.word	LoadTaskAddrOpening	;; Ld_adr
.org 0x800A2100						;; Task_no		;; 6
		.word	LoadTaskFileEnding	;; File_no		;; ENDING
		.word	LoadTaskFuncEnding	;; Func
		.word	LoadTaskAddrEnding	;; Ld_adr
.org 0x800A210C						;; Task_no		;; 7
		.word	LoadTaskFileResult	;; File_no		;; RESULT
		.word	LoadTaskFuncResult	;; Func
		.word	LoadTaskAddrResult	;; Ld_adr
.org 0x800A2118						;; Task_no		;; 8
		.word	LoadTaskFileTitle	;; File_no		;; TITLE
		.word	LoadTaskFuncTitle	;; Func
		.word	LoadTaskAddrTitle	;; Ld_adr
.org 0x800A2124						;; Task_no		;; 9
		.word	0x00000000			;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x00000000			;; Ld_adr
.org 0x800A2130						;; Task_no		;; 10
		.word	0x00000000			;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x00000000			;; Ld_adr
.org 0x800A213C						;; Task_no		;; 11
		.word	0x00000000			;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x00000000			;; Ld_adr
.org 0x800A2148						;; Task_no		;; 12
		.word	0x00000000			;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x00000000			;; Ld_adr
.org 0x800A2154						;; Task_no		;; 13
		.word	0x00000000			;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x00000000			;; Ld_adr
.org 0x800A2160						;; Task_no		;; 14
		.word	0x00000000			;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x00000000			;; Ld_adr
