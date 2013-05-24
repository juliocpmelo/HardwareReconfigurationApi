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

entity SobelWrapper is
	Port(
		clk : IN STD_LOGIC;
		x : IN STD_LOGIC_VECTOR (23 downto 0);
		y : IN STD_LOGIC_VECTOR (23 downto 0);
		--columnCounter : IN STD_LOGIC_VECTOR (23 downto 0);
		--lineCounter : IN STD_LOGIC_VECTOR (23 downto 0);
		pixel : IN STD_LOGIC_VECTOR (23 downto 0);
		mode : IN STD_LOGIC_VECTOR (1 downto 0);
		
		ap_start : IN STD_LOGIC;
		ap_done : OUT STD_LOGIC;
		ap_idle : OUT STD_LOGIC;
		ap_ready : OUT STD_LOGIC;
		
		filteredPixelX : OUT STD_LOGIC_VECTOR (23 downto 0);
		filteredPixelY : OUT STD_LOGIC_VECTOR (23 downto 0)
	);
		
end SobelWrapper;

architecture Behavioral of SobelWrapper is
	
	signal filteredPixelX_Sig : std_logic_vector (23 downto 0);
	signal filteredPixelY_Sig : std_logic_vector (23 downto 0);
	signal pixel_Sig : std_logic_vector (23 downto 0);
	signal x_Sig : std_logic_vector (23 downto 0);
	signal y_Sig : std_logic_vector (23 downto 0);
	signal mode_Sig : std_logic_vector (1 downto 0);
	signal videoDataYValid_Sig : std_logic;
	signal videoDataXValid_Sig : std_logic;
	
begin
	
	sobel_inst : entity work.sobel 
	port map
	(
		ap_clk => clk,
		ap_rst => '0',
		ap_start => ap_start,
		ap_done => ap_done,
		ap_idle => ap_idle,
		ap_ready => ap_ready,
		
		mode => x"000" & "00" & mode_Sig,
		pixel => pixel_Sig,
		pixelColumnCount => x_Sig,
		pixelLineCount => y_Sig,
		filteredXPixel => filteredPixelX_Sig,
		filteredXPixel_ap_vld => videoDataXValid_Sig,
		filteredYPixel => filteredPixelY_Sig,
		filteredYPixel_ap_vld => videoDataYValid_Sig
		
	);
  

	output_Process : process (clk)
	begin
		if (rising_edge(clk)) then
			if videoDataXValid_Sig = '1' and videoDataYValid_Sig = '1' then
				filteredPixelX <= filteredPixelX_Sig;
				filteredPixelY <= filteredPixelY_Sig;
			end if;
		end if;
	end process output_Process;
	
	
	
	input_Process : process (clk)
	begin
		if (rising_edge(clk)) then
			if mode = "10" or mode = "01" or mode = "00" then -- direct access or direct store
				x_Sig <= x;
				y_Sig <= y;
				mode_Sig <= mode;
				pixel_Sig <= pixel;
			else
				x_Sig <= x"000000";
				y_Sig <= x"000000";
				mode_Sig <= "00";
				pixel_Sig <= x"000000";
			end if;
			
		end if;
	end process input_Process;
	
end Behavioral;
	


