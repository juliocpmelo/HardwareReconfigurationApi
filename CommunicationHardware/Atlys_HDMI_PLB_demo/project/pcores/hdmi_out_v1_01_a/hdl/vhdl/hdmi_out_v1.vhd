
----------------------------------------------------------------------------
--	hdmi_out.vhd -- Hdmi Output Core
----------------------------------------------------------------------------
-- Author:  Sam Bobrowicz
--          Referenced Work by Tinghui WANG (Steve)
--          Copyright 2011 Digilent, Inc.
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
--
--Description:
--   Outputs data stored in a framebuffer using the TMDS standard. The frame
--   is accessed via a VFBC PIM on an MPMC core.
--
--Sync Signal Register Definitions:
--
--    0     hsr           hbpr                hfpr         htr
--    | Sync |--------------|-------------------|------------
--    |------|  Back Porch  |   active video    | Front Porch
--	 														
----------------------------------------------------------------------------
--
----------------------------------------------------------------------------
-- Revision History:
--  10/24/2011(SamB): Created for use with Xilinx EDK 13.2
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

entity hdmi_out_v1 is
generic
(
  RESOLUTION_SELECT              : integer := 1);
port
(
	FRAME_BASE_ADDR                : in std_logic_vector(31 downto 0)     := x"00000000";
  LINE_STRIDE                    : in std_logic_vector(23 downto 0)     := x"000000";
	OPTION_VALUES									 : in std_logic_vector(5 downto 0) ;
	FILTER_CONTROL_OUTS            : out std_logic_vector(6 downto 0) ;
	linebuffer_x_access						 : in std_logic_vector(31 downto 0) ;
	linebuffer_y_access						 : in std_logic_vector(31 downto 0) ;
	linebuffer_pixel_in						 : in std_logic_vector(31 downto 0) ;
	
	linebuffer_pixel_out				   : out std_logic_vector(31 downto 0) ;
	 
	PXLCLK_I : in std_logic;
	PXLCLK_2X_I : in std_logic;
	PXLCLK_10X_I : in std_logic;
	
	FILTER_PIXEL_CLOCK : in std_logic;
	
	LOCKED_I : in std_logic;
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
	VFBC_RD_ALMOST_EMPTY : in std_logic);


  attribute MAX_FANOUT : string;
  attribute SIGIS : string;
  
  attribute SIGIS of PXLCLK_I    : signal is "CLK";
  attribute SIGIS of PXLCLK_2X_I    : signal is "CLK";
  attribute SIGIS of PXLCLK_10X_I    : signal is "CLK";

end entity hdmi_out_v1;

architecture IMP of hdmi_out_v1 is
  
  COMPONENT dvi_out_native
  PORT(
		reset : IN std_logic;
		pll_lckd : IN std_logic;
		clkin : IN std_logic;
		clkx2in : IN std_logic;
		clkx10in : IN std_logic;
		blue_din : IN std_logic_vector(7 downto 0);
		green_din : IN std_logic_vector(7 downto 0);
		red_din : IN std_logic_vector(7 downto 0);
		hsync : IN std_logic;
		vsync : IN std_logic;
		de : IN std_logic;          
		TMDS : OUT std_logic_vector(3 downto 0);
		TMDSB : OUT std_logic_vector(3 downto 0)
		);
  END COMPONENT;
	
	
