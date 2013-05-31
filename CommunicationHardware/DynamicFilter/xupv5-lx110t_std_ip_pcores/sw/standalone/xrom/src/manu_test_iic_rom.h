/*******************************************************************************
*
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*     FOR A PARTICULAR PURPOSE.
*     
*     (c) Copyright 2007 Xilinx, Inc.
*     All rights reserved.
*
******************************************************************************/
#define ML501

// STANDARD ML300/ML501 TEST_PASSED_1 CODES
#define DDR_PASSED                0x8000000000000000 //using
#define SER1_PASSED               0x4000000000000000 //using
#define SER2_PASSED               0x2000000000000000
#define TFT_PASSED                0x1000000000000000 //using
#define TOUCHSCREEN_PASSED        0x0800000000000000
#define PAR_PASSED                0x0400000000000000
#define PS2_KEYBOARD_PASSED       0x0200000000000000 //using
#define PS2_MOUSE_PASSED          0x0100000000000000 //using
#define ENET_10_100_PASSED        0x0080000000000000 //using
#define IIC_MC24LC32A_PASSED      0x0040000000000000 //using
#define IIC_DS1845_VOL_PASSED     0x0020000000000000
#define IIC_DS1845_TFT_PASSED     0x0010000000000000
#define IIC_LM76_PASSED           0x0008000000000000
#define IIC_MAX6652_CPU_PASSED    0x0004000000000000
#define IIC_MAX6652_PWR_PASSED    0x0002000000000000
#define IIC_MAX6683_CPU_PASSED    0x0001000000000000
#define IIC_MAX6683_PWR_PASSED    0x0000800000000000
#define IIC_MAX1617_PASSED        0x0000400000000000
#define IIC_X1226A_PASSED         0x0000200000000000
#define SPI_PASSED                0x0000100000000000
#define MGT_HSSDC2_1_PASSED       0x0000080000000000
#define MGT_HSSDC2_2_PASSED       0x0000040000000000
#define MGT_SATA_1_PASSED         0x0000020000000000
#define MGT_SATA_2_PASSED         0x0000010000000000
#define MGT_GIGE_0_PASSED         0x0000008000000000
#define MGT_GIGE_1_PASSED         0x0000004000000000
#define MGT_GIGE_2_PASSED         0x0000002000000000
#define MGT_GIGE_3_PASSED         0x0000001000000000
#define RESET_SW_PASSED           0x0000000800000000 //using
#define PROG_SW_PASSED            0x0000000400000000 //using
#define SYSACE_RESET_SW_PASSED    0x0000000200000000 //using
#define SYSACE_MODE_SW_PASSED     0x0000000100000000 //using
#define PC4_PORT_PASSED           0x0000000080000000 //using
#define BDM_PORT_PASSED           0x0000000040000000
#define TRACE_PORT_PASSED         0x0000000020000000
#define PCMCIA_UPPER_SLOT_PASSED  0x0000000010000000
#define PCMCIA_LOWER_SLOT_PASSED  0x0000000008000000
#define SYSTEMACE_PASSED          0x0000000004000000 //using
#define SOUND_IN_LINE_PASSED      0x0000000002000000 //using
#define SOUND_IN_MIC_PASSED       0x0000000001000000 //using
#define SOUND_OUT_PASSED          0x0000000000800000 //using
#define GPIO2_LEDS_PASSED         0x0000000000400000
#define GPIO1_LEDS_PASSED         0x0000000000200000 //using
#define GPIO1_PUSHBUTTON_PASSED   0x0000000000100000 //using
#define PLB_BUS_ERROR_LEDS_PASSED 0x0000000000080000 //using
#define OPB_BUS_ERROR_LEDS_PASSED 0x0000000000040000 //using
#define POWER_SUP_CPU_12V_PASSED  0x0000000000020000
#define POWER_SUP_CPU_5V_PASSED   0x0000000000010000
#define POWER_SUP_CPU_3V3_PASSED  0x0000000000008000
#define POWER_SUP_CPU_2V5_PASSED  0x0000000000004000
#define POWER_SUP_CPU_1V5_PASSED  0x0000000000002000
#define POWER_SUP_PWR_12V_PASSED  0x0000000000001000
#define POWER_SUP_PWR_5V_PASSED   0x0000000000000800 //using
#define POWER_SUP_PWR_3V3_PASSED  0x0000000000000400 //using
#define POWER_SUP_PWR_2V5_PASSED  0x0000000000000200 //using
#define POWER_SUP_PWR_1V5_PASSED  0x0000000000000100
#define POWER_SUP_PASSED          0x0000000000000080 //using
#define FIREWIRE_PASSED           0x0000000000000040
#define PCI_BRIDGE_PASSED         0x0000000000000020
#define PMC_PASSED                0x0000000000000010
#define CASE_ILLUM_LEDS_PASSED    0x0000000000000008
#define POWER_SUP_FPGA_PWR_OFF    0x0000000000000004
#define BURN_IN_PASSED            0x0000000000000001 //using


