--------------  Execute module (implements the data ALU and Branch Address Adder for the MIPS computer) ----------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
USE IEEE.numeric_std.ALL;
USE work.aux_package.ALL;
USE work.const_package.ALL;
------------ Entity -----------------
ENTITY  Execute IS
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
END Execute;
------------ Architecture -----------------
ARCHITECTURE behavior OF Execute IS
SIGNAL Ainput, Binput 			  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL Aforward_mux, Bforward_mux : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
SIGNAL ALU_output_mux			  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
--SIGNAL Branch_Add 				  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
SIGNAL ALU_ctl					  : STD_LOGIC_VECTOR( 3 DOWNTO 0 );
SIGNAL write_register_address 	  : STD_LOGIC_VECTOR( 4 DOWNTO 0 );
SIGNAL write_register_address_1	  : STD_LOGIC_VECTOR( 4 DOWNTO 0 );
SIGNAL write_register_address_0	  : STD_LOGIC_VECTOR( 4 DOWNTO 0 );
BEGIN
--------------- ALU Inputs: A,B ----------------				
	------------ Forwarding ----------------
		-- Forward A
	WITH ForwardA SELECT 
			Aforward_mux <= Read_data_1    WHEN "00",
							Wr_data_FW_WB  WHEN "01",
							Wr_data_FW_MEM WHEN "10",
							X"00000000"	   WHEN OTHERS;
		-- Forward B
	WITH ForwardB SELECT 
			Bforward_mux <= Read_data_2    WHEN "00",
							Wr_data_FW_WB  WHEN "01",
							Wr_data_FW_MEM WHEN "10",
							X"00000000"	   WHEN OTHERS;
							
	-- ALU A input mux after forwarding (mux for adding shift)
	Ainput <= 	Bforward_mux WHEN (ALUOp = "11") ELSE  -- When Performing Shift, A should get data from reg2
				Aforward_mux;
	-- ALU B input mux after forwarding
	Binput <= 	Bforward_mux WHEN ( ALUSrc = '0' ) ELSE
				Sign_extend( 31 DOWNTO 0 );		
	WriteData_EX <= Bforward_mux;

-------------- Generate ALU control bits (Integrated ALU_CONTROL) -------------
ALU_CONTROL_PROCESS: PROCESS (ALUOp, Function_opcode, Opcode)
BEGIN
	CASE ALUOp IS
		WHEN "10" => -- r-type
			CASE Function_opcode IS
				WHEN ADD_FUN => ALU_ctl <= ALU_ADD; -- add
				WHEN MOV_FUN => ALU_ctl <= ALU_ADD; -- mov
				WHEN SUB_FUN => ALU_ctl <= ALU_SUB; -- sub
				WHEN MUL_FUN_ALT => ALU_ctl <= ALU_MUL; -- mul (using alternative function code)
				WHEN AND_FUN => ALU_ctl <= ALU_AND; -- and
				WHEN OR_FUN => ALU_ctl <= ALU_OR; -- or
				WHEN XOR_FUN => ALU_ctl <= ALU_XOR; -- xor
				WHEN SLT_FUN => ALU_ctl <= ALU_SLT; -- slt
				WHEN OTHERS   => ALU_ctl <= ALU_NOP; -- else
			END CASE;				
		WHEN "00" => -- i-type
			CASE Opcode IS
				WHEN LW_OPC => ALU_ctl <= ALU_ADD; -- lw
				WHEN SW_OPC => ALU_ctl <= ALU_ADD; -- sw
				WHEN ADDI_OPC => ALU_ctl <= ALU_ADD; -- addi
				WHEN ANDI_OPC => ALU_ctl <= ALU_AND; -- andi
				WHEN ORI_OPC => ALU_ctl <= ALU_OR; -- ori
				WHEN XORI_OPC => ALU_ctl <= ALU_XOR; -- xori
				WHEN LUI_OPC => ALU_ctl <= ALU_LUI; -- lui
				WHEN SLTI_OPC => ALU_ctl <= ALU_SLT; -- slti
		        WHEN OTHERS   => ALU_ctl <= ALU_NOP; -- else
			END CASE;			
		WHEN "01" 	=> -- beq, bne
								 ALU_ctl <= ALU_SUB; 		
 	 	WHEN "11"	=>  -- shift
			CASE Function_opcode IS
				WHEN SLL_FUN => ALU_ctl <= ALU_SLL; -- sll
				WHEN SRL_FUN => ALU_ctl <= ALU_SRL; -- srl
				WHEN OTHERS   => ALU_ctl <= ALU_NOP; -- else
			END CASE;
		
		WHEN OTHERS =>  
								 ALU_ctl <= ALU_NOP; -- else	
  	END CASE;
