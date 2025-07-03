--------------- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
use work.const_package.all;
USE work.aux_package.ALL;
-------------- ENTITY --------------------
ENTITY MIPS IS
	GENERIC ( MemWidth : INTEGER := 10;
			 SIM : BOOLEAN := TRUE);
	PORT( rst_i, clk_i, ena					: IN 	STD_LOGIC;
		BPADD								: IN  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		-- Output important signals to pins for easy display in Simulator
		PC									: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		CLKCNT_o							: OUT  STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		STCNT_o								: OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		FHCNT_o								: OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		STRIGGER_o							: OUT  STD_LOGIC;
		INSTCNT_o							: OUT  STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		IFpc_0								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		IFinstruction_o						: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		IDpc_0								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		IDinstruction_o						: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		EXpc_0								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		EXinstruction_o						: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		MEMpc_0								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		MEMinstruction_o					: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		WBpc_0								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		WBinstruction_o						: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 )
		);
END 	MIPS;
------------ ARCHITECTURE ----------------
ARCHITECTURE structure OF MIPS IS
	---- FPGA OR ModelSim Signals ----
	SIGNAL dMemAddr 		: STD_LOGIC_VECTOR(MemWidth-1 DOWNTO 0);
	SIGNAL resetSim, enaSim	: STD_LOGIC;
	SIGNAL MCLK_w 			: STD_LOGIC;

	-- declare signals used to connect VHDL components
	SIGNAL PC_plus_4 		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL read_data1_i 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL read_data2_i 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Sign_Extend 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Add_Result 		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_Result 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL read_data 		: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL ALUSrc 			: STD_LOGIC;
	SIGNAL RegDst 			: STD_LOGIC;
	SIGNAL Regwrite 		: STD_LOGIC;
	SIGNAL Zero 			: STD_LOGIC;
	SIGNAL MemWrite 		: STD_LOGIC;
	SIGNAL MemtoReg 		: STD_LOGIC;
	SIGNAL MemRead 			: STD_LOGIC;
	SIGNAL ALUop 			: STD_LOGIC_VECTOR(  1 DOWNTO 0 );

