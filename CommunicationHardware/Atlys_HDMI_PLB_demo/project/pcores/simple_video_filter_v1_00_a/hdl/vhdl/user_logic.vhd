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
-- Version:           1.00.a
-- Description:       User logic.
-- Date:              Fri Apr 26 16:21:56 2013 (by Create and Import Peripheral Wizard)
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
		FRAME_BASE_ADDR                : std_logic_vector(31 downto 0)     := x"00000000";
		LINE_STRIDE                    : std_logic_vector(23 downto 0)     := x"000000";
		
		
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
		
		-- VFBC Cmd Ports
--    VFBC_CMD_CLK : out std_logic;
--    VFBC_CMD_IDLE : in std_logic;
--    VFBC_CMD_RESET : out std_logic;
--    VFBC_CMD_DATA : out std_logic_vector (31 downto 0);
--    VFBC_CMD_WRITE : out std_logic;
--    VFBC_CMD_END : out std_logic;
--    VFBC_CMD_FULL : in std_logic;
--    VFBC_CMD_ALMOST_FULL : in std_logic;
--    -- VFBC Read Ports
--    VFBC_RD_CLK : out std_logic;
--    VFBC_RD_RESET : out std_logic;
--    VFBC_RD_FLUSH : out std_logic;
--    VFBC_RD_READ : out std_logic;
--    VFBC_RD_END_BURST : out std_logic;
--    VFBC_RD_DATA : in std_logic_vector (15 downto 0);
--    VFBC_RD_EMPTY : in std_logic;
--    VFBC_RD_ALMOST_EMPTY : in std_logic;
		-- VFBC Write Signals, not used in this version
--	  VFBC_WD_CLK : out std_logic;
--	  VFBC_WD_RESET : out std_logic;
--	  VFBC_WD_FLUSH : out std_logic;
--	  VFBC_WD_WRITE : out std_logic;
--	  VFBC_WD_DATA : out std_logic_vector (15 downto 0);
--	  VFBC_WD_DATA_BE : out std_logic_vector (1 downto 0);
--	  VFBC_WD_END_BURST : out std_logic;
--	  VFBC_WD_FULL : in std_logic;
--	  VFBC_WD_ALMOST_FULL : in std_logic;
		
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

end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

  --USER signal declarations added here, as needed for user logic
	
	signal FRAME_READ_BASE_ADDR : std_logic_vector(31 downto 0)     := x"00000000";
	signal FRAME_WRITE_BASE_ADDR : std_logic_vector(31 downto 0)     := x"00000000";
--	signal LINE_STRIDE     : std_logic_vector(23 downto 0)     := x"000000";
	signal loadDefaultValues : std_logic_vector(31 downto 0)     := x"00000000";
	-- Constants
	
	constant default_base_addres : std_logic_vector(31 downto 0) := x"49000000";
  constant vfbc_cmd1_default : std_logic_vector(31 downto 0) := "0" & default_base_addres(30 downto 7) & "0000000"; --Frame base address must be 128 byte alligned and MSB used as WNR
	constant default_line_stride : std_logic_vector(23 downto 0) := x"000800";
  constant vfbc_cmd3_default : std_logic_vector(31 downto 0) := "0000000" & default_line_stride(23 downto 7) & x"00";  --The line stride must be 128 byte alligned and be in bytes (2x input)
	
	constant videoMaxColumn : integer := 680; -- 640 + 20 pixel clock offset in the beginning, + 20 pixel clock offset in the end
	constant videoColumnBlankBegin : integer := 20;
	constant videoColumnBlankEnd : integer := 640 + 20;
	
	
	constant videoMaxLines : integer := 520; -- 480 + 20 pixel clock offset in the beginning, + 20 pixel clock offset in the end
	constant videoLineBlankBegin : integer := 20;
	constant videoLineBlankEnd : integer := 640 + 20;
	
	constant RES_640_480 : integer := 1;
  constant RES_800_600 : integer := 2; --Currently not supported; need support for non-128 byte alligned widths
  constant RES_1280_720 : integer := 3;
	
	-- Signals
	
	signal vfbc_cmd0_r : std_logic_vector(31 downto 0);
	signal vfbc_cmd1_r : std_logic_vector(31 downto 0);
  signal vfbc_cmd2_r : std_logic_vector(31 downto 0);
	signal vfbc_cmd3_r : std_logic_vector(31 downto 0);
	
	signal vfbc_cmd0_w : std_logic_vector(31 downto 0);
	signal vfbc_cmd1_w : std_logic_vector(31 downto 0);
  signal vfbc_cmd2_w : std_logic_vector(31 downto 0);
	signal vfbc_cmd3_w : std_logic_vector(31 downto 0);
	
	signal frame_width     : std_logic_vector(31 downto 0) := (others => '0');
  signal frame_height    : std_logic_vector(31 downto 0) := (others => '0');
	
	signal pxlclk : std_logic;
  signal pxlclk_2x : std_logic;
	
	signal lineCount : std_logic_vector(15 downto 0);
	signal columCount : std_logic_vector(15 downto 0);
	
	signal enabled : std_logic := '1';
	
	signal lineBlank : std_logic;
	signal columnBlank : std_logic;
	signal active_video_i : std_logic;
	
	signal vfbc_cmd_data_i : std_logic_vector(31 downto 0);
  signal vfbc_cmd_write_i : std_logic; 
  signal vfbc_rd_reset_i : std_logic;
	
	signal user_controlOuts : std_logic_vector(0 to C_SLV_DWIDTH - 1);
	

  ------------------------------------------
  -- Signals for user logic slave model s/w accessible register example
  ------------------------------------------
  signal slv_reg0                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- pixel value
  signal slv_reg1                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- x access
  signal slv_reg2                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- y access
  signal slv_reg3                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- options
  signal slv_reg4                       : std_logic_vector(0 to C_SLV_DWIDTH-1); -- pixel out
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
	
	
	
