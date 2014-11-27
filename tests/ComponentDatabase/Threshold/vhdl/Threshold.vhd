
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

entity Threshold_wrapper is
	Port(
		clk : IN STD_LOGIC;

		pixel : IN STD_LOGIC_VECTOR (23 downto 0);
		mode : IN STD_LOGIC_VECTOR (1 downto 0);
		thresholdTable_pos : in std_logic_vector ( 23 downto 0);
		
		ap_start : IN STD_LOGIC;
		ap_done : OUT STD_LOGIC;
		ap_idle : OUT STD_LOGIC;
		ap_ready : OUT STD_LOGIC;
		
		output : out std_logic_vector (23 downto 0)
	);
		
end Threshold_wrapper;

architecture Behavioral of Threshold_wrapper is
	
	signal filteredPixelX_Sig : std_logic_vector (23 downto 0);
	signal filteredPixelY_Sig : std_logic_vector (23 downto 0);
	signal pixelOut_Sig : std_logic_vector (23 downto 0);
	signal pixel_Sig : std_logic_vector (23 downto 0);
	signal thresholdTable_pos_Sig : std_logic_vector (23 downto 0);
	signal mode_Sig : std_logic_vector (7 downto 0);
	signal outputValid_Sig : std_logic;
	signal videoDataXValid_Sig : std_logic;
	
	component threshold
	port(
		ap_clk : IN STD_LOGIC;
		ap_rst : in std_logic;
		ap_start : IN STD_LOGIC;
		ap_done  : out STD_LOGIC;
		ap_idle : out STD_LOGIC;
		ap_ready : out STD_LOGIC;
		mode : IN STD_LOGIC_vector (7 downto 0);
		thresholdTable_pos : in STD_LOGIC_vector (23 downto 0); 
		pixel : IN std_logic_vector(23 downto 0);
		out_r : out std_logic_vector(23 downto 0);
		out_r_ap_vld : out STD_LOGIC
	);
	end component threshold;
	
	
begin
	
	threshold_inst : threshold 
	port map
	(
		ap_clk => clk,
		ap_rst => '0',
		ap_start => ap_start,
		ap_done => ap_done,
		ap_idle => ap_idle,
		ap_ready => ap_ready,
		
		mode => mode_Sig,
		pixel => pixel_Sig,
		thresholdTable_pos => thresholdTable_pos_Sig,
		out_r => pixelOut_Sig,
		out_r_ap_vld => outputValid_Sig
	);
  

	output_Process : process (clk)
	begin
		if (rising_edge(clk)) then
			if outputValid_Sig = '1' then
				output <= pixelOut_Sig;
			end if;
		end if;
	end process output_Process;
	
	
	
	input_Process : process (clk)
	begin
		if (rising_edge(clk)) then
			mode_Sig <= b"000000" & mode;
			pixel_Sig <= pixel;
			thresholdTable_pos_Sig <= thresholdTable_pos;
		end if;
	end process input_Process;
	
end Behavioral;
	


