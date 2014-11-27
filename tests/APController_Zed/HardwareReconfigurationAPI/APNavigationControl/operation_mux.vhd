----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:44:54 09/18/2014 
-- Design Name: 
-- Module Name:    operation_mux - Behavioral 
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
use work.VectorOp_types.all;
library ieee_proposed;
use ieee_proposed.float_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity operation_mux is
port (
	mux_operation : in mux_nav_bearing_op_t;
	
	-- used inputs
	gsVectorX : in std_logic_vector(31 downto 0);
	gsVectorY : in std_logic_vector(31 downto 0);
	airUnitVectorX : in std_logic_vector(31 downto 0);
	airUnitVectorY : in std_logic_vector(31 downto 0);
	max_nu : in std_logic_vector(31 downto 0);
	min_nu : in std_logic_vector(31 downto 0);
	ABVectorX : in std_logic_vector(31 downto 0);
	ABVectorY : in std_logic_vector(31 downto 0);
	
	nu_limit : in std_logic_vector(31 downto 0);
	groundspeed : in std_logic_vector(31 downto 0);
	K_L1 : in std_logic_vector(31 downto 0);
	
	sin_nu1_max : in std_logic_vector(31 downto 0);
	sin_nu1_min : in std_logic_vector(31 downto 0);
	
	L1_dist : in std_logic_vector(31 downto 0);
	L1_dist_min : in std_logic_vector(31 downto 0);
	
	-- used registers
	
	xTrackVel_fixed : in std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	lTrackVel_fixed : in std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core

	ABVectorX_fixed : in std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	ABVectorY_fixed : in std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core

	ab_nu1 : in std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	ab_nu2 : in std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	xTrackErr : in std_logic_vector (31 downto 0);
	ab_sin_nu1 : in std_logic_vector (31 downto 0);
	ab_sin_nu1_fixed : in std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core
	ab_cos_nu1_fixed : in std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core

	L1_dist_internal : in std_logic_vector (31 downto 0); --max(L1_dist, 0.1f)
	cos_nu1_pow2 : in std_logic_vector (31 downto 0);

	min_nu_fixed : in std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	max_nu_fixed : in std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	latAccDem_part_1 : in std_logic_vector(31 downto 0);
	latAccDem_part_2 : in std_logic_vector(31 downto 0);

	sin_nu : in std_logic_vector(31 downto 0);

	latAccDem : in std_logic_vector (31 downto 0);

	nu_fixed : in std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	nu_float : in std_logic_vector(31 downto 0);
	last_nu_float : in std_logic_vector(31 downto 0);
	nav_bearing_float : in std_logic_vector (31 downto 0);

	--	-- prevent indecision s
	minus_nu_limit : in std_logic_vector(31 downto 0); --float
	nu_last_nu_prod : in std_logic_vector(31 downto 0); --float

-- opearands/results from the operation blocs
	vector1X : out std_logic_vector (31 downto 0);
	vector1Y : out std_logic_vector (31 downto 0);
	vector2X : out std_logic_vector (31 downto 0);
	vector2Y : out std_logic_vector (31 downto 0);
	vec_operation : out vector_op_t;
	operationResultX : in std_logic_vector(31 downto 0);
	vec_operationsresult_p1 : in std_logic_vector(31 downto 0);
	
	cordic_x : out std_logic_vector (31 downto 0);
	cordic_y : out std_logic_vector (31 downto 0);
	cordic_result : in std_logic_vector(31 downto 0);

	cordic_sincos_phase_in : out std_logic_vector (31 downto 0);
	cordic_sincos_y : in std_logic_vector (31 downto 0);
	cordic_sincos_x : in std_logic_vector (31 downto 0);
	
	float_comp_a : out std_logic_vector (31 downto 0);
	float_comp_b : out std_logic_vector (31 downto 0);
	float_comp_op : out std_logic_vector (5 downto 0);
	
	float_divider_a : out std_logic_vector (31 downto 0);
	float_divider_b : out std_logic_vector (31 downto 0);
	float_divider_result : in std_logic_vector(31 downto 0);
	
	float_to_fixed_a  : out std_logic_vector (31 downto 0);
	
	fixed_to_float_a : out std_logic_vector (31 downto 0);
	
	fixed_point_comp_a : out std_logic_vector (31 downto 0);
	fixed_point_comp_b : out std_logic_vector (31 downto 0);
	fixed_point_comp_op  : out fixed_point_compare_operation_t;
	
	fixed_adder_a : out std_logic_vector (31 downto 0);
	fixed_adder_b : out std_logic_vector (31 downto 0);
	fixed_adder_op : out fixed_adder_op_t;
	fixed_adder_result : in std_logic_vector (31 downto 0);
	
	float_sqrt_a : out std_logic_vector (31 downto 0);
	float_sqrt_result : in std_logic_vector(31 downto 0)

);
end operation_mux;

