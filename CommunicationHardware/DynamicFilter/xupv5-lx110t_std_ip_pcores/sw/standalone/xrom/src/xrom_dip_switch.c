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

#include <stdio.h>
#include "xrom_led.h"
#include "xrom_input.h"
#include "xgpio_l.h"
#include "xgpio.h"
#include "xparameters.h"
#include "memory_map.h"
#include "sleep.h"

#define DIP1 0x01
#define DIP2 0x02
#define DIP3 0x04
#define DIP4 0x08
#define DIP5 0x10
#define DIP6 0x20
#define DIP7 0x40
#define DIP8 0x80

void XromDipsInit(){
//	XGpio_mSetDataDirection(DIPSW_BASEADDR, 1, 0x003FC000);
	 XGpio gpio_dips;
    XGpio_Initialize(&gpio_dips,XPAR_DIP_SWITCHES_8BIT_DEVICE_ID);
	 XGpio_SetDataDirection(&gpio_dips, 1, 0x003FC000);
}

void XromTestDips(){

	unsigned short dataRead, oldDataRead;
	bool init=1;

	xil_printf("Press ESC to return to the main menu\r\n");
	oldDataRead = 0x0;

	while (1)
  	{
    	dataRead = XGpio_ReadReg(DIPSW_BASEADDR, 1);
    	dataRead = dataRead & 0xFF;  // Clear out "unused" bits
    	
		if((dataRead != oldDataRead) || init) {
			xil_printf("\r\n 1  2  3  4  5  6  7  8\r\n");

			if((dataRead & DIP1)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP2)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP3)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP4)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP5)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP6)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP7)>0) xil_printf(" * ");
				else 	xil_printf("   ");
			if((dataRead & DIP8)>0) xil_printf(" *\r\n");
				else 	xil_printf("  \r\n");

			oldDataRead = dataRead;
			init = 0;
		}

		if (WaitForEscape()){
			XGpio_WriteReg(DIPSW_BASEADDR, 1, 0x0);
			break;
		}
	}
	return;
}
