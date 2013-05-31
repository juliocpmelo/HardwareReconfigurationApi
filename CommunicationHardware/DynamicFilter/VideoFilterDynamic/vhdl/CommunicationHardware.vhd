----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:14 05/24/2013 
-- Design Name: 
-- Module Name:    CommunicationHardware - Behavioral 
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

-- this entity is supposed to be a wrapper of any hardware component and the software
-- system. It uses a serial interface communication
entity CommunicationHardware is
generic (
	communicationBussInput_width : integer:= 32;
	communicationBussOutput_width : integer:= 32;
	communicationAddress_width : integer:= 32
);
port (
	clk : in std_logic;
	mode : in std_logic;  -- 0 to read 1 to write
	registerAddress : in std_logic_vector(communicationAddress_width-1 downto 0); -- register address to be written / read
	registerInValue : in std_logic_vector(communicationBussInput_width-1 downto 0); --- register value to be used in write mode
	registerOutValue: out std_logic_vector(communicationBussOutput_width-1 downto 0) -- register output to be used in read mode
);

end CommunicationHardware;

architecture Behavioral of CommunicationHardware is
	
	signal reg0 : std_logic_vector ( 23 downto 0 ); -- r/w
	signal reg1 : std_logic_vector ( 23 downto 0 ); -- r/w
	signal reg2 : std_logic_vector ( 23 downto 0 ); -- r/w
	signal reg3 : std_logic_vector ( 1 downto 0 ); -- r/w
	signal reg4 : std_logic; --r/w
	signal reg5 : std_logic; --r
	signal reg6 : std_logic; --r
	signal reg7 : std_logic; --r
	signal reg8 : std_logic_vector ( 23 downto 0 ); -- r/w
	signal reg9 : std_logic_vector ( 23 downto 0 ); -- r/w
	
begin

	sobel_wrapper_inst : entity work.SobelWrapper
	port map (
		clk => clk,
		
		pixel => reg0,
		x => reg1,
		y => reg2,
		--columnCounter => slv_reg1(23 downto 0),
		--lineCounter => slv_reg2(23 downto 0),
		
		mode => reg3,
		ap_start => reg4,
		ap_done => reg5,
		ap_idle => reg6,
		ap_ready => reg7,
		
		filteredPixelX => reg8,
		filteredPixelY => reg9
	);
	
	readProcess: process (clk)
	begin
		if rising_edge(clk) and mode = '0' then
			if registerAddress = x"00000000" then
				registerOutValue <= x"00" & reg0;
			elsif registerAddress = x"00000001" then
				registerOutValue <= x"00" & reg1;
			elsif registerAddress = x"00000002" then
				registerOutValue <= x"00" & reg2;
			elsif registerAddress = x"00000003" then
				registerOutValue <= x"0000000" & b"00" & reg3;
			elsif registerAddress = x"00000004" then
				registerOutValue <= x"0000000" & b"000" & reg4;
			elsif registerAddress = x"00000005" then
				registerOutValue <= x"0000000" & b"000" & reg5;
			elsif registerAddress = x"00000006" then
				registerOutValue <= x"0000000" & b"000" & reg6;
			elsif registerAddress = x"00000007" then
				registerOutValue <= x"0000000" & b"000" & reg7;
			elsif registerAddress = x"00000008" then
				registerOutValue <= x"00" & reg8;
			elsif registerAddress = x"00000009" then
				registerOutValue <= x"00" & reg9;
			end if;
		end if;
	end process readProcess;
	
	writeProcess: process (clk)
	begin
		if rising_edge(clk) and mode = '1' then
			if registerAddress = x"00000000" then
				reg0 <= registerInValue(23 downto 0);
			elsif registerAddress = x"00000001" then
				reg1 <= registerInValue(23 downto 0);
			elsif registerAddress = x"00000002" then
				reg2 <= registerInValue(23 downto 0);
			elsif registerAddress = x"00000003" then
				reg3 <= registerInValue(1 downto 0);
			elsif registerAddress = x"00000004" then
				reg4 <= registerInValue(0);
			end if;
		end if;
	end process writeProcess;
	

end Behavioral;