// NEW ML501 TEST_PASSED_2 CODES
#define TP2_ENTER_MAC_SN                 0x8000000000000000
#define TP2_ENTER_ID_DATE                0x4000000000000000
#define TP2_ENTER_VOLTAGE                0x2000000000000000
#define TP2_CHAR_LCD                     0x1000000000000000
#define TP2_GPIO_DIP_SWITCH              0x0800000000000000
#define TP2_IIC_BUS_TEST                 0x0400000000000000
#define TP2_USB_HPI                      0x0200000000000000
#define TP2_INIT_LED                     0x0100000000000000
#define TP2_DONE_LED                     0x0080000000000000
#define TP2_SYSACE_STAT_LED              0x0040000000000000
#define TP2_PWR_LED                      0x0020000000000000
#define TP2_FLASH_MEMORY                 0x0010000000000000
#define TP2_EXPANSION_HEADER             0x0008000000000000
#define TP2_POWER_SUP_PWR_1V8_PASSED     0x0004000000000000
#define TP2_POWER_SUP_PWR_1V2_PASSED     0x0002000000000000
#define TP2_PLAT_FLASH                   0x0001000000000000
#define TP2_CPLD                         0x0000800000000000
#define TP2_SYSACE_ERROR_LED             0x0000400000000000
#define TP2_SYSACE_FAILSAFE              0x0000200000000000
#define TP2_SYSACE_MPU                   0x0000100000000000
#define TP2_SOUND_HEADPHONE              0x0000080000000000
#define TP2_SYSMON_PASSED                0x0000040000000000
#define TP2_SMA_CLK_PORT_PASSED          0x0000020000000000
#define TP2_ZBT_SRAM_PASSED              0x0000010000000000

#define TP2_UNDEFINED_0x0000008000000000 0x0000008000000000
#define TP2_UNDEFINED_0x0000004000000000 0x0000004000000000
#define TP2_UNDEFINED_0x0000002000000000 0x0000002000000000
#define TP2_UNDEFINED_0x0000001000000000 0x0000001000000000
#define TP2_UNDEFINED_0x0000000800000000 0x0000000800000000
#define TP2_UNDEFINED_0x0000000400000000 0x0000000400000000
#define TP2_UNDEFINED_0x0000000200000000 0x0000000200000000
#define TP2_UNDEFINED_0x0000000100000000 0x0000000100000000
#define TP2_UNDEFINED_0x0000000080000000 0x0000000080000000
#define TP2_UNDEFINED_0x0000000040000000 0x0000000040000000
#define TP2_UNDEFINED_0x0000000020000000 0x0000000020000000
#define TP2_UNDEFINED_0x0000000010000000 0x0000000010000000
#define TP2_UNDEFINED_0x0000000008000000 0x0000000008000000
#define TP2_UNDEFINED_0x0000000004000000 0x0000000004000000
#define TP2_UNDEFINED_0x0000000002000000 0x0000000002000000
#define TP2_UNDEFINED_0x0000000001000000 0x0000000001000000
#define TP2_UNDEFINED_0x0000000000800000 0x0000000000800000
#define TP2_UNDEFINED_0x0000000000400000 0x0000000000400000
#define TP2_UNDEFINED_0x0000000000200000 0x0000000000200000
#define TP2_UNDEFINED_0x0000000000100000 0x0000000000100000
#define TP2_UNDEFINED_0x0000000000080000 0x0000000000080000
#define TP2_UNDEFINED_0x0000000000040000 0x0000000000040000
#define TP2_UNDEFINED_0x0000000000020000 0x0000000000020000
#define TP2_UNDEFINED_0x0000000000010000 0x0000000000010000
#define TP2_UNDEFINED_0x0000000000008000 0x0000000000008000
#define TP2_UNDEFINED_0x0000000000004000 0x0000000000004000
#define TP2_UNDEFINED_0x0000000000002000 0x0000000000002000
#define TP2_UNDEFINED_0x0000000000001000 0x0000000000001000
#define TP2_UNDEFINED_0x0000000000000800 0x0000000000000800
#define TP2_UNDEFINED_0x0000000000000400 0x0000000000000400
#define TP2_UNDEFINED_0x0000000000000200 0x0000000000000200
#define TP2_UNDEFINED_0x0000000000000100 0x0000000000000100
#define TP2_UNDEFINED_0x0000000000000080 0x0000000000000080
#define TP2_UNDEFINED_0x0000000000000040 0x0000000000000040
#define TP2_UNDEFINED_0x0000000000000020 0x0000000000000020
#define TP2_UNDEFINED_0x0000000000000010 0x0000000000000010
#define TP2_UNDEFINED_0x0000000000000008 0x0000000000000008
#define TP2_UNDEFINED_0x0000000000000004 0x0000000000000004
#define TP2_UNDEFINED_0x0000000000000002 0x0000000000000002
#define TP2_UNDEFINED_0x0000000000000001 0x0000000000000001




