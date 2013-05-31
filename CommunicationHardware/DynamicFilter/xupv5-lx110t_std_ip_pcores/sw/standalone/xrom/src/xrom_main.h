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

#ifndef XROM_MAIN_H
#define XROM_MAIN_H

#include "globaltypes.h"
#include "xbasic_types.h"

//IIC TEST STRUCTURE LIBRARY
#include "manu_test_iic_rom.h"

//PARAMETERS FOR BASE ADDRESSES
#include "xparameters.h"

//UART LIBRARY
#include "xuartns550_l.h"

//STANDARD XROM LIBRARIES
#include "sleep.h"
#include "xrom_version.h"
#include "xrom_input.h"
#include "xrom_tests.h"

#define HR "------------------------------------------------------------------------------\r\n"

//INSTANTIATION OF IIC TEST STRUCTURE
//static  ptrIIC_MANU_TEST_STRUCT   ptr2testStruct   = (IIC_MANU_TEST_STRUCT *)   (XPAR_PLB_DDR_0_MEM0_BASEADDR + 0x03FF0000); // set ptr to known OK memory space


//MENU INTERFACE
extern MenuProc printMenu;
extern InputProc handleInput;
extern MenuProc parentMenu;
extern InputProc parentInput;
extern bool doPrintMenu;

extern unsigned int UartBaseAdr;
extern unsigned int UartBaud;

void PushMenu(MenuProc menu, InputProc input);
void PopMenu(MenuProc *menu, InputProc *input);

#endif
