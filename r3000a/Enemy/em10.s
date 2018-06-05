

;; Resident Evil 2 Dual Shock (SLUS_007.48)
;; Enemy Routine (EM10/Zombie)

.erroronwarning on
.psx
.open "EM1000.BIN",0x8010D000
.include "C:\\BioDSZ\\r3000a\\Executable.map"
.include "C:\\BioDSZ\\r3000a\\DualShock.map"

.org 0x8010D000
						.word 0x00000024
						.byte 0, 2, 0, 2, 0, 2, 2, 0
						.byte 0x0B, 0x0B, 0x0E, 0x0E, 0x0B, 0x0B, 0x0E, 0x0E
						.byte 0x10, 0x14, 0x01, 0x05
						.byte 0x10, 0x1E, 0x01, 0x0A
jpt_8010F6B8:			.word loc_8010F6C0
						.word loc_8010F7D8
						.word loc_8010F814
						.word loc_8010F838
						.word loc_8010F968
						.word loc_8010F9A4
						.word loc_8010FBE8
						.word loc_8010FC30
						.word loc_8010FC60
						.word loc_8010FEB4
byte_8010D044:			.byte 1
						.byte 2, 0x17
						.byte 0x16
						.byte 8
						.byte 9
						.dh 0
byte_8010D04C:			.byte 0x5A
						.byte 0, 0x1E
						.byte 0
						.byte 0xAA
						.byte 0, 0xA0
						.byte 0
						.byte 0xA
						.byte 0, 0x28
						.byte 0
						.byte 0x64
						.byte 0, 0x32
						.byte 0
						.byte 0x6E
						.byte 0, 0x14
						.byte 0
						.byte 0x23
						.byte 0, 0x46
						.byte 0
						.byte 0x1E
						.byte 0, 0xB4
						.byte 0
						.byte 0x1E
						.byte 0, 0x3C
						.byte 0
off_8010D06C:			.word loc_8011028C
						.word loc_80110370
						.word loc_80110404
						.word loc_801104DC
						.word loc_80110510
						.word loc_8011052C
						.word loc_80110568
						.word loc_80110628
						.word loc_801106F4
						.word      0
jpt_801107C4:			.word loc_801107CC
						.word loc_8011081C
						.word loc_80110838
						.word loc_801108D8
						.word loc_80110900
dword_8010D0A8:			.word 0x12141312, 0x13121413, 0
jpt_80110BE0:			.word loc_80110BE8
						.word loc_80110C18
						.word loc_80110CB0
						.word loc_80110CD8
						.word loc_80110D60
						.word loc_80110D90
						.word loc_80110DB4
						.word loc_80110DD8
						.word loc_80110E20
dword_8010D0D8:			.word 0xD040303, 0x40200
dword_8010D0E0:			.word 0
jpt_801111DC:			.word loc_801111E4
						.word loc_80111234
						.word loc_80111280
						.word loc_801112D4
						.word loc_80111374
dword_8010D0F8:			.word 0x2000200
dword_8010D0FC:			.word 0x2000200, 0
jpt_80114078:			.word loc_80114080
						.word loc_801141A8
						.word loc_80114248
						.word loc_80114274
						.word loc_8011432C
						.word loc_8011433C
						.word loc_801143E8
aBug:					.ascii "BUG",0x00
byte_8010D124:			.byte 0x1D, 0x1C, 0x1E
						.byte 0x1C
						.byte 0x1C, 0x1D, 0x1C
						.byte 0x1E
off_8010D12C:			.word loc_80115C80
						.word loc_80116078
						.word loc_80116158
						.word loc_801161AC
						.word loc_801161EC
						.word loc_801161F8
						.word loc_80116220
						.word      0
jpt_80116328:			.word loc_80116330
						.word loc_801164F4
						.word loc_80116534
						.word loc_80116540
						.word loc_80116568
byte_8010D160:			.byte 0x37, 0x16, 1
						.byte 0x28
						.byte 0x17, 1, 0
						.byte 1
						.word 1
