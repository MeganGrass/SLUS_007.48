
				;; Stack
				addiu	$sp, -0x28
				sw		$ra, 0x28+-0x04($sp)
				sw		$s2, 0x28+-0x08($sp)
				sw		$s1, 0x28+-0x0C($sp)
				sw		$s0, 0x28+-0x10($sp)

				;; Pad Buffer
				sh		$0, G_Padd1
				sh		$0, G_Padd1Trg
				lui     $v0, 0xFFFF
				sw      $v0, G_PaddData
				sw      $v0, G_PaddData+0x24

				;; Function Buffer
				sb		$0, @iCursor

				;; Flag
				la		$a0, @OffStr
				la		$a1, @OnStr
				la		$a2, @RgnJpnStr
				la		$a3, @RgnUSAStr
				li		$v0, TRUE

				;; Language
				lbu		$v1, DBG_LANGUAGE
				nop
				beq		$v0, $v1, @LanguageUSA
				nop
				sw		$a2, @pLanguageStr
				j		@FlgController
				nop
				@LanguageUSA:
				sw		$a3, @pLanguageStr
				nop

				@FlgController:
				lbu		$v1, CONTROLLER_TYPE
				nop
				beq		$v0, $v1, @ControlUSA
				nop
				sw		$a2, @pControlStr
				j		@FlgAutoAim
				nop
				@ControlUSA:
				sw		$a3, @pControlStr
				nop

				@FlgAutoAim:
				lbu		$v1, FORCEAUTOAIM
				nop
				beq		$v0, $v1, @AutoAimON
				nop
				sw		$a0, @pAutoAimStr
				j		@FlgInfAmmo
				nop
				@AutoAimON:
				sw		$a1, @pAutoAimStr
				nop

				@FlgInfAmmo:
				lbu		$v1, FORCEINFAMMO
				nop
				beq		$v0, $v1, @InfAmmoON
				nop
				sw		$a0, @pInfAmmoStr
				j		@FlgQuickTurn
				nop
				@InfAmmoON:
				sw		$a1, @pInfAmmoStr
				nop

				@FlgQuickTurn:
				lbu		$v1, DBG_QTURN_FLAG
				nop
				beq		$v0, $v1, @QuickTurnON
				nop
				sw		$a0, @pQuickTurnStr
				j		@Main
				nop
				@QuickTurnON:
				sw		$a1, @pQuickTurnStr
				nop

@Main:			lhu		$v1, G_Padd1Trg
				li		$v0, PAD_DEBUG
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CANCEL
				beq		$v0, $v1, @Terminate
				li		$v0, PAD_CONFIRM
				beq		$v0, $v1, @Initiate
				li		$v0, PAD_UP
				beq		$v0, $v1, @PadUp
				li		$v0, PAD_DOWN
				beq		$v0, $v1, @PadDown
				li		$v0, PAD_RIGHT
				beq		$v0, $v1, @PadRight
				li		$v0, PAD_LEFT
				beq		$v0, $v1, @PadLeft
				nop