-------------- Signals To support CPI/IPC calculation and break point debug ability --------------------------------
	--SIGNAL CLKCNT_sig		: STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	--SIGNAL STCNT_sig		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	--SIGNAL FHCNT_sig		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL BPADD_ena		: STD_LOGIC;
	SIGNAL Run				: STD_LOGIC;
	SIGNAL PC_BPADD			: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	---------------- Pipeline Registers --------------------------
	
	------ Control Registers ------
	-- WB -- 
	SIGNAL MemtoReg_WB, MemtoReg_MEM, MemtoReg_EX, MemtoReg_ID 	: STD_LOGIC;
	SIGNAL RegWrite_WB, RegWrite_MEM, RegWrite_EX, RegWrite_ID 	: STD_LOGIC;
	SIGNAL Jal_WB, Jal_MEM, Jal_EX, Jal_ID						: STD_LOGIC;
	
	-- MEM --
	SIGNAL Zero_MEM, Zero_EX 						: STD_LOGIC;
	SIGNAL Branch_MEM, Branch_EX, Branch_ID 		: STD_LOGIC;
	SIGNAL MemWrite_MEM, MemWrite_EX, MemWrite_ID 	: STD_LOGIC;
	SIGNAL MemRead_MEM, MemRead_EX, MemRead_ID 		: STD_LOGIC;
	--SIGNAL PCSrc_MEM								: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL BranchBeq_MEM, BranchBeq_EX, BranchBeq_ID: STD_LOGIC;
	SIGNAL BranchBne_MEM, BranchBne_EX, BranchBne_ID: STD_LOGIC;
	SIGNAL Jump_MEM, Jump_EX, Jump_ID				: STD_LOGIC;
	
	-- Forwarding Unit
	SIGNAL ForwardA, ForwardB						: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL ForwardA_ID, ForwardB_ID					: STD_LOGIC; -- Branch Forwarding
	
	-- EXEC -- 
	SIGNAL RegDst_EX, RegDst_ID 					: STD_LOGIC_VECTOR(1 DOWNTO 0);
	SIGNAL ALUSrc_EX, ALUSrc_ID 					: STD_LOGIC;
	SIGNAL ALUOp_EX, ALUOp_ID 						: STD_LOGIC_VECTOR(1 DOWNTO 0);
	
	-- Hazard Unit -- Stall AND Flush
	SIGNAL Stall_IF, Stall_ID, Flush_EX				: STD_LOGIC;
	
	-- Instruction Decode --
	SIGNAL PCSrc_ID									: STD_LOGIC_VECTOR(1 DOWNTO 0);
	
	--------------------------------------------------------
	
	-------- States Registers ------
	-- Instruction Fetch
	SIGNAL PC_plus_4_IF		: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL IR_IF		    : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL inst_cnt_w		: STD_LOGIC_VECTOR(15 DOWNTO 0);

	-- Instruction Decode
	SIGNAL PC_plus_4_ID				     		 				: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL IR_ID		    			  		 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 ); 
	SIGNAL read_data_1_ID, read_data_2_ID 		 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Sign_extend_ID				 		 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Wr_reg_addr_0_ID, Wr_reg_addr_1_ID	 				: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL PCBranch_addr_ID										: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL JumpAddr_ID											: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
																
	-- Execute                                                  
	SIGNAL PC_plus_4_EX				      						: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL IR_EX		    			  		 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 ); 
	SIGNAL read_data_1_EX, read_data_2_EX 						: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Sign_extend_EX				  		 				: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Wr_reg_addr_0_EX, Wr_reg_addr_1_EX, Wr_reg_addr_EX	: STD_LOGIC_VECTOR( 4 DOWNTO 0 );
	SIGNAL write_data_EX										: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Add_Result_EX										: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_Result_EX					   				    : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Opcode_EX											: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
																
	-- Memory     
	SIGNAL PC_plus_4_MEM			      						: STD_LOGIC_VECTOR(9 DOWNTO 0);	
	SIGNAL Add_Result_MEM										: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_Result_MEM										: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL write_data_MEM, read_data_MEM						: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Wr_reg_addr_MEM										: STD_LOGIC_VECTOR( 4 DOWNTO 0 );									    
	SIGNAL JumpAddr_MEM											: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	
	-- WriteBack
	SIGNAL PC_plus_4_WB				      						: STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL read_data_WB											: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL ALU_Result_WB										: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL Wr_reg_addr_WB										: STD_LOGIC_VECTOR( 4 DOWNTO 0 ); 
	SIGNAL write_data_WB										: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	SIGNAL write_data_mux_WB									: STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
	------------------------------------------------------