END PROCESS;

----------------- Mux for Register Write Address ---------------------
	 Wr_reg_addr <= "11111"			WHEN RegDst = "10" ELSE -- jal
					Wr_reg_addr_1 	WHEN RegDst = "01" ELSE 
					Wr_reg_addr_0;
------------ Generate Zero Flag ----------------------------
	Zero <= '1' WHEN ( ALU_output_mux( 31 DOWNTO 0 ) = X"00000000"  ) ELSE	
			'0';    
------------- Select ALU output  ----------------------------      
	ALU_result <= 	X"0000000" & B"000"  & ALU_output_mux( 31 ) WHEN  ALU_ctl = ALU_SLT ELSE  -- For SLT
					ALU_output_mux( 31 DOWNTO 0 );
		
------------ Adder to compute Branch Address ----------------
--	Branch_Add	<= PC_plus_4( 9 DOWNTO 2 ) +  Sign_extend( 7 DOWNTO 0 ) ;
--	Add_result 	<= Branch_Add( 7 DOWNTO 0 );

------------ ALU Process (Integrated ALU) -----------------------------
ALU_PROCESS: PROCESS ( ALU_ctl, Ainput, Binput )
	variable product : STD_LOGIC_VECTOR(63 downto 0); 
BEGIN
	--------------- Select ALU operation ---------------------
 	CASE ALU_ctl IS
		-- ALU performs ALUresult = A_input AND B_input
		WHEN ALU_AND 	=>	ALU_output_mux 	<= Ainput AND Binput; 
		-- ALU performs ALUresult = A_input OR B_input
     	WHEN ALU_OR 	=>	ALU_output_mux 	<= Ainput OR Binput;
		-- ALU performs ALUresult = A_input + B_input
	 	WHEN ALU_ADD 	=>	ALU_output_mux 	<= Ainput + Binput; 
		-- ALU performs ALUresult = A_input * B_input
 	 	WHEN ALU_MUL 	=>	product := Ainput * Binput; -- result 64 bit
							ALU_output_mux <= product(31 DOWNTO 0); -- Take Lower Part
		-- ALU performs ALUresult = A_input XOR B_input
 	 	WHEN ALU_XOR 	=>	ALU_output_mux 	<= Ainput XOR Binput;
		-- ALU performs ALUresult = A_input SLL B_input
 	 	WHEN ALU_SLL 	=>	ALU_output_mux 	<=	std_logic_vector(shift_left(ieee.numeric_std.unsigned(Ainput),to_integer(ieee.numeric_std.unsigned(Binput(10 downto 6)))));

		-- ALU performs ALUresult = A_input SRL B_input
 	 	WHEN ALU_SRL 	=>	ALU_output_mux 	<=	std_logic_vector(shift_right(ieee.numeric_std.unsigned(Ainput),to_integer(ieee.numeric_std.unsigned(Binput(10 downto 6))))); 

		-- ALU performs ALUresult = A_input -B_input
 	 	WHEN ALU_SUB 	=>	ALU_output_mux 	<= Ainput - Binput; 
		-- ALU performs SLT
  	 	WHEN ALU_SLT 	=>	ALU_output_mux 	<= Ainput - Binput;  
		-- ALU performs LUI
  	 	WHEN ALU_LUI 	=>	ALU_output_mux 	<= Binput(15 DOWNTO 0) & "0000000000000000";
		-- OUTPUT ZERO
 	 	WHEN OTHERS	=>	ALU_output_mux 	<= X"00000000" ;
  	END CASE;
END PROCESS;

  
END behavior;

