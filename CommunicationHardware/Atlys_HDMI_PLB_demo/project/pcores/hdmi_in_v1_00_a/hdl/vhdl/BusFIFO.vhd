----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:24 10/24/2011 
-- Design Name: 
-- Module Name:    BusFIFO - Behavioral 
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

entity BusFIFO is
    Port ( BusClk : in  STD_LOGIC;
           UserClk : in  STD_LOGIC;
           async_rst : in  STD_LOGIC;
           bus_wr_en : in  STD_LOGIC;
           bus_wr_d : in  STD_LOGIC_VECTOR (0 to 42);
           bus_rd_d : out  STD_LOGIC_VECTOR (0 to 31);
           bus_rd_en : in  STD_LOGIC;
           bus_rd_empty : out  STD_LOGIC;
           user_wr_en : in  STD_LOGIC;
           user_wr_d : in  STD_LOGIC_VECTOR (31 downto 0);
           user_rd_d : out  STD_LOGIC_VECTOR (42 downto 0);
           user_rd_en : in  STD_LOGIC;
           user_rd_empty : out  STD_LOGIC);
end BusFIFO;

architecture Behavioral of BusFIFO is

COMPONENT Bus2UserFIFO
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(42 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(42 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT User2BusFIFO
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;



begin

inst_Bus2UserFIFO : Bus2UserFIFO
  PORT MAP (
    rst => async_rst,
    wr_clk => BusClk,
    rd_clk => UserClk,
    din => bus_wr_d,
    wr_en => bus_wr_en,
    rd_en => user_rd_en,
    dout => user_rd_d,
    full => open,
    empty => user_rd_empty
  );
  
inst_User2BusFIFO : User2BusFIFO
  PORT MAP (
    rst => async_rst,
    wr_clk => UserClk,
    rd_clk => BusClk,
    din => user_wr_d,
    wr_en => user_wr_en,
    rd_en => bus_rd_en,
    dout => bus_rd_d,
    full => open,
    empty => bus_rd_empty
  );
 
end Behavioral;

