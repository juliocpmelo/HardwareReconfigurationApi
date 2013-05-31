/******************************************************************************
*
*       XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*       AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
*       SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
*       OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
*       APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
*       THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*       AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*       FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*       WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*       IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*       REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*       INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*       FOR A PARTICULAR PURPOSE.
*
*       (c) Copyright 2007 Xilinx Inc.
*       All rights reserved.
*
******************************************************************************/

// includes

#include "xrom_input.h"
//#include "manu_test_iic_rom.h"
#include "gpio_iic_low_level.h"
#include "gpio_iic.h"
#include "MC24LC04B.h"
#include "sleep.h"
#include <string.h>
#include <stdio.h>

// global vars


#ifdef ML300
/* ------------------------------------------------------------------------------------ */
/*   ML300 STRUCTURES                                                                   */
/* ------------------------------------------------------------------------------------ */

// ---------------------------------------------
//   init_ml300_test_struct         
// ---------------------------------------------
void init_ml300_test_struct (ptrIIC_MANU_TEST_STRUCT ptr2testStruct)
{
  // initialize ML300 test structure to known values
  // Generally used parameters
  ptr2testStruct->multipass                   = 0x0; // used to determine if MGT test run, if run continous or single
  ptr2testStruct->which_test                  = 0x0; // identifies which test to run, typically "next"

  // MGT test 1:  HSSDC2       
  ptr2testStruct->mgt_passes_num_1            = 0x0; // MGT1 BERT test, number of passes
  ptr2testStruct->mgt_num_bits_rcvd_1         = 0x0; // MGT1 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_rcvd_1         = 0x0; // MGT1 BERT test, number of errors received
  ptr2testStruct->mgt_num_loops_in_test_1     = 0x0; // MGT1 BERT test, number of loops to run per pass
  ptr2testStruct->mgt_linked_count_1          = 0x0; // MGT PAIR 1 BERT test, linked count
  ptr2testStruct->mgt_num_bits_mgt0_rcvd_1    = 0x0; // MGT0 of PAIR 1, BERT test, number of bits received
  ptr2testStruct->mgt_num_bits_mgt1_rcvd_1    = 0x0; // MGT1 of PAIR 1, BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_mgt0_rcvd_1    = 0x0; // MGT0 of PAIR 1 BERT test, number of errors received
  ptr2testStruct->mgt_num_errs_mgt1_rcvd_1    = 0x0; // MGT1 of PAIR 1 BERT test, number of errors received

  // MGT test 2:  SATA       
  ptr2testStruct->mgt_passes_num_2            = 0x0; // MGT2 BERT test, number of passes
  ptr2testStruct->mgt_num_bits_rcvd_2         = 0x0; // MGT2 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_rcvd_2         = 0x0; // MGT2 BERT test, number of errors received
  ptr2testStruct->mgt_num_loops_in_test_2     = 0x0; // MGT1 BERT test, number of loops to run per pass
  ptr2testStruct->mgt_linked_count_2          = 0x0; // MGT PAIR 2 BERT test, linked count
  ptr2testStruct->mgt_num_bits_mgt0_rcvd_2    = 0x0; // MGT0 of PAIR 2 BERT test, number of bits received
  ptr2testStruct->mgt_num_bits_mgt1_rcvd_2    = 0x0; // MGT1 of PAIR 2 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_mgt0_rcvd_2    = 0x0; // MGT0 of PAIR 2 BERT test, number of errors received
  ptr2testStruct->mgt_num_errs_mgt1_rcvd_2    = 0x0; // MGT1 of PAIR 2 BERT test, number of errors received

  // MGT test 3:  GigE 2/3
  ptr2testStruct->mgt_passes_num_3            = 0x0; // MGT3 BERT test, number of passes
  ptr2testStruct->mgt_num_bits_rcvd_3         = 0x0; // MGT3 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_rcvd_3         = 0x0; // MGT3 BERT test, number of errors received
  ptr2testStruct->mgt_num_loops_in_test_3     = 0x0; // MGT1 BERT test, number of loops to run per pass
  ptr2testStruct->mgt_linked_count_3          = 0x0; // MGT PAIR 3 BERT test, linked count
  ptr2testStruct->mgt_num_bits_mgt0_rcvd_3    = 0x0; // MGT0 of PAIR 3 BERT test, number of bits received
  ptr2testStruct->mgt_num_bits_mgt1_rcvd_3    = 0x0; // MGT1 of PAIR 3 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_mgt0_rcvd_3    = 0x0; // MGT0 of PAIR 3 BERT test, number of errors received
  ptr2testStruct->mgt_num_errs_mgt1_rcvd_3    = 0x0; // MGT1 of PAIR 3 BERT test, number of errors received

  // MGT test 4:  GigE 0/1
  ptr2testStruct->mgt_passes_num_4            = 0x0; // MGT4 BERT test, number of passes
  ptr2testStruct->mgt_num_bits_rcvd_4         = 0x0; // MGT4 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_rcvd_4         = 0x0; // MGT4 BERT test, number of errors received
  ptr2testStruct->mgt_num_loops_in_test_4     = 0x0; // MGT1 BERT test, number of loops to run per pass
  ptr2testStruct->mgt_linked_count_4          = 0x0; // MGT PAIR 4 BERT test, linked count 
  ptr2testStruct->mgt_num_bits_mgt0_rcvd_4    = 0x0; // MGT0 of PAIR 4 BERT test, number of bits received
  ptr2testStruct->mgt_num_bits_mgt1_rcvd_4    = 0x0; // MGT1 of PAIR 4 BERT test, number of bits received
  ptr2testStruct->mgt_num_errs_mgt0_rcvd_4    = 0x0; // MGT0 of PAIR 4 BERT test, number of errors received
  ptr2testStruct->mgt_num_errs_mgt1_rcvd_4    = 0x0; // MGT1 of PAIR 4 BERT test, number of errors received

  // Power Supply Info
  ptr2testStruct->power_sup_measure_12V       = 0x0; // measure the 12V supply
  ptr2testStruct->power_sup_measure_5V        = 0x0; // measure the 5V supply
  ptr2testStruct->power_sup_measure_3V3       = 0x0; // measure the 3V3 supply
  ptr2testStruct->power_sup_measure_2V5       = 0x0; // measure the 2V5 supply
  ptr2testStruct->power_sup_measure_1V5       = 0x0; // measure the 1V5 supply
  ptr2testStruct->power_sup_measure_minus_12V = 0x0; // measure the -12V supply
  ptr2testStruct->power_sup_iic_CPU_12V       = 0x0; // measure the CPUs 12V supply
  ptr2testStruct->power_sup_iic_CPU_5V        = 0x0; // measure the CPUs 5V supply
  ptr2testStruct->power_sup_iic_CPU_3V3       = 0x0; // measure the CPUs 3V3 supply
  ptr2testStruct->power_sup_iic_CPU_2V5       = 0x0; // measure the CPUs 2V5 supply
  ptr2testStruct->power_sup_iic_CPU_1V5       = 0x0; // measure the CPUs 1V5 supply
  ptr2testStruct->power_sup_iic_CPU_minus_12V = 0x0; // can not measure the -12V supply, placeholder
  ptr2testStruct->power_sup_iic_CPU_temp      = 0x0; // measure the CPUs SysMon temperature
  ptr2testStruct->power_sup_iic_PWR_12V       = 0x0; // measure the PWR_IOs 12V supply
  ptr2testStruct->power_sup_iic_PWR_5V        = 0x0; // measure the PWR_IOs 5V supply
  ptr2testStruct->power_sup_iic_PWR_3V3       = 0x0; // measure the PWR_IOs 3V3 supply
  ptr2testStruct->power_sup_iic_PWR_2V5       = 0x0; // measure the PWR_IOs 2V5 supply
  ptr2testStruct->power_sup_iic_PWR_1V5       = 0x0; // measure the PWR_IOs 1V5 supply
  ptr2testStruct->power_sup_iic_PWR_minus_12V = 0x0; // can not measure the -12V supply, placeholder
  ptr2testStruct->power_sup_iic_PWR_temp      = 0x0; // measure the PWR_IOs SysMon temperature

  // ML300 Manufacture Test Info
  ptr2testStruct->test_passed_1               = 0x0; // unique bit identifier for each element of ML300, 1=passed
  ptr2testStruct->test_passed_2               = 0x0; // unique bit identifier for each element of ML300, 1=passed 
  ptr2testStruct->num_passes_ddr_test         = 0x0; // Number of passes for DDR memory test
  ptr2testStruct->num_errs_ddr_test           = 0x0; // Number of errors for DDR memory test
  ptr2testStruct->num_passes_burn_in_test     = 0x0; // Number of passes for DDR memory test
  ptr2testStruct->num_errs_burn_in_test       = 0x0; // Number of errors for DDR memory test
  ptr2testStruct->error_code                  = 0x0; // error code from ML300 production tests (TBD)
  strcpy(ptr2testStruct->ml300_cpu_sn,"");           // Serial Number of ML300_CPU board
  strcpy(ptr2testStruct->ml300_pwr_io_sn,"");        // Serial Number of ML300_PWR_IO board
  strcpy(ptr2testStruct->ml300_mac_id,"");           // MAC Address for this ML300 board
  strcpy(ptr2testStruct->filler,"");                 // Filler space to align everything
  strcpy(ptr2testStruct->last_test_date,"");         // last date that tests were run on board
  strcpy(ptr2testStruct->manufacture_date,"");       // ML300 Manufacture Date
  strcpy(ptr2testStruct->manufacture_id,"");         // ML300 Manufacture ID
  strcpy(ptr2testStruct->tested_before, TESTED_BEFORE_TEXT);
  strcpy(ptr2testStruct->rtc_set,"");                // Set to 'TIMESET' if clock has been set, else 0
  strcpy(ptr2testStruct->iic_eeprom_update_date,""); // time/date string when IIC was flashed.
  ptr2testStruct->last_test                   = 0x0; // Last_test run, used by PROG/RESET/SYSACE RESET tests

  return;
}


