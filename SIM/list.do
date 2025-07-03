onerror {resume}
add list -hex -width 34 /a_mips_tb/U_0/IFE/instruction_o
add list -hex -width 34 /a_mips_tb/U_0/IFE/pc_o
add list -hex -width 34 /a_mips_tb/U_0/EXE/a_input_w
add list -hex -width 34 /a_mips_tb/U_0/EXE/b_input_w
add list -bin /a_mips_tb/U_0/EXE/alu_ctl_w
add list /a_mips_tb/U_0/EXE/alu_ctl_w
add list /a_mips_tb/U_0/ALUOp_EX
add list /a_mips_tb/U_0/ALU_Result
add list /a_mips_tb/U_0/Sign_Extend
add list /a_mips_tb/U_0/ALUSrc_EX
configure list -usestrobe 0
configure list -strobestart {0 ps} -strobeperiod {0 ps}
configure list -usesignaltrigger 1
configure list -delta all
configure list -signalnamewidth 0
configure list -datasetprefix 0
configure list -namelimit 5