@Print:			;; Language
				la		$a0, @LanguageStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x6C
				li		$a1, 0x78
				lbu		$v0, @iCursor
				li		$v1, 0x00
				beq		$v0, $v1, @PrintLanguage
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintLanguage:
				jal		Print8
				move    $a3, $0
				la		$a0, @NameStr
				lw		$a1, @pLanguageStr
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0xC4
				li		$a1, 0x78
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0

				;; Controller
				la		$a0, @ControllerStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x6C
				li		$a1, 0x80
				lbu		$v0, @iCursor
				li		$v1, 0x01
				beq		$v0, $v1, @PrintController
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintController:
				jal		Print8
				move    $a3, $0
				la		$a0, @NameStr
				lw		$a1, @pControlStr
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0xC4
				li		$a1, 0x80
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0

				;; Auto Aim
				la		$a0, @AutoAimStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x6C
				li		$a1, 0x88
				lbu		$v0, @iCursor
				li		$v1, 0x02
				beq		$v0, $v1, @PrintAutoAim
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintAutoAim:
				jal		Print8
				move    $a3, $0
				la		$a0, @NameStr
				lw		$a1, @pAutoAimStr
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0xC4
				li		$a1, 0x88
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0

				;; Infinite Ammo
				la		$a0, @InfAmmoStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x6C
				li		$a1, 0x90
				lbu		$v0, @iCursor
				li		$v1, 0x03
				beq		$v0, $v1, @PrintInfiniteAmmo
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintInfiniteAmmo:
				jal		Print8
				move    $a3, $0
				la		$a0, @NameStr
				lw		$a1, @pInfAmmoStr
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0xC4
				li		$a1, 0x90
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0

				;; Quick-Turn
				la		$a0, @QuickTurnStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x6C
				li		$a1, 0x98
				lbu		$v0, @iCursor
				li		$v1, 0x04
				beq		$v0, $v1, @PrintQuickTurn
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintQuickTurn:
				jal		Print8
				move    $a3, $0
				la		$a0, @NameStr
				lw		$a1, @pQuickTurnStr
				sw		$a0, 0x28+-0x18($sp)
				sw		$a1, 0x28+-0x14($sp)
				li		$a0, 0xC4
				li		$a1, 0x98
				li		$a2, PRINT_GREY
				jal		Print8
				move    $a3, $0

				;; Health
				la		$a0, @HealthStr
				sw		$a0, 0x28+-0x18($sp)
				li		$a0, 0x6C
				li		$a1, 0xA0
				lbu		$v0, @iCursor
				li		$v1, 0x05
				beq		$v0, $v1, @PrintHealth
				li		$a2, PRINT_GREEN
				li		$a2, PRINT_GREY
				@PrintHealth:
				jal		Print8
				move    $a3, $0

				;; Loop
				jal     Task_sleep
				li      $a0, 1
				j		@Main
				nop

@PadUp:			lbu		$v0, @iCursor
				li		$v1, 0x00
				beq		$v0, $v1, @CursorUp01
				nop
				addiu	$v0, -1
				sb		$v0, @iCursor
				j		@Print
				nop
				@CursorUp01:
				addiu	$v0, 0x05
				sb		$v0, @iCursor
				j		@Print
				nop
@PadDown:		lbu		$v0, @iCursor
				li		$v1, 0x05
				beq		$v0, $v1, @CursorDown01
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
@PadRight:		lbu		$v0, @iCursor
				nop
				la		$a0, @OffStr
				la		$a1, @OnStr
				la		$a2, @RgnJpnStr
				la		$a3, @RgnUSAStr
				li		$v1, 0x00
				beq		$v0, $v1, @Language
				li		$v1, 0x01
				beq		$v0, $v1, @Controller
				li		$v1, 0x02
				beq		$v0, $v1, @AutoAim
				li		$v1, 0x03
				beq		$v0, $v1, @InfAmmo
				li		$v1, 0x04
				beq		$v0, $v1, @QuickTurn
				li		$v1, 0x05
				beq		$v0, $v1, @Health
				nop
				j		@Print
				nop
@PadLeft:		lbu		$v0, @iCursor
				nop
				la		$a0, @OffStr
				la		$a1, @OnStr
				la		$a2, @RgnJpnStr
				la		$a3, @RgnUSAStr
				li		$v1, 0x00
				beq		$v0, $v1, @Language
				li		$v1, 0x01
				beq		$v0, $v1, @Controller
				li		$v1, 0x02
				beq		$v0, $v1, @AutoAim
				li		$v1, 0x03
				beq		$v0, $v1, @InfAmmo
				li		$v1, 0x04
				beq		$v0, $v1, @QuickTurn
				li		$v1, 0x05
				beq		$v0, $v1, @Health
				nop
				j		@Print
				nop

@Initiate:		lbu		$v0, @iCursor
				nop
				la		$a0, @OffStr
				la		$a1, @OnStr
				la		$a2, @RgnJpnStr
				la		$a3, @RgnUSAStr
				li		$v1, 0x00
				beq		$v0, $v1, @Language
				li		$v1, 0x01
				beq		$v0, $v1, @Controller
				li		$v1, 0x02
				beq		$v0, $v1, @AutoAim
				li		$v1, 0x03
				beq		$v0, $v1, @InfAmmo
				li		$v1, 0x04
				beq		$v0, $v1, @QuickTurn
				li		$v1, 0x05
				beq		$v0, $v1, @Health
				nop
				j		@Print
				nop

