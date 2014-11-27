----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:52:57 08/18/2014 
-- Design Name: 
-- Module Name:    L1_Guidance_WP_guidance - Behavioral 
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
use work.TypeDeclarations.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity L1_Guidance_WP is
port(
	clk : in std_logic;
	mux_op_cmd : out mux_nav_bearing_op_t;
	store_op : out store_nav_bearing_op_t;
	
	vec_operation_enable : out std_logic;
	vec_operation_ready : in std_logic;
	vec_operation_clear : out std_logic; 
	
	cordic_clear : out std_logic;
	cordic_ready : in std_logic;
	
	cordic_sincos_clear : out std_logic;
	cordic_sincos_ready : in std_logic;
	
	
	float_to_fixed_rdy : in std_logic;
	float_to_fixed_clear : out std_logic;
	float_to_fixed_enable : out std_logic;
	
	fixed_to_float_rdy : in std_logic;
	fixed_to_float_enable : out std_logic;
	fixed_to_float_clear : out std_logic;
	
	float_divider_rdy : in std_logic;
	float_divider_clear : out std_logic;
	float_divider_enable : out std_logic;
		
	float_compare_rdy : in std_logic;
	float_compare_clear : out std_logic;
	float_compare_enable : out std_logic;
	
	float_sqrt_rdy : in std_logic;
	float_sqrt_enable : out std_logic;
	float_sqrt_clear : out std_logic;
		
	
	wpa_reference : in std_logic
);
end L1_Guidance_WP;

architecture Behavioral of L1_Guidance_WP is
	type nav_bearing_eval_state_t is
	(
		nav_bearing_eval_state_xtrackVel,
		nav_bearing_eval_state_ltrackVel,
		nav_bearing_eval_state_wpa_nu,
		nav_bearing_eval_state_wpa_nav_bearing,
		
		nav_bearing_eval_state_ab_nu2,
		nav_bearing_eval_state_xtrackErr,
		nav_bearing_eval_state_ab_L1_dist,
		nav_bearing_eval_state_ab_sin_nu1,
		nav_bearing_eval_state_ab_sin_nu1_constrained_p1,
		nav_bearing_eval_state_ab_sin_nu1_constrained_p2,
		nav_bearing_eval_state_ab_cos_nu1_p1,
		nav_bearing_eval_state_ab_cos_nu1_p2,
		nav_bearing_eval_state_ab_nu1,
		nav_bearing_eval_state_ab_nu,
		nav_bearing_eval_state_ab_nav_bearing,
		
		
		latAccel_eval_state_nu_constrained_p1,
		latAccel_eval_state_nu_constrained_p2,
		latAccel_eval_state_latAccel_p1,
		latAccel_eval_state_latAccel_p2,
		latAccel_eval_state_latAccel_p3,
		
		nav_bearing_eval_state_wpa_prevent_indecision_p1,
		nav_bearing_eval_state_wpa_prevent_indecision_p2,
		nav_bearing_eval_state_wpa_prevent_indecision_p3,
		nav_bearing_eval_state_wpa_prevent_indecision_p4,
		nav_bearing_eval_state_wpa_prevent_indecision_p5,
		nav_bearing_eval_state_wpa_prevent_indecision_p6,
		
		nav_bearing_eval_state_reset_operators
	);
	
	type eval_stage_t is
	(
		eval_stage_nav_bearing,
		eval_stage_latAccel
	);
	
	signal next_state : nav_bearing_eval_state_t := nav_bearing_eval_state_reset_operators;
	signal state : nav_bearing_eval_state_t := nav_bearing_eval_state_reset_operators;
	signal ant_state : nav_bearing_eval_state_t := nav_bearing_eval_state_reset_operators;
	
	signal stage : eval_stage_t := eval_stage_nav_bearing;
	signal next_stage : eval_stage_t := eval_stage_nav_bearing;
	
