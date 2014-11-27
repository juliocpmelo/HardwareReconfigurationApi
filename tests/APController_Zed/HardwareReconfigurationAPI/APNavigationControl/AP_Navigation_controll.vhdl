----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:11 08/15/2014 
-- Design Name: 
-- Module Name:    AP_Navigation_controll - behavior 
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
USE ieee.numeric_std.ALL;
library ieee_proposed;
use ieee_proposed.float_pkg.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AP_Navigation_controll is
port (
	nu : out std_logic_vector(31 downto 0);
	last_nu : out std_logic_vector(31 downto 0);
	lateral_acceleration_dem : out  std_logic_vector(31 downto 0);
	bearing_error : out  std_logic_vector(31 downto 0);
	nav_bearing : out  std_logic_vector(31 downto 0);

	clk : in std_logic;
	gsVectorX : in std_logic_vector(31 downto 0);
	gsVectorY : in std_logic_vector(31 downto 0);
	airUnitVectorX : in std_logic_vector(31 downto 0);
	airUnitVectorY : in std_logic_vector(31 downto 0);
	ABVectorX : in std_logic_vector(31 downto 0);
	ABVectorY : in std_logic_vector(31 downto 0);
	groundspeed : in std_logic_vector(31 downto 0);
	K_L1 : in std_logic_vector(31 downto 0);
	
	L1_dist : in std_logic_vector(31 downto 0);
	L1_dist_min : in std_logic_vector(31 downto 0);
	sin_nu1_max : in std_logic_vector(31 downto 0);
	sin_nu1_min : in std_logic_vector(31 downto 0);
	nu_limit : in std_logic_vector(31 downto 0);
	
	max_nu : in std_logic_vector(31 downto 0);
	min_nu : in std_logic_vector(31 downto 0);
	
	nav_bearing_cd_condition : in std_logic;
	wpa_reference : in std_logic
	
);
end AP_Navigation_controll;