architecture Behavioral of operation_mux is

begin

	operationMux : process(mux_operation, gsVectorX, gsVectorY, airUnitVectorX, airUnitVectorY, ABVectorX, ABVectorY, 
								  sin_nu1_max, sin_nu1_min, l1_dist_min, operationResultX, max_nu, min_nu,
								  float_divider_result, float_sqrt_result, cordic_sincos_y, cordic_sincos_x, cordic_result)
	begin
	--default values to avoid latches
		vector1X <= (others => '0');
		vector1Y <= (others => '0');
		vector2X <= (others => '0');
		vector2Y <= (others => '0');
		vec_operation <= vector_op_dotProduct;
		
		cordic_x <= (others => '0');
		cordic_y <= (others => '0');
		
		cordic_sincos_phase_in <= (others => '0');
		
		float_comp_a <= (others => '0');
		float_comp_b <= (others => '0');
		float_comp_op <= (others => '0');
		
		float_divider_a <= (others => '0');
		float_divider_b <= (others => '0');
		
		float_to_fixed_a  <= (others => '0');
		
		fixed_to_float_a <= (others => '0');
		
		fixed_point_comp_a <= (others => '0');
		fixed_point_comp_b <= (others => '0');
		fixed_point_comp_op  <= fixed_point_compare_gt;
		
		fixed_adder_a <= (others => '0');
		fixed_adder_b <= (others => '0');
		fixed_adder_op <= fixed_adder_op_add;
		
		float_sqrt_a <= (others => '0');
		
		case mux_operation is
			-- wpa operations
			when mux_eval_wpa_xtrackVel =>
				vector1X <= gsVectorX;
				vector1Y <= gsVectorY;
				vector2X <= airUnitVectorX;
				vector2Y <= airUnitVectorY;
				vec_operation <= vector_op_xProduct;
				float_to_fixed_a <= operationResultX;
			when mux_eval_wpa_ltrackVel =>
				vector1X <= gsVectorX;
				vector1Y <= gsVectorY;
				vector2X <= airUnitVectorX;
				vector2Y <= airUnitVectorY;
				vec_operation <= vector_op_dotProduct;
				float_to_fixed_a <= operationResultX;
			when mux_eval_wpa_nu =>
				float_to_fixed_a <= min_nu;
				cordic_x <= xtrackVel_fixed;
				cordic_y <= ltrackVel_fixed;
				fixed_to_float_a <= cordic_result;
			when mux_eval_wpa_nav_bearing => --can be done in parallel
				float_to_fixed_a <= max_nu;
				cordic_x <= airUnitVectorX;
				cordic_y <= airUnitVectorY;
				fixed_to_float_a <= cordic_result;
			
			-- ab operations
			when mux_eval_ab_xtrackVel =>
				vector1X <= gsVectorX;
				vector1Y <= gsVectorY;
				vector2X <= ABVectorX;
				vector2Y <= ABVectorY;
				vec_operation <= vector_op_xProduct;
				float_to_fixed_a <= operationResultX;
			when mux_eval_ab_ltrackVel =>
				vector1X <= gsVectorX;
				vector1Y <= gsVectorY;
				vector2X <= ABVectorX;
				vector2Y <= ABVectorY;
				vec_operation <= vector_op_dotProduct;
				float_to_fixed_a <= operationResultX;
				
			when mux_eval_ab_nu2 =>
				cordic_x <= xtrackVel_fixed;
				cordic_y <= ltrackVel_fixed;
				float_to_fixed_a <= ABVectorX; -- will be needed for some final operations
				
			when mux_eval_ab_xtrackErr =>
				vector1X <= airUnitVectorX;
				vector1Y <= airUnitVectorY;
				vector2X <= ABVectorX;
				vector2Y <= ABVectorY;
				vec_operation <= vector_op_xProduct;
				float_to_fixed_a <= ABVectorY; -- will be needed for some final operations
				
			when mux_eval_ab_L1_dist =>
				float_comp_a <= L1_dist;
				float_comp_b <= L1_dist_min; --0.1 in the code
				float_comp_op <= "110100"; -- A gte B
			
			when mux_eval_ab_sin_nu1 =>
				float_divider_a <= xTrackErr;
				float_divider_b <= L1_dist_internal;
				float_to_fixed_a <= float_divider_result;
			-- todo simulate constraining
			when mux_eval_ab_constraint_nu1_p1 =>
				float_comp_a <= ab_sin_nu1;
				float_comp_b <= sin_nu1_min; -- -0.7071 in the code
				float_comp_op <= "110100"; -- A gte B
				float_to_fixed_a <= sin_nu1_min;
				
			when mux_eval_ab_constraint_nu1_p2 =>
				float_comp_a <= ab_sin_nu1;
				float_comp_b <= sin_nu1_max; -- 0.7071 in the code
				float_comp_op <= "011100"; -- A lte B
				float_to_fixed_a <= sin_nu1_max;
			
			-- todo simulate eval nu1
			when mux_eval_ab_cos_nu1_p1 => -- 1 - ab_sin_nu1^2 and ab_sin_nu1^2
				vector1X <= to_std_logic_vector(to_float(1.0));
				vector1Y <= ab_sin_nu1;
				vector2X <= ab_sin_nu1;
				vector2Y <= to_std_logic_vector(to_float(1.0));
				vec_operation <= vector_op_xProduct;
				
			when mux_eval_ab_cos_nu1_p2 => -- cos_nu1 = sqrt(1 - ab_sin_nu1^2)
				float_sqrt_a <= cos_nu1_pow2;
				float_to_fixed_a <= float_sqrt_result;
			when mux_eval_ab_nu1 =>
				cordic_x <= ab_cos_nu1_fixed;
				cordic_y <= ab_sin_nu1_fixed;
				float_to_fixed_a <= min_nu;
			when mux_eval_ab_nu =>
				fixed_adder_a <= ab_nu1;
				fixed_adder_b <= ab_nu2;
				fixed_adder_op <= fixed_adder_op_add;
			when mux_eval_ab_nav_bearing =>
				cordic_x <= ABVectorX_fixed;
				cordic_y <= ABVectorY_fixed;
				fixed_adder_a <= cordic_result;
				fixed_adder_b <= ab_nu1;
				fixed_adder_op <= fixed_adder_op_add;
				fixed_to_float_a <= fixed_adder_result;
				
				float_to_fixed_a <= max_nu;

			-- general operations
			when mux_eval_nu_constrained_p1 =>
				fixed_point_comp_a <= nu_fixed;
				fixed_point_comp_b <= min_nu_fixed; -- -1.5708f on the code
				fixed_point_comp_op <= fixed_point_compare_gte;
			when mux_eval_nu_constrained_p2 =>
				fixed_point_comp_a <= nu_fixed;
				fixed_point_comp_b <= max_nu_fixed; -- 1.5708f on the code
				fixed_point_comp_op <= fixed_point_compare_lte;
			
			when mux_eval_latAccDem_p1 => --eval sin(nu_fixed)
				cordic_sincos_phase_in <= nu_fixed;
				fixed_to_float_a <= cordic_sincos_y;
			when mux_eval_latAccDem_p2 => -- use vec processing usint to eval groundspeed^2 and k_l1 * sin_nu
				vector1X <= groundSpeed;
				vector1Y <= K_L1;
				vector2X <= groundSpeed;
				vector2Y <= sin_nu;
				vec_operation <= vector_op_dotProduct;
			when mux_eval_latAccDem_p3 =>
				vector1X <= latAccDem_part_1;
				vector1Y <= to_std_logic_vector(to_float(1.0));
				vector2X <= latAccDem_part_2;
				vector2Y <= to_std_logic_vector(to_float(1.0));
				vec_operation <= vector_op_dotProduct;
				float_divider_a <= vec_operationsresult_p1;
				float_divider_b <= L1_dist;
				
			-- todo prevent indecision nu
			when mux_eval_prevent_indecision_p1 => -- use vec processing to eval -Nu_limit and Nu * last_Nu
				vector1X <= nu_limit;
				vector1Y <= nu_float;
				vector2X <= to_std_logic_vector(to_float(-1.0));
				vector2Y <= last_nu_float;
				vec_operation <= vector_op_dotProduct;
			when mux_eval_prevent_indecision_p2 =>
				float_comp_a <= nu_float;
				float_comp_b <= minus_nu_limit;
				float_comp_op <= "001100"; -- nu_float lt -nu_limit
			when mux_eval_prevent_indecision_p3 =>
				float_comp_a <= nu_float;
				float_comp_b <= nu_limit;
				float_comp_op <= "100100"; -- nu_float gt nu_limit
			when mux_eval_prevent_indecision_p4 =>
				float_comp_a <= last_nu_float;
				float_comp_b <= minus_nu_limit;
				float_comp_op <= "001100"; -- last_nu_float lt -nu_limit
			when mux_eval_prevent_indecision_p5 =>
				float_comp_a <= last_nu_float;
				float_comp_b <= nu_limit;
				float_comp_op <= "100100"; -- last_nu_float gt nu_limit
			when mux_eval_prevent_indecision_p6 =>
				float_comp_a <= nu_last_nu_prod;
				float_comp_b <= to_std_logic_vector(to_float(0.0));
				float_comp_op <= "100100"; -- nu * last_nu gt 0
				
		end case;
	end process operationMux;

end Behavioral;

