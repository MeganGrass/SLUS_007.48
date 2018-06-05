

.erroronwarning on
.psx
.open "EM2100.BIN",0x8010D000
.include "C:\\BioDSZ\\r3000a\\Executable.map"
.include "C:\\BioDSZ\\r3000a\\DualShock.map"

Em221:					.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Em221.s"
Em21_kage_set:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_kage_set.s"
Em21_Init:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Em21_Init.s"
Em21_Move:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\Em21_Move.s"
Em21_br_wait_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_wait_i.s"
Em21_mv_wait_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_wait_i.s"
Em21_br_go_wait_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_go_wait_i.s"
Em21_mv_go_wait_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_go_wait_i.s"
Em21_br_take_off_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_take_off_i.s"
Em21_mv_take_off_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_take_off_i.s"
Em21_br_glide_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_glide_i.s"
Em21_mv_glide_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_glide_i.s"
Em21_br_flight_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_flight_i.s"
Em21_mv_flight_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_flight_i.s"
Em21_br_up_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_up_i.s"
Em21_mv_up_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_up_i.s"
Em21_br_down_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_down_i.s"
Em21_mv_down_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_down_i.s"
Em21_br_landing_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_landing_i.s"
Em21_mv_landing_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_landing_i.s"
Em21_br_quick_turn_i:	.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_quick_turn_i.s"
Em21_mv_quick_turn_i:	.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_quick_turn_i.s"
Em21_br_jump_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_jump_i.s"
Em21_mv_jump_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_jump_i.s"
Em21_br_fall_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_fall_i.s"
Em21_mv_fall_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_fall_i.s"
Em21_br_crash_f_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_crash_f_i.s"
Em21_mv_crash_f_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_crash_f_i.s"
Em21_br_crash_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_crash_i.s"
Em21_mv_crash_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_crash_i.s"
Em21_br_peck_f_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_peck_f_i.s"
Em21_mv_peck_f_i:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_peck_f_i.s"
Em21_br_peck_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\BR\\Em21_br_peck_i.s"
Em21_mv_peck_i:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Move\\MV\\Em21_mv_peck_i.s"
Em21_Damage:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em21_Damage.s"
Em21_dm00:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em21_dm00.s"
Em21_dm01:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em21_dm01.s"
Em21_parts_bomb_set:	.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_parts_bomb_set.s"
Em21_parts_fall_set:	.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_parts_fall_set.s"
Em21_dm02:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em21_dm02.s"
Em21_dm03:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em21_dm03.s"
Em21_Die:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Dead\\Em21_Die.s"
Em21_Scenario:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Scenario\\Em21_Scenario.s"
Em21_sce_wait:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Scenario\\Em21_sce_wait.s"
Em21_sce_rush:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Scenario\\Em21_sce_rush.s"
Em21_sce_crash:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Scenario\\Em21_sce_crash.s"
Em21_Dead:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Dead\\Em21_Dead.s"
Em21_dead_normal:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Dead\\Em21_dead_normal.s"
Em21_dead_bomb:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Dead\\Em21_dead_bomb.s"
Em21_dead_bow:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Dead\\Em21_dead_bow.s"
Em21_dead_instant:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Dead\\Em21_dead_instant.s"
Em21_foot_set:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_foot_set.s"
Em21_r0_set:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_r0_set.s"
Em21_r1_set:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_r1_set.s"
Em21_sca_avoid_ck:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_sca_avoid_ck.s"
Em21_attack_ck:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_attack_ck.s"
Em21_run_away_ck:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_run_away_ck.s"
Em21_pl_dead_ck:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_pl_dead_ck.s"
Em21_lock_off_ck:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_lock_off_ck.s"
Em21_set_flg_all:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_set_flg_all.s"
Em_21_blood_call:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em_21_blood_call.s"
Em_21_blood_call2:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Damage\\Em_21_blood_call2.s"
Em_21_feather_call:		.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Em_21_feather_call.s"
Em21_atd_set:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\CkSet\\Em21_atd_set.s"
Pldamage_Em221:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Player\\Pldamage_Em221.s"
Em21_pldm00:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Player\\Em21_pldm00.s"
Em21_dummy_br:			.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Em21_dummy_br.s"
Em21_dummy:				.include "C:\\BioDSZ\\asset\\Enemy\\em021\\Em21_dummy.s"
Em23_life:				.dh	300
Em23_life_easy:			.dh	300
Em2a_life:				.dh	250, 450, 300, 300, 220, 300, 400, 300
						.dh	400, 350