begin

	state_transition : process (clk)
	begin
		if(rising_edge(clk)) then
			if (state /= nav_bearing_eval_state_reset_operators) then
				ant_state <= state;
			end if;
			state <= next_state;
			stage <= next_stage;
		end if;
	end process state_transition;
	
	operation_control : process (clk)
	begin
		if(rising_edge(clk)) then
			if(wpa_reference = '1' and stage = eval_stage_nav_bearing) then -- L1 evaluation with A as reference
				if state = nav_bearing_eval_state_xtrackVel then
					vec_operation_enable <= '1';
					vec_operation_clear <= '0';
					mux_op_cmd <= mux_eval_wpa_xtrackVel;
					store_op <= store_op_store_xtrackVel;
					
					if(vec_operation_ready = '1') then 
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
					
				elsif state = nav_bearing_eval_state_ltrackVel then
					vec_operation_enable <= '1';
					vec_operation_clear <= '0';
					 
					mux_op_cmd <= mux_eval_wpa_ltrackVel;
					store_op <= store_op_store_ltrackVel;
					
					if(vec_operation_ready = '1') then
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
					
				elsif state = nav_bearing_eval_state_wpa_nu then
					
					mux_op_cmd <= mux_eval_wpa_nu;
					store_op <= store_op_store_wpa_nu;
					cordic_clear <= '0';
					
					if(cordic_ready = '1') then --convert min_nu to fixed
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then -- convert nu_fixed to float
							fixed_to_float_enable <= '1';
							fixed_to_float_clear <= '0';
							if( fixed_to_float_rdy = '1') then
								next_state <= nav_bearing_eval_state_reset_operators;
							end if;
						end if;
					end if;
				-- prevent indecision wpa_nu
				elsif state = nav_bearing_eval_state_wpa_prevent_indecision_p1 then
					vec_operation_enable <= '1';
					vec_operation_clear <= '0';
					mux_op_cmd <= mux_eval_prevent_indecision_p1;
					store_op <= store_op_store_prevent_indecision_p1;
					
					if(vec_operation_ready = '1') then 
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_wpa_prevent_indecision_p2 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					mux_op_cmd <= mux_eval_prevent_indecision_p2;
					store_op <= store_op_store_prevent_indecision_p2;
					if(float_compare_rdy = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_wpa_prevent_indecision_p3 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					mux_op_cmd <= mux_eval_prevent_indecision_p3;
					store_op <= store_op_store_prevent_indecision_p3;
					if(float_compare_rdy = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_wpa_prevent_indecision_p4 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					mux_op_cmd <= mux_eval_prevent_indecision_p4;
					store_op <= store_op_store_prevent_indecision_p4;
					if(float_compare_rdy = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_wpa_prevent_indecision_p5 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					mux_op_cmd <= mux_eval_prevent_indecision_p5;
					store_op <= store_op_store_prevent_indecision_p5;
					if(float_compare_rdy = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_wpa_prevent_indecision_p6 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					mux_op_cmd <= mux_eval_prevent_indecision_p6;
					store_op <= store_op_store_prevent_indecision_p6;
					if(float_compare_rdy = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;

				elsif state = nav_bearing_eval_state_wpa_nav_bearing then
					
					mux_op_cmd <= mux_eval_wpa_nav_bearing;
					store_op <= store_op_store_wpa_nav_bearing;
					cordic_clear <= '0';
					
					if(cordic_ready = '1') then
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then -- convert max_nu to fixed
							fixed_to_float_enable <= '1';
							fixed_to_float_clear <= '0';
							if( fixed_to_float_rdy = '1') then --convert nav_bearing to float
								next_stage <= eval_stage_latAccel;
								next_state <= nav_bearing_eval_state_reset_operators;
							end if;
						end if;
					end if;
					
				elsif state = nav_bearing_eval_state_reset_operators then
					--clear cordic
					cordic_clear <= '1';
					
					--clear vector processor
					vec_operation_clear <= '1';
					vec_operation_enable <= '0';
					
					--clear float_to_fixed
					float_to_fixed_enable <= '0';
					float_to_fixed_clear <= '1';
					
					--clear float_to_fixed
					fixed_to_float_enable <= '0';
					fixed_to_float_clear <= '1';
					
					--make the normal state transition
					case ant_state is
						when nav_bearing_eval_state_xtrackVel =>
							next_state <= nav_bearing_eval_state_ltrackVel;
						when nav_bearing_eval_state_ltrackVel =>
							next_state <= nav_bearing_eval_state_wpa_nu;
						when nav_bearing_eval_state_wpa_nu =>
							store_op <= store_op_nop;
							next_state <= nav_bearing_eval_state_wpa_prevent_indecision_p1;
						when nav_bearing_eval_state_wpa_prevent_indecision_p1 =>
							next_state <= nav_bearing_eval_state_wpa_prevent_indecision_p2;
						when nav_bearing_eval_state_wpa_prevent_indecision_p2 =>
							next_state <= nav_bearing_eval_state_wpa_prevent_indecision_p3;
						when nav_bearing_eval_state_wpa_prevent_indecision_p3 =>
							next_state <= nav_bearing_eval_state_wpa_prevent_indecision_p4;
						when nav_bearing_eval_state_wpa_prevent_indecision_p4 =>
							next_state <= nav_bearing_eval_state_wpa_prevent_indecision_p5;
						when nav_bearing_eval_state_wpa_prevent_indecision_p5 =>
							next_state <= nav_bearing_eval_state_wpa_prevent_indecision_p6;
						when nav_bearing_eval_state_wpa_prevent_indecision_p6 =>
							next_state <= nav_bearing_eval_state_wpa_nav_bearing;
						when others => --init contidition
							store_op <= store_op_nop;
							next_state <= nav_bearing_eval_state_xtrackVel;
					end case;
				end if;
			elsif(wpa_reference = '0' and stage = eval_stage_nav_bearing) then -- L1 evaluation with the AB line
				if state = nav_bearing_eval_state_xtrackVel then
					vec_operation_enable <= '1';
					vec_operation_clear <= '0';
					
					mux_op_cmd <= mux_eval_ab_xtrackVel;
					store_op <= store_op_store_xtrackVel;
					
					if(vec_operation_ready = '1') then
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				elsif state = nav_bearing_eval_state_ltrackVel then
					vec_operation_enable <= '1';
					vec_operation_clear <= '0';
					
					mux_op_cmd <= mux_eval_ab_ltrackVel;
					store_op <= store_op_store_ltrackVel;
					
					if(vec_operation_ready = '1') then
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				elsif state = nav_bearing_eval_state_ab_nu2 then
					cordic_clear <= '0';
					mux_op_cmd <= mux_eval_ab_nu2;
					store_op <= store_op_store_ab_nu2;
					
					if(cordic_ready = '1') then -- use this to convert ABVectorX to fixed point for further operations
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				elsif state = nav_bearing_eval_state_xtrackErr then
					vec_operation_enable <= '1';
					vec_operation_clear <= '0';
					mux_op_cmd <= mux_eval_ab_xtrackErr;
					store_op <= store_op_store_ab_xtrackErr;
					
					if(vec_operation_ready = '1') then -- use this to convert ABVectorY to fixed point for further operations
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				elsif state = nav_bearing_eval_state_ab_L1_dist then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					mux_op_cmd <= mux_eval_ab_L1_dist;
					store_op <= store_op_store_ab_L1_dist;
					
					if(float_compare_rdy = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_ab_sin_nu1 then
					float_divider_enable <= '1';
					float_divider_clear <= '0';
										
					mux_op_cmd <= mux_eval_ab_sin_nu1;
					store_op <= store_op_store_ab_sin_nu1;
					
					if(float_divider_rdy = '1') then
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
						
					end if;
					
				elsif state = nav_bearing_eval_state_ab_sin_nu1_constrained_p1 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					
					mux_op_cmd <= mux_eval_ab_constraint_nu1_p1;
					store_op <= store_op_store_ab_sin_nu1_constrained_p1;
					
					if(float_compare_rdy = '1') then --using float operation to eval both 1 - sin2 and sin2 at same time
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				elsif state = nav_bearing_eval_state_ab_sin_nu1_constrained_p2 then
					float_compare_enable <= '1';
					float_compare_clear <= '0';
					
					
					mux_op_cmd <= mux_eval_ab_constraint_nu1_p2;
					store_op <= store_op_store_ab_sin_nu1_constrained_p2;
					
					
					if(float_compare_rdy = '1') then --using float operation to eval both 1 - sin2 and sin2 at same time
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				
				elsif state = nav_bearing_eval_state_ab_cos_nu1_p1 then
					vec_operation_clear <= '0';
					vec_operation_enable <= '1';
					mux_op_cmd <= mux_eval_ab_cos_nu1_p1;
					store_op <= store_op_store_ab_cos_nu1_p1;
					
					if(vec_operation_ready = '1') then --using float operation to eval both 1 - sin2 and sin2 at same time
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
				elsif state = nav_bearing_eval_state_ab_cos_nu1_p2 then
					float_sqrt_enable <= '1';
					float_sqrt_clear <= '0';
					
					
					mux_op_cmd <= mux_eval_ab_cos_nu1_p2;
					store_op <= store_op_store_ab_cos_nu1_p2;
					
					if(float_sqrt_rdy = '1' ) then --using float operation to eval both 1 - sin2 and sin2 at same time
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if( float_to_fixed_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				
				elsif state = nav_bearing_eval_state_ab_nu1 then
					cordic_clear <= '0';
					
					mux_op_cmd <= mux_eval_ab_nu1;
					store_op <= store_op_store_ab_nu1;
					
					if(cordic_ready = '1') then --eval nu1 using atan(sin_nu1, cos_nu1)
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then -- convert min_nu to fixed point
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				
				elsif state = nav_bearing_eval_state_ab_nu then
					store_op <= store_op_store_ab_nu;
					mux_op_cmd <= mux_eval_ab_nu;
					
					fixed_to_float_enable <= '1';
					fixed_to_float_clear <= '0';
					if(fixed_to_float_rdy = '1') then --convert nu_fixed to nu_float
						next_state <= nav_bearing_eval_state_reset_operators;--nav_bearing_eval_state_ab_nav_bearing;
					end if;
					
				elsif state = nav_bearing_eval_state_ab_nav_bearing then
					cordic_clear <= '0';
					
					mux_op_cmd <= mux_eval_ab_nav_bearing;
					store_op <= store_op_store_ab_nav_bearing;
					
					
					if(cordic_ready = '1') then -- cordic to eval atan(AB.y, AB.x)
						float_to_fixed_enable <= '1';
						float_to_fixed_clear <= '0';
						if(float_to_fixed_rdy = '1') then -- convert max_nu to fixed
							fixed_to_float_enable <= '1';
							fixed_to_float_clear <= '0';
							if(fixed_to_float_rdy = '1') then --convert nav_bearing_fixed to nav_bearing_float
								next_stage <= eval_stage_latAccel;
								next_state <= nav_bearing_eval_state_reset_operators;
							end if;
						end if;
					end if;
				elsif state = nav_bearing_eval_state_reset_operators then
					--clear cordic
					cordic_clear <= '1';
					
					--clear vector processor
					vec_operation_clear <= '1';
					vec_operation_enable <= '0';
					
					--clear divider
					float_divider_enable <= '0';
					float_divider_clear <= '1';
					
					--clear comparer
					float_compare_enable <= '0';
					float_compare_clear <= '1';
					
					--clear sqrt
					float_sqrt_enable <= '0';
					float_sqrt_clear <= '1';
					
					--clear float_to_fixed
					float_to_fixed_enable <= '0';
					float_to_fixed_clear <= '1';
					
					--clear float_to_fixed
					fixed_to_float_enable <= '0';
					fixed_to_float_clear <= '1';
					
					--make the normal state transition
					case ant_state is
						when nav_bearing_eval_state_xtrackVel =>
							next_state <= nav_bearing_eval_state_ltrackVel;
						when nav_bearing_eval_state_ltrackVel =>
							next_state <= nav_bearing_eval_state_ab_nu2;
						when nav_bearing_eval_state_ab_nu2 =>
							store_op <= store_op_nop;
							next_state <= nav_bearing_eval_state_xtrackErr;
						when nav_bearing_eval_state_xtrackErr =>
							next_state <= nav_bearing_eval_state_ab_L1_dist;
						when nav_bearing_eval_state_ab_L1_dist =>
							next_state <= nav_bearing_eval_state_ab_sin_nu1;
						when nav_bearing_eval_state_ab_sin_nu1 =>
							next_state <= nav_bearing_eval_state_ab_sin_nu1_constrained_p1;	
						when nav_bearing_eval_state_ab_sin_nu1_constrained_p1 =>
							next_state <= nav_bearing_eval_state_ab_sin_nu1_constrained_p2;
						when nav_bearing_eval_state_ab_sin_nu1_constrained_p2 =>
							next_state <= nav_bearing_eval_state_ab_cos_nu1_p1;
						when nav_bearing_eval_state_ab_cos_nu1_p1 =>
							next_state <= nav_bearing_eval_state_ab_cos_nu1_p2;
						when nav_bearing_eval_state_ab_cos_nu1_p2 =>
							next_state <= nav_bearing_eval_state_ab_nu1;
						when nav_bearing_eval_state_ab_nu1 =>
							store_op <= store_op_nop;
							next_state <= nav_bearing_eval_state_ab_nu;
						when nav_bearing_eval_state_ab_nu =>
							next_state <= nav_bearing_eval_state_ab_nav_bearing;
						when others => --init contidition
							next_state <= nav_bearing_eval_state_xtrackVel;
					end case;
				end if;
				
			elsif(stage = eval_stage_latAccel) then
				if state = latAccel_eval_state_nu_constrained_p1 then
					
					mux_op_cmd <= mux_eval_nu_constrained_p1;
					store_op <= store_op_store_nu_constrained_p1;
					-- no sync needed due to combinational operation
					next_state <= latAccel_eval_state_nu_constrained_p2;
					
				elsif state = latAccel_eval_state_nu_constrained_p2 then
					mux_op_cmd <= mux_eval_nu_constrained_p2;
					store_op <= store_op_store_nu_constrained_p2;
					next_state <= latAccel_eval_state_latAccel_p1;
					
				elsif state = latAccel_eval_state_latAccel_p1 then
					
					cordic_sincos_clear <= '0';
					mux_op_cmd <= mux_eval_latAccDem_p1;
					store_op <= store_op_store_latAccDem_part1;
					
					if (cordic_sincos_ready = '1') then
						fixed_to_float_enable <= '1';
						fixed_to_float_clear <= '0';
						if(fixed_to_float_rdy = '1') then
							next_state <= nav_bearing_eval_state_reset_operators;
						end if;
					end if;
				elsif state = latAccel_eval_state_latAccel_p2 then
					
					vec_operation_clear <= '0';
					vec_operation_enable <= '1';
					mux_op_cmd <= mux_eval_latAccDem_p2;
					store_op <= store_op_store_latAccDem_part2;
					
					
					if(vec_operation_ready = '1') then
						next_state <= nav_bearing_eval_state_reset_operators;
					end if;
					
				elsif state = latAccel_eval_state_latAccel_p3 then
					
					vec_operation_clear <= '0';
					vec_operation_enable <= '1';
					mux_op_cmd <= mux_eval_latAccDem_p3;
					store_op <= store_op_store_latAccDem;
					
					if(vec_operation_ready = '1') then
						float_divider_enable <= '1';
						float_divider_clear <= '0';
					--	if(float_divider_ready = '1') then
					--		next_state <= nav_bearing_eval_state_reset_operators;
					--	end if;
					end if;
				
				elsif state = nav_bearing_eval_state_reset_operators then
					--make the normal state transition
					cordic_sincos_clear <= '1';
					
					--clear vector processor
					vec_operation_clear <= '1';
					vec_operation_enable <= '0';
					
					--clear divider
					float_divider_enable <= '0';
					float_divider_clear <= '1';
					
					--clear float_to_fixed
					fixed_to_float_enable <= '0';
					fixed_to_float_clear <= '1';
					
					case ant_state is
						when latAccel_eval_state_latAccel_p1 =>
							next_state <= latAccel_eval_state_latAccel_p2;
						when latAccel_eval_state_latAccel_p2 =>
							next_state <= latAccel_eval_state_latAccel_p3;
						when others => --coming from other processing
							store_op <= store_op_nop;
							next_state <= latAccel_eval_state_nu_constrained_p1;
					end case;
				end if;
			end if;
		end if;
	end process operation_control;
	
	
	
	
end Behavioral;

