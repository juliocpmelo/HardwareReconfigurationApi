----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:53 09/18/2014 
-- Design Name: 
-- Module Name:    results_storage - Behavioral 
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
use work.TypeDeclarations.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity results_storage is
port (
	clk : in std_logic;
	store_op : in store_nav_bearing_op_t;
	
	-- input parameters
	l1_dist : in std_logic_vector(31 downto 0);
	l1_dist_min : in std_logic_vector(31 downto 0);
	sin_nu1_max : in std_logic_vector(31 downto 0);
	sin_nu1_min : in std_logic_vector(31 downto 0);
	min_nu : in std_logic_vector(31 downto 0);
	max_nu : in std_logic_vector(31 downto 0);
	nav_bearing_cd_condition : in std_logic;
	
	-- outputs from the operators
	operationResultX_sig : in std_logic_vector(31 downto 0);
	operationResultY_sig : in std_logic_vector(31 downto 0);
	
	vec_operationsresult_p1_sig : in std_logic_vector(31 downto 0);
	vec_operationsresult_p2_sig : in std_logic_vector(31 downto 0);
	
	cordic_result : in std_logic_vector(31 downto 0);
	
	float_to_fixed_result : in std_logic_vector(31 downto 0);
	float_divider_result : in std_logic_vector(31 downto 0);
	float_sqrt_result : in std_logic_vector(31 downto 0);
	float_comp_result : in std_logic;
	
	fixed_to_float_result : in std_logic_vector(31 downto 0);
	fixed_adder_result : in std_logic_vector(31 downto 0);
	fixed_point_comp_result : in std_logic;
	
	-- elements used by the mux
	
	 xTrackVel_fixed_out : out std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	 lTrackVel_fixed_out : out std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core

	 ABVectorX_fixed_out : out std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	 ABVectorY_fixed_out : out std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core

	 ab_nu1_out : out std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	 ab_nu2_out : out std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	 xTrackErr_out : out std_logic_vector (31 downto 0);
	 ab_sin_nu1_out : out std_logic_vector (31 downto 0);
	 ab_sin_nu1_fixed_out : out std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core
	 ab_cos_nu1_fixed_out : out std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core

	 L1_dist_internal_out : out std_logic_vector (31 downto 0); --max(L1_dist, 0.1f)
	 cos_nu1_pow2_out : out std_logic_vector (31 downto 0);

	 min_nu_fixed_out : out std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	 max_nu_fixed_out : out std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	 latAccDem_part_1_out : out std_logic_vector(31 downto 0);
	 latAccDem_part_2_out : out std_logic_vector(31 downto 0);

	 sin_nu_out : out std_logic_vector(31 downto 0);

	 latAccDem_out : out std_logic_vector (31 downto 0);

	 nu_fixed_out : out std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	 nu_float_out : out std_logic_vector(31 downto 0);
	 last_nu_float_out : out std_logic_vector(31 downto 0);
	 nav_bearing_float_out : out std_logic_vector (31 downto 0);

--	-- prevent indecision s
	 minus_nu_limit_out : out std_logic_vector(31 downto 0); --float
	 nu_last_nu_prod_out : out std_logic_vector(31 downto 0) --float
	
);
end results_storage;