@Language:		lbu		$v0, DBG_LANGUAGE
				nop
				beqz	$v0, @LanguageUSA00
				nop
				sb		$0,  DBG_LANGUAGE
				sw		$a2, @pLanguageStr
				j		@Print
				nop
				@LanguageUSA00:
				li		$v0, TRUE
				sb		$v0, DBG_LANGUAGE
				sw		$a3, @pLanguageStr
				nop
				j		@Print
				nop

@Controller:	lbu		$v0, CONTROLLER_TYPE
				nop
				beqz	$v0, @ControlUSA00
				nop
				sb		$0,  CONTROLLER_TYPE
				sw		$a2, @pControlStr
				j		@Print
				nop
				@ControlUSA00:
				li		$v0, TRUE
				sb		$v0, CONTROLLER_TYPE
				sw		$a3, @pControlStr
				nop
				j		@Print
				nop

@AutoAim:		lbu		$v0, FORCEAUTOAIM
				nop
				beqz	$v0, @AutoAimON00
				nop
				sb		$0,  FORCEAUTOAIM
				sw		$a0, @pAutoAimStr
				j		@Print
				nop
				@AutoAimON00:
				li		$v0, TRUE
				sb		$v0, FORCEAUTOAIM
				sw		$a1, @pAutoAimStr
				nop
				j		@Print
				nop

@InfAmmo:		lbu		$v0, FORCEINFAMMO
				nop
				beqz	$v0, @InfAmmoON00
				nop
				sb		$0,  FORCEINFAMMO
				sw		$a0, @pInfAmmoStr
				j		@Print
				nop
				@InfAmmoON00:
				li		$v0, TRUE
				sb		$v0, FORCEINFAMMO
				sw		$a1, @pInfAmmoStr
				nop
				j		@Print
				nop

@QuickTurn:		lbu		$v0, DBG_QTURN_FLAG
				nop
				beqz	$v0, @QuickTurnON00
				nop
				sb		$0,  DBG_QTURN_FLAG
				sw		$a0, @pQuickTurnStr
				j		@Print
				nop
				@QuickTurnON00:
				li		$v0, TRUE
				sb		$v0, DBG_QTURN_FLAG
				sw		$a1, @pQuickTurnStr
				nop
				j		@Print
				nop

@Health:		j		@Print
				nop

@Terminate:		lw		$ra, 0x28+-0x04($sp)
				lw		$s2, 0x28+-0x08($sp)
				lw		$s1, 0x28+-0x0C($sp)
				lw		$s0, 0x28+-0x10($sp)
				jr		$ra
				addiu	$sp, 0x28

@iCursor:		.byte	0x00
@NameStr:		.ascii	"%s",0x00
				.align
@NumberStr:		.ascii	"%02d/%02d",0x00
				.align
@OnStr:			.ascii	"ON",0x00
				.align
@OffStr:		.ascii	"OFF",0x00
				.align
@RgnJpnStr:		.ascii	"JP",0x00
				.align
@RgnUSAStr:		.ascii	"US",0x00
				.align
@LanguageStr:	.ascii	"Language",0x00
				.align
@ControllerStr:	.ascii	"Controller",0x00
				.align
@AutoAimStr:	.ascii	"Auto-Aim",0x00
				.align
@InfAmmoStr:	.ascii	"Inf. Ammo",0x00
				.align
@QuickTurnStr:	.ascii	"Quick-Turn",0x00
				.align
@QuickKnifeStr:	.ascii	"Quick-Knife",0x00
				.align
@QuickLoadStr:	.ascii	"Quick-Reload",0x00
				.align
@HealthStr:		.ascii	"Health",0x00
				.align
@RegionStr:		.word	@RgnJpnStr,@RgnUSAStr
@OnOffStr:		.word	@OffStr,@OnStr
@pLanguageStr:	.word	@RgnUSAStr
@pControlStr:	.word	@RgnJpnStr
@pAutoAimStr:	.word	@OnStr
@pQuickTurnStr:	.word	@OnStr
@pInfAmmoStr:	.word	@OnStr