--	user_controlOuts ((C_SLV_DWIDTH - 1) - 3 ) <= '1' when slv_reg1((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1) /= x"000000" else '0';
--	user_controlOuts ((C_SLV_DWIDTH - 1) - 4 ) <= '1' when slv_reg2((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1) /= x"000000" else '0';
--	
--	line_buffer_wrapper_inst : entity work.LineBuffer_wrapper
--	port map (
--		clk => PXLCLK_2X_I,
--		
--		pixel => slv_reg0((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1),
--		x => slv_reg1((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1),
--    y => slv_reg2((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1),
--		--columnCounter => slv_reg1(23 downto 0),
--		--lineCounter => slv_reg2(23 downto 0),
--		
--
--    param => slv_reg3((C_SLV_DWIDTH-1)-1 to C_SLV_DWIDTH-1),
--		ap_start => slv_reg3((C_SLV_DWIDTH-1)-2),
--		ap_done => user_controlOuts(C_SLV_DWIDTH-1),
--		ap_idle => user_controlOuts((C_SLV_DWIDTH-1) - 1),
--		ap_ready => user_controlOuts((C_SLV_DWIDTH-1) - 2),
--		
--    outputPixel => slv_reg4 ((C_SLV_DWIDTH -1) - 23 to C_SLV_DWIDTH -1)
--		
--	);
	
	

	user_controlOuts ((C_SLV_DWIDTH - 1) - 3 ) <= '1' when slv_reg1((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1) /= x"000000" else '0';
	user_controlOuts ((C_SLV_DWIDTH - 1) - 4 ) <= '1' when slv_reg2((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1) /= x"000000" else '0';
	sobel_wrapper_inst : entity work.SobelWrapper
	port map (
		clk => PXLCLK_2X_I,
		
		pixel => slv_reg0((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1),
		x => slv_reg1((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1),
    y => slv_reg2((C_SLV_DWIDTH-1)-23 to C_SLV_DWIDTH-1),
		--columnCounter => slv_reg1(23 downto 0),
		--lineCounter => slv_reg2(23 downto 0),
		

		mode => slv_reg3((C_SLV_DWIDTH-1)-1 to C_SLV_DWIDTH-1),
		ap_start => slv_reg3((C_SLV_DWIDTH-1)-2),
		ap_done => user_controlOuts(C_SLV_DWIDTH-1),
		ap_idle => user_controlOuts((C_SLV_DWIDTH-1) - 1),
		ap_ready => user_controlOuts((C_SLV_DWIDTH-1) - 2),
		
    filteredPixelX => slv_reg4 ((C_SLV_DWIDTH -1) - 23 to C_SLV_DWIDTH -1),
		filteredPixelY => slv_reg5 ((C_SLV_DWIDTH -1) - 23 to C_SLV_DWIDTH -1)
	);	
	
	
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
      -- slv_reg4 <= (others => '0');
      -- slv_reg5 <= (others => '0');
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
              if ( Bus2IP_BE(byte_index/8) = '1' ) then
								--FRAME_READ_BASE_ADDR(C_SLV_DWIDTH - byte_index - 1) <= Bus2IP_Data(byte_index);
                slv_reg1(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0010000000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index/8) = '1' ) then
								--LINE_STRIDE(C_SLV_DWIDTH - byte_index - 1) <= Bus2IP_Data(byte_index);
                slv_reg2(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0001000000" =>
             for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index/8) = '1' ) then
								--load_default_values(C_SLV_DWIDTH - byte_index - 1) <= Bus2IP_Data(byte_index);
                slv_reg3(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000100000" =>
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index/8) = '1' ) then -- out only
								--FRAME_WRITE_BASE_ADDR(C_SLV_DWIDTH - byte_index - 1) <= Bus2IP_Data(byte_index);
                --slv_reg4(byte_index*8 to byte_index*8+7) <= Bus2IP_Data(byte_index*8 to byte_index*8+7);
              end if;
            end loop;
          when "0000010000" =>
             for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index/8) = '1' ) then -- out only
                --slv_reg5(C_SLV_DWIDTH - byte_index - 1) <= Bus2IP_Data(byte_index);
              end if;
            end loop;
          when "0000001000" =>
             for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index/8) = '1' ) then
								slv_reg6(C_SLV_DWIDTH - byte_index - 1) <= Bus2IP_Data(byte_index);
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

  -- implement slave model software accessible register(s) read mux
  SLAVE_REG_READ_PROC : process( slv_reg_read_sel, slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9 ) is
  begin

    case slv_reg_read_sel is
      when "1000000000" => slv_ip2bus_data <= slv_reg0;
      when "0100000000" => slv_ip2bus_data <= slv_reg1;
      when "0010000000" => slv_ip2bus_data <= slv_reg2;
      when "0001000000" => slv_ip2bus_data <= x"000000" & user_controlOuts((C_SLV_DWIDTH-1)-4 to C_SLV_DWIDTH-1) & slv_reg3((C_SLV_DWIDTH-1)-2 to C_SLV_DWIDTH-1);
      when "0000100000" => slv_ip2bus_data <= slv_reg4;
      when "0000010000" => slv_ip2bus_data <= slv_reg5;
      when "0000001000" => slv_ip2bus_data <= slv_reg6;
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
