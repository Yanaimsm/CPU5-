library IEEE;
use ieee.std_logic_1164.all;

package aux_package is
--------------------------------------------------------
	COMPONENT Ifetch IS
	GENERIC (MemWidth	: INTEGER;
			 SIM 		: BOOLEAN);
	PORT(	Instruction						       : OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	PC_plus_4_out 					       : OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	Add_result 						       : IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        	PCSrc 							       : IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
      		PC_out 							       : OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			JumpAddr						       : IN	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        	clock, ena, Stall_IF, BPADD_ena, reset : IN 	STD_LOGIC);
	END COMPONENT;

	COMPONENT Idecode
	PORT(	read_data_1						: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_2						: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			write_register_address_0 		: OUT   STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			write_register_address_1 		: OUT   STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			write_register_address      	: IN    STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Instruction 					: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC_plus_4_shifted				: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			RegWrite						: IN 	STD_LOGIC;
			ForwardA_ID, ForwardB_ID		: IN 	STD_LOGIC;
			BranchBeq, BranchBne, Jump, JAL	: IN 	STD_LOGIC; -- Added JAL
			Stall_ID					: IN    STD_LOGIC;
			write_data				: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Branch_read_data_FW			: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Sign_extend 				: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PCSrc		 				: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			JumpAddr					: OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			PCBranch_addr 				: OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			clock,reset					: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT control
	PORT( 	
		Opcode 							: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		Funct							: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		RegDst 							: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUSrc 							: OUT 	STD_LOGIC;
		MemtoReg 						: OUT 	STD_LOGIC;
		RegWrite 						: OUT 	STD_LOGIC;
		MemRead 						: OUT 	STD_LOGIC;
		MemWrite 						: OUT 	STD_LOGIC;
		BranchBeq 						: OUT 	STD_LOGIC;
		BranchBne 						: OUT 	STD_LOGIC;
		Jump							: OUT 	STD_LOGIC;
		Jal								: OUT 	STD_LOGIC;
		ALUop 							: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		clock, reset					: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT  Execute
	PORT(	Read_data_1 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Sign_extend 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Function_opcode : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			Opcode			: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			ALUOp 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			ALUSrc 			: IN 	STD_LOGIC;
			Zero 			: OUT	STD_LOGIC;
			RegDst			: IN    STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			ALU_Result 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			Wr_reg_addr     : OUT   STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Wr_reg_addr_0	: IN    STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Wr_reg_addr_1	: IN    STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Wr_data_FW_WB	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Wr_data_FW_MEM	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ForwardA 		: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);		
			ForwardB		: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);	
			WriteData_EX    : OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			clock, reset	: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT dmemory
	GENERIC (MemWidth	: INTEGER);
	PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	address 			: IN 	STD_LOGIC_VECTOR( MemWidth-1 DOWNTO 0 );
        	write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	   		MemRead, Memwrite 	: IN 	STD_LOGIC;
            clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;
	
	COMPONENT WRITE_BACK IS
	PORT( 
		ALU_Result, read_data	: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		PC_plus_4_shifted		: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		MemtoReg, Jal			: IN  STD_LOGIC;
		write_data 				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		write_data_mux			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT HazardUnit IS
	PORT( 
		MemtoReg_EX, MemtoReg_MEM	 		 : IN STD_LOGIC;
		WriteReg_EX, WriteReg_MEM, WriteReg_WB : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegRs_ID, RegRt_ID 					 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegRs_EX, RegRt_EX					 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		EX_RegWr, MEM_RegWr, WB_RegWr		 : IN  STD_LOGIC;
		BranchBeq_ID, BranchBne_ID, Jump_ID	 : IN STD_LOGIC;
		Stall_IF, Stall_ID, Flush_EX 	 	 : OUT STD_LOGIC;
		ForwardA, ForwardB				     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		ForwardA_Branch, ForwardB_Branch		     : OUT STD_LOGIC
		);
	END 	COMPONENT;
-----------------------------------------------------------------------------------

end aux_package;

