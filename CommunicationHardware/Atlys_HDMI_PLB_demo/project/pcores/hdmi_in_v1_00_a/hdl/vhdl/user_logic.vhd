----------------------------------------------------------------------------
--	user_logic.vhd -- Hdmi Input Core User Logic
----------------------------------------------------------------------------
-- Author:  Sam Bobrowicz
--          Referenced Work by Tinghui WANG (Steve)
--          Copyright 2011 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--
-- Description:
--   Stores data from TMDS lines into a framebuffer. The frame is accessed 
--   via a VFBC PIM on an MPMC core. The core can be controlled via a PLB
--   bus.
--
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  10/25/2011(SamB): Created for use with Xilinx EDK 13.2
----------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.            **
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
-- Date:              Sat Oct 22 04:21:31 2011 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
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
    -- ADD USER GENERICS ABOVE THIS LINE ---------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_SLV_DWIDTH                   : integer              := 32;
    C_NUM_REG                      : integer              := 6
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
    TMDS         : in std_logic_vector(3 downto 0);
    TMDSB        : in std_logic_vector(3 downto 0);
    
    -- VFBC Command Signals
	  VFBC_CMD_CLK : out std_logic;
	  VFBC_CMD_IDLE : in std_logic;
	  VFBC_CMD_RESET : out std_logic;
	  VFBC_CMD_DATA : out std_logic_vector (31 downto 0);
	  VFBC_CMD_WRITE : out std_logic;
	  VFBC_CMD_END : out std_logic;
	  VFBC_CMD_FULL : in std_logic;
	  VFBC_CMD_ALMOST_FULL : in std_logic;
	  -- VFBC Write Signals
	  VFBC_WD_CLK : out std_logic;
	  VFBC_WD_RESET : out std_logic;
	  VFBC_WD_FLUSH : out std_logic;
	  VFBC_WD_WRITE : out std_logic;
	  VFBC_WD_DATA : out std_logic_vector (15 downto 0);
	  VFBC_WD_DATA_BE : out std_logic_vector (1 downto 0);
	  VFBC_WD_END_BURST : out std_logic;
	  VFBC_WD_FULL : in std_logic;
	  VFBC_WD_ALMOST_FULL : in std_logic;
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


	COMPONENT dvi_decoder
	PORT(
		tmdsclk_p : IN std_logic;
		tmdsclk_n : IN std_logic;
		blue_p : IN std_logic;
		green_p : IN std_logic;
		red_p : IN std_logic;
		blue_n : IN std_logic;
		green_n : IN std_logic;
		red_n : IN std_logic;
		exrst : IN std_logic;          
		reset : OUT std_logic;
		pclk : OUT std_logic;
		hsync : OUT std_logic;
		vsync : OUT std_logic;
		de : OUT std_logic;
		red : OUT std_logic_vector(7 downto 0);
		green : OUT std_logic_vector(7 downto 0);
		blue : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
  
  COMPONENT BusFIFO
	PORT(
		BusClk : IN std_logic;
		UserClk : IN std_logic;
		async_rst : IN std_logic;
		bus_wr_en : IN std_logic;
		bus_wr_d : IN std_logic_vector(0 to 42);
		bus_rd_en : IN std_logic;
		user_wr_en : IN std_logic;
		user_wr_d : IN std_logic_vector(31 downto 0);
		user_rd_en : IN std_logic;          
		bus_rd_d : OUT std_logic_vector(0 to 31);
		bus_rd_empty : OUT std_logic;
		user_rd_d : OUT std_logic_vector(42 downto 0);
		user_rd_empty : OUT std_logic
		);
	END COMPONENT;
  
  type FRAME_STATE_TYPE is (FRAME_RST, FRAME_FIND_POL, FRAME_WAIT_VSYNC, FRAME_DETECT, FRAME_LOCKED, FRAME_WR_CMD, FRAME_WR_DATA);


  signal pll_locked_n  : std_logic;
  signal pll_reset       : std_logic;
  signal soft_reset      : std_logic := '0'; 
  
  signal pxlclk        : std_logic;
  
  signal hsync     : std_logic;
  signal vsync     : std_logic;
  signal de        : std_logic;
  
  signal red                         : std_logic_vector(7 downto 0);
  signal green                       : std_logic_vector(7 downto 0);
  signal blue                        : std_logic_vector(7 downto 0);
  
  signal frame_state     : FRAME_STATE_TYPE := FRAME_RST;
  signal writing_cmd     : std_logic;
  signal writing_frame   : std_logic;
  signal frame_is_locked    : std_logic;
  
  signal hsync_pol     : std_logic := '0';
  signal vsync_pol     : std_logic := '0';
  
  signal hsync_reg     : std_logic := '0';
  signal vsync_reg     : std_logic := '0';
  signal de_reg        : std_logic := '0';
 
  signal new_frame     : std_logic;
  signal line_end     : std_logic;
  
  signal line_cnt : std_logic_vector(15 downto 0) := (others => '0');
  signal pxl_cnt : std_logic_vector(15 downto 0) := (others => '0');
  
  signal write_en        : std_logic := '0';
  signal frame_width     : std_logic_vector(15 downto 0) := (others => '0');
  signal frame_height    : std_logic_vector(15 downto 0) := (others => '0');
  signal frame_base_addr : std_logic_vector(31 downto 0) := (others => '0');
  signal line_stride     : std_logic_vector(15 downto 0) := (others => '0');
  
  signal vfbc_cmd_cnt     : std_logic_vector(6 downto 0) := (others => '0');
  signal vfbc_cmd_data_i : std_logic_vector(31 downto 0) := (others => '0');
  signal vfbc_cmd_write_i : std_logic := '0';
  
  signal vfbc_cmd0 : std_logic_vector(31 downto 0);
  signal vfbc_cmd1 : std_logic_vector(31 downto 0);
  signal vfbc_cmd2 : std_logic_vector(31 downto 0);
  signal vfbc_cmd3 : std_logic_vector(31 downto 0);
  
  signal vfbc_wd_data_i : std_logic_vector(15 downto 0) := (others => '0');
  signal vfbc_wd_write_i : std_logic := '0';
  
  signal bus_wait_ack : std_logic := '0';
  signal fifo_bus_wr_en : std_logic;
  signal fifo_bus_wr_d : std_logic_vector(0 to 42);
  signal fifo_bus_rd_d : std_logic_vector(0 to 31);
  signal fifo_bus_rd_en : std_logic;
  signal fifo_bus_rd_empty : std_logic;
  signal fifo_user_wr_en : std_logic;
  signal fifo_user_wr_d : std_logic_vector(31 downto 0);
  signal fifo_user_rd_d : std_logic_vector(42 downto 0);
  signal fifo_user_rd_en : std_logic;
  signal fifo_user_rd_empty : std_logic;
  
  signal fifo_rst : std_logic;
  
  signal slv_reg_write_sel              : std_logic_vector(0 to 5);
  signal slv_reg_read_sel               : std_logic_vector(0 to 5);
  signal slv_read_cmd                   : std_logic;
  signal slv_write_cmd                  : std_logic;

begin

	Inst_dvi_decoder: dvi_decoder PORT MAP(
		tmdsclk_p => TMDS(3),
		tmdsclk_n => TMDSB(3),
		blue_p => TMDS(0),
		green_p => TMDS(1),
		red_p => TMDS(2),
		blue_n => TMDSB(0),
		green_n => TMDSB(1),
		red_n => TMDSB(2),
		exrst => pll_reset,
		reset => pll_locked_n,
		pclk => pxlclk,
		hsync => hsync,
		vsync => vsync,
		de => de,
		red => red, 
		green => green,
		blue => blue
	);
  --PLL can be reset by either the PLB bus or a software triggerable reset. Both of these signals
  --are synchronous to the bus clock and should be held stable high for at least an entire clock cycle
  --to trigger a reset
  pll_reset <= Bus2IP_Reset or soft_reset;
  
  --Generate the new_frame signal, which goes high when vsync becomes active,
  --and line_end, which goes high when date enable goes low. These pulse signals
  --only stay high for a single cycle
  signal_delay_proc : process (pxlclk)
  begin
    if (rising_edge(pxlclk)) then
      de_reg <= de;
      vsync_reg <= vsync;
    end if;
  end process signal_delay_proc;
  new_frame <= '1' when ((vsync_reg = not(vsync_pol)) and (vsync = vsync_pol)) else
               '0';
  line_end  <= '1' when ((de_reg = '1') and (de = '0'))else
               '0';
  
  
  
  --Next state logic for frame detect and write state machine
  next_state_proc : process (pxlclk, pll_locked_n)
  begin
  if (pll_locked_n = '1') then
    frame_state <= FRAME_RST;
  else
    if (rising_edge(pxlclk)) then
      case frame_state is 
      when FRAME_RST =>
        frame_state <= FRAME_FIND_POL;
      when FRAME_FIND_POL =>
        if (de = '1') then
          frame_state <= FRAME_WAIT_VSYNC;
        end if;
      when FRAME_WAIT_VSYNC =>
        if (new_frame = '1') then
          frame_state <= FRAME_DETECT;
        end if;
      when FRAME_DETECT =>
        if (new_frame = '1') then
          frame_state <= FRAME_LOCKED;
        end if;
      when FRAME_LOCKED =>
        if (write_en = '1') then
          frame_state <= FRAME_WR_CMD;
        end if;
      when FRAME_WR_CMD =>
        if (vfbc_cmd_cnt = 80) then
          frame_state <= FRAME_WR_DATA;
        end if;
      when FRAME_WR_DATA =>
        if (new_frame = '1') then
          if (write_en = '1') then
            frame_state <= FRAME_WR_CMD;
          else
            frame_state <= FRAME_LOCKED;
          end if;
        end if;
      when others=> --Should be unreachable
        frame_state <= FRAME_RST;
      end case;
    end if;
  end if;
  end process next_state_proc;
  
  writing_frame <= '1' when ((frame_state = FRAME_WR_CMD) or (frame_state = FRAME_WR_DATA)) else
                   '0';
  writing_cmd <= '1' when (frame_state = FRAME_WR_CMD) else
                 '0';                 
  frame_is_locked <= '1' when ((frame_state = FRAME_WR_CMD) or (frame_state = FRAME_WR_DATA) or (frame_state = FRAME_LOCKED)) else
                     '0';
                  
  find_sync_pol_proc : process (pxlclk)
  begin
    if (rising_edge(pxlclk)) then
      if (frame_state = FRAME_RST) then
        vsync_pol <= '0';
        hsync_pol <= '0';
      elsif (frame_state = FRAME_FIND_POL) then
        if (de = '1') then
          vsync_pol <= not(vsync);
          hsync_pol <= not(hsync);
        end if;
      end if;
    end if;
  end process find_sync_pol_proc;
    
  pxl_cnt_proc : process (pxlclk)
  begin
    if (rising_edge(pxlclk)) then
      if (frame_state = FRAME_DETECT) then
        if (de = '1') then
          pxl_cnt <= pxl_cnt + 1;
        elsif (line_end = '1') then
          pxl_cnt <= (others => '0');
          line_cnt <= line_cnt + 1; 
        end if;
      else
        pxl_cnt <= (others => '0');
        line_cnt <= (others => '0');
      end if;  
    end if;
  end process pxl_cnt_proc;
  
  store_frame_dim_proc : process (pxlclk)
  begin
    if (rising_edge(pxlclk)) then
      if (frame_state = FRAME_RST) then
        frame_width <= (others => '0');
        frame_height <= (others => '0');
      elsif (frame_state = FRAME_DETECT) then
        if (line_end = '1') then
          frame_width <= pxl_cnt;
        end if;
        if (new_frame = '1') then
          frame_height <= line_cnt - 1;
        end if;
      end if;  
    end if;
  end process store_frame_dim_proc;

  --------------------------------
  -- VFBC Command Logic
  --------------------------------

  VFBC_CMD_CLK <= pxlclk;
  VFBC_CMD_RESET <= '1' when (frame_state = FRAME_RST) else
						  '0'; -- reset at the very beginning
  VFBC_CMD_DATA <= vfbc_cmd_data_i;
  VFBC_CMD_WRITE <= vfbc_cmd_write_i;
  VFBC_CMD_END <= '0'; -- never ends
  
  --TODO: 128 byte allign (non 128 byte alligned widths, line strides and frame base addresses may cause problems
  -- Generate command according to registers, 2 bytes per pixel
  vfbc_cmd0 <= x"0000" & frame_width(14 downto 0) & '0';  
  vfbc_cmd1 <= '1' & frame_base_addr(30 downto 0);
  vfbc_cmd2 <= x"0000" & frame_height;
  vfbc_cmd3 <= x"0000" & line_stride(14 downto 0) & '0';

  -- Feed command into VFBC Cmd Port at the beginning of each frame
  VFBC_FEED_CMD_PROCESS: process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
		if (writing_cmd = '1') then
      if (vfbc_cmd_cnt = 75) then
        vfbc_cmd_data_i <= vfbc_cmd0;
        vfbc_cmd_write_i <= '1';
		  elsif (vfbc_cmd_cnt = 76) then
        vfbc_cmd_data_i <= vfbc_cmd1;
        vfbc_cmd_write_i <= '1';
		  elsif (vfbc_cmd_cnt = 77) then
        vfbc_cmd_data_i <= vfbc_cmd2;
        vfbc_cmd_write_i <= '1';
		  elsif (vfbc_cmd_cnt = 78) then
        vfbc_cmd_data_i <= vfbc_cmd3;
        vfbc_cmd_write_i <= '1';
      else
        vfbc_cmd_data_i <= (others => '0');
			  vfbc_cmd_write_i <= '0';
      end if;
		else
			vfbc_cmd_data_i <= (others=>'0');
			vfbc_cmd_write_i <= '0';
		end if;
	end if;
  end process VFBC_FEED_CMD_PROCESS;
  
  VFBC_CMD_CNT_PROCESS: process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
    if (frame_state = FRAME_WR_CMD) then
      vfbc_cmd_cnt <= vfbc_cmd_cnt + 1;
    else
      vfbc_cmd_cnt <= (others => '0');
    end if;
  end if;
  end process;
  
  --------------------------------
  -- VFBC Write Logic
  --------------------------------
  VFBC_WD_CLK <= pxlclk;
  VFBC_WD_RESET <= '1' when ((vfbc_cmd_cnt < 50) and  (writing_cmd = '1')) else
                   '0';
  VFBC_WD_FLUSH <= '0';
  VFBC_WD_WRITE <= vfbc_wd_write_i;
  VFBC_WD_DATA <= vfbc_wd_data_i;
  VFBC_WD_DATA_BE <= (others => '1');
  VFBC_WD_END_BURST <= '0';
  
  VFBC_WRITE_DATA_PROC : process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
		vfbc_wd_data_i <= green(4 downto 2) & red(7 downto 3) &  blue(7 downto 3) & green(7 downto 5);
		vfbc_wd_write_i <= de and writing_frame;
	end if;
  end process VFBC_WRITE_DATA_PROC;
  
  
-----------------------------------------------------------------------------
--- The following code responds to read and write register requests sent
--- from the Bus Clock domain over a FIFO. Requests are immediatly handled
--- and then acknowledged over a FIFO that operates in the opposite direction
-----------------------------------------------------------------------------

  REG_WRITE_PROC : process( pxlclk ) is
  begin

    if rising_edge(pxlclk) then
      if (frame_state = FRAME_RST) then
        write_en <= '0';
        line_stride <= (others => '0');
        frame_base_addr <= (others => '0');
      elsif ((fifo_user_rd_empty = '0') and (fifo_user_rd_d(10) = '1')) then  
      --perform the bus signaled register writes if a write on a writable register
      --is requested
        case (fifo_user_rd_d(5 downto 0)) is
          when "100000" => --Ctrl Reg
            if (fifo_user_rd_d(6) = '1') then --ensure the lower byte is enabled
              write_en <= fifo_user_rd_d(11);
            end if;
          when "000010" =>  --Line stride register
            for byte_index in 0 to 1 loop  --Macro for writing the if statements that ensure enabled bytes are written
              if ( fifo_user_rd_d(byte_index + 6) = '1' ) then
                line_stride(byte_index*8+7 downto byte_index*8) <= fifo_user_rd_d(byte_index*8+18 downto byte_index*8+11);
              end if;
            end loop;
          when "000001" =>  --Frame Base Address register
            for byte_index in 0 to 3 loop  --Macro for writing the if statements that ensure enabled bytes are written
              if ( fifo_user_rd_d(byte_index + 6) = '1' ) then
                frame_base_addr(byte_index*8+7 downto byte_index*8) <= fifo_user_rd_d(byte_index*8+18 downto byte_index*8+11);
              end if;
            end loop;
          when others => null;
        end case;
      end if;
    end if;

  end process REG_WRITE_PROC;
  
  --Read register Mux
  SLAVE_REG_READ_PROC : process( fifo_user_rd_d(5 downto 0), fifo_user_rd_d(10), write_en, frame_is_locked, pll_locked_n, frame_width, frame_height, line_stride, frame_base_addr ) is
  begin

    case (fifo_user_rd_d(10) & fifo_user_rd_d(5 downto 0)) is
      when "0100000" => fifo_user_wr_d <= "0000000000000000000000000000000" & write_en; --ctrl reg
      when "0010000" => fifo_user_wr_d <= "000000000000000000000000000000" & frame_is_locked & not(pll_locked_n); --status reg
      when "0001000" => fifo_user_wr_d <= "0000000000000000" & frame_width;
      when "0000100" => fifo_user_wr_d <= "0000000000000000" & frame_height;
      when "0000010" => fifo_user_wr_d <= "0000000000000000" & line_stride;
      when "0000001" => fifo_user_wr_d <= frame_base_addr;
      when others => fifo_user_wr_d <= (others => '0');
    end case;

  end process SLAVE_REG_READ_PROC;
  
  fifo_user_rd_en <= not(fifo_user_rd_empty); --clear data from FIFO right as it arrives
  fifo_user_wr_en <= not(fifo_user_rd_empty);
  


-------------------------------------------------------------------------
--- The following code sends read and write register requests
--- from the Bus domain to the User domain over a First-word fall thru 
--- FIFO. If PLL is not locked, then 0 is returned on the IPIC data bus
--- and the write or read is acknowledged. If the PLL is locked, register
--- values are recieved from the User domain over another FIFO.
-------------------------------------------------------------------------

  slv_reg_write_sel <= Bus2IP_WrCE(0 to 5);
  slv_reg_read_sel  <= Bus2IP_RdCE(0 to 5);
  slv_write_cmd     <= Bus2IP_WrCE(0) or Bus2IP_WrCE(1) or Bus2IP_WrCE(2) or Bus2IP_WrCE(3) or Bus2IP_WrCE(4) or Bus2IP_WrCE(5);
  slv_read_cmd      <= Bus2IP_RdCE(0) or Bus2IP_RdCE(1) or Bus2IP_RdCE(2) or Bus2IP_RdCE(3) or Bus2IP_RdCE(4) or Bus2IP_RdCE(5);

  --Data is concatenated with write_not_read, byte select, and register select signals before being sent
  --across the FIFO
  fifo_bus_wr_d(0 to 31) <= Bus2IP_Data;
  fifo_bus_wr_d(32) <= slv_write_cmd;
  fifo_bus_wr_d(33 to 36) <= Bus2IP_BE;
  fifo_bus_wr_d(37 to 42) <= slv_reg_write_sel or slv_reg_read_sel;
  
  --If PLL is not locked or a soft reset is triggered then no data is sent across the fifo.
  fifo_bus_wr_en <= '1' when ((slv_write_cmd = '1' or slv_read_cmd = '1') and pll_locked_n = '0' and bus_wait_ack = '0' and
                              not((slv_reg_write_sel = "100000" and Bus2IP_BE(3) = '1') and Bus2IP_Data(30) = '1')) else 
                    '0';
  fifo_bus_rd_en <= not(fifo_bus_rd_empty);
  IP2Bus_Data <= fifo_bus_rd_d  when (pll_locked_n = '0') else
                 (others => '0');
  IP2Bus_WrAck <= '1' when (bus_wait_ack = '1' and slv_write_cmd = '1' and (fifo_bus_rd_empty = '0' or pll_locked_n = '1' or soft_reset = '1')) else
                  '0';
  IP2Bus_RdAck <= '1' when (bus_wait_ack = '1' and slv_read_cmd = '1' and (fifo_bus_rd_empty = '0' or pll_locked_n = '1')) else
                  '0';
  IP2Bus_Error <= '0';
	
  Bus_acknowledge_ctrl_proc : process (Bus2IP_Clk) is
  begin
  if rising_edge(Bus2IP_Clk) then
    if (bus_wait_ack = '1' and (fifo_bus_rd_empty = '0' or pll_locked_n = '1' or soft_reset = '1')) then
      bus_wait_ack <= '0';
    elsif (bus_wait_ack = '0' and (slv_write_cmd = '1' or slv_read_cmd = '1')) then
      bus_wait_ack <= '1';
    end if;
  end if;
  end process Bus_acknowledge_ctrl_proc;
  
  soft_reset_proc : process (Bus2IP_Clk) is
  begin
  if rising_edge(Bus2IP_Clk) then
    if (slv_reg_write_sel = "100000" and Bus2IP_BE(3) = '1' and Bus2IP_Data(30) = '1') then
    --Trigger the PLL to do an async reset
      soft_reset <= '1';
    else
      soft_reset <= '0';
    end if;
  end if;
  end process;
      
----------------------------------------------------------------------
--- Dual FIFOs for crossing of PLB Clock domain and User Clock
--- domain 
----------------------------------------------------------------------

fifo_rst <= Bus2IP_Reset or pll_locked_n; --Asynchronous FIFO reset
  
  Inst_BusFIFO: BusFIFO PORT MAP(
		BusClk => Bus2IP_Clk,
		UserClk => pxlclk,
		async_rst => fifo_rst,
		bus_wr_en => fifo_bus_wr_en,
		bus_wr_d => fifo_bus_wr_d,
		bus_rd_d => fifo_bus_rd_d,
		bus_rd_en => fifo_bus_rd_en,
		bus_rd_empty => fifo_bus_rd_empty,
		user_wr_en => fifo_user_wr_en,
		user_wr_d => fifo_user_wr_d,
		user_rd_d => fifo_user_rd_d,
		user_rd_en => fifo_user_rd_en,
		user_rd_empty => fifo_user_rd_empty
	);
  
end IMP;