// ---------------------------------------------
//   read_ml300_test_struct         
// ---------------------------------------------
void read_ml300_test_struct (  char * pointer_to_struct)
{
  unsigned      long iic_eeprom_addr;
  int length;
  unsigned long errorIIC;
   
  iic_eeprom_addr = MANU_TEST_IIC_ROM_BASE_ADDR;  // reset before use!

  length = sizeof(IIC_MANU_TEST_STRUCT);
  while (length > 0)
  	{
       errorIIC = MC24LC32A_readByte (MC24LC32A_DEV0, iic_eeprom_addr, pointer_to_struct);
       iic_eeprom_addr++;
       length--;
       pointer_to_struct++;
  	}

  return;
}


// ---------------------------------------------
//   write_ml300_test_struct         
// ---------------------------------------------
void write_ml300_test_struct (  char * pointer_to_struct)
{
  unsigned      long iic_eeprom_addr;
  int length;
  unsigned long errorIIC;
  unsigned      char writeProtect24LC32A = 0x1;  // leave write protected normally
   
  // enable writing to the IIC EEPROM
  writeProtect24LC32A = 0x0;
  errorIIC = MC24LC32A_writeProtect (MC24LC32A_DEV0, writeProtect24LC32A);
  
  // set up base address of IIC EEPROM before we use it
  iic_eeprom_addr = MANU_TEST_IIC_ROM_BASE_ADDR;  // reset before use!

  length = sizeof(IIC_MANU_TEST_STRUCT);
  while (length > 0)
  	{
       errorIIC = MC24LC32A_writeByte (MC24LC32A_DEV0, iic_eeprom_addr, pointer_to_struct);
       iic_eeprom_addr++;
       length--;
       pointer_to_struct++;
  	}

  return;
}
#endif

