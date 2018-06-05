

;; LOAD ADDRESS
.org 0x800107C0
		.word	0x801BFA18			;; 0x800107C0	;; CONFIG
		.word	0x80190000			;; 0x800107C4	;; DIEDEMO
		.word	0x8011A000			;; 0x800107C8	;; ENDING
		.word	0x801BFA18			;; 0x800107CC	;; MEM_CARD
		.word	0x801BFA18			;; 0x800107D0	;; OPENING
		.word	0x80158000			;; 0x800107D4	;; RESULT
		.word	0x801BFA18			;; 0x800107D8	;; SELECT
		.word	0x80190000			;; 0x800107DC	;; BOOT	(32Kb Limit)
		.word	0x00000000			;; 0x800107E0	;; 
		.word	0x00000000			;; 0x800107E4	;; 
		.word	0x00000000			;; 0x800107E8	;; 
		.word	0x00000000			;; 0x800107EC	;; 
		.word	0x00000000			;; 0x800107F0	;; 
		.word	0x00000000			;; 0x800107F4	;; 
		.word	0x00000000			;; 0x800107F8	;; 
		.word	0x00000000			;; 0x800107FC	;; 
		.word	0x00000000			;; 0x80010800	;; 
		.word	0x00000000			;; 0x80010804	;; pFuncall
		.word	0x00000000			;; 0x80010808	;; 
		.word	0x00000000			;; 0x8001080C	;; 
		.word	0x00000000			;; 0x80010810	;; 
		.word	0x00000000			;; 0x80010814	;; 
		.word	0x00000000			;; 0x80010818	;; 
		.word	0x00000000			;; 0x8001081C	;; 
		.word	0x00000000			;; 0x80010820	;; 
		.word	0x00000000			;; 0x80010824	;; 
		.word	0x00000000			;; 0x80010828	;; 


;; LOAD TASK
.org 0x800A20B8
		.word	0x01				;; File_no		;; BOOT
		.word	0x80190000			;; Func
		.word	0x800107DC			;; pLd_adr
.org 0x800A20C4
		.word	0x09				;; File_no		;; MEM_CARD
		.word	0x801BFD14			;; Func
		.word	0x800107CC			;; pLd_adr
.org 0x800A20D0
		.word	0x03				;; File_no		;; DIEDEMO
		.word	0x8019009C			;; Func
		.word	0x800107C4			;; pLd_adr
.org 0x800A20DC
		.word	0x0C				;; File_no		;; SELECT
		.word	0x801BFAA8			;; Func
		.word	0x800107D8			;; pLd_adr
.org 0x800A20E8
		.word	0x05				;; File_no		;; CONFIG
		.word	0x801BFA84			;; Func
		.word	0x800107C0			;; pLd_adr
.org 0x800A20F4
		.word	0x0A				;; File_no		;; OPENING
		.word	0x801BFAD8			;; Func
		.word	0x800107D0			;; pLd_adr
.org 0x800A2100
		.word	0x08				;; File_no		;; ENDING
		.word	0x8011A0FC			;; Func
		.word	0x800107C8			;; pLd_adr
.org 0x800A210C
		.word	0x0B				;; File_no		;; RESULT
		.word	0x80158020			;; Func
		.word	0x800107D4			;; pLd_adr
.org 0x800A2118
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107E0			;; pLd_adr
.org 0x800A2124
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107E4			;; pLd_adr
.org 0x800A2130
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107E8			;; pLd_adr
.org 0x800A213C
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107EC			;; pLd_adr
.org 0x800A2148
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107F0			;; pLd_adr
.org 0x800A2154
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107F4			;; pLd_adr
.org 0x800A2160
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107F8			;; pLd_adr
.org 0x800A216C
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x800107FC			;; pLd_adr
.org 0x800A2178
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010800			;; pLd_adr
.org 0x800A2184
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010808			;; pLd_adr
.org 0x800A2190
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x8001080C			;; pLd_adr
.org 0x800A219C
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010810			;; pLd_adr
.org 0x800A21A8
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010810			;; pLd_adr
.org 0x800A21B4
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010810			;; pLd_adr
.org 0x800A21C0
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x8001081C			;; pLd_adr
.org 0x800A21CC
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010820			;; pLd_adr
.org 0x800A21D8
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010824			;; pLd_adr
.org 0x800A21E4
		.word	0x00				;; File_no		;; 
		.word	0x00000000			;; Func
		.word	0x80010828			;; pLd_adr