off_8010D16C:			.word loc_80116EB8
						.word loc_80116F00
						.word loc_80116F88
						.word loc_80116FF4
						.word loc_80117030
						.word 0
jpt_801170DC:			.word loc_801170E4
						.word loc_80117114
						.word loc_80117154
						.word loc_80117178
						.word loc_801171FC
						.word      0
jpt_80117488:			.word loc_80117490
						.word loc_801175D8
						.word loc_8011760C
						.word loc_8011764C
						.word loc_8011769C
						.word loc_801177E0
						.word loc_801176BC
						.word loc_8011780C
						.word loc_80117768
						.word loc_801177B4
						.word loc_801177E0
						.word loc_80117808
dword_8010D1CC:			.word 0xC80000, 0xFF9C0064, 0xFF380064, 0
jpt_80117A48:			.word loc_80117A50
						.word loc_80117B14
						.word loc_80117B70
						.word loc_80117B90
						.word loc_80117CA0
						.word loc_80117D78
						.word loc_80117EDC
byte_8010D1F8:			.byte 0x70
						.byte 0xFE, 0x9C
						.byte 0xFF
						.byte 0
						.byte 0, 0xC8
						.byte 0
						.byte 0x9C
						.byte 0xFF, 0
						.byte 0
off_8010D204:			.word loc_80117FFC
						.word loc_80118078
						.word loc_801180B8
						.word loc_801180D8
						.word loc_8011829C
						.word loc_801182F4
						.word loc_801182C4
						.word loc_801182F4
						.word loc_80118350
						.word 0
jpt_801184BC:			.word loc_801184C4
						.word loc_801185CC
						.word loc_80118724
						.word loc_80118744
						.word loc_80118774
						.word loc_8011878C
						.word loc_801187AC
dword_8010D248:			.word 0
dword_8010D24C:			.word 0x7E, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
jpt_80118868:			.word loc_80118870
						.word loc_801188D8
						.word loc_801189AC
						.word loc_801189C8
						.word loc_80118A88
						.word loc_80118B0C
						.word loc_80118B6C
						.word loc_80118BA4
						.word loc_80118BE8
word_8010D2A0:			.dh 300
						.dh -300
						.dh 0
						.dh 0
						.dh 0
						.dh 0
jpt_801192FC:			.word loc_801195E4
						.word loc_80119304
						.word loc_8011940C
						.word loc_8011957C
						.word loc_801195E4
