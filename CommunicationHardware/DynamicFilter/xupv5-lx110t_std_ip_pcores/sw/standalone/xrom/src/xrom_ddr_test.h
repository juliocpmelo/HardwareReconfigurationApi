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

#define memsize 256*1024*1024  // NOTE:  This is 256MB for ML501

#define ML501_TEST2_SHIFT_VALUE     20          // used by test2 for shifting bits tests
#define ML501_DDR_BASEADDR_CONSTANT 0xFC000000  // baseAddr Constant for Test3
#define ML501_DDR_BA_CONSTANT       0x03000000  // Bank Address Constant for Test3
#define ML501_DDR_RA_CONSTANT       0x00FFF800  // Row Address Constant for Test3
#define ML501_DDR_CA_CONSTANT       0x000007FC  // Col Address Constant for Test3

#define DDR_TESTS_PASSED 0x00000000
#define DDR_TEST0_FAILED 0x00000001
#define DDR_TEST1_FAILED 0x00000002
#define DDR_TEST2_FAILED 0x00000003
#define DDR_TEST3_FAILED 0x00000004
#define DDR_TEST4_FAILED 0x00000005
#define DDR_TEST5_FAILED 0x00000006

/*********************************************************************
*
* FUNCTION PROTOTYPE: ml501_ddr_mem_test
*
*********************************************************************/
long ml501_ddr_mem_test
  (
    unsigned long startAdr,
    unsigned long size
  );
