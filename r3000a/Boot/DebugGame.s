

				;; Stack Variable
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

				;; Pad Buffer
				sh		$0, G_Padd1
				sh		$0, G_Padd1Trg
				lui     $v0, 0xFFFF
				sw      $v0, G_PaddData
				sw      $v0, G_PaddData+0x24

				;; Initialize Game Settings
				j		@InitialSetup
				nop

@Main:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_UP
				beq		$v0, $v1, @CursorUp
				li		$v0, PAD_DOWN
				beq		$v0, $v1, @CursorDown
				li		$v0, PAD_RIGHT
				beq		$v0, $v1, @Next
				li		$v0, PAD_LEFT
				beq		$v0, $v1, @Prev
				li		$v0, PAD_SELECT
				beq		$v0, $v1, @Select
				li		$v0, PAD_R1
				beq		$v0, $v1, @NextMinute
				li		$v0, PAD_L1
				beq		$v0, $v1, @PrevMinute
				li		$v0, PAD_R2
				beq		$v0, $v1, @NextSecond
				li		$v0, PAD_L2
				beq		$v0, $v1, @PrevSecond
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @CancelOperation
				nop
				j		@Print
				nop

				@CancelOperation:
				li		$v0, TRUE
				sw		$v0, BOOT_BioTitleFail
				nop
				lui     $a0, 0x405
				jal     Snd_se_stad
				move    $a1, $0
				j		@Complete
				nop

@Print:			;; Player
				la		$a0, @NameStr
				lw		$a1, @pPlayer
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0x80
				li		$a1, 0xA0
				lbu		$v0, @iCursor
				li		$v1, 0x00
				beq		$v0, $v1, @PrintPlayer
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintPlayer:
				jal		Print8
				move    $a3, $0

				;; Weapon
				la		$a0, @NameStr
				lw		$a1, @pWeapon
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0x80
				li		$a1, 0xA8
				lbu		$v0, @iCursor
				li		$v1, 0x01
				beq		$v0, $v1, @PrintWeapon
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintWeapon:
				jal		Print8
				move    $a3, $0

				;; Scenario
				la		$a0, @NameStr
				lw		$a1, @pScenario
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0x80
				li		$a1, 0xB0
				lbu		$v0, @iCursor
				li		$v1, 0x02
				beq		$v0, $v1, @PrintScenario
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintScenario:
				jal		Print8
				move    $a3, $0
				lw		$v0, @iScenario
				li		$v1, 0x02
				bne		$v0, $v1, @DiscID
				nop
				la		$a0, @SCE03
				lw		$a1, @iTimerMinute
				lw		$a2, @iTimerSecond
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				sw		$a2, 0x28+-0x10($sp)
				li		$a0, 0xE8
				li		$a1, 0xB0
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0

				@DiscID:
				la		$a0, @NameStr
				la		$a1, @DiscType
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0x80
				li		$a1, 0xB8
				lbu		$v0, @iCursor
				li		$v1, 0x03
				beq		$v0, $v1, @PrintDiscID
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintDiscID:
				jal		Print8
				move    $a3, $0
				la		$a0, @NameStr
				lw		$a1, @pDiscType
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0xA8
				li		$a1, 0xB8
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0
				
				@Loop:
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@Next:			lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				lbu		$v0, @iCursor
				nop
				li		$v1, 0x00
				beq		$v0, $v1, @NextPld
				li		$v1, 0x01
				beq		$v0, $v1, @NextPlw
				li		$v1, 0x02
				beq		$v0, $v1, @NextSce
				li		$v1, 0x03
				beq		$v0, $v1, @NextDisk
				nop
				j		@Print
				nop

@Prev:			lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				lbu		$v0, @iCursor
				nop
				li		$v1, 0x00
				beq		$v0, $v1, @PrevPld
				li		$v1, 0x01
				beq		$v0, $v1, @PrevPlw
				li		$v1, 0x02
				beq		$v0, $v1, @PrevSce
				li		$v1, 0x03
				beq		$v0, $v1, @NextDisk
				nop
				j		@Print
				nop

@Select:		lbu		$v0, @iCursor
				nop
				li		$v1, 0x00
				beq		$v0, $v1, @SelectNone
				li		$v1, 0x01
				beq		$v0, $v1, @SelectNone
				li		$v1, 0x02
				beq		$v0, $v1, @SelectNone
				li		$v1, 0x03
				beq		$v0, $v1, @SelectNone
				nop
				@SelectNone:
				j		@Print
				nop