Em2a_life_easy:			.dh	180, 340, 220, 240, 175, 240, 310, 240
						.dh	310, 300
Em2b_life:				.dh	250, 200, 240, 240, 250, 450, 300, 300
						.dh	220, 300, 400, 300, 400
Em2b_life_easy:			.dh	350, 180, 340, 220, 240, 175, 240, 310
						.dh	240, 310, 300, 250, 200
Em21_routine_0:			.word Em21_Init
						.word Em21_Move
						.word Em21_Damage
						.word Em21_Damage
						.word Em21_Scenario
						.word 0
						.word 0
						.word Em21_Dead
Em21_indoor_br:			.word Em21_br_wait_i
						.word Em21_br_go_wait_i
						.word Em21_br_take_off_i
						.word Em21_br_glide_i
						.word Em21_br_flight_i
						.word Em21_br_up_i
						.word Em21_br_down_i
						.word Em21_br_landing_i
						.word Em21_br_quick_turn_i
						.word Em21_br_jump_i
						.word Em21_br_fall_i
						.word Em21_br_crash_f_i
						.word Em21_br_crash_i
						.word Em21_br_peck_f_i
						.word Em21_br_peck_i
Em21_indoor_mv:			.word Em21_mv_wait_i
						.word Em21_mv_go_wait_i
						.word Em21_mv_take_off_i
						.word Em21_mv_glide_i
						.word Em21_mv_flight_i
						.word Em21_mv_up_i
						.word Em21_mv_down_i
						.word Em21_mv_landing_i
						.word Em21_mv_quick_turn_i
						.word Em21_mv_jump_i
						.word Em21_mv_fall_i
						.word Em21_mv_crash_f_i
						.word Em21_mv_crash_i
						.word Em21_mv_peck_f_i
						.word Em21_mv_peck_i
Em21_outdoor_br:		.word Em21_br_wait_i
						.word Em21_br_go_wait_i
						.word Em21_br_take_off_i
						.word Em21_br_glide_i
						.word Em21_br_flight_i
						.word Em21_br_up_i
						.word Em21_br_down_i
						.word Em21_br_landing_i
						.word Em21_br_quick_turn_i
						.word Em21_br_jump_i
						.word Em21_br_fall_i
						.word Em21_br_crash_f_i
						.word Em21_br_crash_i
						.word Em21_br_peck_f_i
						.word Em21_br_peck_i
Em21_outdoor_mv:		.word Em21_mv_wait_i
						.word Em21_mv_go_wait_i
						.word Em21_mv_take_off_i
						.word Em21_mv_glide_i
						.word Em21_mv_flight_i
						.word Em21_mv_up_i
						.word Em21_mv_down_i
						.word Em21_mv_landing_i
						.word Em21_mv_quick_turn_i
						.word Em21_mv_jump_i
						.word Em21_mv_fall_i
						.word Em21_mv_crash_f_i
						.word Em21_mv_crash_i
						.word Em21_mv_peck_f_i
						.word Em21_mv_peck_i
Em21_dm:				.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm01
						.word Em21_dm01
						.word Em21_dm03
						.word Em21_dm03
						.word Em21_dm01
						.word Em21_dm01
						.word Em21_dm01
						.word Em21_dm02
						.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm00
						.word Em21_dm01
						.word Em21_dm00
Em21_sce_mv:			.word Em21_sce_wait
						.word Em21_sce_rush
						.word Em21_sce_crash
Em21_dead_mv:			.word Em21_dead_normal
						.word Em21_dead_bomb
						.word Em21_dead_bow
						.word Em21_dead_instant
Pldamage_Em21_tbl:		.word Em21_pldm00
D0:						.word 0

.close