

;; Debug Overlay
DEBUG_FILE:			equ 0x02

;; Zero
ZERO_OVERLAY:		equ 0
ZERO_BSS_FILES:		equ 0xEA
ZERO_DO2_FILES:		equ 0xF1
ZERO_EMD0_FILES:	equ 0xF2
ZERO_EMD1_FILES:	equ 0xF3
ZERO_PLD_FILES:		equ 0xF4
ZERO_PLW_FILES:		equ 0xF5
ZERO_SNDARMS_FILES:	equ 0x105
ZERO_SNDCORE_FILES:	equ 0x106
ZERO_SNDEMD_FILES:	equ 0x107
ZERO_SNDMAIN_FILES:	equ 0x108
ZERO_SNDSUB_FILES:	equ 0x109
ZERO_RDT_FILES:		equ 0x10A

;; Miscellaneous
FILE_DO2:			equ 0x327			;; x8 + 0x800988A4 = 0x8009A1DC
FILE_ARMS_EDH:		equ 0x2FF			;; 
FILE_ARMS_VBD:		equ 0x313			;; 
FILE_CORE_EDH:		equ 0x2D3			;; 
FILE_CORE_VBD:		equ 0x2E9			;; 

;; Arms
.org 0x80059CE8
		addiu	$a0, $s2, FILE_ARMS_EDH
		nop
		nop
.org 0x80059DFC
		addiu	$a0, $s2, FILE_ARMS_VBD
		nop
		nop

;; Core
.org 0x80059A94
		addiu	$a0, $s3, FILE_CORE_EDH
		nop
		nop
.org 0x80059B58
		addiu	$a0, $s3, FILE_CORE_VBD
		nop
		nop
.org 0x80059C04
		addiu	$a0, $s3, FILE_CORE_VBD
		nop
		nop

;; Door
.org 0x80014D88
		addiu	$a0, $s6, FILE_DO2
		nop
		nop
.org 0x80015094
		addiu	$a0, $v1, FILE_DO2
		nop
		nop
		sll     $a2, $v1, 1
		addu    $v1, $a2, $v1
		sll     $v1, 2
		addu    $v1, $v0