Em210:					.include ".\\em10\\Em210.s"
Em10Init:				.include ".\\em10\\Em10Init.s"
Em10Move:				.include ".\\em10\\Move\\Em10Move.s"
Em10MoveType00:			.include ".\\em10\\Move\\Em10MoveType00.s"
Em10MoveType01:			.include ".\\em10\\Move\\Em10MoveType01.s"
Em10Mv00Br:				.include ".\\em10\\Move\\BR\\Em10Mv00Br.s"
Em10Mv00:				.include ".\\em10\\Move\\MV\\Em10Mv00.s"
sub_8010E6C8:			.include ".\\em10\\Move\\sub_8010E6C8.s"
Em10Mv01Br:				.include ".\\em10\\Move\\BR\\Em10Mv01Br.s"
Em10Mv01:				.include ".\\em10\\Move\\MV\\Em10Mv01.s"
Em10Mv02Br:				.include ".\\em10\\Move\\BR\\Em10Mv02Br.s"
Em10Mv02:				.include ".\\em10\\Move\\MV\\Em10Mv02.s"
Em10Mv03Br:				.include ".\\em10\\Move\\BR\\Em10Mv03Br.s"
Em10Mv03:				.include ".\\em10\\Move\\MV\\Em10Mv03.s"
Em10Mv04Br:				.include ".\\em10\\Move\\BR\\Em10Mv04Br.s"
Em10Mv04:				.include ".\\em10\\Move\\MV\\Em10Mv04.s"
Em10Mv05Br:				.include ".\\em10\\Move\\BR\\Em10Mv05Br.s"
Em10Mv05:				.include ".\\em10\\Move\\MV\\Em10Mv05.s"
Em10Mv06Br:				.include ".\\em10\\Move\\BR\\Em10Mv06Br.s"
Em10Mv06:				.include ".\\em10\\Move\\MV\\Em10Mv06.s"
Em10Mv07Br:				.include ".\\em10\\Move\\BR\\Em10Mv07Br.s"
Em10Mv07:				.include ".\\em10\\Move\\MV\\Em10Mv07.s"
Em10Mv08Br:				.include ".\\em10\\Move\\BR\\Em10Mv08Br.s"
Em10Mv08:				.include ".\\em10\\Move\\MV\\Em10Mv08.s"
Em10Mv09Br:				.include ".\\em10\\Move\\BR\\Em10Mv09Br.s"
Em10Mv09:				.include ".\\em10\\Move\\MV\\Em10Mv09.s"
Em10Mv0ABr:				.include ".\\em10\\Move\\BR\\Em10Mv0ABr.s"
Em10Mv0A:				.include ".\\em10\\Move\\MV\\Em10Mv0A.s"
Em10Mv0BBr:				.include ".\\em10\\Move\\BR\\Em10Mv0BBr.s"
Em10Mv0B:				.include ".\\em10\\Move\\MV\\Em10Mv0B.s"
Em10Mv0CBr:				.include ".\\em10\\Move\\BR\\Em10Mv0CBr.s"
Em10Mv0C:				.include ".\\em10\\Move\\MV\\Em10Mv0C.s"
Em10Mv0DBr:				.include ".\\em10\\Move\\BR\\Em10Mv0DBr.s"
Em10Mv0D:				.include ".\\em10\\Move\\MV\\Em10Mv0D.s"
Em10Mv0EBr:				.include ".\\em10\\Move\\BR\\Em10Mv0EBr.s"
Em10Mv0E:				.include ".\\em10\\Move\\MV\\Em10Mv0E.s"
Em10Mv0FBr:				.include ".\\em10\\Move\\BR\\Em10Mv0FBr.s"
Em10Mv0F:				.include ".\\em10\\Move\\MV\\Em10Mv0F.s"
Em10Mv10Br:				.include ".\\em10\\Move\\BR\\Em10Mv10Br.s"
Em10Mv10:				.include ".\\em10\\Move\\MV\\Em10Mv10.s"
Em10Mv11Br:				.include ".\\em10\\Move\\BR\\Em10Mv11Br.s"
Em10Mv11:				.include ".\\em10\\Move\\MV\\Em10Mv11.s"
Em10Damage:				.include ".\\em10\\Damage\\Em10Damage.s"
Em10Dm00:				.include ".\\em10\\Damage\\Em10Dm00.s"
Em10Dm01:				.include ".\\em10\\Damage\\Em10Dm01.s"
Em10Firedm:				.include ".\\em10\\Damage\\Em10Firedm.s"
Em10Ryudm:				.include ".\\em10\\Damage\\Em10Ryudm.s"
Em10Tudm:				.include ".\\em10\\Damage\\Em10Tudm.s"
Em10Spdm:				.include ".\\em10\\Damage\\Em10Spdm.s"
Em10Dm02:				.include ".\\em10\\Damage\\Em10Dm02.s"
Em10Dm03:				.include ".\\em10\Damage\\\Em10Dm03.s"
Em10Dm04:				.include ".\\em10\\Damage\\Em10Dm04.s"
Em10Dm05:				.include ".\\em10\\Damage\\Em10Dm05.s"
Em10Dm06:				.include ".\\em10\\Damage\\Em10Dm06.s"
Em10Dm07:				.include ".\\em10\\Damage\\Em10Dm07.s"
Em10Dm08:				.include ".\\em10\\Damage\\Em10Dm08.s"
Em10Die:				.include ".\\em10\\Die\\Em10Die.s"
Em10Die00:				.include ".\\em10\\Die\\Em10Die00.s"
Em10Die01:				.include ".\\em10\\Die\\Em10Die01.s"
Em10Die02:				.include ".\\em10\\Die\\Em10Die02.s"
Em10Die03:				.include ".\\em10\\Die\\Em10Die03.s"
Em10Die04:				.include ".\\em10\\Die\\Em10Die04.s"
Em10Die05:				.include ".\\em10\\Die\\Em10Die05.s"
Em10Scenario:			.include ".\\em10\\Scenario\\Em10Scenario.s"
Em10Sce00:				.include ".\\em10\\Scenario\\Em10Sce00.s"
Em10Sce01:				.include ".\\em10\\Scenario\\Em10Sce01.s"
Em10Sce02:				.include ".\\em10\\Scenario\\Em10Sce02.s"
Em10Sce03:				.include ".\\em10\\Scenario\\Em10Sce03.s"
Em10Sce04:				.include ".\\em10\\Scenario\\Em10Sce04.s"
Em10Dead:				.include ".\\em10\\Em10Dead.s"
PlDamegeEm210:			.include ".\\em10\\Player\\PlDamegeEm210.s"
Em10Pldm00:				.include ".\\em10\\Player\\Em10Pldm00.s"
Em10Pldm01:				.include ".\\em10\\Player\\Em10Pldm01.s"
Em10Pldm02:				.include ".\\em10\\Player\\Em10Pldm02.s"
PldieEm210:				.include ".\\em10\\Player\\PldieEm210.s"
Em10Pldie00:			.include ".\\em10\\Player\\Em10Pldie00.s"
Em10KahannsinWalk:		.include ".\\em10\\Em10KahannsinWalk.s"
Em10Kubigoro:			.include ".\\em10\\Em10Kubigoro.s"
Em10Water:				.include ".\\em10\\Em10Water.s"
Em10UdeDown:			.include ".\\em10\\Em10UdeDown.s"
Em10Life:				.dh  70,  84, 118,  65,  50,  85,  48,  65,  40,  73,  69,  56,  70,  55,  72,  55
Em10LifeEasy:			.dh  39,  13,  27,  39,  54,  27,  39,  85,  27,  39,  27,  27,  39,  27,  39,  27
Em23Life:				.dh 300
Em23LifeEasy:			.dh 300
Em2aLife:				.dh 250, 450, 300, 300, 220, 300, 400, 300, 400, 350
Em2aLifeEasy:			.dh 180, 340, 220, 240, 175, 240, 310, 240, 310, 300
Em2bLife:				.dh 250
Em2bLifeEasy:			.dh 200
Em1FLife:				.dh  80,  94, 128,  75,  60,  95,  58,  75,  50,  83,  79,  66,  80,  65,  82,  65
Em1FLifeEasy:			.dh  54,  28,  54,  54,  70,  40,  54, 100,  40,  54,  70,  54,  54,  70,  54,  40
word_801196B0:			.dh 240, 240, 250, 450, 300, 300, 220, 300, 400, 300, 400, 350
word_801196C8:			.dh 180, 340, 220, 240, 175, 240, 310, 240, 310, 300, 250, 200
Subpl_walk:				.byte 0x14,0x10,0x46,0x30,0x14,0x10,0x46,0x30,0x3C,0x30,0x32,0x30,0x3C,0x30,0x41,0x30
						.byte 0x3C,0x30,0x41,0x30,0x1E,0x10,   0,   0,   0,   0,   0,   0,   0,   0,0x32,0x30
						.byte 0x4B,0x30,0x46,0x30,0x4B,0x30,0x46,0x30,0x4B,0x30,0x46,0x30,0x4B,0x30,0x46,0x30
						.byte 0x4B,0x30,0x46,0x30,0x4B,0x30,0x4B,0x30,0x4B,0x30,0x4B,0x30,0x46,0x30,0x32,0x30
