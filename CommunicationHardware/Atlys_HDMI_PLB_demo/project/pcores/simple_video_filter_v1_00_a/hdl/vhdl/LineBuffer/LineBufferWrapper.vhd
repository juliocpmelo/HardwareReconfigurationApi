----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:30:25 05/08/2013 
-- Design Name: 
-- Module Name:    LineBuffer - Behavioral 
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

entity LineBuffer_wrapper is
port (
    clk : IN STD_LOGIC;
    x : IN STD_LOGIC_VECTOR (23 downto 0);
    y : IN STD_LOGIC_VECTOR (23 downto 0);
		--columnCounter : IN STD_LOGIC_VECTOR (23 downto 0);
		--lineCounter : IN STD_LOGIC_VECTOR (23 downto 0);
    pixel : IN STD_LOGIC_VECTOR (23 downto 0);
    param : IN STD_LOGIC_VECTOR (1 downto 0);
		
		ap_start : IN STD_LOGIC;
		ap_done : OUT STD_LOGIC;
		ap_idle : OUT STD_LOGIC;
		ap_ready : OUT STD_LOGIC;
		
    outputPixel : OUT STD_LOGIC_VECTOR (23 downto 0)
		);
end LineBuffer_wrapper;

architecture Behavioral of LineBuffer_wrapper is
	signal lineBuffer_out_sig : std_logic_vector(23 downto 0);
	signal lineBuffer_x_access : std_logic_vector(23 downto 0);
	signal lineBuffer_y_access : std_logic_vector(23 downto 0);
	
	signal output_valid : std_logic;
	signal paramSig : STD_LOGIC_VECTOR (1 downto 0);
	signal pixelSig : std_logic_vector(23 downto 0);
	signal count : integer range 0 to 5;
begin


	lineBuffer_inst : entity work.lineBuffer
	port map(
		ap_clk => clk,
		ap_rst => '0',
		ap_start => ap_start,
		ap_done => ap_done,
		ap_idle => ap_idle,
		ap_ready => ap_ready,
		
		x => lineBuffer_x_access,
		y => lineBuffer_y_access,
		pixel => pixelSig,
		param => "000000" & paramSig,
		
		output_r => lineBuffer_out_sig,
    output_r_ap_vld => output_valid
	);
	
	LineBuffer_outProcesses : process (clk)
	begin
		if (rising_edge(clk)) then
			if output_valid = '1' then
				outputPixel <= lineBuffer_out_sig;
			end if;
		end if;
	end process LineBuffer_outProcesses;
	
	
	
	LineBuffer_inProcesses: process (clk)
	begin
		if (rising_edge(clk)) then
			if param = "10" or param = "01" then -- direct access or direct store
				lineBuffer_x_access <= x;
				lineBuffer_y_access <= y;
				paramSig <= param;
				pixelSig <= pixel;
			else
				lineBuffer_x_access <= x"000000";
				lineBuffer_y_access <= x"000000";
				paramSig <= "10";
				pixelSig <= x"000000";
			end if;
			
		end if;
	end process LineBuffer_inProcesses;
	
end Behavioral;