architecture behavior of AP_Navigation_controll is
	component cordic --evaluates atan(arc)
	port(
		x_in: in std_logic_vector(31 downto 0);
		y_in: in std_logic_vector(31 downto 0);
		phase_out: out std_logic_vector(31 downto 0);
		
		sclr : in std_logic;
		rdy : out std_logic;
		clk : in std_logic
	);
	end component cordic;
	--cordic specific signals
	signal cordic_x : std_logic_vector(31 downto 0);
	signal cordic_y : std_logic_vector(31 downto 0);
	signal cordic_result : std_logic_vector(31 downto 0);
	signal cordic_clear : std_logic;
	signal cordic_rdy : std_logic;

	component cordic_sincos 
	port (
		phase_in : in std_logic_vector (31 downto 0);
		x_out: out std_logic_vector(31 downto 0);
		y_out: out std_logic_vector(31 downto 0);
		
		sclr : in std_logic;
		rdy : out std_logic;
		clk : in std_logic
	);
	end component cordic_sincos;
	--cordic sincos specific signals
	signal cordic_sincos_x : std_logic_vector(31 downto 0);
	signal cordic_sincos_y : std_logic_vector(31 downto 0);
	signal cordic_sincos_phase_in : std_logic_vector(31 downto 0);
	signal cordic_sincos_clear : std_logic;
	signal cordic_sincos_rdy : std_logic;
	
	component Float_to_Fixed
	port(
		a : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
		
		operation_nd : in std_logic;
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Float_to_Fixed;
	-- signals for float to fixed
	signal float_to_fixed_a : std_logic_vector(31 downto 0);
	signal float_to_fixed_result : std_logic_vector(31 downto 0);
	signal float_to_fixed_rdy : std_logic;
	signal float_to_fixed_enable : std_logic;
	signal float_to_fixed_clear : std_logic;
	
	component Fixed_to_Float
	port(
		a : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
		
		operation_nd : in std_logic;
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Fixed_to_Float;
	-- signals for fixed to float
	signal fixed_to_float_a : std_logic_vector(31 downto 0);
	signal fixed_to_float_result : std_logic_vector(31 downto 0);
	signal fixed_to_float_rdy : std_logic;
	signal fixed_to_float_enable : std_logic;
	signal fixed_to_float_clear : std_logic;
	
	
	component Float_Divider
	port(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
		
		operation_nd : in std_logic;
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Float_Divider;
	--signals for float divider
	signal float_divider_a : std_logic_vector(31 downto 0);
	signal float_divider_b : std_logic_vector(31 downto 0);
	signal float_divider_result : std_logic_vector(31 downto 0);
	signal float_divider_rdy : std_logic;
	signal float_divider_enable : std_logic;
	signal float_divider_clear : std_logic;
	
	component Float_Compare
	port(
		a : in std_logic_vector(31 downto 0);
		b : in std_logic_vector(31 downto 0);
		operation : in std_logic_vector (5 downto 0);
		clk : in std_logic;
		result : out std_logic_vector (0 downto 0);
		
		operation_nd : in std_logic;
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Float_Compare;
	-- float compare signals
	signal float_comp_a : std_logic_vector(31 downto 0);
	signal float_comp_b : std_logic_vector(31 downto 0);
	signal float_comp_op : std_logic_vector(5 downto 0);
	signal float_comp_result : std_logic;
	signal float_comp_rdy : std_logic;
	signal float_comp_enable : std_logic;
	signal float_comp_clear : std_logic;
	
	component Float_Sqrt
	port(
		a : in std_logic_vector(31 downto 0);
		clk : in std_logic;
		result : out std_logic_vector(31 downto 0);
		
		operation_nd : in std_logic;
		sclr : in std_logic;
		rdy : out std_logic -- high when processing is done
	);
	end component Float_Sqrt;
	-- float sqrt signals
	signal float_sqrt_a : std_logic_vector(31 downto 0);
	signal float_sqrt_result : std_logic_vector(31 downto 0);
	signal float_sqrt_rdy : std_logic;
	signal float_sqrt_enable : std_logic;
	signal float_sqrt_clear : std_logic;
	
	component Fixed_Point_Comparator is
   port ( 
		a : in  std_logic_vector (31 downto 0);
		b : in  std_logic_vector (31 downto 0);
		operation : in fixed_point_compare_operation_t;
		result : out std_logic
	);
	end component Fixed_Point_Comparator;
	-- fixed point comparator signals
	signal fixed_point_comp_a : std_logic_vector (31 downto 0);
	signal fixed_point_comp_b : std_logic_vector (31 downto 0);
	signal fixed_point_comp_op : fixed_point_compare_operation_t;
	signal fixed_point_comp_result : std_logic;
	
	component Fixed_Adder is
   port ( 
		a : in  std_logic_vector (31 downto 0);
		b : in  std_logic_vector (31 downto 0);
		operation : fixed_adder_op_t;
		result : out  std_logic_vector (31 downto 0)
	);
	end component Fixed_Adder;
	signal fixed_adder_a : std_logic_vector (31 downto 0);
	signal fixed_adder_b : std_logic_vector (31 downto 0);
	signal fixed_adder_op : fixed_adder_op_t;
	signal fixed_adder_result : std_logic_vector (31 downto 0);
	
	--internal signals
	signal vector1X_sig : std_logic_vector(31 downto 0);
	signal vector1Y_sig : std_logic_vector(31 downto 0);
	signal vector2X_sig : std_logic_vector(31 downto 0);
	signal vector2Y_sig : std_logic_vector(31 downto 0);
	signal operationResultX_sig : std_logic_vector(31 downto 0);
	signal operationResultY_sig : std_logic_vector(31 downto 0);
	signal vec_operationsResult_p1_sig : std_logic_vector(31 downto 0);
	signal vec_operationsResult_p2_sig : std_logic_vector(31 downto 0);
	
	signal vec_operation_sig : vector_op_t;
	signal vec_operation_enable_sig : std_logic;
	signal vec_operation_ready_sig : std_logic;
	signal vec_operation_clear_sig : std_logic;
	
	signal mux_operation_sig : mux_nav_bearing_op_t ;
	signal store_op_sig : store_nav_bearing_op_t;

	signal xTrackVel_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal lTrackVel_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core

	signal ABVectorX_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal ABVectorY_fixed : std_logic_vector(31 downto 0); --(1QN-2) sfixed format due to cordic core

	signal ab_nu1 : std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal ab_nu2 : std_logic_vector (31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal xTrackErr : std_logic_vector (31 downto 0);
	signal ab_sin_nu1 : std_logic_vector (31 downto 0);
	signal ab_sin_nu1_fixed : std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core
	signal ab_cos_nu1_fixed : std_logic_vector (31 downto 0); --(1QN-2) sfixed format due to cordic core

	signal L1_dist_internal : std_logic_vector (31 downto 0); --max(L1_dist, 0.1f)
	signal cos_nu1_pow2 : std_logic_vector (31 downto 0);

	signal min_nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal max_nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal latAccDem_part_1 : std_logic_vector(31 downto 0);
	signal latAccDem_part_2 : std_logic_vector(31 downto 0);

	signal sin_nu : std_logic_vector(31 downto 0);

	signal latAccDem : std_logic_vector (31 downto 0);

	signal nu_fixed : std_logic_vector(31 downto 0); --2q(N-3) sfixed format due to cordic core
	signal nu_float : std_logic_vector(31 downto 0);
	signal last_nu_float : std_logic_vector(31 downto 0);
	signal nav_bearing_float : std_logic_vector (31 downto 0);

--	-- prevent indecision signals
	signal minus_nu_limit : std_logic_vector(31 downto 0); --float
	signal nu_last_nu_prod : std_logic_vector(31 downto 0); --float
	
begin
	
	vec2DOperations : entity work.Vector2DOperations
	port map(
			  
		clk => clk,

		vector1X => vector1X_sig,
		vector1Y => vector1Y_sig,
		
		vector2X => vector2X_sig,
		vector2Y => vector2Y_sig,
		
		resultX => operationResultX_sig,
		resultY => operationResultY_sig,
		
		result_p1 => vec_operationsResult_p1_sig,
		result_p2 => vec_operationsResult_p2_sig,

		operation => vec_operation_sig, 
		
		enable => vec_operation_enable_sig,
		ready => vec_operation_ready_sig,
		clear => vec_operation_clear_sig
	);
	
	L1_Guidance_WP_inst : entity work.L1_Guidance_WP
	port map(
		clk => clk,
		mux_op_cmd =>  mux_operation_sig,
		store_op => store_op_sig,
		
		vec_operation_enable =>  vec_operation_enable_sig,
		vec_operation_ready => vec_operation_ready_sig,
		vec_operation_clear => vec_operation_clear_sig,
		
		cordic_clear => cordic_clear,
		cordic_ready => cordic_rdy,
		
		cordic_sincos_clear => cordic_sincos_clear,
		cordic_sincos_ready => cordic_sincos_rdy,
		
		float_to_fixed_enable => float_to_fixed_enable,
		float_to_fixed_rdy => float_to_fixed_rdy,
		float_to_fixed_clear => float_to_fixed_clear,
		
		fixed_to_float_enable => fixed_to_float_enable,
		fixed_to_float_rdy => fixed_to_float_rdy,
		fixed_to_float_clear => fixed_to_float_clear,
		
		float_divider_rdy => float_divider_rdy,
		float_divider_clear => float_divider_clear,
		float_divider_enable => float_divider_enable,
		
		float_compare_rdy => float_comp_rdy,
		float_compare_clear => float_comp_clear,
		float_compare_enable => float_comp_enable,
		
		float_sqrt_enable => float_sqrt_enable,
		float_sqrt_rdy => float_sqrt_rdy,
		float_sqrt_clear => float_sqrt_clear,
		
		wpa_reference => wpa_reference --enable the L1 using WPA as reference
	);
	
	cordic_inst : cordic 
	port map(
		clk => clk,
		
		x_in => cordic_x ,
		y_in => cordic_y ,
		phase_out => cordic_result,
		
		sclr => cordic_clear,
		rdy => cordic_rdy
	);
	
	cordic_sincos_inst : cordic_sincos
	port map(
		clk => clk,
		phase_in => cordic_sincos_phase_in,
		x_out => cordic_sincos_x,
		y_out => cordic_sincos_y,
		
		sclr => cordic_sincos_clear,
		rdy => cordic_sincos_rdy
	);
	
	float_to_fixed_inst : Float_to_Fixed
	port map(
		clk => clk,
		
		a => float_to_fixed_a,
		result => float_to_fixed_result,
		
		operation_nd => float_to_fixed_enable,
		rdy => float_to_fixed_rdy,
		sclr => float_to_fixed_clear
	);
	
	fixed_to_float_inst : Fixed_to_Float
	port map(
		clk => clk,
		
		a => fixed_to_float_a,
		result => fixed_to_float_result,
		
		operation_nd => fixed_to_float_enable,
		rdy => fixed_to_float_rdy,
		sclr => fixed_to_float_clear
	);
	
	float_sqrt_inst : Float_Sqrt
	port map(
		clk => clk,
		
		a => float_sqrt_a,
		result => float_sqrt_result,
		
		operation_nd => float_sqrt_enable,
		rdy => float_sqrt_rdy,
		sclr => float_sqrt_clear
	);
	
	
	float_divider_inst : Float_Divider
	port map(
		clk => clk,
		
		a => float_divider_a,
		b => float_divider_b,
		result => float_divider_result,
		
		operation_nd => float_divider_enable,
		rdy => float_divider_rdy,
		sclr => float_divider_clear
	);
	
	
	float_compare_inst : Float_Compare
	port map(
		clk => clk,
		
		a => float_comp_a,
		b => float_comp_b,
		result(0) => float_comp_result,
		operation => float_comp_op,
		
		operation_nd => float_comp_enable,
		rdy => float_comp_rdy,
		sclr => float_comp_clear
		
	);
	
	fixed_point_compartor_inst : Fixed_Point_Comparator
	port map(
		a => fixed_point_comp_a,
		b => fixed_point_comp_b,
		operation => fixed_point_comp_op,
		result => fixed_point_comp_result
	);
	
	fixed_adder_inst : Fixed_Adder
	port map (
		a => fixed_adder_a,
		b => fixed_adder_b,
		operation => fixed_adder_op,
		result => fixed_adder_result
	);
	
	operation_mux_inst : entity work.operation_mux
	port map (
		mux_operation => mux_operation_sig,
	
		-- used inputs
		gsVectorX => gsVectorX,
		gsVectorY => gsVectorY,
		airUnitVectorX => airUnitVectorX,
		airUnitVectorY => airUnitVectorY,
		max_nu => max_nu,
		min_nu => min_nu,
		ABVectorX => ABVectorX,
		ABVectorY => ABVectorY,
		
		nu_limit => nu_limit,
		groundspeed => groundspeed,
		K_L1 => K_L1,
		
		sin_nu1_max => sin_nu1_max,
		sin_nu1_min => sin_nu1_min,
		
		L1_dist => L1_dist,
		L1_dist_min => L1_dist_min,
	
		-- used registers

		xTrackVel_fixed => xTrackVel_fixed,
		lTrackVel_fixed => lTrackVel_fixed,

		ABVectorX_fixed => ABVectorX_fixed,
		ABVectorY_fixed => ABVectorY_fixed,
--
		ab_nu1 => ab_nu1,
		ab_nu2 => ab_nu2,
		xTrackErr => xTrackErr,
		ab_sin_nu1 => ab_sin_nu1,
		ab_sin_nu1_fixed => ab_sin_nu1_fixed,
		ab_cos_nu1_fixed => ab_cos_nu1_fixed,
--
		L1_dist_internal => L1_dist_internal,
		cos_nu1_pow2 => cos_nu1_pow2,

		min_nu_fixed => min_nu_fixed,
		max_nu_fixed => max_nu_fixed,
		latAccDem_part_1 => latAccDem_part_1,
		latAccDem_part_2 => latAccDem_part_2,
--
		sin_nu => sin_nu,
--
		latAccDem => latAccDem,
--
		nu_fixed => nu_fixed,
		nu_float => nu_float,
		last_nu_float => last_nu_float,
		nav_bearing_float => nav_bearing_float,
--
		minus_nu_limit => minus_nu_limit,
		nu_last_nu_prod => nu_last_nu_prod,
	
		
-- opearands/results from the operation blocs
		vector1X => vector1X_sig,
		vector1Y => vector1Y_sig,
		vector2X => vector2X_sig,
		vector2Y => vector2Y_sig,
		vec_operation => vec_operation_sig,
		operationResultX => operationResultX_sig,
		vec_operationsresult_p1 => vec_operationsresult_p1_sig,

		cordic_x => cordic_x,
		cordic_y => cordic_y,
		cordic_result => cordic_result,

		cordic_sincos_phase_in => cordic_sincos_phase_in,
		cordic_sincos_y => cordic_sincos_y,
		cordic_sincos_x => cordic_sincos_x,

		float_comp_a => float_comp_a,
		float_comp_b => float_comp_b,
		float_comp_op => float_comp_op,
		
		float_divider_a => float_divider_a,
		float_divider_b => float_divider_b,
		float_divider_result => float_divider_result,
		
		float_to_fixed_a  => float_to_fixed_a,
		
		fixed_to_float_a => fixed_to_float_a,
		
		fixed_point_comp_a => fixed_point_comp_a,
		fixed_point_comp_b => fixed_point_comp_b,
		fixed_point_comp_op  => fixed_point_comp_op,
		
		fixed_adder_a => fixed_adder_a,
		fixed_adder_b => fixed_adder_b,
		fixed_adder_op => fixed_adder_op,
		fixed_adder_result => fixed_adder_result,
		
		float_sqrt_a => float_sqrt_a,
		float_sqrt_result => float_sqrt_result 
	);
	
	results_storage_inst : entity work.results_storage
	port map(
		clk => clk,
		store_op => store_op_sig,
		
		--input parameters
		l1_dist => l1_dist,
		l1_dist_min => l1_dist_min,
		sin_nu1_max => sin_nu1_max,
		sin_nu1_min => sin_nu1_max,
		min_nu => min_nu,
		max_nu => max_nu,
		nav_bearing_cd_condition => nav_bearing_cd_condition,
		
		-- operation outputs
		operationResultX_sig => operationResultX_sig,
		operationResultY_sig => operationResultY_sig,
		vec_operationsresult_p1_sig => vec_operationsresult_p1_sig,
		vec_operationsresult_p2_sig => vec_operationsresult_p2_sig,
		
		cordic_result => cordic_result,
		
		float_to_fixed_result =>float_to_fixed_result,
		float_divider_result =>float_divider_result,
		float_sqrt_result =>float_sqrt_result,
		float_comp_result =>float_comp_result,
		
		fixed_to_float_result => fixed_to_float_result,
		fixed_adder_result => fixed_adder_result,
		fixed_point_comp_result => fixed_point_comp_result,
		
		-- outputs used by the mux
		xTrackVel_fixed_out => xTrackVel_fixed,
		lTrackVel_fixed_out => lTrackVel_fixed,

		ABVectorX_fixed_out => ABVectorX_fixed,
		ABVectorY_fixed_out => ABVectorY_fixed,
--
		ab_nu1_out => ab_nu1,
		ab_nu2_out => ab_nu2,
		xTrackErr_out => xTrackErr,
		ab_sin_nu1_out => ab_sin_nu1,
		ab_sin_nu1_fixed_out => ab_sin_nu1_fixed,
		ab_cos_nu1_fixed_out => ab_cos_nu1_fixed,
--
		L1_dist_internal_out => L1_dist_internal,
		cos_nu1_pow2_out => cos_nu1_pow2,

		min_nu_fixed_out => min_nu_fixed,
		max_nu_fixed_out => max_nu_fixed,
		latAccDem_part_1_out => latAccDem_part_1,
		latAccDem_part_2_out => latAccDem_part_2,
--
		sin_nu_out => sin_nu,
--
		latAccDem_out => latAccDem,
--
		nu_fixed_out => nu_fixed,
		nu_float_out => nu_float,
		last_nu_float_out => last_nu_float,
		nav_bearing_float_out => nav_bearing_float,
--
		minus_nu_limit_out => minus_nu_limit,
		nu_last_nu_prod_out => nu_last_nu_prod
	);
	
	bearing_error <= nu_float;
	nu <= nu_float;
	last_nu <= last_nu_float;
	lateral_acceleration_dem <= latAccDem;
	nav_bearing <= nav_bearing_float;
	
	
end behavior;

