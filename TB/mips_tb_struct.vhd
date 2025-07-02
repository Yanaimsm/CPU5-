

ENTITY a_mips_tb IS
-- Declarations

END a_mips_tb ;


--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
use work.const_package.all;
LIBRARY work;

ARCHITECTURE struct OF a_mips_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALU_result_out  : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
   SIGNAL Branch_out      : STD_LOGIC;
   SIGNAL Instruction_out : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
   SIGNAL Memwrite_out    : STD_LOGIC;
   SIGNAL PC              : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
   SIGNAL Regwrite_out    : STD_LOGIC;
   SIGNAL Zero_out        : STD_LOGIC;
   SIGNAL clock           : STD_LOGIC;
   SIGNAL read_data_1_out : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
   SIGNAL read_data_2_out : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
   SIGNAL reset           : STD_LOGIC;
   SIGNAL write_data_out  : STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
   SIGNAL CLKCNT		     : STD_LOGIC_VECTOR(15 DOWNTO 0);
   SIGNAL STCNT		 	  : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL FHCNT			  : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL BPADD			  : STD_LOGIC_VECTOR(7 DOWNTO 0);
   SIGNAL ST_trigger	     : STD_LOGIC;
   SIGNAL ena			     : STD_LOGIC;
   


   -- Component Declarations
   COMPONENT MIPS
	GENERIC ( MemWidth : INTEGER := 10;
			 SIM : BOOLEAN := TRUE);
	PORT( rst_i, clk_i, ena		: IN  STD_LOGIC; 
      BPADD						: IN  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		-- Output important signals to pins for easy display in Simulator
		PC							: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		CLKCNT_o					: OUT  STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		STCNT_o						: OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		FHCNT_o						: OUT  STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		STRIGGER_o					: OUT  STD_LOGIC;
		INSTCNT_o					: OUT  STD_LOGIC_VECTOR( 15 DOWNTO 0 );
		IFpc_0						: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		IFinstruction_o				: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		IDpc_0						: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		IDinstruction_o				: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		EXpc_0						: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		EXinstruction_o				: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		MEMpc_0						: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		MEMinstruction_o				: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 );
		WBpc_0						: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		WBinstruction_o				: OUT  STD_LOGIC_VECTOR(DATA_BUS_WIDTH-1 DOWNTO 0 )
		);
	END 	COMPONENT;
   COMPONENT MIPS_tester
   PORT (
      ALU_result_out  : IN     STD_LOGIC_VECTOR ( DATA_BUS_WIDTH-1 DOWNTO 0 );
      Branch_out      : IN     STD_LOGIC ;
      Instruction_out : IN     STD_LOGIC_VECTOR ( DATA_BUS_WIDTH-1 DOWNTO 0 );
      Memwrite_out    : IN     STD_LOGIC ;
      PC              : IN     STD_LOGIC_VECTOR ( 9 DOWNTO 0 );
      Regwrite_out    : IN     STD_LOGIC ;
      Zero_out        : IN     STD_LOGIC ;
      read_data_1_out : IN     STD_LOGIC_VECTOR ( DATA_BUS_WIDTH-1 DOWNTO 0 );
      read_data_2_out : IN     STD_LOGIC_VECTOR ( DATA_BUS_WIDTH-1 DOWNTO 0 );
      write_data_out  : IN     STD_LOGIC_VECTOR ( DATA_BUS_WIDTH-1 DOWNTO 0 );
      clock           : OUT    STD_LOGIC ;
	  ena			       : OUT    STD_LOGIC;
      reset           : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MIPS USE ENTITY work.mips;
   FOR ALL : MIPS_tester USE ENTITY work.mips_tester;
   -- pragma synthesis_on


BEGIN


   -- Instance port mappings.
   U_0 : MIPS
	  GENERIC MAP (
		 MemWidth => 8,
		 SIM => TRUE ) 
      PORT MAP (
         rst_i           => reset,
         clk_i           => clock,
         ena             => ena,
         PC              => PC,
         CLKCNT_o  		    => CLKCNT,
         STCNT_o 			 => STCNT,
         FHCNT_o 			 => FHCNT,
         BPADD 			 => BPADD,
		 STRIGGER_o        => ST_trigger
      );
   U_1 : MIPS_tester
      PORT MAP (
         ALU_result_out  => ALU_result_out,
         Branch_out      => Branch_out,
         Instruction_out => Instruction_out,
         Memwrite_out    => Memwrite_out,
         PC              => PC,
         Regwrite_out    => Regwrite_out,
         Zero_out        => Zero_out,
         read_data_1_out => read_data_1_out,
         read_data_2_out => read_data_2_out,
         write_data_out  => write_data_out,
         clock           => clock,
		   ena			    => ena,
         reset           => reset
      );

END struct;
