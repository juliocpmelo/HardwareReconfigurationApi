----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:17 04/30/2013 
-- Design Name: 
-- Module Name:    VideoProcessing - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VideoProcessing is
port (
		pixelClock : in std_logic;
		pixelDataIn_r : in std_logic_vector(7 downto 0);
		pixelDataIn_g : in std_logic_vector(7 downto 0);
		pixelDataIn_b : in std_logic_vector(7 downto 0);
		pixelDataOut_r : out std_logic_vector(7 downto 0);
		pixelDataOut_g : out std_logic_vector(7 downto 0);
		pixelDataOut_b : out std_logic_vector(7 downto 0)
);
end VideoProcessing;

architecture Behavioral of VideoProcessing is

begin
	pixelDataIn_r <= pixelDataOut_r;
	pixelDataIn_g <= pixelDataOut_g;
	pixelDataIn_b <= pixelDataOut_b;
	

end Behavioral;