Subpl_back:				.byte 0x19,0x10,0x37,0x30,0x19,0x10,0x37,0x30,0x37,0x30,0x23,0x30,0x37,0x30,0x37,0x30
						.byte 0x37,0x30,0x37,0x30,0x19,0x10,   0,   0,   0,   0,   0,   0,   0,   0,0x23,0x30
						.byte 0x46,0x30,0x41,0x30,0x46,0x30,0x41,0x30,0x46,0x30,0x41,0x30,0x46,0x30,0x41,0x30
						.byte 0x46,0x30,0x41,0x30,0x46,0x30,0x46,0x30,0x46,0x30,0x46,0x30,0x37,0x30,0x23,0x30
Subpl_dir:				.byte    0,0x20,   0,0x58,   0,0x20,   0,0x58,   0,0x58,   0,0x50,   0,0x58,   0,0x58
						.byte    0,0x58,   0,0x58,   0,0x20,   0,   0,   0,   0,   0,   0,   0,   0,   0,0x50
						.byte    0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x60
						.byte    0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x60,   0,0x58,   0,0x50
Subpl_ato:				.byte  0xA,   8,0x2D,0x30, 0xA,   8,0x2D,0x30,0x28,0x30,0x1E,0x28,0x28,0x30,0x28,0x28
						.byte 0x28,0x28,0x28,0x28, 0xA,   8,   0,   0,   0,   0,   0,   0,   0,   0,0x1E,0x28
						.byte 0x28,0x30,0x2D,0x30,0x28,0x30,0x2D,0x30,0x28,0x30,0x2D,0x30,0x28,0x30,0x2D,0x30
						.byte 0x28,0x30,0x2D,0x30,0x28,0x30,0x28,0x30,0x28,0x30,0x28,0x30,0x2D,0x30,0x1E,0x28