architecture Behavioral of results_storage is
	signal xTrackVel : std_logic_vector(31 downto 0);
	signal xTrackVel_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal lTrackVel : std_logic_vector(31 downto 0);
	signal lTrackVel_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	
	signal ABVectorX_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal ABVectorY_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	
	signal wpa_nav_bearing : std_logic_vector (31 downto 0);
	
	signal ab_nu1 : std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal ab_nu2 : std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal xTrackErr : std_logic_vector (31 downto 0);
	signal ab_sin_nu1 : std_logic_vector (31 downto 0);
	signal ab_sin_nu1_fixed : std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal ab_cos_nu1 : std_logic_vector (31 downto 0);
	signal ab_cos_nu1_fixed : std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal ab_nav_bearing : std_logic_vector (31 downto 0);
	
	signal L1_dist_internal : std_logic_vector (31 downto 0); --max(L1_dist, 0.1f)
	signal sin_nu1_pow2 : std_logic_vector (31 downto 0);
	signal cos_nu1_pow2 : std_logic_vector (31 downto 0);
	
	
	signal min_nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal max_nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal latAccDem_part_1 : std_logic_vector(31 downto 0);
	signal latAccDem_part_2 : std_logic_vector(31 downto 0);
	
	signal sin_nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal sin_nu : std_logic_vector(31 downto 0);
	
	signal latAccDem : std_logic_vector (31 downto 0);
	
	signal nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal nu_float : std_logic_vector(31 downto 0);
	signal last_nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal last_nu_float : std_logic_vector(31 downto 0);
	signal nav_bearing_fixed : std_logic_vector (31 downto 0); -- 2QN fixed format due to cordic core
	signal nav_bearing_float : std_logic_vector (31 downto 0);
	
	-- prevent indecision signals
	signal minus_nu_limit : std_logic_vector(31 downto 0); --float
	signal nu_last_nu_prod : std_logic_vector(31 downto 0); --float
	signal indecision_condition : std_logic_vector(3 downto 0);
