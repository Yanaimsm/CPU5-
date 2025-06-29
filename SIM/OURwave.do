onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mips_tb/U_0/IFE/clock
add wave -noupdate -radix hexadecimal /mips_tb/U_0/IFE/reset
add wave -noupdate -radix decimal /mips_tb/CLKCNT
add wave -noupdate -radix decimal /mips_tb/FHCNT
add wave -noupdate -radix decimal /mips_tb/STCNT
add wave -noupdate -group Hazard /mips_tb/U_0/Hazard/Stall_ID
add wave -noupdate -group Hazard /mips_tb/U_0/Hazard/Stall_IF
add wave -noupdate -group Hazard /mips_tb/U_0/Hazard/Flush_EX
add wave -noupdate -group Hazard /mips_tb/U_0/Hazard/ForwardA
add wave -noupdate -group Hazard /mips_tb/U_0/Hazard/ForwardB
add wave -noupdate -expand -group Fetch /mips_tb/U_0/IFE/PCSrc
add wave -noupdate -expand -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/Instruction
add wave -noupdate -expand -group Fetch -radix decimal -childformat {{/mips_tb/U_0/IFE/Mem_Addr(7) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(6) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(5) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(4) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(3) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(2) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(1) -radix hexadecimal} {/mips_tb/U_0/IFE/Mem_Addr(0) -radix hexadecimal}} -subitemconfig {/mips_tb/U_0/IFE/Mem_Addr(7) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(6) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(5) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(4) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(3) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(2) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(1) {-height 15 -radix hexadecimal} /mips_tb/U_0/IFE/Mem_Addr(0) {-height 15 -radix hexadecimal}} /mips_tb/U_0/IFE/Mem_Addr
add wave -noupdate -expand -group Fetch -radix decimal /mips_tb/U_0/IFE/PC
add wave -noupdate -expand -group Fetch -radix decimal /mips_tb/U_0/IFE/PC_plus_4
add wave -noupdate -expand -group Fetch -radix hexadecimal /mips_tb/U_0/IFE/next_PC
add wave -noupdate -expand -group Decode -radix hexadecimal -childformat {{/mips_tb/U_0/ID/register_array(0) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(1) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(2) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(3) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(4) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(5) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(6) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(7) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(8) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(9) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(10) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(11) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(12) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(13) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(14) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(15) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(16) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(17) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(18) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(19) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(20) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(21) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(22) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(23) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(24) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(25) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(26) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(27) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(28) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(29) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(30) -radix hexadecimal} {/mips_tb/U_0/ID/register_array(31) -radix hexadecimal}} -subitemconfig {/mips_tb/U_0/ID/register_array(0) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(1) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(2) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(3) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(4) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(5) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(6) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(7) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(8) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(9) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(10) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(11) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(12) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(13) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(14) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(15) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(16) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(17) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(18) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(19) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(20) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(21) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(22) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(23) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(24) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(25) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(26) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(27) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(28) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(29) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(30) {-height 15 -radix hexadecimal} /mips_tb/U_0/ID/register_array(31) {-height 15 -radix hexadecimal}} /mips_tb/U_0/ID/register_array
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/ID/Instruction
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/ID/read_data_1
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/ID/read_data_2
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/ID/write_data
add wave -noupdate -expand -group Decode /mips_tb/U_0/ID/write_register_address
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/ID/read_register_1_address
add wave -noupdate -expand -group Decode -radix hexadecimal /mips_tb/U_0/ID/read_register_2_address
add wave -noupdate -group Control /mips_tb/U_0/CTL/Jal
add wave -noupdate -group Control /mips_tb/U_0/CTL/Jump
add wave -noupdate -group Control /mips_tb/U_0/CTL/Shift
add wave -noupdate -group Control /mips_tb/U_0/CTL/ALUop
add wave -noupdate -group Control /mips_tb/U_0/CTL/BranchBeq
add wave -noupdate -group Control /mips_tb/U_0/CTL/BranchBne
add wave -noupdate -group Control /mips_tb/U_0/CTL/ALUSrc
add wave -noupdate -expand -group Execute /mips_tb/U_0/EXE/ALUCTL/ALUOp
add wave -noupdate -expand -group Execute -radix hexadecimal /mips_tb/U_0/EXE/RegDst
add wave -noupdate -expand -group Execute /mips_tb/U_0/EXE/ALUCTL/Funct
add wave -noupdate -expand -group Execute /mips_tb/U_0/EXE/ALUCTL/Opcode
add wave -noupdate -expand -group Execute -radix hexadecimal /mips_tb/U_0/EXE/ALU_ctl
add wave -noupdate -expand -group Execute /mips_tb/U_0/EXE/ALUOp
add wave -noupdate -expand -group Execute /mips_tb/U_0/EXE/ALUSrc
add wave -noupdate -expand -group Execute -radix hexadecimal -childformat {{/mips_tb/U_0/EXE/ALU_Result(31) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(30) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(29) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(28) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(27) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(26) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(25) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(24) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(23) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(22) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(21) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(20) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(19) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(18) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(17) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(16) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(15) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(14) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(13) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(12) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(11) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(10) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(9) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(8) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(7) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(6) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(5) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(4) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(3) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(2) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(1) -radix hexadecimal} {/mips_tb/U_0/EXE/ALU_Result(0) -radix hexadecimal}} -subitemconfig {/mips_tb/U_0/EXE/ALU_Result(31) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(30) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(29) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(28) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(27) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(26) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(25) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(24) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(23) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(22) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(21) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(20) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(19) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(18) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(17) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(16) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(15) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(14) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(13) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(12) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(11) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(10) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(9) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(8) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(7) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(6) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(5) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(4) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(3) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(2) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(1) {-height 15 -radix hexadecimal} /mips_tb/U_0/EXE/ALU_Result(0) {-height 15 -radix hexadecimal}} /mips_tb/U_0/EXE/ALU_Result
add wave -noupdate -expand -group Execute -radix hexadecimal /mips_tb/U_0/EXE/Aforward_mux
add wave -noupdate -expand -group Execute -radix hexadecimal /mips_tb/U_0/EXE/Bforward_mux
add wave -noupdate -expand -group Execute /mips_tb/U_0/EXE/Wr_reg_addr
add wave -noupdate -expand -group Execute -radix hexadecimal /mips_tb/U_0/EXE/Ainput
add wave -noupdate -expand -group Execute -radix hexadecimal /mips_tb/U_0/EXE/Binput
add wave -noupdate -group Memory -radix hexadecimal /mips_tb/U_0/MEM/read_data
add wave -noupdate -group Memory /mips_tb/U_0/Branch_MEM
add wave -noupdate -group Memory /mips_tb/U_0/JumpAddr_MEM
add wave -noupdate -group Memory /mips_tb/U_0/Zero_MEM
add wave -noupdate -group Memory -radix hexadecimal /mips_tb/U_0/MEM/address
add wave -noupdate -group Memory -radix hexadecimal /mips_tb/U_0/MEM/write_data
add wave -noupdate -group Memory /mips_tb/U_0/MEM/MemRead
add wave -noupdate -group Memory /mips_tb/U_0/MEM/Memwrite
add wave -noupdate -expand -group WriteBack -radix hexadecimal /mips_tb/U_0/write_data_WB
add wave -noupdate -expand -group WriteBack /mips_tb/U_0/Wr_reg_addr_WB
add wave -noupdate -expand -group WriteBack -radix hexadecimal /mips_tb/U_0/WB/Jal
add wave -noupdate -expand -group WriteBack -radix decimal /mips_tb/U_0/WB/PC_plus_4_shifted
add wave -noupdate -expand -group WriteBack /mips_tb/U_0/RegWrite_WB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {21057555 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 277
configure wave -valuecolwidth 39
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
WaveRestoreZoom {21270872 ps} {22038376 ps}
