--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package TypeDeclarations is
	
	type mux_nav_bearing_op_t is
	(
		mux_eval_wpa_xtrackVel,
		mux_eval_wpa_ltrackVel,
		mux_eval_wpa_nu,
		mux_eval_wpa_nav_bearing,
		
		mux_eval_ab_xtrackVel,
		mux_eval_ab_ltrackVel,
		mux_eval_ab_nu2,
		mux_eval_ab_xtrackErr,
		mux_eval_ab_L1_dist ,
		mux_eval_ab_sin_nu1,
		mux_eval_ab_constraint_nu1_p1,
		mux_eval_ab_constraint_nu1_p2,
		mux_eval_ab_cos_nu1_p1,
		mux_eval_ab_cos_nu1_p2,
		mux_eval_ab_nu1,
		mux_eval_ab_nu,
		mux_eval_ab_nav_bearing,

		
		mux_eval_nu_constrained_p1,
		mux_eval_nu_constrained_p2,
		mux_eval_latAccDem_p1,
		mux_eval_latAccDem_p2,
		mux_eval_latAccDem_p3,
		
		--prevent indecicision
		mux_eval_prevent_indecision_p1,
		mux_eval_prevent_indecision_p2,
		mux_eval_prevent_indecision_p3,
		mux_eval_prevent_indecision_p4,
		mux_eval_prevent_indecision_p5,
		mux_eval_prevent_indecision_p6
	);
	
	
	type store_nav_bearing_op_t is
	(
		
		
		--local operations to wpa
		store_op_store_wpa_nu,
		store_op_store_wpa_nav_bearing,

		
		--local operations to ab
		store_op_store_ab_nu2,
		store_op_store_ab_xtrackErr,
		store_op_store_ab_L1_dist,
		store_op_store_ab_sin_nu1,
		store_op_store_ab_sin_nu1_constrained_p1,
		store_op_store_ab_sin_nu1_constrained_p2,
		store_op_store_ab_cos_nu1_p1,
		store_op_store_ab_cos_nu1_p2,
		store_op_store_ab_nu1,
		store_op_store_ab_nu,
		store_op_store_ab_nav_bearing,
		
		--global components
		store_op_store_xtrackVel,
		store_op_store_ltrackVel,
		store_op_store_nu_constrained_p1,
		store_op_store_nu_constrained_p2,
		store_op_store_latAccDem_part1,
		store_op_store_latAccDem_part2,
		store_op_store_latAccDem,
		
		--prevent indecision
		store_op_store_prevent_indecision_p1,
		store_op_store_prevent_indecision_p2,
		store_op_store_prevent_indecision_p3,
		store_op_store_prevent_indecision_p4,
		store_op_store_prevent_indecision_p5,
		store_op_store_prevent_indecision_p6,
		
		store_op_nop
		
	);
	type fixed_point_compare_operation_t is
	(
			fixed_point_compare_gt,
			fixed_point_compare_gte,
			fixed_point_compare_lt,
			fixed_point_compare_lte
	);
	
	type fixed_adder_op_t is
	(
		fixed_adder_op_add,
		fixed_adder_op_sub
	);

-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end TypeDeclarations;

package body TypeDeclarations is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end TypeDeclarations;
