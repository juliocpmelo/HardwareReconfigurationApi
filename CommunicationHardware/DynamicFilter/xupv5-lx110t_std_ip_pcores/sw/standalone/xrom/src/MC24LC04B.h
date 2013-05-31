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
#ifndef MC24LC04B_H
#define MC24LC04B_H

//  This file header is for the MC24LC04B EEPROM

#define MC24LC04B_IIC_BaseAddr      0xA0
#define MC24LC04B_IIC_ReadCMD       0x01
#define MC24LC04B_IIC_WriteCMD      0x00
#define MC24LC04B_IIC_Block_Addr_B0 0x00
#define MC24LC04B_IIC_Block_Addr_B1 0x02
#define MC24LC04B_IIC_NumPossible   0x1
#define MC24LC04B_ADDR_OUT_OF_BOUNDS_ERROR 0x00BADADD


// Function Prototypes
unsigned  long MC24LC04B_readByte     (
	unsigned long addr,
	char * readData
	);

unsigned  long MC24LC04B_writeByte    (
	unsigned long addr,
	char * writeData
	);

unsigned  long MC24LC04B_writeProtect (
	char writeProtect
	);

#endif
