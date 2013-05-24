-------------------------------------------------------------------------------
-- system_stub.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system_stub is
  port (
    fpga_0_RS232_Uart_1_RX_pin : in std_logic;
    fpga_0_RS232_Uart_1_TX_pin : out std_logic;
    fpga_0_Push_Buttons_5Bits_GPIO_IO_I_pin : in std_logic_vector(0 to 4);
    fpga_0_MCB_DDR2_mcbx_dram_addr_pin : out std_logic_vector(12 downto 0);
    fpga_0_MCB_DDR2_mcbx_dram_ba_pin : out std_logic_vector(2 downto 0);
    fpga_0_MCB_DDR2_mcbx_dram_ras_n_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_cas_n_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_we_n_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_cke_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_clk_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_clk_n_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_dq_pin : inout std_logic_vector(15 downto 0);
    fpga_0_MCB_DDR2_mcbx_dram_dqs_pin : inout std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_dqs_n_pin : inout std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_udqs_pin : inout std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_udqs_n_pin : inout std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_udm_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_ldm_pin : out std_logic;
    fpga_0_MCB_DDR2_mcbx_dram_odt_pin : out std_logic;
    fpga_0_MCB_DDR2_rzq_pin : inout std_logic;
    fpga_0_MCB_DDR2_zio_pin : inout std_logic;
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic;
    hdmi_in_0_TMDS_pin : in std_logic_vector(3 downto 0);
    hdmi_in_0_TMDSB_pin : in std_logic_vector(3 downto 0);
    xps_iic_0_Scl : inout std_logic;
    xps_iic_0_Sda : inout std_logic;
    hdmi_out_0_TMDS_pin : out std_logic_vector(3 downto 0);
    hdmi_out_0_TMDSB_pin : out std_logic_vector(3 downto 0)
  );
end system_stub;

architecture STRUCTURE of system_stub is

  component system is
    port (
      fpga_0_RS232_Uart_1_RX_pin : in std_logic;
      fpga_0_RS232_Uart_1_TX_pin : out std_logic;
      fpga_0_Push_Buttons_5Bits_GPIO_IO_I_pin : in std_logic_vector(0 to 4);
      fpga_0_MCB_DDR2_mcbx_dram_addr_pin : out std_logic_vector(12 downto 0);
      fpga_0_MCB_DDR2_mcbx_dram_ba_pin : out std_logic_vector(2 downto 0);
      fpga_0_MCB_DDR2_mcbx_dram_ras_n_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_cas_n_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_we_n_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_cke_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_clk_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_clk_n_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_dq_pin : inout std_logic_vector(15 downto 0);
      fpga_0_MCB_DDR2_mcbx_dram_dqs_pin : inout std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_dqs_n_pin : inout std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_udqs_pin : inout std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_udqs_n_pin : inout std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_udm_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_ldm_pin : out std_logic;
      fpga_0_MCB_DDR2_mcbx_dram_odt_pin : out std_logic;
      fpga_0_MCB_DDR2_rzq_pin : inout std_logic;
      fpga_0_MCB_DDR2_zio_pin : inout std_logic;
      fpga_0_clk_1_sys_clk_pin : in std_logic;
      fpga_0_rst_1_sys_rst_pin : in std_logic;
      hdmi_in_0_TMDS_pin : in std_logic_vector(3 downto 0);
      hdmi_in_0_TMDSB_pin : in std_logic_vector(3 downto 0);
      xps_iic_0_Scl : inout std_logic;
      xps_iic_0_Sda : inout std_logic;
      hdmi_out_0_TMDS_pin : out std_logic_vector(3 downto 0);
      hdmi_out_0_TMDSB_pin : out std_logic_vector(3 downto 0)
    );
  end component;

  attribute BOX_TYPE : STRING;
  attribute BOX_TYPE of system : component is "user_black_box";

