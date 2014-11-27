----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:50 09/17/2014 
-- Design Name: 
-- Module Name:    fixed_adder - Behavioral 
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fixed_adder is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
			  operation : fixed_adder_op_t;
			  result : out  STD_LOGIC_VECTOR (31 downto 0)
			);

end fixed_adder;

architecture Behavioral of fixed_adder is

begin

	add_process : process(a, b, operation)
	begin
		case (operation) is
			when fixed_adder_op_add =>
				result <= std_logic_vector(signed(a) + signed(b));
			when fixed_adder_op_sub =>
				result <= std_logic_vector(signed(a) - signed(b));
		end case;
	end process add_process;
end Behavioral;
