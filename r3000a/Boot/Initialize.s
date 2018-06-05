
;; BOOT

				;; Stack
				addiu   $sp, -0x50
				sw      $ra, 0x50+-0x08($sp)
				sw      $s7, 0x50+-0x0C($sp)
				sw      $s6, 0x50+-0x10($sp)
				sw      $s5, 0x50+-0x14($sp)
				sw      $s4, 0x50+-0x18($sp)
				sw      $s3, 0x50+-0x1C($sp)
				sw      $s2, 0x50+-0x20($sp)
				sw      $s1, 0x50+-0x24($sp)
				sw      $s0, 0x50+-0x28($sp)

				;; Copyright
				.if UseCopyright
				jal		BOOT_Copyright
				nop
				.endif

				;; Memory
				li		$a0, G_Card_head
				la		$a1, BOOT_InitTable
				jal		memcpy16
				li		$a2, 0x798

				;; Sound Variable
				lbu     $v0, 0x800D46AD			;; G.Save.Stereo
				lbu     $v1, 0x800CE5E1			;; G.Sound_mode
				nop
				or      $v0, $v1
				andi    $v0, 1
				sb      $v0, 0x800D46AD			;; G.Save.Stereo

				;; Sound Engine
				la		$v0, 0x8011A000
				sw		$v0, G_pFree_work
				li		$a0, 0x11
				move    $a1, $0
				jal     Snd_sys_core_set
				nop
				jal     Snd_sys_init_sub2
				nop
				
				;; Debug Flag
				lbu     $v0, ControlTypeABC
				sb      $0,  BssTimFlag
				sb      $0,  0x800DFD58
				sb      $0,  0x800DFD59
				sb      $0,  PauseFlag
				sb      $v0, 0x800D3D1E
				li      $v0, TRUE
				sb      $v0, 0x800D7654			;; Used by Pad_set()
				sb		$v0, DBG_LANGUAGE		;; English Language (Default: 0=JP,1=US)
				sb		$0,  CONTROLLER_TYPE	;; Japanese (Default: 0=JP,1=US)
				sb		$v0, FORCEAUTOAIM		;; Auto-Aim (Default, 1=Enable)
				sb		$v0, FORCEINFAMMO		;; Infinite Ammo (Default, 1=Enable)
				sb		$v0, DBG_QTURN_FLAG		;; Quick-Turn (Default, 1=Enable)
				sb		$0,  DBG_LAST_MESSAGE	;; RDT Debug
				sb		$0,  DBG_LAST_EVENT		;; RDT Debug
				sb		$v0, DBG_PRINT_RDT		;; RDT Debug
				sb		$v0, DBG_PRINT_PLPOS	;; RDT Debug
				sb		$v0, DBG_PRINT_PLROT	;; RDT Debug
				sw		$0,  BOOT_BioTitleFail

				;; Title Screen
				li		$v0, 1
				sb      $v0, BssTimFlag
				jal		BOOT_TitleScreen
				nop
				sb      $0,  BssTimFlag

				;; Player Setup
				lbu		$v0, BOOT_PLAYER
				sb		$v0, Player_Id
				sb		$v0, G_Pl_id
				li		$v0, BOOT_HEALTH
				sh		$v0, Player_Life
				sh		$v0, G_Pl_life
				jal		LoadPlwTable
				nop

				@Initialize:
				la		$v0, 0x8011A000
				sw		$v0, G_pFree_work
				jal		Status_init
				nop
				jal     Status_init_m
				nop
				lbu		$a0, BOOT_PLAYER
				move    $a1, $0
				jal     Snd_sys_core_set
				nop
				jal     Snd_sys_init_sub2
				nop
				jal		Esp_init_C
				nop
				jal		Em_move_tbl_set
				nop
				jal		Set_stage
				nop
				lw      $s1, G_pFree_work_head
				li      $v0, 1
				li		$s0, G_Player
				sw      $s0, G_pEnemy
				sw      $v0, Player_Be_flg
				jal     SetSpadStack
				nop
				sw      $s1, G_pFree_work
				li		$a0, G_Player
				nop
				jal     Player_set
				nop
				jal		ResetSpadStack
				nop
				jal		Spl_set
				nop
				jal		Kage_work_init
				nop
				jal		Kage_work9_init
				nop
				jal		Sce_test_init
				nop
				jal		Set_room
				nop
				li      $a0, 0xFFFFFFFF
				jal		VSync
				nop
				sw      $v0, G_Game_time_offset
				lw      $v0, G_System_flg
				lui     $v1, 0x4000
				or      $v0, $v1
				sw      $v0, G_System_flg
				li      $v0, 2
				sb		$v0, 0x800DFC1A			;; Main.Vloop
				move    $a0, $0
				jal     Bg_set_mode
				move    $a1, $0
				li      $v0, 1
				sb		$v0, 0x800DFC1B			;; Main.Bg_chg_flg
				lh      $a0, G_Cut_no
				jal		Cut_change
				nop
				li      $a0, 1
				jal     Cut_check
				nop

				@Terminate:
				lbu		$v0, FORCEAUTOAIM
				li		$v1, TRUE
				beq		$v0, $v1, @AutoAimEnable
				nop
				j		@InfAmmo
				nop
				@AutoAimEnable:
				sb		$0,  G_Auto_Aim
				nop

				@InfAmmo:
				lbu		$v0, FORCEINFAMMO
				li		$v1, TRUE
				beq		$v0, $v1, @InfAmmoEnable
				nop
				j		@Controller
				nop
				@InfAmmoEnable:
				li		$v1, 0xFF
				sb		$v1, 0x800D46CD
				sb		$v1, 0x800D46CE
				sb		$v1, 0x800D46CF
				nop

				@Controller:
				li		$a0, 0x800A26A0
				lbu		$v0, CONTROLLER_TYPE
				li		$v1, 1
				beq		$v0, $v1, @SetPadUSA
				nop
				@SetPadJPN:
				la		$a1, BOOT_PADJPN
				j		@SetPad
				nop
				@SetPadUSA:
				la		$a1, BOOT_PADUSA
				@SetPad:
				jal		memcpy16
				li		$a2, 0x60

				;; Statistics
				.if NoStatistics
				sb		$0, DBG_PRINT_RDT
				sb		$0, DBG_PRINT_PLPOS
				sb		$0, DBG_PRINT_PLROT
				.endif

				@Complete:
				sb      $0,	 0x800D7654			;; Used by Pad_set()
				lw      $ra, 0x50+-0x08($sp)
				lw      $s7, 0x50+-0x0C($sp)
				lw      $s6, 0x50+-0x10($sp)
				lw      $s5, 0x50+-0x14($sp)
				lw      $s4, 0x50+-0x18($sp)
				lw      $s3, 0x50+-0x1C($sp)
				lw      $s2, 0x50+-0x20($sp)
				lw      $s1, 0x50+-0x24($sp)
				lw      $s0, 0x50+-0x28($sp)
				jr      $ra
				addiu   $sp, 0x50