//==========================ML300 TEST STRUCT=============================

#ifdef ML300

#define MC24LC32A_DEV0  0x0
#define MANU_TEST_IIC_ROM_BASE_ADDR 0x800
#define TESTED_BEFORE_TEXT "     Xilinx Virtex-5 ML300"

// #defines for which_test
#define ML300_MANU_NO_TEST              0x0
#define ML300_MANU_IIC_MC24LC32A_TEST   0x100
#define ML300_MANU_DDR_TEST             0x101
#define ML300_MANU_IIC_TFT_TEST         0x102
#define ML300_MANU_IIC_VOL_TEST         0x103
#define ML300_MANU_SPI_TEST             0x104
#define ML300_MANU_SER_TEST             0x105
#define ML300_MANU_IIC_SYS_MON_TEST     0x106
#define ML300_MANU_IIC_MAX1617_TEST     0x107
#define ML300_MANU_PCI_BRIDGE_TEST      0x108
#define ML300_MANU_SOUND_TEST           0x109
#define ML300_MANU_GPIO_PUSHBUTTON_TEST 0x10A
#define ML300_MANU_GPIO_LED_TEST        0x10B
#define ML300_MANU_BUS_ERROR_LED_TEST   0x10C
#define ML300_MANU_RTC_SET_TEST         0x10D
#define ML300_MANU_SYSACE_CFG_TEST      0x10E
#define ML300_MANU_TOUCH_CAL_TEST       0x10F
#define ML300_MANU_RESET1_TEST          0x110
#define ML300_MANU_RESET2_TEST          0x111
#define ML300_MANU_PROG1_TEST           0x112
#define ML300_MANU_PROG2_TEST           0x113
#define ML300_MANU_MACID_SN_TEST        0x114
#define ML300_MANU_MGT1_TEST            0x1000  // will be cfg1
#define ML300_MANU_MGT2_TEST            0x2000  // will be cfg2
#define ML300_MANU_MGT3_TEST            0x3000  // will be cfg3
#define ML300_MANU_MGT4_TEST            0x4000  // will be cfg4
#define ML300_MANU_MGT_BOGUS_BITS_TEST  0x5000  // will be cfg5 - MGT tests go here only if can not link
#define ML300_MANU_MGT_DISPLAY_TEST     0x6000  // will be cfg6, display the results from MGT testing...
#define ML300_MANU_BURN_IN_TEST         0x80000

// #defines for multipass
#define ML300_MANU_MULTI_PASS_TEST      0xAA000000
#define ML300_MANU_NO_MULTI_PASS_TEST   0x00000000