begin

  system_i : system
    port map (
      fpga_0_RS232_Uart_1_RX_pin => fpga_0_RS232_Uart_1_RX_pin,
      fpga_0_RS232_Uart_1_TX_pin => fpga_0_RS232_Uart_1_TX_pin,
      fpga_0_Push_Buttons_5Bits_GPIO_IO_I_pin => fpga_0_Push_Buttons_5Bits_GPIO_IO_I_pin,
      fpga_0_MCB_DDR2_mcbx_dram_addr_pin => fpga_0_MCB_DDR2_mcbx_dram_addr_pin,
      fpga_0_MCB_DDR2_mcbx_dram_ba_pin => fpga_0_MCB_DDR2_mcbx_dram_ba_pin,
      fpga_0_MCB_DDR2_mcbx_dram_ras_n_pin => fpga_0_MCB_DDR2_mcbx_dram_ras_n_pin,
      fpga_0_MCB_DDR2_mcbx_dram_cas_n_pin => fpga_0_MCB_DDR2_mcbx_dram_cas_n_pin,
      fpga_0_MCB_DDR2_mcbx_dram_we_n_pin => fpga_0_MCB_DDR2_mcbx_dram_we_n_pin,
      fpga_0_MCB_DDR2_mcbx_dram_cke_pin => fpga_0_MCB_DDR2_mcbx_dram_cke_pin,
      fpga_0_MCB_DDR2_mcbx_dram_clk_pin => fpga_0_MCB_DDR2_mcbx_dram_clk_pin,
      fpga_0_MCB_DDR2_mcbx_dram_clk_n_pin => fpga_0_MCB_DDR2_mcbx_dram_clk_n_pin,
      fpga_0_MCB_DDR2_mcbx_dram_dq_pin => fpga_0_MCB_DDR2_mcbx_dram_dq_pin,
      fpga_0_MCB_DDR2_mcbx_dram_dqs_pin => fpga_0_MCB_DDR2_mcbx_dram_dqs_pin,
      fpga_0_MCB_DDR2_mcbx_dram_dqs_n_pin => fpga_0_MCB_DDR2_mcbx_dram_dqs_n_pin,
      fpga_0_MCB_DDR2_mcbx_dram_udqs_pin => fpga_0_MCB_DDR2_mcbx_dram_udqs_pin,
      fpga_0_MCB_DDR2_mcbx_dram_udqs_n_pin => fpga_0_MCB_DDR2_mcbx_dram_udqs_n_pin,
      fpga_0_MCB_DDR2_mcbx_dram_udm_pin => fpga_0_MCB_DDR2_mcbx_dram_udm_pin,
      fpga_0_MCB_DDR2_mcbx_dram_ldm_pin => fpga_0_MCB_DDR2_mcbx_dram_ldm_pin,
      fpga_0_MCB_DDR2_mcbx_dram_odt_pin => fpga_0_MCB_DDR2_mcbx_dram_odt_pin,
      fpga_0_MCB_DDR2_rzq_pin => fpga_0_MCB_DDR2_rzq_pin,
      fpga_0_MCB_DDR2_zio_pin => fpga_0_MCB_DDR2_zio_pin,
      fpga_0_clk_1_sys_clk_pin => fpga_0_clk_1_sys_clk_pin,
      fpga_0_rst_1_sys_rst_pin => fpga_0_rst_1_sys_rst_pin,
      hdmi_in_0_TMDS_pin => hdmi_in_0_TMDS_pin,
      hdmi_in_0_TMDSB_pin => hdmi_in_0_TMDSB_pin,
      xps_iic_0_Scl => xps_iic_0_Scl,
      xps_iic_0_Sda => xps_iic_0_Sda,
      hdmi_out_0_TMDS_pin => hdmi_out_0_TMDS_pin,
      hdmi_out_0_TMDSB_pin => hdmi_out_0_TMDSB_pin
    );

end architecture STRUCTURE;