Subpl_run:				.byte 0x1E,0x1E,0xDC,0x48,0x1E,0x1E,0xDC,0x48,0xBE,0x48,0x78,0x40,0xBE,0x48,0xAA,0x48
						.byte 0xA0,0x3C,0xAA,0x48,0x1E,0x1E,   0,   0,   0,   0,   0,   0,   0,   0,0x78,0x40
						.byte 0xC8,0x48,0xD2,0x48,0xC8,0x48,0xD2,0x48,0xC8,0x48,0xD2,0x48,0xC8,0x48,0xD2,0x48
						.byte 0xC8,0x48,0xD2,0x48,0xC8,0x48,0xC8,0x48,0xC8,0x48,0xC8,0x48,0xDC,0x48,0x78,0x40
Em4a_zobiparts_tbl:		.byte  8, 17
						.byte 12, 18
						.byte 13, 15
						.byte 14, 19
						.byte  9, 20
						.byte 10, 21
						.byte 11, 22
						.byte  0,  0
Em10_routine_0:			.word Em10Init
						.word Em10Move
						.word Em10Damage
						.word Em10Die
						.word Spl_Scenario
						.word 0
						.word 0
						.word Em10Dead
						.word Em10Scenario
Em10_Move_type:			.word Em10MoveType00
						.word Em10MoveType01
						.word Em10MoveType00
						.word Em10MoveType01
						.word Em10MoveType00
						.word Em10MoveType01
						.word Em10MoveType00
						.word Em10MoveType01
						.word Em10MoveType00
						.word Em10MoveType01
						.word Em10MoveType00
						.word Em10MoveType01
						.word Em10MoveType00
						.word Em10MoveType01
Em10_mv_br_type00:		.word Em10Mv00Br
						.word Em10Mv01Br
						.word Em10Mv02Br
						.word Em10Mv03Br
						.word Em10Mv05Br
						.word Em10Mv06Br
						.word Em10Mv08Br
						.word Em10Mv07Br
						.word Em10Mv0ABr
						.word Em10Mv0BBr
						.word Em10Mv0CBr
						.word Em10Mv0DBr
						.word Em10Mv0EBr
						.word Em10Mv0FBr
						.word Em10Mv10Br
						.word Em10Mv11Br
Em10_mv_type00:			.word Em10Mv00
						.word Em10Mv01
						.word Em10Mv02
						.word Em10Mv03
						.word Em10Mv05
						.word Em10Mv06
						.word Em10Mv08
						.word Em10Mv07
						.word Em10Mv0A
						.word Em10Mv0B
						.word Em10Mv0C
						.word Em10Mv0D
						.word Em10Mv0E
						.word Em10Mv0F
						.word Em10Mv10
						.word Em10Mv11
