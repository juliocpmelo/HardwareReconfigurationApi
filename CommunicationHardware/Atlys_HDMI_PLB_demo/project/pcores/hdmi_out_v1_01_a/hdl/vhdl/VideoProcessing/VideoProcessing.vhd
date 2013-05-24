----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:32 05/03/2013 
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
    Port ( videoData_in_r : in  STD_LOGIC_VECTOR(7 downto 0);
           videoData_in_g : in  STD_LOGIC_VECTOR(7 downto 0);
           videoData_in_b : in  STD_LOGIC_VECTOR(7 downto 0);
					 
					 videoData_switch : in std_logic; -- when 0 filterX is out, when 1 filterY is out
					
					 videoData_out_r : out  STD_LOGIC_VECTOR(7 downto 0);
           videoData_out_g : out  STD_LOGIC_VECTOR(7 downto 0);
           videoData_out_b : out  STD_LOGIC_VECTOR(7 downto 0);
					 
					 videoDataValid_out : out std_logic;
					 
					 hcount : in std_logic_vector(0 to 13); -- pixel position x
					 vcount : in std_logic_vector(0 to 13); -- pixel position y
					 active_video : in STD_LOGIC; -- high when valid video data is disponible in the inputs
					 pixelClock : in STD_LOGIC);
end VideoProcessing;

architecture Behavioral of VideoProcessing is
	
	signal filteredPixelXReg : std_logic_vector (23 downto 0);
	signal filteredPixelYReg : std_logic_vector (23 downto 0);
	signal videoDataXValid : std_logic;
	signal videoDataYValid : std_logic;
	
begin
	
	sobel_inst : entity work.sobel 
	port map
	(
		ap_clk => pixelClock,
		ap_rst => '0',
		ap_start => '1',
		ap_done => open,
		ap_idle => open,
		ap_ready => open,
		
		pixel => videoData_in_r & videoData_in_g & videoData_in_b,
		pixelColumnCount => "0000000000" & hcount,
		pixelLineCount => "0000000000" & vcount,
		filteredXPixel => filteredPixelXReg,
		filteredXPixel_ap_vld => videoDataXValid,
		filteredYPixel => filteredPixelYReg,
		filteredYPixel_ap_vld => videoDataYValid
		
	);
  
	videoDataValid_out <= videoDataXValid and videoDataYValid;
	
	videoData_out_r <= filteredPixelXReg (23 downto 16) when videoData_switch = '0' else x"00";
	videoData_out_g <= filteredPixelXReg (15 downto 8) when videoData_switch = '0' else x"00";
	videoData_out_b <= filteredPixelXReg (7 downto 0) when videoData_switch = '0' else x"00";
	


end Behavioral;