#ifdef ML501
/* ------------------------------------------------------------------------------------ */
/*   ML501 STRUCTURES                                                                   */
/* ------------------------------------------------------------------------------------ */

// ---------------------------------------------
//   init_ml501_test_struct         
// ---------------------------------------------
void init_ml501_test_struct (ptrIIC_MANU_TEST_STRUCT ptr2testStruct)
{
  // initialize ML501 test structure to known values

  // ML501 Board Manufacture Test Info
  strcpy(ptr2testStruct->which_board,"HW-V5-ML505");          // which board 
  strcpy(ptr2testStruct->board_rev,"B");                      // Major Revision of board
  strcpy(ptr2testStruct->minor_board_rev,"002");                // Minor Revision of Board
  strcpy(ptr2testStruct->which_FPGA,"XC5VLX50TFF1136");         // Main FPGA used on board
  strcpy(ptr2testStruct->ml501_sn,"");                        // ML501 Serial Number
  strcpy(ptr2testStruct->ml501_mac_id,"");                    // ML501 Ethernet Mac Address
  strcpy(ptr2testStruct->last_test_date,"");                  // last date that tests were run on board
  strcpy(ptr2testStruct->manufacture_date,"");                // Manufacture Date
  strcpy(ptr2testStruct->manufacture_id,"");                  // Manufacture ID
  strcpy(ptr2testStruct->tested_before, TESTED_BEFORE_TEXT);  // how we know it was actually set!


  // Generally used parameters

 // Power Supply Info
  ptr2testStruct->power_sup_measure_5V        = 0x0; // measure the 5V supply
  ptr2testStruct->power_sup_measure_3V3       = 0x0; // measure the 3V3 supply
  ptr2testStruct->power_sup_measure_2V5       = 0x0; // measure the 2V5 supply
  ptr2testStruct->power_sup_measure_1V8       = 0x0; // measure the 1V8 supply
  ptr2testStruct->power_sup_measure_1V2       = 0x0; // measure the 1V2 supply

  ptr2testStruct->power_sup_iic_FPGA_5V       = 0x0; // measure the FPGAs 5V supply
  ptr2testStruct->power_sup_iic_FPGA_3V3      = 0x0; // measure the FPGAs 3V3 supply
  ptr2testStruct->power_sup_iic_FPGA_2V5      = 0x0; // measure the FPGAs 2V5 supply
  ptr2testStruct->power_sup_iic_FPGA_1V8      = 0x0; // measure the FPGAs 1V8 supply
  ptr2testStruct->power_sup_iic_FPGA_1V2      = 0x0; // measure the FPGAs 1V8 supply
  ptr2testStruct->power_sup_iic_FPGA_temp     = 0x0; // measure the FPGAs SysMon temperature

  // Manufacture Test Info
  ptr2testStruct->curr_test                   = 0x0; // identifies which test to run, typically "next"
  ptr2testStruct->test_passed_1               = 0x0; // unique bit identifier for each element of ML300, 1=passed
  ptr2testStruct->test_passed_2               = 0x0; // unique bit identifier for each element of ML300, 1=passed 
  ptr2testStruct->num_passes_ddr_test         = 0x0; // Number of passes for DDR memory test
  ptr2testStruct->num_errs_ddr_test           = 0x0; // Number of errors for DDR memory test
  ptr2testStruct->num_passes_burn_in_test     = 0x0; // Number of passes for DDR memory test
  ptr2testStruct->num_errs_burn_in_test       = 0x0; // Number of errors for DDR memory test
  ptr2testStruct->error_code                  = 0x0; // error code from ML300 production tests (TBD)
  
  ptr2testStruct->last_test                   = 0x0; // Last_test run, used by PROG/RESET/SYSACE RESET tests

  return;
}


