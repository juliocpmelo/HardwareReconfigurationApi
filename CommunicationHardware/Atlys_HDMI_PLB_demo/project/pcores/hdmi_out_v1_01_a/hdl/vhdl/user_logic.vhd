------------------------------------------------------------------------------
-- user_logic.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          user_logic.vhd
-- Version:           1.01.a
-- Description:       User logic.
-- Date:              Mon Apr 29 10:59:50 2013 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.all;

-- DO NOT EDIT ABOVE THIS LINE --------------------

--USER libraries added here

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--   C_NUM_REG                    -- Number of software accessible registers
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Reset                 -- Bus to IP reset
--   Bus2IP_Data                  -- Bus to IP data bus
--   Bus2IP_BE                    -- Bus to IP byte enables
--   Bus2IP_RdCE                  -- Bus to IP read chip enable
--   Bus2IP_WrCE                  -- Bus to IP write chip enable
--   IP2Bus_Data                  -- IP to Bus data bus
--   IP2Bus_RdAck                 -- IP to Bus read transfer acknowledgement
--   IP2Bus_WrAck                 -- IP to Bus write transfer acknowledgement
--   IP2Bus_Error                 -- IP to Bus error response
------------------------------------------------------------------------------

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    --USER generics added here
		RESOLUTION_SELECT              : integer := 1;
    -- ADD USER GENERICS ABOVE THIS LINE ---------------
		
    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_SLV_DWIDTH                   : integer              := 32;
    C_NUM_REG                      : integer              := 10
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
    --USER ports added here
		
		PXLCLK_I : in std_logic;
		PXLCLK_2X_I : in std_logic;
		PXLCLK_10X_I : in std_logic;
		LOCKED_I : in std_logic;
		FILTER_PIXEL_CLOCK : in std_logic;
		
		-- HDMI ports
		TMDS : out std_logic_vector(3 downto 0);
		TMDSB : out std_logic_vector(3 downto 0);
		-- VFBC Cmd Ports
		VFBC_CMD_CLK : out std_logic;
		VFBC_CMD_IDLE : in std_logic;
		VFBC_CMD_RESET : out std_logic;
		VFBC_CMD_DATA : out std_logic_vector (31 downto 0);
		VFBC_CMD_WRITE : out std_logic;
		VFBC_CMD_END : out std_logic;
		VFBC_CMD_FULL : in std_logic;
		VFBC_CMD_ALMOST_FULL : in std_logic;
		-- VFBC Read Ports
		VFBC_RD_CLK : out std_logic;
		VFBC_RD_RESET : out std_logic;
		VFBC_RD_FLUSH : out std_logic;
		VFBC_RD_READ : out std_logic;
		VFBC_RD_END_BURST : out std_logic;
		VFBC_RD_DATA : in std_logic_vector (15 downto 0);
		VFBC_RD_EMPTY : in std_logic;
		VFBC_RD_ALMOST_EMPTY : in std_logic;

    -- ADD USER PORTS ABOVE THIS LINE ------------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
    Bus2IP_Clk                     : in  std_logic;
    Bus2IP_Reset                   : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(0 to C_SLV_DWIDTH-1);
    Bus2IP_BE                      : in  std_logic_vector(0 to C_SLV_DWIDTH/8-1);
    Bus2IP_RdCE                    : in  std_logic_vector(0 to C_NUM_REG-1);
    Bus2IP_WrCE                    : in  std_logic_vector(0 to C_NUM_REG-1);
    IP2Bus_Data                    : out std_logic_vector(0 to C_SLV_DWIDTH-1);
    IP2Bus_RdAck                   : out std_logic;
    IP2Bus_WrAck                   : out std_logic;
    IP2Bus_Error                   : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;

  attribute SIGIS of Bus2IP_Clk    : signal is "CLK";
  attribute SIGIS of Bus2IP_Reset  : signal is "RST";
	
	-- user attributes
	
	attribute SIGIS of PXLCLK_I    : signal is "CLK";
	attribute SIGIS of PXLCLK_2X_I    : signal is "CLK";
	attribute SIGIS of PXLCLK_10X_I    : signal is "CLK";