// Structure for IIC Memory and ML300 tests
typedef struct iic_struct_ml300_test {
  // Generally used parameters
       long  multipass;                   // used to determine if MGT test run, if run continous or single
       long  which_test;                  // identifies which test to run, typically "next"

  // MGT test 1:  HSSDC2       
  long long  mgt_passes_num_1;            // MGT1 BERT test, number of passes
  long long  mgt_num_bits_rcvd_1;         // MGT1 BERT test, number of bits received
  long long  mgt_num_errs_rcvd_1;         // MGT1 BERT test, number of errors received
  long long  mgt_num_loops_in_test_1;     // MGT1 BERT test, number of loops to run per pass
  long long  mgt_linked_count_1;          // MGT PAIR 1 BERT test, linked count
  long long  mgt_num_bits_mgt0_rcvd_1;    // MGT0 of PAIR 1, BERT test, number of bits received
  long long  mgt_num_bits_mgt1_rcvd_1;    // MGT1 of PAIR 1, BERT test, number of bits received
  long long  mgt_num_errs_mgt0_rcvd_1;    // MGT0 of PAIR 1 BERT test, number of errors received
  long long  mgt_num_errs_mgt1_rcvd_1;    // MGT1 of PAIR 1 BERT test, number of errors received

  // MGT test 2:  SATA       
  long long  mgt_passes_num_2;            // MGT2 BERT test, number of passes
  long long  mgt_num_bits_rcvd_2;         // MGT2 BERT test, number of bits received
  long long  mgt_num_errs_rcvd_2;         // MGT2 BERT test, number of errors received
  long long  mgt_num_loops_in_test_2;     // MGT1 BERT test, number of loops to run per pass
  long long  mgt_linked_count_2;          // MGT PAIR 2 BERT test, linked count
  long long  mgt_num_bits_mgt0_rcvd_2;    // MGT0 of PAIR 2 BERT test, number of bits received
  long long  mgt_num_bits_mgt1_rcvd_2;    // MGT1 of PAIR 2 BERT test, number of bits received
  long long  mgt_num_errs_mgt0_rcvd_2;    // MGT0 of PAIR 2 BERT test, number of errors received
  long long  mgt_num_errs_mgt1_rcvd_2;    // MGT1 of PAIR 2 BERT test, number of errors received

  // MGT test 3:  GigE 2/3
  long long  mgt_passes_num_3;            // MGT3 BERT test, number of passes
  long long  mgt_num_bits_rcvd_3;         // MGT3 BERT test, number of bits received
  long long  mgt_num_errs_rcvd_3;         // MGT3 BERT test, number of errors received
  long long  mgt_num_loops_in_test_3;     // MGT1 BERT test, number of loops to run per pass
  long long  mgt_linked_count_3;          // MGT PAIR 3 BERT test, linked count
  long long  mgt_num_bits_mgt0_rcvd_3;    // MGT0 of PAIR 3 BERT test, number of bits received
  long long  mgt_num_bits_mgt1_rcvd_3;    // MGT1 of PAIR 3 BERT test, number of bits received
  long long  mgt_num_errs_mgt0_rcvd_3;    // MGT0 of PAIR 3 BERT test, number of errors received
  long long  mgt_num_errs_mgt1_rcvd_3;    // MGT1 of PAIR 3 BERT test, number of errors received

  // MGT test 4:  GigE 0/1
  long long  mgt_passes_num_4;            // MGT4 BERT test, number of passes
  long long  mgt_num_bits_rcvd_4;         // MGT4 BERT test, number of bits received
  long long  mgt_num_errs_rcvd_4;         // MGT4 BERT test, number of errors received
  long long  mgt_num_loops_in_test_4;     // MGT1 BERT test, number of loops to run per pass
  long long  mgt_linked_count_4;          // MGT PAIR 4 BERT test, linked count 
  long long  mgt_num_bits_mgt0_rcvd_4;    // MGT0 of PAIR 4 BERT test, number of bits received
  long long  mgt_num_bits_mgt1_rcvd_4;    // MGT1 of PAIR 4 BERT test, number of bits received
  long long  mgt_num_errs_mgt0_rcvd_4;    // MGT0 of PAIR 4 BERT test, number of errors received
  long long  mgt_num_errs_mgt1_rcvd_4;    // MGT1 of PAIR 4 BERT test, number of errors received

  // Power Supply Info
  double     power_sup_measure_20V;       // measure the 20V supply
  double     power_sup_measure_12V;       // measure the 12V supply
  double     power_sup_measure_5V;        // measure the 5V supply
  double     power_sup_measure_3V3;       // measure the 3V3 supply
  double     power_sup_measure_2V5;       // measure the 2V5 supply
  double     power_sup_measure_1V5;       // measure the 1V5 supply
  double     power_sup_measure_minus_12V; // measure the -12V supply
  double     power_sup_iic_CPU_12V;       // measure the CPUs 12V supply
  double     power_sup_iic_CPU_5V;        // measure the CPUs 5V supply
  double     power_sup_iic_CPU_3V3;       // measure the CPUs 3V3 supply
  double     power_sup_iic_CPU_2V5;       // measure the CPUs 2V5 supply
  double     power_sup_iic_CPU_1V5;       // measure the CPUs 1V5 supply
  double     power_sup_iic_CPU_minus_12V; // can not measure the -12V supply, placeholder
  double     power_sup_iic_CPU_temp;      // measure the CPUs SysMon temperature
  double     power_sup_iic_PWR_12V;       // measure the PWR_IOs 12V supply
  double     power_sup_iic_PWR_5V;        // measure the PWR_IOs 5V supply
  double     power_sup_iic_PWR_3V3;       // measure the PWR_IOs 3V3 supply
  double     power_sup_iic_PWR_2V5;       // measure the PWR_IOs 2V5 supply
  double     power_sup_iic_PWR_1V5;       // measure the PWR_IOs 1V5 supply
  double     power_sup_iic_PWR_minus_12V; // can not measure the -12V supply, placeholder
  double     power_sup_iic_PWR_temp;      // measure the PWR_IOs SysMon temperature

  // ML300 Manufacture Test Info
  long long  test_passed_1;               // unique bit identifier for each element of ML300, 1=passed
  long long  test_passed_2;               // unique bit identifier for each element of ML300, 1=passed 
  long long  num_passes_ddr_test;         // Number of passes for DDR memory test
  long long  num_errs_ddr_test;           // Number of errors for DDR memory test
  long long  num_passes_burn_in_test;     // Number of passes for DDR memory test
  long long  num_errs_burn_in_test;       // Number of errors for DDR memory test
  long long  error_code;                  // error code from ML300 production tests (TBD)
  char       ml300_cpu_sn[9];             // Serial Number of ML300_CPU board
  char       ml300_pwr_io_sn[9];          // Serial Number of ML300_PWR_IO board
  char       ml300_mac_id[13];            // MAC Address for this ML300 board
  char       filler[1];                   // Filler to make us longlong aligned
  char       last_test_date[24];          // last date that tests were run on board
  char       manufacture_date[24];        // ML300 Manufacture Date
  char       manufacture_id[16]  ;        // ML300 Manufacture ID
  char       tested_before[32];           // set to '     Xilinx Virtex-5 ML300', with NULL in [31]

  // Real Time Clock Information
  char         rtc_set[8];                  // Set to 'TIMESET' if clock has been set, else 0
  char         iic_eeprom_update_date[24];  // time/date string when IIC was flashed.
  
  // Touchscreen calibration data
  unsigned int touchscreen_Xlcorn;        // touchscreen X corner base calibration
  unsigned int touchscreen_Ylcorn;        // touchscreen Y corner base calibration
  unsigned int touchscreen_Xmult;         // touchscreen X multiplier base calibration
  unsigned int touchscreen_Ymult;         // touchscreen Y multiplier base calibration

  // keep track of last test, just in case...
          long last_test;                 // identifies which test was last run used for PROG/RESET/SYSACE RESET tests

} IIC_MANU_TEST_STRUCT;

