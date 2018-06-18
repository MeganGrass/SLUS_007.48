

;; AREA.BIN
LoadTaskFileArea:		equ 0x00		;; File_no
LoadTaskAddrArea:		equ 0x801BFA18	;; Ld_adr
LoadTaskFuncArea:		equ 0x801BFA18	;; Func

;; BOOT.BIN
LoadTaskFileBoot:		equ 0x01		;; File_no
LoadTaskAddrBoot:		equ 0x80190000	;; Ld_adr
LoadTaskFuncBoot:		equ 0x80190000	;; Func

;; CONFIG.BIN
LoadTaskFileConfig:		equ 0x02		;; File_no
LoadTaskAddrConfig:		equ 0x801BFA18	;; Ld_adr
LoadTaskFuncConfig:		equ 0x801BFA84	;; Func

;; DEBUG.BIN
LoadTaskFileDebug:		equ 0x03		;; File_no
LoadTaskAddrDebug:		equ 0x801BFA18	;; Ld_adr
LoadTaskFuncDebug:		equ 0x801BFA18	;; Func

;; DIEDEMO.BIN
LoadTaskFileDieDemo:	equ 0x04		;; File_no
LoadTaskAddrDieDemo:	equ 0x80190000	;; Ld_adr
LoadTaskFuncDieDemo:	equ 0x8019009C	;; Func

;; ENDING.BIN
LoadTaskFileEnding:		equ 0x05		;; File_no
LoadTaskAddrEnding:		equ 0x8011A000	;; Ld_adr
LoadTaskFuncEnding:		equ 0x8011A0FC	;; Func

;; MEM_CARD.BIN
LoadTaskFileMemory:		equ 0x06		;; File_no
LoadTaskAddrMemory:		equ 0x801BFA18	;; Ld_adr
LoadTaskFuncMemory:		equ 0x801BFD14	;; Func

;; OPENING.BIN
LoadTaskFileOpening:	equ 0x07		;; File_no
LoadTaskAddrOpening:	equ 0x801BFA18	;; Ld_adr
LoadTaskFuncOpening:	equ 0x801BFAD8	;; Func

;; RESULT.BIN
LoadTaskFileResult:		equ 0x08		;; File_no
LoadTaskAddrResult:		equ 0x80158000	;; Ld_adr
LoadTaskFuncResult:		equ 0x80158020	;; Func

;; SELECT.BIN
LoadTaskFileSelect:		equ 0x09		;; File_no
LoadTaskAddrSelect:		equ 0x801BFA18	;; Ld_adr
LoadTaskFuncSelect:		equ 0x801BFAA8	;; Func

;; TITLE.BIN
LoadTaskFileTitle:		equ 0x0A		;; File_no
LoadTaskAddrTitle:		equ 0x80190000	;; Ld_adr
LoadTaskFuncTitle:		equ 0x80191808	;; Func

;; Data
Room800Snd:				equ 0x12		;; dataex\\room800.snd
DataTitleScreen:		equ 0x13		;; dataex\\title.tim

;; Runtime Data
CdxFileBss:				equ 0xEA
CdxFileD02:				equ 0xF1
CdxFileEmd0:			equ 0xF2
CdxFileEmd1:			equ 0xF3
CdxFilePld:				equ 0xF4
CdxFilePlw:				equ 0xF5
CdxFileSndArms:			equ 0x105
CdxFileSndCore:			equ 0x106
CdxFileSndEmd:			equ 0x107
CdxFileSndMain:			equ 0x108
CdxFileSndSub:			equ 0x109
CdxFileRdt:				equ 0x10A

;; Work In Progress
FILE_DO2:				equ 0x327		;; x8 + 0x800988A4 = 0x8009A1DC
FILE_ARMS_EDH:			equ 0x2FF		;; 
FILE_ARMS_VBD:			equ 0x313		;; 
FILE_CORE_EDH:			equ 0x2D3		;; 
FILE_CORE_VBD:			equ 0x2E9		;; 