// ---------------------------------------------
//   read_ml501_test_struct         
// ---------------------------------------------
void read_ml501_test_struct (  char * pointer_to_struct)
{
  unsigned      long iic_eeprom_addr;
  int length;
  unsigned long errorIIC;
   
  iic_eeprom_addr = MANU_TEST_IIC_ROM_BASE_ADDR;  // reset before use!

  length = sizeof(IIC_MANU_TEST_STRUCT);
  while (length > 0)
  	{
       errorIIC = MC24LC04B_readByte (iic_eeprom_addr, pointer_to_struct);
       iic_eeprom_addr++;
       length--;
       pointer_to_struct++;
  	}

  return;
}


// ---------------------------------------------
//   write_ml501_test_struct         
// ---------------------------------------------
void write_ml501_test_struct (  char * pointer_to_struct)
{
  unsigned      long iic_eeprom_addr;
  int length;
  unsigned long errorIIC;
  //  unsigned      char writeProtect24LC32A = 0x1;  // leave write protected normally
   
  
  // set up base address of IIC EEPROM before we use it
  iic_eeprom_addr = MANU_TEST_IIC_ROM_BASE_ADDR;  // reset before use!

  length = sizeof(IIC_MANU_TEST_STRUCT);
  while (length > 0)
  	{ 
       errorIIC = MC24LC04B_writeByte (iic_eeprom_addr, pointer_to_struct);
       iic_eeprom_addr++;
       length--;
       pointer_to_struct++;
  	}

  return;
}