BEGIN
	-------------------------- FPGA or ModelSim -----------------------
	resetSim 	<= rst_i WHEN SIM ELSE not rst_i;
	enaSim		<= ena 	 WHEN SIM ELSE not ena;

	G0:
	if (not SIM) generate
	  MCLK: PLL
		PORT MAP (
			inclk0 	=> clk_i,
			c0 		=> MCLK_w
		);
	else generate
		MCLK_w <= clk_i;
	end generate;
   --------------------- PORT MAP COMPONENTS --------------------------
   ----- Instruction Fetch -----
	IFE : Ifetch
	GENERIC MAP(MemWidth => MemWidth, SIM => SIM) 
	PORT MAP (	instruction_o => IR_IF,
    	    	pc_plus4_o => PC_plus_4_IF,
				add_result_i => PCBranch_addr_ID( 7 DOWNTO 0 ), 
				PCSrc_i => PCSrc_ID,
				pc_o => PC_BPADD,      
				addr_res_o => JumpAddr_ID,
				clk_i => MCLK_w, 
				ena_i => enaSim,
				Stall_IF_i => Stall_IF,
				BPADD_ena_i => BPADD_ena,
				inst_cnt_o => inst_cnt_w,
				rst_i => resetSim );
	----- Instruction Decode -----
	ID : Idecode
   	PORT MAP (	read_data1_o => read_data_1_ID,
        		read_data2_o => read_data_2_ID,
				rt_register_o => Wr_reg_addr_0_ID,
				rd_register_o => Wr_reg_addr_1_ID,
				write_register_address => Wr_reg_addr_WB,
        		instruction_i => IR_ID,
				PC_plus_4_shifted_i => PC_plus_4_ID(9 DOWNTO 2),
				RegWrite_ctrl_i => RegWrite_wb,
				ForwardA_ID => ForwardA_ID,
				ForwardB_ID => ForwardB_ID,
				BranchBeq_i => BranchBeq_ID,
				BranchBne_i => BranchBne_ID,
				Jump_i => Jump_ID,
				JAL_i => Jal_ID,
				Stall_ID => Stall_ID,
				write_data_i => write_data_mux_WB,
				Branch_read_data_FW => ALU_Result_MEM,
				sign_extend_o => Sign_extend_ID,
				PCSrc_o => PCSrc_ID,
				JumpAddr_o => JumpAddr_ID,
				PCBranch_addr_o => PCBranch_addr_ID,
        		clk_i => MCLK_w,  
				rst_i => resetSim );
	
			
	----- Control Unit in Instruction Decode -----
	CTL:   control
	PORT MAP (
		opcode_i => IR_ID(31 DOWNTO 26),
		funct_i => IR_ID(5 DOWNTO 0),
		RegDst_ctrl_o => RegDst_ID,
		ALUSrc_ctrl_o => ALUSrc_ID,
		MemtoReg_ctrl_o => MemtoReg_ID,
		RegWrite_ctrl_o => RegWrite_ID,
		MemRead_ctrl_o => MemRead_ID,
		MemWrite_ctrl_o => MemWrite_ID,
		BranchBeq_o => BranchBeq_ID,
		BranchBne_o => BranchBne_ID,
		Jump_o => Jump_ID,
		Jal_o => Jal_ID,
		ALUOp_ctrl_o => ALUOp_ID,
		clock => MCLK_w,
		reset => resetSim
	);
	----- Execute -----
	EXE:  Execute
   	PORT MAP (	Read_data1_i 	=> read_data_1_EX,
             	Read_data2_i 	=> read_data_2_EX,
				sign_extend_i	=> sign_extend_EX,
                funct_i			=> sign_extend_EX( 5 DOWNTO 0 ),
				opcode_i			=> Opcode_EX,
				ALUOp_ctrl_i	=> ALUOp_EX,
				ALUSrc_ctrl_i	=> ALUSrc_EX,
				zero_o			=> Zero_EX,
				RegDst	=> RegDst_EX,
                alu_res_o		=> ALU_Result_EX,
				pc_plus4_i		=> PC_plus_4_EX,
				Wr_reg_addr     => Wr_reg_addr_EX,
				Wr_reg_addr_0   => Wr_reg_addr_0_EX,
				Wr_reg_addr_1   => Wr_reg_addr_1_EX,
				Wr_data_FW_WB	=> write_data_WB,  -- For Forwarding
				Wr_data_FW_MEM	=> ALU_Result_MEM, -- For Forwarding
				ForwardA		=> ForwardA,
				ForwardB		=> ForwardB,
				WriteData_EX    => write_data_EX
				);
				
	----- Hazard Unit (Stalls AND Flushs AND Forwarding) -----
	Hazard:	HazardUnit
	PORT MAP(	
				MemtoReg_EX		=> MemtoReg_EX,	
				MemtoReg_MEM	=> MemtoReg_MEM,
				WriteReg_EX		=> Wr_reg_addr_EX,
				WriteReg_MEM   	=> Wr_reg_addr_MEM,
				WriteReg_WB		=> Wr_reg_addr_WB,
				RegRs_EX		=> IR_EX(25 DOWNTO 21),
				RegRt_EX 		=> IR_EX(20 DOWNTO 16),
				RegRs_ID		=> IR_ID(25 DOWNTO 21),
				RegRt_ID 		=> IR_ID(20 DOWNTO 16),
				EX_RegWr		=> RegWrite_EX,
				MEM_RegWr   	=> RegWrite_MEM,
				WB_RegWr		=> RegWrite_WB,
				BranchBeq_ID	=> BranchBeq_ID,
				BranchBne_ID	=> BranchBne_ID,
				Jump_ID			=> Jump_ID,
				Stall_IF        => Stall_IF,
				Stall_ID        => Stall_ID,
				Flush_EX        => Flush_EX,
				ForwardA    	=> ForwardA,
				ForwardB		=> ForwardB,
				ForwardA_Branch => ForwardA_ID,
				ForwardB_Branch	=> ForwardB_ID				
	);
		
	----- Data Memory -----
	ModelSim: 
		IF (SIM = TRUE) GENERATE
				dMemAddr <= ALU_Result_MEM (9 DOWNTO 2);
		END GENERATE ModelSim;
		
	FPGA: 
		IF (SIM = FALSE) GENERATE
				dMemAddr <= ALU_Result_MEM (9 DOWNTO 2) & "00";
		END GENERATE FPGA;
	
	MEM:  dmemory
	GENERIC MAP(MemWidth => MemWidth) 
	PORT MAP (	dtcm_data_rd_o => read_data_MEM,
				dtcm_addr_i => dMemAddr,  --jump memory address by 4
				dtcm_data_wr_i => write_data_MEM, 
				MemRead_ctrl_i => MemRead_MEM, 
				MemWrite_ctrl_i => MemWrite_MEM, 
                clk_i => MCLK_w,  
				rst_i => resetSim );
	----- Write Back -----	
	WB:	WRITE_BACK
	PORT MAP(	
				alu_result_i => ALU_Result_WB,
				dtcm_data_rd_i => read_data_WB,
				PC_plus_4_shifted_i => PC_plus_4_WB(9 DOWNTO 2),
				MemtoReg_ctrl_i => MemtoReg_WB,
				Jal_i => Jal_WB,  
				write_data_o => write_data_WB,
				write_data_mux_o => write_data_mux_WB
	);
	
	---------------------------------------------------------------------------
	------- PROCESS TO COUNT Clocks, Stalls, Flushs --------
	PC		 	<= PC_BPADD;
	BPADD_ena 	<= '1' WHEN (NOT SIM AND BPADD = PC_BPADD(9 DOWNTO 2) AND BPADD /= X"00") ELSE '0';
	STRIGGER_o 	<= BPADD_ena;
	
	PROCESS (MCLK_w, resetSim, enaSim, Run, BPADD_ena, Flush_EX, Stall_ID, Stall_IF) 
		VARIABLE CLKCNT_sig		: STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		VARIABLE STCNT_sig		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		VARIABLE FHCNT_sig		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	BEGIN
		IF resetSim = '1' THEN
			CLKCNT_sig  := X"0000";
			STCNT_sig 	:= X"00";
			FHCNT_sig 	:= X"00";
			Run			<= '0';
		ELSIF (rising_edge(MCLK_w) and Run = '1' and BPADD_ena = '0') THEN 	-- count clk counts on rising edge
			CLKCNT_sig := CLKCNT_sig + 1;
			IF (Stall_ID OR Stall_IF) = '1' THEN 	-- count on rising edge when stall occurs
				STCNT_sig := STCNT_sig + 1;
			END IF;
			IF Flush_EX = '1' THEN					-- count on rising edge when flush occurs
				FHCNT_sig := FHCNT_sig + 1;
			END IF;
		END IF;
		
		IF BPADD_ena = '1' THEN -- if PC got to BreakPointAddr then pause
			Run			<= '0';
		ELSIF enaSim = '1' THEN 
			Run			<= '1';
		END IF;
		------------- Signals To support CPI/IPC calculation -------------
		CLKCNT_o 		<= CLKCNT_sig;
		STCNT_o		<= STCNT_sig;
		FHCNT_o		<= FHCNT_sig;
	END PROCESS;




	----------------------- Connect Pipeline Registers ------------------------
	PROCESS BEGIN
		WAIT UNTIL MCLK_w'EVENT AND MCLK_w = '1';
		IF  (Run = '1' AND BPADD_ena = '0') THEN
			-------------- Instruction Fetch TO Instruction Decode ---------------- 
			IF Stall_ID = '0' THEN 
				PC_plus_4_ID <= PC_plus_4_IF;
				IR_ID <= IR_IF;		
			END IF;
			IF (PCSrc_ID(0) = '1' OR PCSrc_ID(1) = '1')  THEN -- CLR IF_ID
				PC_plus_4_ID <= "0000000000";
				IR_ID 		 <= X"00000000";			
			END IF;
			-------------------- Instruction Decode TO Execute -------------------- 
			IF Flush_EX = '1' THEN -- CLR ID_IF register
				----- Control Reg ----
				Branch_EX 	     <= '0';
				MemtoReg_EX      <= '0';
				RegWrite_EX      <= '0';
				MemWrite_EX      <= '0';
				MemRead_EX	     <= '0';
				RegDst_EX 	     <= "00";  
				ALUSrc_EX	     <= '0';
				ALUOp_EX 	     <= "00";
				Opcode_EX		 <= "000000";
				BranchBeq_EX	 <= '0';
				BranchBne_EX	 <= '0';
				Jump_EX			 <= '0';
				Jal_EX			 <= '0';   
				----- State Reg -----
				PC_plus_4_EX     <= "0000000000";
				IR_EX			 <= X"00000000";
				read_data_1_EX   <= X"00000000";
				read_data_2_EX   <= X"00000000";
				Sign_extend_EX   <= X"00000000";
				Wr_reg_addr_0_EX <= "00000";
				Wr_reg_addr_1_EX <= "00000";
			ELSE 
				----- Control Reg -----
				Branch_EX 	     <= Branch_ID;
				MemtoReg_EX      <= MemtoReg_ID;
				RegWrite_EX      <= RegWrite_ID;
				MemWrite_EX      <= MemWrite_ID;
				MemRead_EX	     <= MemRead_ID;		
				RegDst_EX 	     <= RegDst_ID;
				ALUSrc_EX	     <= ALUSrc_ID;
				ALUOp_EX 	     <= ALUOp_ID;
				Opcode_EX		 <= IR_ID(31 DOWNTO 26);
				BranchBeq_EX	 <= BranchBeq_ID;
				BranchBne_EX	 <= BranchBne_ID;
				Jump_EX			 <= Jump_ID;
				Jal_EX			 <= Jal_ID;   
				----- State Reg -----
				PC_plus_4_EX     <= PC_plus_4_ID;	
				IR_EX			 <= IR_ID;
				read_data_1_EX   <= read_data_1_ID;  -- rs
				read_data_2_EX   <= read_data_2_ID;	 -- rt
				Sign_extend_EX   <= Sign_extend_ID;
				Wr_reg_addr_0_EX <= Wr_reg_addr_0_ID;
				Wr_reg_addr_1_EX <= Wr_reg_addr_1_ID;
			END IF;
			
			-------------------------- Execute TO Memory --------------------------- 
			----- Control Reg -----
			Branch_MEM		<= Branch_EX;
			Zero_MEM		<= Zero_EX;
			MemtoReg_MEM    <= MemtoReg_EX;
			RegWrite_MEM    <= RegWrite_EX;
			MemWrite_MEM    <= MemWrite_EX;
			MemRead_MEM	    <= MemRead_EX;	
			BranchBeq_MEM	<= BranchBeq_EX;
			BranchBne_MEM	<= BranchBne_EX;
			Jump_MEM		<= Jump_EX;
			Jal_MEM			<= Jal_EX;
			----- State Reg -----
			PC_plus_4_MEM	<= PC_plus_4_EX;
			Add_Result_MEM  <= Add_Result_EX;
			ALU_Result_MEM  <= ALU_Result_EX;
			write_data_MEM	<= write_data_EX;   -- was read_data_2_EX
			Wr_reg_addr_MEM	<= Wr_reg_addr_EX;

			
			------------------------- Memory TO WriteBack ------------------------- 
			----- Control Reg -----
			MemtoReg_WB		<= MemtoReg_MEM;
			RegWrite_WB		<= RegWrite_MEM;
			Jal_WB			<= Jal_MEM;
			
			----- State Reg -----
			PC_plus_4_WB	<= PC_plus_4_MEM;
			read_data_WB	<= read_data_MEM;
			ALU_Result_WB	<= ALU_Result_MEM;
			Wr_reg_addr_WB	<= Wr_reg_addr_MEM;
		END IF;
		
	END PROCESS;		
	---------------------------------------------------------------------------
	INSTCNT_o <= inst_cnt_w;
	IFpc_0 <= PC_plus_4_IF-4;
	IFinstruction_o <= IR_IF;
	IDpc_0 <= PC_plus_4_ID-4;
	IDinstruction_o <= IR_ID;
	EXpc_0 <= PC_plus_4_EX-4;
	EXinstruction_o <= IR_EX;
	MEMpc_0 <= PC_plus_4_MEM-4;
	MEMinstruction_o <= IR_EX;
	WBpc_0 <= PC_plus_4_WB-4;
	WBinstruction_o <= IR_EX;
END structure;

