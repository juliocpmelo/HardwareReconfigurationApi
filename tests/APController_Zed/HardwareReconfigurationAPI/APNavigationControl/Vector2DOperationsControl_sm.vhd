----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:25 09/01/2014 
-- Design Name: 
-- Module Name:    Vector2DOperationsControl_sm - Behavioral 
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
use work.VectorOp_types.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Vector2DOperationsControl_sm is
port(
	clk : in std_logic;
	mux_op_cmd : out mux_op_t;
	float_multiplier_rdy : in std_logic;
	float_multiplier_clear : out std_logic;
	float_multiplier_enable : out std_logic;
	float_adder_rdy : in std_logic;
	float_adder_enable : out std_logic;
	float_adder_clear : out std_logic;
	
	operation : in vector_op_t;
	
	storeOp : out store_op_t;
	enable : in std_logic;
	ready : out std_logic;
	clear : in std_logic
);
end Vector2DOperationsControl_sm;

architecture Behavioral of Vector2DOperationsControl_sm is

type state_operation_t is
	(
		state_operation_none,
	
	--xProduct states
		state_operation_xProduct_p1, --vector1x * vector2y
		state_operation_xProduct_p1_store,
		state_operation_xProduct_p2, --vector1y * vector2x
		state_operation_xProduct_p2_store,
		state_operation_xProduct_add, --p1 - p2
		state_operation_xProduct_p3_store,
		state_operation_xProduct_done,
		
	--dotProduct states
		state_operation_dotProduct_p1, --vector1x * vector2x
		state_operation_dotProduct_p1_store,
		state_operation_dotProduct_p2, --vector1y * vector2y
		state_operation_dotProduct_p2_store,
		state_operation_dotProduct_add, --p1 - p2
		state_operation_dotProduct_p3_store,
		state_operation_dotProduct_done
	);
	
	signal operation_state : state_operation_t;
	signal operation_state_next : state_operation_t := state_operation_none;
	
	signal dotProductDone : std_logic := '0';
	signal enable_dotProduct : std_logic := '0';
	
	signal xProductDone : std_logic := '0';
	signal enable_xProduct : std_logic := '0';
begin

	state_transition : process (clk)
	begin
		if(rising_edge(clk)) then
			operation_state <= operation_state_next;
		end if;
	end process state_transition;
	
	
	operation_sel_clr : process (clk)
	begin
		if(rising_edge(clk)) then
			if clear /= '1' then
				if operation = vector_op_xProduct then
					enable_xProduct <= '1' and enable;
				elsif operation = vector_op_dotProduct then
					enable_dotProduct <= '1'; -- not implemented
				end if;
			else
				enable_xProduct <= '0';
				enable_dotProduct <= '0';
			end if;
		end if;
	end process operation_sel_clr;
	
	evaluate_vecOperation : process (clk)
	begin
		if rising_edge(clk) then
			--cross product
			if (enable_xProduct = '1') then			
				if operation_state = state_operation_none then
					operation_state_next <= state_operation_xProduct_p1;
				elsif operation_state = state_operation_xProduct_p1 then
					if( float_multiplier_rdy = '1') then
						operation_state_next <= state_operation_xProduct_p1_store;
						float_multiplier_enable <= '0';
					else
						storeOp <= store_op_p1;
						mux_op_cmd <= mux_op_xProduct_p1;
						float_multiplier_enable <= '1';
						float_multiplier_clear <= '0';
					end if;
				elsif operation_state = state_operation_xProduct_p1_store then
					operation_state_next <= state_operation_xProduct_p2;
					float_multiplier_clear <= '1'; --resets float mult core after operation done
				--cross product p2	
				elsif operation_state = state_operation_xProduct_p2 then
					if( float_multiplier_rdy = '1') then
						operation_state_next <= state_operation_xProduct_p2_store;
						float_multiplier_enable <= '0';
					else
						storeOp <= store_op_p2;
						mux_op_cmd <= mux_op_xProduct_p2;
						float_multiplier_enable <= '1';
						float_multiplier_clear <= '0';
					end if;
				elsif operation_state = state_operation_xProduct_p2_store then
					operation_state_next <= state_operation_xProduct_add;
					float_multiplier_clear <= '1';  --resets float mult core after operation done
				--cross product p3
				elsif operation_state = state_operation_xProduct_add then
					if(float_adder_rdy = '1') then
						operation_state_next <= state_operation_xProduct_p3_store;
						float_adder_enable <= '0';
					else
						storeOp <= store_op_p3;
						float_adder_enable <= '1';
						mux_op_cmd <= mux_op_xProduct_add_parts;
						float_adder_clear <= '0'; 
					end if;				
				elsif operation_state = state_operation_xProduct_p3_store then
					operation_state_next <= state_operation_xProduct_done;
					float_adder_clear <= '1'; --resets float adder core after operation done
				--operation end
				elsif operation_state = state_operation_xProduct_done then
					xProductDone <= '1';
				end if;
			-- dot product
			elsif(enable_dotProduct = '1') then
				if operation_state = state_operation_none then
					operation_state_next <= state_operation_dotProduct_p1;
				elsif operation_state = state_operation_dotProduct_p1 then
					if( float_multiplier_rdy = '1') then
						operation_state_next <= state_operation_dotProduct_p1_store;
						float_multiplier_enable <= '0';
					else
						storeOp <= store_op_p1;
						mux_op_cmd <= mux_op_dotProduct_p1;
						float_multiplier_enable <= '1';
						float_multiplier_clear <= '0';
					end if;
				elsif operation_state = state_operation_dotProduct_p1_store then
					operation_state_next <= state_operation_dotProduct_p2;
					float_multiplier_clear <= '1'; --resets float mult core after operation done
				--cross product p2	
				elsif operation_state = state_operation_dotProduct_p2 then
					if( float_multiplier_rdy = '1') then
						operation_state_next <= state_operation_dotProduct_p2_store;
						float_multiplier_enable <= '0';
					else
						storeOp <= store_op_p2;
						mux_op_cmd <= mux_op_dotProduct_p2;
						float_multiplier_enable <= '1';
						float_multiplier_clear <= '0';
					end if;
				elsif operation_state = state_operation_dotProduct_p2_store then
					operation_state_next <= state_operation_dotProduct_add;
					float_multiplier_clear <= '1';  --resets float mult core after operation done
				--cross product p3
				elsif operation_state = state_operation_dotProduct_add then
					if(float_adder_rdy = '1') then
						operation_state_next <= state_operation_dotProduct_p3_store;
						float_adder_enable <= '0';
					else
						storeOp <= store_op_p3;
						float_adder_enable <= '1';
						mux_op_cmd <= mux_op_dotProduct_add_parts;
						float_adder_clear <= '0'; 
					end if;				
				elsif operation_state = state_operation_dotProduct_p3_store then
					operation_state_next <= state_operation_dotProduct_done;
					float_adder_clear <= '1'; --resets float adder core after operation done
				--operation end
				elsif operation_state = state_operation_dotProduct_done then
					dotProductDone <= '1';
				end if;
			else
				operation_state_next <= state_operation_none; -- resets to first step
				dotProductDone <= '0';
				xProductDone <= '0';
			end if;
		end if;
	end process evaluate_vecOperation;

	ready <= (xProductDone or dotProductDone) and (enable_xProduct or enable_dotProduct);

end Behavioral;