end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

  --USER signal declarations added here, as needed for user logic

	signal lineStrideSig 									: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal frameBaseAddrSig 									: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal linebuffer_x_accessSig							: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal linebuffer_y_accessSig 									: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal linebuffer_pixel_inSig 									: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal linebuffer_pixel_outSig 									: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	
	signal filter_control_outsSig : std_logic_vector(6 downto 0);
	
	signal debugOut1: std_logic_vector(C_SLV_DWIDTH-1 downto 0);
	signal debugOut2 : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  ------------------------------------------
  -- Signals for user logic slave model s/w accessible register example
  ------------------------------------------
  signal slv_reg0                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg1                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg2                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg3                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg4                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg5                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg6                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg7                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg8                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg9                       : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_reg_write_sel              : std_logic_vector(0 to 9);
  signal slv_reg_read_sel               : std_logic_vector(0 to 9);
  signal slv_ip2bus_data                : std_logic_vector(0 to C_SLV_DWIDTH-1);
  signal slv_read_ack                   : std_logic;
  signal slv_write_ack                  : std_logic;

begin

  --USER logic implementation added here
	
	hdmi_out_inst : entity work.hdmi_out_v1 
	generic map(
		RESOLUTION_SELECT => RESOLUTION_SELECT
	)
	port map(
		FRAME_BASE_ADDR => frameBaseAddrSig,
		LINE_STRIDE => lineStrideSig (23 downto 0),
		OPTION_VALUES => slv_reg2( (C_SLV_DWIDTH - 1)-5 to C_SLV_DWIDTH-1),
		FILTER_CONTROL_OUTS => filter_control_outsSig,
		
		linebuffer_x_access						 => linebuffer_x_accessSig, --slave_reg3,
		linebuffer_y_access						 => linebuffer_y_accessSig, --slave_reg4,
		linebuffer_pixel_in						 => linebuffer_pixel_inSig, --slave_reg5,

		linebuffer_pixel_out				   => linebuffer_pixel_outSig, --slave_reg6,

		PXLCLK_I => PXLCLK_I,
		PXLCLK_2X_I => PXLCLK_2X_I,
		PXLCLK_10X_I => PXLCLK_10X_I,
		FILTER_PIXEL_CLOCK => FILTER_PIXEL_CLOCK,
		LOCKED_I => LOCKED_I,
		-- HDMI ports
		TMDS => TMDS,
		TMDSB => TMDSB,
		-- VFBC Cmd Ports
		VFBC_CMD_CLK => VFBC_CMD_CLK,
		VFBC_CMD_IDLE => VFBC_CMD_IDLE,
		VFBC_CMD_RESET => VFBC_CMD_RESET,
		VFBC_CMD_DATA => VFBC_CMD_DATA,
		VFBC_CMD_WRITE => VFBC_CMD_WRITE,
		VFBC_CMD_END => VFBC_CMD_END,
		VFBC_CMD_FULL => VFBC_CMD_FULL,
		VFBC_CMD_ALMOST_FULL => VFBC_CMD_FULL,
		-- VFBC Read Ports
		VFBC_RD_CLK => VFBC_RD_CLK,
		VFBC_RD_RESET => VFBC_RD_RESET,
		VFBC_RD_FLUSH => VFBC_RD_FLUSH,
		VFBC_RD_READ => VFBC_RD_READ,
		VFBC_RD_END_BURST => VFBC_RD_END_BURST,
		VFBC_RD_DATA => VFBC_RD_DATA,
		VFBC_RD_EMPTY => VFBC_RD_EMPTY,
		VFBC_RD_ALMOST_EMPTY => VFBC_RD_ALMOST_EMPTY
	);
	
	-- endianess convertion
	GEN_ASSIGNMENT : for byte_index in 0 to C_SLV_DWIDTH-1 generate 
		frameBaseAddrSig(C_SLV_DWIDTH - byte_index - 1) <= slv_reg0(byte_index);
		lineStrideSig(C_SLV_DWIDTH - byte_index - 1) <= slv_reg1(byte_index);
		
		linebuffer_x_accessSig(C_SLV_DWIDTH - byte_index - 1) <= slv_reg3(byte_index);
		linebuffer_y_accessSig(C_SLV_DWIDTH - byte_index - 1) <= slv_reg4(byte_index);
		linebuffer_pixel_inSig(C_SLV_DWIDTH - byte_index - 1) <= slv_reg5(byte_index);
	end generate GEN_ASSIGNMENT;

  ------------------------------------------
  -- Example code to read/write user logic slave model s/w accessible registers
  -- 
  -- Note:
  -- The example code presented here is to show you one way of reading/writing
  -- software accessible registers implemented in the user logic slave model.
  -- Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  -- to one software accessible register by the top level template. For example,
  -- if you have four 32 bit software accessible registers in the user logic,
  -- you are basically operating on the following memory mapped registers:
  -- 
  --    Bus2IP_WrCE/Bus2IP_RdCE   Memory Mapped Register
  --                     "1000"   C_BASEADDR + 0x0
  --                     "0100"   C_BASEADDR + 0x4
  --                     "0010"   C_BASEADDR + 0x8
  --                     "0001"   C_BASEADDR + 0xC
  -- 
  ------------------------------------------
  slv_reg_write_sel <= Bus2IP_WrCE(0 to 9);
  slv_reg_read_sel  <= Bus2IP_RdCE(0 to 9);
  slv_write_ack     <= Bus2IP_WrCE(0) or Bus2IP_WrCE(1) or Bus2IP_WrCE(2) or Bus2IP_WrCE(3) or Bus2IP_WrCE(4) or Bus2IP_WrCE(5) or Bus2IP_WrCE(6) or Bus2IP_WrCE(7) or Bus2IP_WrCE(8) or Bus2IP_WrCE(9);
  slv_read_ack      <= Bus2IP_RdCE(0) or Bus2IP_RdCE(1) or Bus2IP_RdCE(2) or Bus2IP_RdCE(3) or Bus2IP_RdCE(4) or Bus2IP_RdCE(5) or Bus2IP_RdCE(6) or Bus2IP_RdCE(7) or Bus2IP_RdCE(8) or Bus2IP_RdCE(9);

  -- implement slave model software accessible register(s)
  SLAVE_REG_WRITE_PROC : process( Bus2IP_Clk ) is
  begin

    if Bus2IP_Clk'event and Bus2IP_Clk = '1' then
      if Bus2IP_Reset = '1' then
        slv_reg0 <= (others => '0');
        slv_reg1 <= (others => '0');
        slv_reg2 <= (others => '0');
        slv_reg3 <= (others => '0');
        slv_reg4 <= (others => '0');
        slv_reg5 <= (others => '0');
        slv_reg6 <= (others => '0');
        slv_reg7 <= (others => '0');
        slv_reg8 <= (others => '0');
        slv_reg9 <= (others => '0');
      else
        case slv_reg_write_sel is
          when "1000000000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg0(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0100000000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg1(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0010000000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg2(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0001000000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg3(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000100000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg4(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000010000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg5(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000001000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg6(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000000100" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg7(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000000010" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg8(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000000001" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                slv_reg9(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when others => null;
        end case;
      end if;
    end if;

  end process SLAVE_REG_WRITE_PROC;

	--debugOut1 <= x"00000001" when (lineStrideSig = x"000800") else x"00000000";
	--debugOut2 <= x"00000001" when (frameBaseAddrSig = x"49000000") else x"00000000";
  -- implement slave model software accessible register(s) read mux
  SLAVE_REG_READ_PROC : process( slv_reg_read_sel, slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9 ) is
  begin

    case slv_reg_read_sel is
      when "1000000000" => slv_ip2bus_data <= slv_reg0;
      when "0100000000" => slv_ip2bus_data <= slv_reg1;
      when "0010000000" => slv_ip2bus_data <= x"0000" & b"000" & filter_control_outsSig & slv_reg2((C_SLV_DWIDTH - 1)-5 to C_SLV_DWIDTH-1); -- option values 0x04
      when "0001000000" => slv_ip2bus_data <= slv_reg3; -- linebuffer_x_accessSig 0x0C
      when "0000100000" => slv_ip2bus_data <= slv_reg4; -- linebuffer_y_accessSig 0x10
      when "0000010000" => slv_ip2bus_data <= slv_reg5; -- linebuffer_pixel_inSig 0x14
      when "0000001000" => slv_ip2bus_data <= linebuffer_pixel_outSig; -- linebuffer_pixel_outSig 0x18
      when "0000000100" => slv_ip2bus_data <= slv_reg7;
      when "0000000010" => slv_ip2bus_data <= slv_reg8;
      when "0000000001" => slv_ip2bus_data <= slv_reg9;
      when others => slv_ip2bus_data <= (others => '0');
    end case;

  end process SLAVE_REG_READ_PROC;

  ------------------------------------------
  -- Example code to drive IP to Bus signals
  ------------------------------------------
  IP2Bus_Data  <= slv_ip2bus_data when slv_read_ack = '1' else
                  (others => '0');

  IP2Bus_WrAck <= slv_write_ack;
  IP2Bus_RdAck <= slv_read_ack;
  IP2Bus_Error <= '0';

end IMP;