@NextDisk:		lbu		$v0, DISK_ID
				li		$v1, 1
				beq		$v0, $v1, @NextDisk00
				nop
				sb		$v1, DISK_ID
				j		@DiskComplete
				nop
				@NextDisk00:
				sb		$0,  DISK_ID
				j		@DiskComplete
				nop

@NextMinute:	lw		$v0, @iTimerMinute
				li		$v1, 59
				beq		$v0, $v1, @NextMinute00
				nop
				addiu	$v0, 1
				sw		$v0, @iTimerMinute
				j		@Print
				nop
				@NextMinute00:
				li		$v0, 0
				sw		$v0, @iTimerMinute
				j		@Print
				nop
@PrevMinute:	lw		$v0, @iTimerMinute
				li		$v1, 0
				beq		$v0, $v1, @PrevMinute00
				nop
				addiu	$v0, -1
				sw		$v0, @iTimerMinute
				j		@Print
				nop
				@PrevMinute00:
				li		$v0, 59
				sw		$v0, @iTimerMinute
				j		@Print
				nop
@NextSecond:	lw		$v0, @iTimerSecond
				li		$v1, 59
				beq		$v0, $v1, @NextSecond00
				nop
				addiu	$v0, 1
				sw		$v0, @iTimerSecond
				j		@Print
				nop
				@NextSecond00:
				li		$v0, 0
				sw		$v0, @iTimerSecond
				j		@Print
				nop
@PrevSecond:	lw		$v0, @iTimerSecond
				li		$v1, 0
				beq		$v0, $v1, @PrevSecond00
				nop
				addiu	$v0, -1
				sw		$v0, @iTimerSecond
				j		@Print
				nop
				@PrevSecond00:
				li		$v0, 59
				sw		$v0, @iTimerSecond
				j		@Print
				nop

@NextPlw:		lw		$v0, @iWeapon
				nop
				li		$v1, 0x13
				bne		$v0, $v1, @NextWeapon00
				nop
				sw		$0,  @iWeapon
				j		@PLWComplete
				nop
				@NextWeapon00:
				addiu	$v0, 1
				sw		$v0, @iWeapon
				j		@PLWComplete
				nop

@PrevPlw:		lw		$v0, @iWeapon
				nop
				bne		$v0, $0, @PrevWeapon00
				nop
				li		$v0, 0x13
				sw		$v0, @iWeapon
				j		@PLWComplete
				nop
				@PrevWeapon00:
				addiu	$v0, -1
				sw		$v0, @iWeapon
				j		@PLWComplete
				nop

@NextPld:		lbu		$v0, BOOT_PLAYER
				nop
				li		$v1, 0x0F
				bne		$v0, $v1, @NextFlag00
				nop
				sb		$0,  BOOT_PLAYER
				j		@PLDComplete
				nop
				@NextFlag00:
				addiu	$v0, 1
				sb		$v0, BOOT_PLAYER
				j		@PLDComplete
				nop

@PrevPld:		lbu		$v0, BOOT_PLAYER
				nop
				bne		$v0, $0, @PrevFlag00
				nop
				li		$v0, 0x0F
				sb		$v0, BOOT_PLAYER
				j		@PLDComplete
				nop
				@PrevFlag00:
				addiu	$v0, -1
				sb		$v0, BOOT_PLAYER
				j		@PLDComplete
				nop

@NextSce:		lw		$v0, @iScenario
				nop
				li		$v1, 0x02
				bne		$v0, $v1, @NextSCE00
				nop
				sw		$0,  @iScenario
				j		@SCEComplete
				nop
				@NextSCE00:
				addiu	$v0, 1
				sw		$v0, @iScenario
				j		@SCEComplete
				nop

@PrevSce:		lw		$v0, @iScenario
				nop
				bne		$v0, $0, @PrevSCE00
				nop
				li		$v0, 0x02
				sw		$v0, @iScenario
				j		@SCEComplete
				nop
				@PrevSCE00:
				addiu	$v0, -1
				sw		$v0, @iScenario
				j		@SCEComplete
				nop

@InitialSetup:	sb		$0,  BOOT_PLAYER
				sb		$0,  DISK_ID

@PLDComplete:	la		$a1, @Player		;; String
				lbu		$v0, BOOT_PLAYER	;; Numerical
				li		$v1, 4
				multu	$v1, $v0
				mflo	$v1
				addu	$v0, $v1, $a1
				lw		$v0, 0($v0)
				nop
				sw		$v0, @pPlayer