// ---------------------------------------------
//   print_ml501_test_struct         
// ---------------------------------------------
void print_ml501_test_struct(ptrIIC_MANU_TEST_STRUCT ptr2testStruct)
{
  //	int i;

	//READ DATA FROM IIC TO DDR
	read_ml501_test_struct((char *) ptr2testStruct);

	//PRINT DATA FROM DDR
	xil_printf("Board Identification: %s", ptr2testStruct->tested_before);
	xil_printf("\n\r  Board Model: %s   Major Revision: %s   Minor Revision: %s", ptr2testStruct->which_board, ptr2testStruct->board_rev, ptr2testStruct->minor_board_rev);
	xil_printf("\n\r  FPGA Part Number:    %s", ptr2testStruct->which_FPGA);
	xil_printf("\n\r  Board Serial Number: %s", ptr2testStruct->ml501_sn);
	xil_printf("\n\r  Board MAC Address:   %s", ptr2testStruct->ml501_mac_id);

	xil_printf("\r\n\r\nManufacture Date: %s   Manufacture ID: %s", ptr2testStruct->manufacture_date, ptr2testStruct->manufacture_id);
	xil_printf("\r\n  5.0V Production Measured Power Supply: ");
	printfloat(ptr2testStruct->power_sup_measure_5V, 3);
	xil_printf("\r\n  3.3V Production Measured Power Supply: ");
	printfloat(ptr2testStruct->power_sup_measure_3V3, 3);
	xil_printf("\r\n  2.5V Production Measured Power Supply: ");
	printfloat(ptr2testStruct->power_sup_measure_2V5, 3);
	xil_printf("\r\n  1.8V Production Measured Power Supply: ");
	printfloat(ptr2testStruct->power_sup_measure_1V8, 3);
	xil_printf("\r\n  1.2V Production Measured Power Supply: ");
	printfloat(ptr2testStruct->power_sup_measure_1V2, 3);
	
	xil_printf("\r\n\n\rLast Test Date: %s", ptr2testStruct->last_test_date);
	xil_printf("\r\n  Test Result Code 1:  ");
		print_longlong_hex(ptr2testStruct->test_passed_1);
	xil_printf("\r\n  Test Result Code 2:  ");
		print_longlong_hex(ptr2testStruct->test_passed_2);
	xil_printf("\r\n  Board Error Code:    ");
		print_longlong_hex(ptr2testStruct->error_code);

	xil_printf("\r\n  Burn-In Test Passes: %d", (unsigned int) ptr2testStruct->num_passes_burn_in_test);
	
	if(ptr2testStruct->num_passes_burn_in_test < 10)
		print_space(10);
	else if(ptr2testStruct->num_passes_burn_in_test < 100)
		print_space(9);
	else if(ptr2testStruct->num_passes_burn_in_test < 1000)
		print_space(8);
	else if(ptr2testStruct->num_passes_burn_in_test < 10000)
		print_space(7);
	else
		print_space(6);
		
	xil_printf("Burn-In Test Errors:  %d", (unsigned int) ptr2testStruct->num_errs_burn_in_test);
	xil_printf("\r\n  DDR Test Passes:     %d", (unsigned int) ptr2testStruct->num_passes_ddr_test);
	
	if(ptr2testStruct->num_passes_ddr_test < 10)
		print_space(10);
	else if(ptr2testStruct->num_passes_ddr_test < 100)
		print_space(9);
	else if(ptr2testStruct->num_passes_ddr_test < 1000)
		print_space(8);
	else if(ptr2testStruct->num_passes_ddr_test < 10000)
		print_space(7);
	else
		print_space(6);

	xil_printf("DDR Test Errors:      %d", (unsigned int) ptr2testStruct->num_errs_ddr_test);
	
	xil_printf("\r\n  Current Test Code:   ");
		print_long_hex(ptr2testStruct->curr_test);
	xil_printf(" Last Test Code:       ");
		print_long_hex(ptr2testStruct->last_test);
	
	xil_printf("\r\n\r\nPress Enter to Continue\r\n");
	while(!WaitForEnter());

	xil_printf("\r\n");
	return;
}


