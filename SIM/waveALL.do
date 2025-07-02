onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group MIPSTB_mod /a_mips_tb/PC
add wave -noupdate -group MIPSTB_mod /a_mips_tb/clock
add wave -noupdate -group MIPSTB_mod /a_mips_tb/reset
add wave -noupdate -group MIPSTB_mod /a_mips_tb/ST_trigger
add wave -noupdate -group MIPSTB_mod /a_mips_tb/ena
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/clock
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/reset
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/mw_U_0clk
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/mw_U_0disable_clk
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/mw_U_1pulse
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/PC
add wave -noupdate -group MIPSTB_mod /a_mips_tb/CLKCNT
add wave -noupdate -group MIPSTB_mod /a_mips_tb/STCNT
add wave -noupdate -group MIPSTB_mod /a_mips_tb/FHCNT
add wave -noupdate -group MIPSTB_mod /a_mips_tb/ALU_result_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/Branch_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/Instruction_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/Memwrite_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/Regwrite_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/Zero_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/read_data_1_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/read_data_2_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/write_data_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/BPADD
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/read_data_1_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/read_data_2_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/write_data_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/ALU_result_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/Branch_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/Instruction_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/Memwrite_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/Regwrite_out
add wave -noupdate -group MIPSTB_mod /a_mips_tb/U_1/Zero_out
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/rst_i
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/clk_i
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/ena
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/PC
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/CLKCNT_o
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/STCNT_o
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/FHCNT_o
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/STRIGGER_o
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/INSTCNT_o
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/resetSim
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/enaSim
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/BPADD_ena
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/Run
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/PC_BPADD
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/ForwardA
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/ForwardB
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/inst_cnt_w
add wave -noupdate -group MIPS_mod /a_mips_tb/U_1/ena
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/MCLK_w
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/BPADD
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/PC_plus_4
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/read_data1_i
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/read_data2_i
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/Sign_Extend
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/Add_Result
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/ALU_Result
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/read_data
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/ALUSrc
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/RegDst
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/Regwrite
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/Zero
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/MemWrite
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/MemtoReg
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/MemRead
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/ALUop
add wave -noupdate -group MIPS_mod /a_mips_tb/U_0/Instruction
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/instruction_o
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/pc_plus4_o
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/add_result_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/PCSrc_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/pc_o
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/addr_res_o
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/clk_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/ena_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/Stall_IF_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/BPADD_ena_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/rst_i
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_cnt_o
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/pc_q
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/pc_plus4_r
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/next_pc_w
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/itcm_addr_w
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/ifetch_clock
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_cnt_q
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/wren_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/wren_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/rden_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/rden_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/data_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/data_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/address_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/address_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/clock0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/clock1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/clocken0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/clocken1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/clocken2
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/clocken3
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/aclr0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/aclr1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/addressstall_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/addressstall_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/byteena_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/byteena_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/q_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/q_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/eccstatus
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_data_reg_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_data_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_reg_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp2_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp_wren_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp2_wren_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp_wren_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_tmp2_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_output_latch
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_ecc_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_q_ecc_tmp_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_current_written_data_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_original_data_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_original_data_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a_x
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b_x
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a_out
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b_out
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_address_reg_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_address_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_wren_reg_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_wren_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_rden_reg_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_rden_reg_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_read_flag_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_read_flag_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_reread_flag_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_reread_flag_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_reread_flag2_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_reread_flag2_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_write_flag_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_write_flag_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_nmram_write_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_nmram_write_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_indata_aclr_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_address_aclr_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_wrcontrol_aclr_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_indata_aclr_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_address_aclr_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_wrcontrol_aclr_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_outdata_aclr_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_outdata_aclr_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_rdcontrol_aclr_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_aclr_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_aclr_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/good_to_go_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/good_to_go_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_core_clocken_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_core_clocken_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_core_clocken_b0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_core_clocken_b1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_inclocken0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_input_clocken_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_outdata_clken_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_outdata_clken_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_outlatch_clken_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_outlatch_clken_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_core_clocken_a_reg
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_core_clocken_b_reg
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/default_val
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_data_zero_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_data_zero_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_data_ones_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_data_ones_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/same_clock_pulse0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/same_clock_pulse1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_force_reread_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_force_reread_a1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_force_reread_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_force_reread_b1
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_force_reread_signal_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_force_reread_signal_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_good_to_write_a
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_good_to_write_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/Stall_IF
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/PC_plus_4_IF
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IR_IF
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFE/inst_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFpc_0
add wave -noupdate -group IF_MOD /a_mips_tb/U_0/IFinstruction_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/read_data1_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/read_data2_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/rt_register_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/rd_register_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/write_register_address
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/instruction_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/PC_plus_4_shifted_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/RegWrite_ctrl_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/ForwardA_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/ForwardB_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/BranchBeq_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/BranchBne_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/Jump_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/JAL_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/Stall_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/write_data_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/Branch_read_data_FW
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/sign_extend_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/PCSrc_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/JumpAddr_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/PCBranch_addr_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/clk_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/rst_i
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/RF_q
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/write_reg_addr_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/write_reg_data_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/rs_register_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/rt_register_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/rd_register_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/imm_value_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/read_data_1_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/read_data_2_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/read_data_comp_input_1
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/read_data_comp_input_2
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/Opcode_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/sign_extend_w
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/PC_plus_4_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/IR_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/read_data_1_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/read_data_2_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Sign_extend_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Wr_reg_addr_0_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Wr_reg_addr_1_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/PCBranch_addr_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/JumpAddr_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ID/write_data_mux_out
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/IDpc_0
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/IDinstruction_o
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/MemtoReg_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/RegWrite_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Jal_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Branch_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/MemWrite_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/MemRead_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/BranchBeq_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/BranchBne_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Jump_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ForwardA_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ForwardB_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/RegDst_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ALUSrc_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/ALUOp_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/Stall_ID
add wave -noupdate -expand -group ID_mod /a_mips_tb/U_0/PCSrc_ID
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/opcode_i
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/funct_i
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/RegDst_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/ALUSrc_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/MemtoReg_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/RegWrite_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/MemRead_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/MemWrite_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/BranchBeq_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/BranchBne_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Jump_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Jal_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/ALUOp_ctrl_o
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/clock
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/reset
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/rtype_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/itype_imm_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/lw_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/sw_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/beq_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Bne_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Addi_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Ori_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Xori_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Andi_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Shift_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Lui_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/Slti_w
add wave -noupdate -expand -group CONTROL_MOD /a_mips_tb/U_0/CTL/JalSignal_w
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/read_data1_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/read_data2_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/sign_extend_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/funct_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/opcode_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/ALUOp_ctrl_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/ALUSrc_ctrl_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/zero_o
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/RegDst
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/alu_res_o
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/pc_plus4_i
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Wr_reg_addr
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Wr_reg_addr_0
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Wr_reg_addr_1
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Wr_data_FW_WB
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Wr_data_FW_MEM
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/ForwardA
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/ForwardB
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/WriteData_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/a_input_w
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/b_input_w
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Aforward_mux
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/Bforward_mux
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/alu_out_mux_w
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/alu_ctl_w
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/write_register_address
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/write_register_address_1
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXE/write_register_address_0
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/PC_plus_4_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/IR_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/read_data_1_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/read_data_2_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Sign_extend_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Wr_reg_addr_0_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Wr_reg_addr_1_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Wr_reg_addr_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/write_data_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Add_Result_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/ALU_Result_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Opcode_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXpc_0
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/EXinstruction_o
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/MemtoReg_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/RegWrite_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Jal_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Zero_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Branch_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/MemWrite_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/MemRead_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/BranchBeq_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/BranchBne_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Jump_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/RegDst_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/ALUSrc_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/ALUOp_EX
add wave -noupdate -group EXE_mod /a_mips_tb/U_0/Flush_EX
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/MemtoReg_EX
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/MemtoReg_MEM
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/WriteReg_EX
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/WriteReg_MEM
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/WriteReg_WB
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/RegRs_ID
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/RegRt_ID
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/RegRs_EX
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/RegRt_EX
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/EX_RegWr
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/MEM_RegWr
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/WB_RegWr
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/BranchBeq_ID
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/BranchBne_ID
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/Jump_ID
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/Stall_IF
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/Stall_ID
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/Flush_EX
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/ForwardA
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/ForwardB
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/ForwardA_Branch
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/ForwardB_Branch
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/LwStall
add wave -noupdate -group HAZARD_MOD /a_mips_tb/U_0/Hazard/BranchStall
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/dtcm_data_rd_o
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/dtcm_addr_i
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/dtcm_data_wr_i
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/MemRead_ctrl_i
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/MemWrite_ctrl_i
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/clk_i
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/rst_i
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/wrclk_w
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/wren_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/wren_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/rden_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/rden_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/data_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/data_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/address_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/address_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/clock0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/clock1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/clocken0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/clocken1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/clocken2
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/clocken3
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/aclr0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/aclr1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/addressstall_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/addressstall_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/byteena_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/byteena_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/q_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/q_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/eccstatus
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_data_reg_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_data_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_reg_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp2_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp_wren_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp2_wren_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp_wren_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_tmp2_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_output_latch
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_ecc_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_q_ecc_tmp_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_current_written_data_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_original_data_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_original_data_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a_x
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b_x
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a_out
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b_out
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_a_out_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_mask_reg_b_out_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_address_reg_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_address_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_wren_reg_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_wren_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_rden_reg_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_rden_reg_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_read_flag_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_read_flag_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_reread_flag_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_reread_flag_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_reread_flag2_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_reread_flag2_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_write_flag_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_write_flag_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_nmram_write_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_nmram_write_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_indata_aclr_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_address_aclr_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_wrcontrol_aclr_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_indata_aclr_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_address_aclr_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_wrcontrol_aclr_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_outdata_aclr_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_outdata_aclr_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_rdcontrol_aclr_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_aclr_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_byteena_aclr_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/good_to_go_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/good_to_go_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_core_clocken_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_core_clocken_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_core_clocken_b0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_core_clocken_b1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_inclocken0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_input_clocken_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_outdata_clken_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_outdata_clken_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_outlatch_clken_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_outlatch_clken_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_core_clocken_a_reg
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_core_clocken_b_reg
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/default_val
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_data_zero_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_data_zero_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_data_ones_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_data_ones_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/same_clock_pulse0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/same_clock_pulse1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_force_reread_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_force_reread_a1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_force_reread_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_force_reread_b1
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_force_reread_signal_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_force_reread_signal_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_good_to_write_a
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEM/data_memory/i_good_to_write_b
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/PC_plus_4_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/Add_Result_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/ALU_Result_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/write_data_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/read_data_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/Wr_reg_addr_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/JumpAddr_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/WBpc_0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/WBinstruction_o
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MemtoReg_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/RegWrite_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/Jal_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/Zero_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/Branch_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MemWrite_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MemRead_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/BranchBeq_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/BranchBne_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/Jump_MEM
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEMpc_0
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/MEMinstruction_o
add wave -noupdate -group MEM_mod /a_mips_tb/U_0/dMemAddr
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/alu_result_i
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/dtcm_data_rd_i
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/PC_plus_4_shifted_i
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/MemtoReg_ctrl_i
add wave -noupdate -group WB_mod /a_mips_tb/U_0/PC_plus_4_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/read_data_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/ALU_Result_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/Wr_reg_addr_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/write_data_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/write_data_mux_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/Jal_i
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/write_data_o
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/write_data_mux_o
add wave -noupdate -group WB_mod /a_mips_tb/U_0/WB/write_reg_data_w
add wave -noupdate -group WB_mod /a_mips_tb/U_0/MemtoReg_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/RegWrite_WB
add wave -noupdate -group WB_mod /a_mips_tb/U_0/Jal_WB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6146584 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 473
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {5863315 ps} {7081745 ps}
bookmark add wave bookmark0 {{1639697 ps} {3161093 ps}} 0