--  changed to configurable through software  
	constant default_base_addres : std_logic_vector(31 downto 0) := x"49000000";
  constant vfbc_cmd1_default : std_logic_vector(31 downto 0) := "0" & default_base_addres(30 downto 7) & "0000000"; --Frame base address must be 128 byte alligned and MSB used as WNR
	constant default_line_stride : std_logic_vector(23 downto 0) := x"000800";
  constant vfbc_cmd3_default : std_logic_vector(31 downto 0) := "0000000" & default_line_stride(23 downto 7) & x"00";  --The line stride must be 128 byte alligned and be in bytes (2x input)
  
  constant RES_640_480 : integer := 1;
  constant RES_800_600 : integer := 2; --Currently not supported; need support for non-128 byte alligned widths
  constant RES_1280_720 : integer := 3;

  signal vfbc_cmd0 : std_logic_vector(31 downto 0);
  signal vfbc_cmd2 : std_logic_vector(31 downto 0);
  
  signal htr : std_logic_vector(15 downto 0);
  signal vtr : std_logic_vector(15 downto 0);
  signal hsr : std_logic_vector(15 downto 0);
  signal vsr : std_logic_vector(15 downto 0);
  signal hfpr : std_logic_vector(15 downto 0);
  signal vfpr : std_logic_vector(15 downto 0);
  signal hbpr : std_logic_vector(15 downto 0);
  signal vbpr : std_logic_vector(15 downto 0);
	
	signal columnLimit : std_logic_vector(15 downto 0);
	signal lineLimit : std_logic_vector(15 downto 0);
	signal lineCounter : std_logic_vector(15 downto 0);
	signal columnCounter : std_logic_vector(15 downto 0);
  
  signal polarity : std_logic;
  
  signal pxlclk : std_logic;
  signal pxlclk_2x : std_logic;
  
  signal enabled : std_logic := '1';
  
  signal vfbc_cmd_data_i : std_logic_vector(31 downto 0);
  signal vfbc_cmd_write_i : std_logic; 
  signal vfbc_rd_reset_i : std_logic;
  
  signal hcnt : std_logic_vector(0 to 13) := (others => '0');
  signal vcnt : std_logic_vector(0 to 13) := (others => '0');
  
  signal hsync_i : std_logic;
  signal vsync_i : std_logic;
  signal hsync_d1 : std_logic;
  signal vsync_d1 : std_logic;
  signal hsync_d2 : std_logic;
  signal vsync_d2 : std_logic;
  signal hblank_i : std_logic;
  signal vblank_i : std_logic;
  signal active_video_i : std_logic;
  signal video_data_i : std_logic_vector(23 downto 0);
	signal video_data_processed_i : std_logic_vector(23 downto 0);
  signal active_video_d1 : std_logic;
  signal active_video_d2 : std_logic;
  signal video_data_d1 : std_logic_vector(23 downto 0);
  
	-- julio
	signal videoProcessedData_dataValid : std_logic;
	signal ap_idleSignal : std_logic;
	signal linebuffer_pixel_inSig : std_logic_vector (23 downto 0);
	
begin

with RESOLUTION_SELECT select 
htr <= 	x"0320"  when RES_640_480,  --800
			x"0420"  when RES_800_600,  --1056
			x"0672"  when RES_1280_720, --1650
			x"0320"  when others;
			
with RESOLUTION_SELECT select 
hsr <= 	x"0060"  when RES_640_480,  --96
			x"0080"  when RES_800_600,  --128
			x"0028"  when RES_1280_720, --40
			x"0060"  when others;
						
with RESOLUTION_SELECT select 
hfpr <= 	x"0318"  when RES_640_480,  --792
			x"03F8"  when RES_800_600,  --1016
			x"0604"  when RES_1280_720, --1540
			x"0318"  when others;
			
with RESOLUTION_SELECT select 
hbpr <= 	x"0098"  when RES_640_480,  --152
			x"00D8"  when RES_800_600,  --216
			x"0104"  when RES_1280_720, --260
			x"0098"  when others;
			
with RESOLUTION_SELECT select 
columnLimit <= 	x"0280"  when RES_640_480,
								x"0320"  when RES_800_600,
								x"0500"  when RES_1280_720,
								x"0000"  	when others;

with RESOLUTION_SELECT select 
vtr <= 	x"020D"  when RES_640_480,  --525
			x"0274"  when RES_800_600,  --628
			x"02EE"  when RES_1280_720, --750
			x"020D"  when others;
			
with RESOLUTION_SELECT select 
vsr <= 	x"0002"  when RES_640_480,  --2
			x"0004"  when RES_800_600,  --4
			x"0005"  when RES_1280_720, --5
			x"0002"  when others;
						
with RESOLUTION_SELECT select 
vfpr <= 	x"020B"  when RES_640_480,  --523
			x"0273"  when RES_800_600,  --627
			x"02E9"  when RES_1280_720, --745
			x"020B"  when others;
			
with RESOLUTION_SELECT select 
vbpr <= 	x"002B"  when RES_640_480,  --43
			x"001B"  when RES_800_600,  --27
			x"0019"  when RES_1280_720, --25
			x"002B"  when others;
			
