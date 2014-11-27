----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:24 09/15/2014 
-- Design Name: 
-- Module Name:    fixed_point_comparator - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.TypeDeclarations.all;

entity fixed_point_comparator is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
			  operation : in fixed_point_compare_operation_t;
           result : out STD_LOGIC
			);
end fixed_point_comparator;



architecture Behavioral of fixed_point_comparator is

	
begin
	
	compare : process (a,b,operation)
	begin
		result <= '0';
		case (operation) is
			when fixed_point_compare_gt =>
				if( signed(a) > signed(b) ) then
					result <= '1';
				end if;
			when fixed_point_compare_gte =>
				if( signed(a) >= signed(b) ) then
					result <= '1';
				end if;
			when fixed_point_compare_lt =>
				if( signed(a) < signed(b) ) then
					result <= '1';
				end if;
			when fixed_point_compare_lte =>
				if( signed(a) <= signed(b) ) then
					result <= '1';
				end if;
		end case;
	end process;

end Behavioral;

