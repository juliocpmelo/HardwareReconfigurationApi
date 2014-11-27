----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:14 09/01/2014 
-- Design Name: 
-- Module Name:    Vector2DOperations - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

use work.VectorOp_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vector2DOperations is
    Port ( clk : in std_logic;
			  vector1X : in  STD_LOGIC_VECTOR (31 downto 0);
			  vector1Y : in  STD_LOGIC_VECTOR (31 downto 0);
           vector2X : in  STD_LOGIC_VECTOR (31 downto 0);
			  vector2Y : in  STD_LOGIC_VECTOR (31 downto 0);
           resultX : out  STD_LOGIC_VECTOR (31 downto 0);
			  resultY : out  STD_LOGIC_VECTOR (31 downto 0);
			  result_p1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  result_p2 : out  STD_LOGIC_VECTOR (31 downto 0);
           operation : in vector_op_t;
			  enable : in std_logic;
			  ready : out std_logic;
			  clear : in std_logic);
end Vector2DOperations;

architecture Behavioral of Vector2DOperations is

component Float_mult --floating point operations
	port(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
		
		operation_nd : in std_logic; -- high when ready for new inputs
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Float_mult;
	-- signals for float mult
	signal float_mult_a : std_logic_vector(31 downto 0);
	signal float_mult_b : std_logic_vector(31 downto 0);
	signal float_mult_result : std_logic_vector(31 downto 0);
	signal float_mult_rdy : std_logic;
	signal float_mult_enable : std_logic;
	signal float_mult_clear : std_logic;
	
	component Float_add --floating point operations
	port(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		operation : in std_logic_vector(5 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
		
		operation_nd : in std_logic; -- high when ready for new inputs
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Float_add;
	-- signals for float add
	signal float_add_a : std_logic_vector(31 downto 0);
	signal float_add_b : std_logic_vector(31 downto 0);
	signal float_add_result : std_logic_vector(31 downto 0);
	signal float_add_operation : std_logic_vector(5 downto 0);
	signal float_add_rdy : std_logic;
	signal float_add_enable : std_logic;
	signal float_add_clear : std_logic;
	
	signal xtrackVel : std_logic_vector(31 downto 0) := std_logic_vector(to_signed(0,32));
	
	--registers to be used in vector operations
	signal part_1 : std_logic_vector(31 downto 0);
	signal part_2 : std_logic_vector(31 downto 0);
	signal part_3 : std_logic_vector(31 downto 0);
	
	signal mux_op_sig : mux_op_t;
	signal storeOp_sig : store_op_t;
	
begin

	float_multiplier : Float_mult
	port map(
		a => float_mult_a,
		b => float_mult_b,
		clk => clk,
		result => float_mult_result,
		
		operation_nd => float_mult_enable,
		sclr => float_mult_clear,
		rdy => float_mult_rdy
	);

	float_adder : Float_add
	port map(
		a => float_add_a,
		b => float_add_b,
		operation => float_add_operation,
		clk => clk,
		result => float_add_result,
		
		operation_nd => float_add_enable,
		sclr => float_add_clear,
		rdy => float_add_rdy
	);
	
	Vec2DOperations_ctrl_inst : entity work.Vector2DOperationsControl_sm
	port map(
		clk => clk,
		mux_op_cmd => mux_op_sig,
		float_multiplier_rdy => float_mult_rdy,
		float_multiplier_enable => float_mult_enable,
		float_multiplier_clear => float_mult_clear,
		
		float_adder_rdy => float_add_rdy,
		float_adder_enable => float_add_enable,
		float_adder_clear => float_add_clear,
		
		operation => operation,
		
		storeOp => storeOp_sig,
		enable => enable,
		ready => ready, 
		clear => clear
	);

	
	operation_mux : process(mux_op_sig, part_1, part_2, part_3, vector1X, vector1Y, vector2X, vector2Y, float_mult_result, float_add_result)
	begin
		--default values to avoid latches
		float_mult_a <= (others => '0');
		float_mult_b <= (others => '0');
		float_add_a <= (others => '0');
		float_add_b <= (others => '0'); 
		float_add_operation <= "000000"; --add operation 
		
		case mux_op_sig is
			when mux_op_xProduct_p1 =>
				float_mult_a <= vector1X;
				float_mult_b <= vector2Y;
				
			when mux_op_xProduct_p2 =>
				float_mult_a <= vector1Y;
				float_mult_b <= vector2X;
				
			when mux_op_xProduct_add_parts =>
				float_add_a <= part_1;
				float_add_b <= part_2; 
				float_add_operation <= "000001"; --subtract
				
			when mux_op_dotProduct_p1 =>
				float_mult_a <= vector1X;
				float_mult_b <= vector2X;
				
			when mux_op_dotProduct_p2 =>
				float_mult_a <= vector1Y;
				float_mult_b <= vector2Y;
				
			when mux_op_dotProduct_add_parts =>
				float_add_a <= part_1;
				float_add_b <= part_2; 
				float_add_operation <= "000000"; --add
		end case;
	end process operation_mux;
	
	storeOperations : process(clk)
	begin
		if(rising_edge(clk)) then
			if(storeOp_sig = store_op_p1 ) then
				part_1  <= float_mult_result;
			elsif(storeOp_sig = store_op_p2 ) then
				part_2  <= float_mult_result;
			elsif(storeOp_sig = store_op_p3 ) then
				part_3  <= float_add_result;
			end if;
		end if;
	end process storeOperations;
	
	storeResults : process(clk)
	begin
		if(rising_edge(clk)) then
			if(operation = vector_op_xProduct ) then
				resultX <= part_3;
				result_p1 <= part_1; -- output part1, so this module could also be used as float mult
				result_p2 <= part_2;	-- output part2, so this module could also be used as float mult
				resultY <= (others => '0');
			elsif(operation = vector_op_dotProduct) then
				resultX <= part_3;
				result_p1 <= part_1; -- output part1, so this module could also be used as float mult
				result_p2 <= part_2;	-- output part2, so this module could also be used as float mult
				resultY <= (others => '0');
			else
				result_p1 <= (others => '0');
				result_p2 <= (others => '0');
				resultX <= (others => '0');
				resultY <= (others => '0');
			end if;
		end if;
	end process storeResults;
	
end Behavioral;