Em10_mv_br_type01:		.word Em10Mv04Br
						.word Em10Mv03Br
						.word Em10Mv09Br
Em10_mv_type01:			.word Em10Mv04
						.word Em10Mv03
						.word Em10Mv09
Em10_walk_rnd:			.dh 190, 32818
						.dh 150, 32832
						.dh 110, 32832
						.dh 180, 32820
						.dh 140, 32820
						.dh 120, 32826
						.dh 150, 32846
						.dh 140, 32818
						.dh 150, 32830
						.dh 150, 32840
						.dh 110, 32838
						.dh 120, 32842
						.dh 180, 32802
						.dh 110, 32820
						.dh 200, 32834
						.dh	180, 32834
Em10_dm:				.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word 0,		0,			0,			0,			0,			0,			0,			0,			0
						.word 0,		0,			0,			0,			0,			0,			0,			0,			0
						.word Em10Dm05,	Em10Dm02,	0,			Em10Dm05,	Em10Dm01,	0,			Em10Dm05,	Em10Dm00,	0
						.word Em10Dm05,	Em10Dm02,	0,			Em10Dm05,	Em10Dm01,	0,			Em10Dm05,	Em10Dm01,	0
						.word Em10Dm05,	Em10Dm01,	Em10Dm01,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00
						.word Em10Dm01,	Em10Dm01,	Em10Dm01,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00
						.word Em10Dm01,	Em10Dm01,	Em10Dm01,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00,	Em10Dm00
						.word Em10Dm05,	Em10Dm04,	0,			Em10Dm05,	Em10Dm04,	0,			Em10Dm05,	Em10Dm04,	0
						.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word Em10Dm08,	Em10Dm08,	0,			Em10Dm08,	Em10Dm08,	0,			Em10Dm08,	Em10Dm08,	0
						.word Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0,			Em10Dm00,	Em10Dm00,	0
						.word 0,		0,			0,			0,			0,			0,			0,			0,			0
						.word Em10Dm08,	Em10Dm08,	0,			Em10Dm08,	Em10Dm08,	0,			Em10Dm08,	Em10Dm08,	0
Em10_haidm:				.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
						.word Em10Dm06
Em10_dm00_usonum:		.byte 9
						.byte 15
						.byte 15
						.byte 35
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 20
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
						.byte 0
Em10_die:				.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Dm05,		Em10Die03,	0,			Em10Dm05,	Em10Die03,	0,			Em10Dm05,	Em10Die03,	0
						.word Em10Dm05,		Em10Die03,	0,			Em10Dm05,	Em10Die03,	0,			Em10Dm05,	Em10Die03,	0
						.word Em10Dm05,		Em10Dm02,	0,			Em10Dm05,	Em10Die00,	0,			Em10Dm05,	Em10Die00,	0
						.word Em10Dm05,		Em10Die02,	0,			Em10Dm05,	Em10Die04,	0,			Em10Dm05,	Em10Die00,	0
						.word Em10Dm05,		Em10Die02,	Em10Die02,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00
						.word Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00
						.word Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00,	Em10Die00
						.word Em10Die00,	Em10Die04,	0,			Em10Die00,	Em10Die04,	0,			Em10Die00,	Em10Die04,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
						.word Em10Dm05,		Em10Die02,	0,			Em10Dm05,	Em10Die04,	0,			Em10Dm05,	Em10Die00,	0
						.word Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0,			Em10Die00,	Em10Die00,	0
Em10_haidie:			.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
						.word Em10Die01
Em10_sce:				.word Em10Sce00
						.word Em10Sce01
						.word Em10Sce02
						.word Em10Sce03
						.word Em10Sce04
PlDamageEm10Tbl:		.word Em10Pldm00
						.word Em10Pldm00
						.word Em10Pldm02
						.word Em10Pldm02
Pldie_Em10_tbl:			.word Em10Pldie00
						.word Em10Pldie00
Em10_pldm00_hajiki:		.byte 0, 0, 0, 0
Em10_hajiki_no:			.byte 0, 0, 0, 0

.close