with RESOLUTION_SELECT select 
lineLimit <= 	x"01E0"  when RES_640_480,
							x"0258"  when RES_800_600,
							x"02D0" when RES_1280_720,
							x"0000"  	 when others;

with RESOLUTION_SELECT select 
vfbc_cmd0 <= 	x"00000500"  when RES_640_480,
			      x"00000640"  when RES_800_600,
			      x"00000A00"  when RES_1280_720,
			      x"00000500"  when others;
					
with RESOLUTION_SELECT select 
vfbc_cmd2 <= 	x"000001E0"  when RES_640_480,
			      x"00000257"  when RES_800_600,
			      x"000002CF"  when RES_1280_720,
			      x"000001E0"  when others;
					
with RESOLUTION_SELECT select 
polarity <= 	'0'  when RES_640_480,
			      '0'  when RES_800_600,
			      '1'  when RES_1280_720,
			      '0'  when others;
					
 pxlclk_2x <= PXLCLK_2X_I;
 pxlclk <= PXLCLK_I;
  
  --HV_CNT_PROC : horizontal and vertical counter
  HV_CNT_PROC: process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
		if LOCKED_I = '0' or enabled = '0' then
			hcnt <= (others => '0');
			vcnt <= (others => '0');
			lineCounter <= (others => '0');
			columnCounter <= (others => '0');
		else
			if hcnt < htr then
				hcnt <= hcnt + 1;
				--counter to the active column indexes
				if active_video_i = '1' and columnCounter < columnLimit then
					columnCounter <= columnCounter + 1;
				end if;			
			else
				hcnt <= (others => '0');
				columnCounter <= (others => '0'); --only restart counter when another frame is being generated
				if vcnt < vtr then
					vcnt <= vcnt + 1;
					--counter to the active line indexes
					if active_video_i = '1' and lineCounter < lineLimit then 
						lineCounter <= lineCounter + 1;
					end if;
				else
					lineCounter <= (others => '0'); --only restart counter when another frame is being generated
					vcnt <= (others => '0');
				end if;
			end if;
		end if;
	end if;
  end process HV_CNT_PROC;
  
  --Assign ALL video Signals
  hsync_i <= polarity when (hcnt < hsr) else
				 not(polarity);
  vsync_i <= polarity when (vcnt < vsr) else
				 not(polarity);
  hblank_i <= '1' when (hcnt >= hbpr) and (hcnt < hfpr) else
						 '0';
  vblank_i <= '1' when (vcnt >= vbpr) and (vcnt < vfpr) else
						 '0';
  active_video_i <= hblank_i and vblank_i;
	
	-- only enables the block when the BASE and LINE STRIDE where written
	enabled <= '1' when (FRAME_BASE_ADDR > 0 and LINE_STRIDE > 0) else
					   '0';
  
  --DELAYED OUTPUT for ALL video signals
  VIDEO_DELAY_PROC : process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
		if LOCKED_I = '0' or enabled = '0' then
			hsync_d2 <= '0';
			vsync_d2 <= '0';
			hsync_d1 <= '0';
			vsync_d1 <= '0';
			active_video_d2 <= '0';
			active_video_d1 <= '0';
			video_data_d1 <= (others => '0');
		else
			hsync_d2 <= hsync_d1;
			hsync_d1 <= hsync_i;
			vsync_d2 <= vsync_d1;
			vsync_d1 <= vsync_i;
      active_video_d2 <= active_video_d1;
			active_video_d1 <= active_video_i;
--			if (OPTION_VALUES(1) = '1') then
--				if (videoProcessedData_dataValid = '1') then
--					video_data_d1 <= video_data_processed_i;
--				else
--					video_data_d1 <= x"000000";
--				end if;
--			else
				video_data_d1 <= video_data_i;
--			end if;
		end if;
	end if;
  end process VIDEO_DELAY_PROC;
	
  video_data_i <= VFBC_RD_DATA(7 downto 3) & "000" & VFBC_RD_DATA(2 downto 0) & VFBC_RD_DATA(15 downto 13) & "00" & VFBC_RD_DATA(12 downto 8) & "000";
	