typedef struct iic_struct_ml300_test *ptrIIC_MANU_TEST_STRUCT;  // create pointer type for struct

//=============Function Prototypes=================================
void  init_ml300_test_struct (ptrIIC_MANU_TEST_STRUCT ptr2testStruct);
void  read_ml300_test_struct ( char * pointer_to_struct);
void write_ml300_test_struct ( char * pointer_to_struct);

#endif //ML300


//====================ML501 TEST STRUCTURE========================

#ifdef ML501

#define MANU_TEST_IIC_ROM_BASE_ADDR 0x000
#define TESTED_BEFORE_TEXT "Xilinx ML501"

#define ML501_MANU_NO_TEST                 0x000
#define ML501_MANU_IIC_EEPROM_TEST         0x001
#define ML501_MANU_DDR_TEST                0x002
#define ML501_MANU_VGA_TEST                0x003
#define ML501_MANU_VOL_TEST                0x004
#define ML501_MANU_AUDIO_TEST              0x005
#define ML501_MANU_GPIO_TEST               0x006 //for buttons and leds, err leds, and cpu reset pb
#define ML501_MANU_SYSACE_CFG_TEST         0x007
#define ML501_MANU_MACID_SN_TEST           0x008
#define ML501_MANU_ENTER_ID_TEST           0x009
#define ML501_MANU_CHAR_LCD_TEST           0x00A
#define ML501_MANU_DIPSWITCH_TEST          0x00B
#define ML501_MANU_PS2_TEST                0x00C
#define ML501_MANU_SMA_TEST                0x00D
#define ML501_MANU_CPLD_TEST               0x00E
#define ML501_MANU_ZBT_SRAM_TEST           0x00F
#define ML501_MANU_USB_TEST                0x010
#define ML501_MANU_ETHERNET_TEST           0x011
#define ML501_MANU_FLASH_TEST              0x012
#define ML501_MANU_SERIAL_UART_TEST        0x013
#define ML501_MANU_EXPANSION_TEST          0x014
#define ML501_MANU_INIT_LED_TEST           0x015
#define ML501_MANU_PLAT_FLASH              0x016
#define ML501_MANU_LINEAR_FLASH            0x017
#define ML501_MANU_BURN_IN_TEST            0xFFF
#define ML501_MANU_DONE_TEST               0xFFFFFFFF