@PLWComplete:	la		$a1, @Weapon		;; String
				lw		$v0, @iWeapon		;; Numerical
				li		$v1, 4
				multu	$v1, $v0
				mflo	$v1
				addu	$v0, $v1, $a1
				lw		$v0, 0($v0)
				nop
				sw		$v0, @pWeapon

@DiskComplete:	la		$a1, @DiscTypeStr		;; String
				lbu		$v0, DISK_ID			;; Numerical
				li		$v1, 4
				multu	$v1, $v0
				mflo	$v1
				addu	$v0, $v1, $a1
				lw		$v0, 0($v0)
				nop
				sw		$v0, @pDiscType

@SCEComplete:	la		$a1, @Scenario		;; String
				lw		$v0, @iScenario		;; Numerical
				li		$v1, 4
				multu	$v1, $v0
				mflo	$v1
				addu	$v0, $v1, $a1
				lw		$v0, 0($v0)
				nop
				sw		$v0, @pScenario
				lw		$v0, @iScenario
				nop
				li		$v1, 0x00
				beq		$v0, $v1, @ScenarioA
				li		$v1, 0x01
				beq		$v0, $v1, @ScenarioB
				li		$v1, 0x02
				beq		$v0, $v1, @ScenarioHunk
				nop
				j		@Print
				nop
@ScenarioA:		li		$a0, 0x00020040
				sw		$a0, G_Status_flg
				j		@Print
				nop
@ScenarioB:		li		$a0, 0x40020040
				sw		$a0, G_Status_flg
				j		@Print
				nop
@ScenarioHunk:	li		$a0, 0x4A020040
				sw		$a0, G_Status_flg
				j		@Print
				nop

@CursorUp:		lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				lbu		$v0, @iCursor
				li		$v1, 0x00
				beq		$v0, $v1, @CursorUp01
				nop
				lbu		$v0, @iCursor
				nop
				addiu	$v0, -1
				sb		$v0, @iCursor
				j		@Print
				nop
				@CursorUp01:
				li		$v0, 0x03
				sb		$v0, @iCursor
				j		@Print
				nop
@CursorDown:	lui     $a0, 0x404
				jal     Snd_se_stad
				move    $a1, $0
				lbu		$v0, @iCursor
				li		$v1, 0x03
				beq		$v0, $v1, @CursorDown01
				nop
				lbu		$v0, @iCursor
				nop
				addiu	$v0, 1
				sb		$v0, @iCursor
				j		@Print
				nop
				@CursorDown01:
				li		$v0, 0
				sb		$v0, @iCursor
				j		@Print
				nop

@Terminate:		;; WEAPON
				lw		$v0, @iWeapon
				sb		$v0, 0x800A9264		;; Chris/Jill - Weapon
				sb		$v0, 0x800A92A6		;; Battle Mode - Weapon
				li		$v0, 0xFF
				sb		$v0, 0x800A9265		;; Chris/Jill - Infinite Ammo
				sb		$v0, 0x800A92A7		;; Battle Mode - Infinite Ammo

				;; BATTLE MODE
				lw		$v1, @iTimerMinute
				li		$v0, 60
				multu	$v0, $v1
				mflo	$v0
				lw		$v1, @iTimerSecond
				nop
				addu	$v0, $v0, $v1
				sh		$v0, 0x800D4832

@Complete:		lw      $ra, 0x50+-0x08($sp)
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

@iCursor:		.byte	0x00
@Player:		.word	@PLD00,@PLD01,@PLD02,@PLD03,@PLD04,@PLD05,@PLD06,@PLD07,@PLD08,@PLD09,@PLD0A,@PLD0B,@PLD0C,@PLD0D,@PLD0E,@PLD0F
@Weapon:		.word	@PLW00,@PLW01,@PLW02,@PLW03,@PLW04,@PLW05,@PLW06,@PLW07,@PLW08,@PLW09,@PLW0A,@PLW0B,@PLW0C,@PLW0D,@PLW0E,@PLW0F,@PLW10,@PLW11,@PLW12,@PLW13
@Scenario:		.word	@SCE00,@SCE01,@SCE02
@DiscTypeStr:	.word	@PLD00,@PLD01
@pPlayer:		.word	@Player
@pWeapon:		.word	@Weapon
@pScenario:		.word	@Scenario
@pDiscType:		.word	@DiscTypeStr
@iWeapon:		.word	0
@iScenario:		.word	0
@iTimerMinute:	.word	5
@iTimerSecond:	.word	0
@LoadStr:		.ascii	"Load Game",0x00
				.align