// ---------------------------------------------
//   default_ml501_test_struct         
// ---------------------------------------------
void default_ml501_test_struct(ptrIIC_MANU_TEST_STRUCT ptr2testStruct)
{
	xil_printf("Restoring IIC EEPROM Defaults\r\n\r\n");

	init_ml501_test_struct(ptr2testStruct);

	strcpy(ptr2testStruct->which_board, "HW-V5-ML505");
	strcpy(ptr2testStruct->board_rev, "B");
	strcpy(ptr2testStruct->minor_board_rev, "002");
	strcpy(ptr2testStruct->which_FPGA, "XC5VLX50TFF1136");
	strcpy(ptr2testStruct->ml501_sn, "");
	strcpy(ptr2testStruct->last_test_date, "");
	strcpy(ptr2testStruct->manufacture_date, "");
	strcpy(ptr2testStruct->manufacture_id, "");
	strcpy(ptr2testStruct->tested_before, "No");

	ptr2testStruct->power_sup_measure_5V = 0.0;
	ptr2testStruct->power_sup_measure_3V3 = 0.0;
	ptr2testStruct->power_sup_measure_2V5 = 0.0;
	ptr2testStruct->power_sup_measure_1V8 = 0.0;
	ptr2testStruct->power_sup_measure_1V2 = 0.0;

	ptr2testStruct->last_test = ML501_MANU_NO_TEST;
	ptr2testStruct->curr_test = ML501_MANU_IIC_EEPROM_TEST;
	ptr2testStruct->test_passed_1 = 0;
	ptr2testStruct->test_passed_2 = 0;
	ptr2testStruct->num_passes_ddr_test = 0;
	ptr2testStruct->num_errs_ddr_test = 0;
	ptr2testStruct->num_passes_burn_in_test = 0;
	ptr2testStruct->num_errs_burn_in_test = 0;
	ptr2testStruct->error_code = 0;

	write_ml501_test_struct((char *) ptr2testStruct);	

	xil_printf("IIC EEPROM RESET\r\n\r\n");
}
#endif


