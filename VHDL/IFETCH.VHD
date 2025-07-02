-------- Ifetch module (provides the PC and instruction memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.const_package.all;
LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
---------------- ENTITY ------------------
ENTITY Ifetch IS
	GENERIC (
		MemWidth		: INTEGER;
		SIM				: BOOLEAN;
		PC_WIDTH		: integer := 10;
		NEXT_PC_WIDTH	: integer := 8; -- NEXT_PC_WIDTH = PC_WIDTH-2
		ITCM_ADDR_WIDTH	: integer := 8;
		WORDS_NUM		: integer := 256;
		INST_CNT_WIDTH	: integer := 16
	);
	PORT(
		instruction_o			: OUT	STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0);
		pc_plus4_o				: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		add_result_i			: IN  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		PCSrc_i					: IN  STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		pc_o					: OUT STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		addr_res_o				: IN  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		clk_i, ena_i, Stall_IF_i, BPADD_ena_i, rst_i : IN  STD_LOGIC
	);
END Ifetch;
--------------- ARCHITECTURE --------------
ARCHITECTURE behavior OF Ifetch IS
	SIGNAL pc_q, pc_plus4_r : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL next_pc_w : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL itcm_addr_w : STD_LOGIC_VECTOR( MemWidth-1 DOWNTO 0 );
	SIGNAL ifetch_clock : STD_LOGIC;  --new signal name we made for falling edge
BEGIN
--------------- ROM for Instruction Memory --------------- 
inst_memory: altsyncram
	
	GENERIC MAP (
		operation_mode => "ROM",
		width_a => 32,
		widthad_a => MemWidth,
		lpm_type => "altsyncram",
		outdata_reg_a => "UNREGISTERED",
		init_file => "C:\Users\yanai\Local\Documents\Yanai\University\LABS\CPU Architercture\Lab5\CPU5_new\CODE\program.hex",
		intended_device_family => "Cyclone"
	)
	PORT MAP (
		clock0     => ifetch_clock,  -- Falling Edge
		address_a 	=> itcm_addr_w, 
		q_a 			=> instruction_o
		);
--------------------------------------------------------------	
	ifetch_clock <= not clk_i;
--------- Instructions always start on word address - not byte -------
		pc_q(1 DOWNTO 0) <= "00";
--------- Copy output signals - allows read inside module -----------
		pc_o 			<= pc_q;
		pc_plus4_o 	<= pc_plus4_r;
---------- Send address to inst. memory address register ---------

		ModelSim: 
		IF (SIM = TRUE) GENERATE
				itcm_addr_w <= pc_q( 9 DOWNTO 2 );
		END GENERATE ModelSim;
		
		FPGA: 
		IF (SIM = FALSE) GENERATE
				itcm_addr_w <= pc_q;
		END GENERATE FPGA;
		
---------- Adder to increment PC by 4 ----------------------       
      	pc_plus4_r( 9 DOWNTO 2 )  <= pc_q( 9 DOWNTO 2 ) + 1;
       	pc_plus4_r( 1 DOWNTO 0 )  <= "00";
		
---------- Mux to select Branch Address or PC + 4 -----------       
		next_pc_w  <= X"00" 				WHEN rst_i = '1' 	ELSE
					add_result_i 			WHEN PCSrc_i = "01" 	ELSE   -- branch
					addr_res_o			WHEN PCSrc_i = "10"	ELSE	-- jump
					pc_plus4_r( 9 DOWNTO 2 );
			
---------- PC Proccess (CLK on rising edge) --------------			
	PROCESS  BEGIN
		WAIT UNTIL ( clk_i'EVENT ) AND ( clk_i = '1' );
		IF rst_i = '1' THEN
			   pc_q( 9 DOWNTO 2) <= "00000000" ; 
		ELSIF (ena_i = '1' AND Stall_IF_i = '0' AND BPADD_ena_i = '0') THEN
			   pc_q( 9 DOWNTO 2 ) <= next_pc_w;
		END IF;
	END PROCESS;
END behavior;