@StartStr:		.ascii	"Start Game",0x00
				.align
@PlayerStr:		.ascii	"Player",0x00
				.align
@WeaponStr:		.ascii	"Weapon",0x00
				.align
@PLD00:			.ascii	"Billy",0x00			;; "MALE",0x00
				.align
@PLD01:			.ascii	"Rebecca",0x00			;; "FEMALE",0x00
				.align
@PLD02:			.ascii	"---",0x00				;; "MALE",0x00
				.align
@PLD03:			.ascii	"---",0x00				;; "FEMALE",0x00
				.align
@PLD04:			.ascii	"---",0x00				;; "MALE",0x00
				.align
@PLD05:			.ascii	"---",0x00				;; "FEMALE",0x00
				.align
@PLD06:			.ascii	"---",0x00				;; "MALE",0x00
				.align
@PLD07:			.ascii	"---",0x00				;; "FEMALE",0x00
				.align
@PLD08:			.ascii	"---",0x00				;; "MALE",0x00
				.align
@PLD09:			.ascii	"---",0x00				;; "FEMALE",0x00
				.align
@PLD0A:			.ascii	"---",0x00				;; "MALE",0x00
				.align
@PLD0B:			.ascii	"Male NPC 1",0x00		;; "CHRIS",0x00
				.align
@PLD0C:			.ascii	"Male NPC 2",0x00		;; "HUNK",0x00
				.align
@PLD0D:			.ascii	"Male NPC 3",0x00		;; "TOFU",0x00
				.align
@PLD0E:			.ascii	"---",0x00				;; "ADA",0x00
				.align
@PLD0F:			.ascii	"---",0x00				;; "SHERRY",0x00
				.align
@PLW00:			.ascii	"Nothing",0x00
				.align
@PLW01:			.ascii	"Knife",0x00
				.align
@PLW02:			.ascii	"Handgun",0x00			;; "H&K VP70",0x00
				.align
@PLW03:			.ascii	"Handgun",0x00			;; "BROWNING HP",0x00
				.align
@PLW04:			.ascii	"---",0x00				;; "C. H&K VP70",0x00
				.align
@PLW05:			.ascii	"Magnum",0x00			;; "MAGNUM",0x00
				.align
@PLW06:			.ascii	"Magnum",0x00			;; "C. MAGNUM",0x00
				.align
@PLW07:			.ascii	"Hunting Rifle",0x00	;; "SHOTGUN",0x00
				.align
@PLW08:			.ascii	"Shotgun",0x00			;; "C. SHOTGUN",0x00
				.align
@PLW09:			.ascii	"Grenade Launcher",0x00	;; "GRENADE LAUNCHER",0x00
				.align
@PLW0A:			.ascii	"Grenade Launcher",0x00	;; "FLAME LAUNCHER",0x00
				.align
@PLW0B:			.ascii	"Grenade Launcher",0x00	;; "ACID LAUNCHER",0x00
				.align
@PLW0C:			.ascii	"---",0x00				;; "BOW GUN",0x00
				.align
@PLW0D:			.ascii	"Custom Handgun",0x00	;; "COLT S.A.A.",0x00
				.align
@PLW0E:			.ascii	"---",0x00				;; "SPARKSHOT",0x00
				.align
@PLW0F:			.ascii	"Sub Machine Gun",0x00	;; "SUB MACHINE GUN",0x00
				.align
@PLW10:			.ascii	"Molotov Cocktail",0x00	;; "FLAME THROWER",0x00
				.align
@PLW11:			.ascii	"Rocket Launcher",0x00
				.align
@PLW12:			.ascii	"---",0x00				;; "GATLING GUN",0x00
				.align
@PLW13:			.ascii	"Custom Handgun",0x00	;; "HAND GUN",0x00
				.align
@SCE00:			.ascii	"Scenario A",0x00
				.align
@SCE01:			.ascii	"Scenario B",0x00
				.align
@SCE02:			.ascii	"Leech Hunter",0x00
				.align
@SCE03:			.ascii	"%02d:%02d",0x00
				.align
@DiscType:		.ascii	"Disc",0x00
				.align
@NameStr:		.ascii	"%s",0x00
				.align
