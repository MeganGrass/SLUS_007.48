

;; VOID ChgWeapon(USHORT G_Padd1Trg);
.org ChgWeapon

@Stack:			addiu   $sp, -0x20
				sw      $s0, 0x20+-0x10($sp)
				sw      $s1, 0x20+-0x0C($sp)
				sw      $s2, 0x20+-0x08($sp)
				sw      $ra, 0x20+-0x04($sp)

@Status:		li      $s1, StatusWork
				li      $s2, G_Player
				li      $v1, 0x80
				sb      $v1, 0x08($s1)			;; Status.Equip_item_no
				sb      $v1, 0x09($s1)			;; Status.Equip_item_no_old
				sb      $0,  0x0A($s1)			;; Status.Equip_item_id
				sb      $0,  0x0B($s1)			;; Status.Equip_item_id_old

@PadInput:		lhu		$v0, Player_Type
				li		$v1, PAD_WEP_PREV
				beq		$a0, $v1, @PadPrev		;; L2 button was pressed
				li		$v1, PAD_WEP_NEXT
				beq		$a0, $v1, @PadNext		;; R2 button was pressed
				nop

@PadPrev:		li		$v1, 0x00
				beq		$v0, $v1, @PlwLast
				addiu	$v0, -0x01
				j		@WeaponTest
				nop
@PadNext:		li		$v1, 0x13
				beq		$v0, $v1, @PlwFirst
				addiu	$v0, 0x01
				j		@WeaponTest
				nop
@PlwFirst:		li		$v0, 0x00
				j		@WeaponTest
				nop
@PlwLast:		li		$v0, 0x13
				j		@WeaponTest
				nop

@WeaponTest:	sh		$v0, 0x10E($s2)			;; Player.Type
				la		$a0, PlwArchiveTbl
				li		$a1, 8
				multu	$a1, $v0
				mflo	$a1
				addu	$a0, $a0, $a1
				lw		$a1, 0x00($a0)			;; Size
				nop
				beqz	$a1, @PadNext
				nop

@Work:			sb		$v0, G_Item_work		;; G.Save.Item_work[0].Id
				li      $v1, 0x1000
				sh      $0,  0x154($s2)			;; Player.Status_flg
				sh      $v1, 0x1DE($s2)			;; Player.Parts0_pos_y
				sh		$v0, 0x10E($s2)			;; Player.Type
				jal     Weapon_cls
				move    $a0, $s2
                sb		$0,	 0x08($s1)			;; Status.Equip_item_no
                sb		$0,  0x0A($s1)			;; Status.Equip_item_id
				jal     Pl_weapon_ch
				move    $a0, $s2
				li      $v0, 0x80
				sb      $v0, 0x09($s2)			;; Player.Sc_id
				lhu     $a0, 0x10E($s2)			;; Player.Type
				jal     Snd_sys_arms_set
				andi    $a0, 0xFFF

				;; Terminate
				lw      $ra, 0x20+-0x04($sp)
				lw      $s2, 0x20+-0x08($sp)
				lw      $s1, 0x20+-0x0C($sp)
				lw      $s0, 0x20+-0x10($sp)
				jr      $ra
				addiu   $sp, 0x20