//=============Structure for IIC Memory and ML501 tests===================

typedef struct iic_struct_ml501_test {

// Generally used parameters
char  which_board[17];             // 0x000 to 0x010 Plain text ID of which board
char  board_rev[5];                // 0x011 to 0x015 Plain text Board Rev (A, B, C, etc)
char  minor_board_rev[5];          // 0x016 to 0x01A Plain text minor board rev (001, 002, etc)
char  which_FPGA[19];              // 0x01B to 0x02E Plain text which FPGA is on the board (main FPGA if multiples)
char  ml501_sn[9];                 // 0x02F to 0x037 Plain text Serial Number of ML501 boardgl
char  ml501_mac_id[13];            // 0x038 to 0x044 Plain text MAC Address for this ML501 board
char  last_test_date[12];          // 0x045 to 0x050 Plain test last date that tests were run on board (DD-MMM-YYYY)
char  manufacture_date[12];        // 0x051 to 0x05C Plain text ML501 Manufacture Date (DD-MMM-YYYY)
char  manufacture_id[17];          // 0x05D to 0x06D Plain text ML501 Manufacture ID (Name)
char  tested_before[19];           // 0x06E to 0x080 Plain text set to 'Xilinx Virtex-4 Based ML501', with NULL in [31]

// ML501 Manufacture Test Info
long long test_passed_1;           // unique bit identifier for each element of ML501, 1=passed
long long test_passed_2;           // unique bit identifier for each element of ML501, 1=passed 
long long error_code;              // error code from ML501 production tests (TBD)

long  last_test;                // identifies which test was last run. Used for PROG/RESET/SYSACE RESET tests
long  curr_test;                // identifies which test to run, typically "next"
long  num_passes_ddr_test;      // Number of passes for DDR memory test
long  num_errs_ddr_test;        // Number of errors for DDR memory test
long  num_passes_burn_in_test;  // Number of passes for DDR memory test
long  num_errs_burn_in_test;    // Number of errors for DDR memory test

  // Power Supply Info
  double power_sup_measure_5V;        // measure the 5V supply
  double power_sup_measure_3V3;       // measure the 3V3 supply
  double power_sup_measure_2V5;       // measure the 2V5 supply
  double power_sup_measure_1V8;       // measure the 1V8 supply
  double power_sup_measure_1V2;       // measure the 1V2 supply
  //Sysmon Power Info
  double power_sup_iic_FPGA_5V;  // measure the FPGAs 5V supply
  double power_sup_iic_FPGA_3V3; // measure the FPGAs 3V3 supply
  double power_sup_iic_FPGA_2V5; // measure the FPGAs 2V5 supply
  double power_sup_iic_FPGA_1V8; // measure the FPGAs 1V8 supply
  double power_sup_iic_FPGA_1V2; // measure the FPGAs 1V8 supply
  double power_sup_iic_FPGA_temp;// measure the FPGAs SysMon temperature

} IIC_MANU_TEST_STRUCT;

typedef struct iic_struct_ml501_test * ptrIIC_MANU_TEST_STRUCT;  // create pointer type for struct


//================Function Prototypes=====================
void  init_ml501_test_struct (ptrIIC_MANU_TEST_STRUCT ptr2testStruct);
void  read_ml501_test_struct ( char * pointer_to_struct);
void  write_ml501_test_struct ( char * pointer_to_struct);
void  print_ml501_test_struct (ptrIIC_MANU_TEST_STRUCT ptr2testStruct);
void  default_ml501_test_struct (ptrIIC_MANU_TEST_STRUCT ptr2testStruct);
#endif