begin


	storeResults : process (clk)
	begin
		if(rising_edge(clk)) then
			case store_op is
				-- xtrack and ltrack velocities
				when store_op_store_xtrackVel =>
					xtrackVel <= operationResultX_sig;
					xtrackVel_fixed <= float_to_fixed_result;
				when store_op_store_ltrackVel =>
					ltrackVel <= operationResultX_sig;
					ltrackVel_fixed <= float_to_fixed_result;
				
				-- wpa operations
				-- todo convert nu_fixed to float
				when store_op_store_wpa_nu =>
					nu_fixed <= cordic_result;
					nu_float <= fixed_to_float_result;
					
					min_nu_fixed <= float_to_fixed_result;
					
				when store_op_store_wpa_nav_bearing =>
					wpa_nav_bearing <= cordic_result;
					nav_bearing_fixed <= cordic_result;
					nav_bearing_float <= fixed_to_float_result;
					last_nu_fixed <= nu_fixed;
					last_nu_float <= nu_float;
					
					max_nu_fixed <= float_to_fixed_result;
				
				-- ab operations
				when store_op_store_ab_nu2 =>
					ab_nu2 <= cordic_result;
					ABVectorX_fixed <= float_to_fixed_result;
				when store_op_store_ab_xtrackErr =>
					xTrackErr <= operationResultX_sig;
					ABVectorY_fixed <= float_to_fixed_result;
				when store_op_store_ab_L1_dist =>
					if(float_comp_result = '1') then
						L1_dist_internal <= L1_dist;
					else
						L1_dist_internal <= L1_dist_min;
					end if;
				when store_op_store_ab_sin_nu1 =>
					ab_sin_nu1 <= float_divider_result;
					ab_sin_nu1_fixed <= float_to_fixed_result;
				when store_op_store_ab_sin_nu1_constrained_p1 =>
					if(float_comp_result = '0') then -- ab_sin_nu1 < ab_sin_nu1_min
						ab_sin_nu1 <= sin_nu1_min;
						ab_sin_nu1_fixed <= float_to_fixed_result;
					end if;
				when store_op_store_ab_sin_nu1_constrained_p2 =>
					if(float_comp_result = '0') then -- ab_sin_nu1 > ab_sin_nu1_max
						ab_sin_nu1 <= sin_nu1_max;
						ab_sin_nu1_fixed <= float_to_fixed_result;
					end if;
				when store_op_store_ab_cos_nu1_p1 =>
					cos_nu1_pow2 <= operationResultX_sig;
				when store_op_store_ab_cos_nu1_p2 =>
					ab_cos_nu1 <= float_sqrt_result;
					ab_cos_nu1_fixed <= float_to_fixed_result;
				when store_op_store_ab_nu1 =>
					ab_nu1 <= cordic_result;
					
					min_nu_fixed <= float_to_fixed_result;
				when store_op_store_ab_nu =>
					nu_fixed <= fixed_adder_result; -- ab_nu1 + ab_nu2
					nu_float <= fixed_to_float_result;
					
				when store_op_store_ab_nav_bearing =>
					ab_nav_bearing <= fixed_adder_result; -- cordic_result + ab_nu1
					nav_bearing_fixed <= fixed_adder_result;
					nav_bearing_float <= fixed_to_float_result;
					last_nu_fixed <= nu_fixed;
					last_nu_float <= nu_float;
					
					max_nu_fixed <= float_to_fixed_result;
				
				-- lateral acceleration
				when store_op_store_nu_constrained_p1 =>
					if(fixed_point_comp_result = '0') then -- nu_fixed < min_nu_fixed
						nu_fixed <= min_nu_fixed;
						nu_float <= min_nu;
					end if;
				when store_op_store_nu_constrained_p2 =>
					if(fixed_point_comp_result = '0') then -- nu_fixed > max_nu_fixed
						nu_fixed <= max_nu_fixed;
						nu_float <= max_nu;
					end if;
				when store_op_store_latAccDem_part1 => -- store sin (nu_fixed) in float32 format
					sin_nu <= fixed_to_float_result;
				when store_op_store_latAccDem_part2 =>
					latAccDem_part_1 <= vec_operationsResult_p1_sig; -- groundspeed*groundspeed
					latAccDem_part_2 <= vec_operationsResult_p2_sig; -- K_L1 * sinf(Nu)	
				when store_op_store_latAccDem =>
					latAccDem <= float_divider_result; -- latAccDem_part_1*latAccDem_part_2/L1_dist
				
				--prevent indecision
				when store_op_store_prevent_indecision_p1 =>
					minus_nu_limit <= vec_operationsResult_p1_sig; -- -nu_limit
					nu_last_nu_prod <= vec_operationsResult_p2_sig; -- nu * last_nu
				when store_op_store_prevent_indecision_p2 =>
					indecision_condition(0) <= float_comp_result;
				when store_op_store_prevent_indecision_p3 =>
					indecision_condition(1) <= float_comp_result;
				when store_op_store_prevent_indecision_p4 =>
					indecision_condition(2) <= float_comp_result;
				when store_op_store_prevent_indecision_p5 =>
					indecision_condition(3) <= float_comp_result;
				when store_op_store_prevent_indecision_p6 =>
				-- fabs(nu) > nu_limit and fabs(last_nu) > nu_limit and 
				--	nu*last_nu > 0 and fabsf(wrap_180_cd(_target_bearing_cd - _ahrs.yaw_sensor)) > 12000
					if(((indecision_condition(0) or indecision_condition(1)) and 
						 (indecision_condition(2) or indecision_condition(3)) and 
						 float_comp_result and nav_bearing_cd_condition) = '1' ) then 
						nu_float <= last_nu_float;
					end if;
		
				when store_op_nop =>
					--do nothing
			end case;
		end if;
	end process storeResults;
	
	xTrackVel_fixed_out <= xTrackVel_fixed;
	lTrackVel_fixed_out <= lTrackVel_fixed;

	ABVectorX_fixed_out <= ABVectorX_fixed;
	ABVectorY_fixed_out <= ABVectorY_fixed;

	ab_nu1_out <= ab_nu1;
	ab_nu2_out <= ab_nu2;
	xTrackErr_out <= xTrackErr;
	ab_sin_nu1_out <= ab_sin_nu1;
	ab_sin_nu1_fixed_out <= ab_sin_nu1_fixed;
	ab_cos_nu1_fixed_out <= ab_cos_nu1_fixed;

	L1_dist_internal_out <= L1_dist_internal;
	cos_nu1_pow2_out <= cos_nu1_pow2;

	min_nu_fixed_out <= min_nu_fixed;
	max_nu_fixed_out <= max_nu_fixed;
	latAccDem_part_1_out <= latAccDem_part_1;
	latAccDem_part_2_out <= latAccDem_part_2;

	sin_nu_out <= sin_nu;

	latAccDem_out <= latAccDem;

	nu_fixed_out <= nu_fixed;
	nu_float_out <= nu_float;
	last_nu_float_out <= last_nu_float;
	nav_bearing_float_out <= nav_bearing_float;

	--	-- prevent indecision s
	minus_nu_limit_out <= minus_nu_limit;
	nu_last_nu_prod_out <= nu_last_nu_prod;
end Behavioral;