--	video_processing_inst : entity work.VideoProcessing
--	port map (
--		videoData_in_b => video_data_i (23 downto 16),
--		videoData_in_g => video_data_i (15 downto 8),
--		videoData_in_r => video_data_i (7 downto 0),
--		videoDataValid_out => videoProcessedData_dataValid,
--		
--		videoData_switch => OPTION_VALUES(2),
--		
--		videoData_out_b => video_data_processed_i (23 downto 16),
--		videoData_out_g => video_data_processed_i (15 downto 8),
--		videoData_out_r => video_data_processed_i (7 downto 0),
--		
--		hcount =>  columnCounter(13 downto 0), 
--		vcount =>  lineCounter(13 downto 0), -- pixel position y
--		active_video => active_video_i,
--		pixelClock => PXLCLK_10X_I
--	);
	
	

  
    --Instantiate TMDS encoder
  Inst_dvi_out_native: dvi_out_native PORT MAP(
		reset => '0',
		pll_lckd => LOCKED_I,
		clkin => pxlclk,
		clkx2in => pxlclk_2x,
		clkx10in => PXLCLK_10X_I,
		blue_din => video_data_d1(23 downto 16),
		green_din => video_data_d1(15 downto 8),
		red_din => video_data_d1(7 downto 0),
		hsync => hsync_d2,
		vsync => vsync_d2,
		de => active_video_d2,
		TMDS => TMDS,
		TMDSB => TMDSB
	);

  --------------------------------
  -- VFBC Command Logic
  --------------------------------

  VFBC_CMD_CLK <= pxlclk;
  VFBC_CMD_RESET <= '1' when LOCKED_I = '0' else
						  '0'; -- reset at the very beginning
  VFBC_CMD_DATA <= vfbc_cmd_data_i;
  VFBC_CMD_WRITE <= vfbc_cmd_write_i;
  VFBC_CMD_END <= '0'; -- never ends
  
  -- Feed command into VFBC Cmd Port at the beginning of each frame
  VFBC_FEED_CMD_PROC : process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
    if vcnt = 0 and hcnt = 1 and enabled = '1' then
			vfbc_cmd_data_i <= vfbc_cmd0;
			vfbc_cmd_write_i <= '1';
		elsif vcnt = 0 and hcnt = 2 and enabled = '1' then
		  if OPTION_VALUES(0) = '1' then
				vfbc_cmd_data_i <= vfbc_cmd1_default;
			else
				vfbc_cmd_data_i <= "0" & FRAME_BASE_ADDR(30 downto 7) & "0000000";
			end if;
			vfbc_cmd_write_i <= '1';
		elsif vcnt = 0 and hcnt = 3 and enabled = '1' then
			vfbc_cmd_data_i <= vfbc_cmd2;
			vfbc_cmd_write_i <= '1';
		elsif vcnt = 0 and hcnt = 4 and enabled = '1' then
			if OPTION_VALUES(0) = '1' then
				vfbc_cmd_data_i <= vfbc_cmd3_default;
			else
				vfbc_cmd_data_i <= "0000000" & LINE_STRIDE(23 downto 7) & x"00";
			end if;
			vfbc_cmd_write_i <= '1';
		else
			vfbc_cmd_data_i <= (others=>'0');
			vfbc_cmd_write_i <= '0';
		end if;
	end if;
  end process VFBC_FEED_CMD_PROC;
  
  --------------------------------
  -- VFBC Read Logic
  --------------------------------
  VFBC_RD_CLK <= pxlclk;
  VFBC_RD_RESET <= vfbc_rd_reset_i;
  VFBC_RD_FLUSH <= '0';
  VFBC_RD_READ <= active_video_i;
  --TODO: allow non 128 byte alligned parameters by implementing Burst stop logic
  VFBC_RD_END_BURST <= '0';
  
  -- Reset VFBC Read Port at the beginning of each frame
  VFBC_READ_DATA_PROC : process (pxlclk) is
  begin
	if rising_edge(pxlclk) then
    if vcnt = 0 and hcnt < 10 then
			vfbc_rd_reset_i <= '1';
		else
			vfbc_rd_reset_i <= '0';
		end if;
	end if;
  end process VFBC_READ_DATA_PROC;

end IMP;
  


