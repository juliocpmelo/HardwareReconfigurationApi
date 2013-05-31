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
#include "globaltypes.h"
#include "sleep.h"
#include "xgpio_l.h"
#include "xgpio.h"
#include "xparameters.h"
#include "memory_map.h"
#include "xrom_push_button.h"
#include "xrom_lcd.h"

#define N_IN 0x00400000
#define N_OUT 0x01000000
#define P_IN 0x00800000
#define P_OUT 0x02000000

void XromTestSma()
{
	unsigned long result;
	bool one, two, three;

	one=two=three=false;

		//=====================================================
      XGpio lcd;
      XGpio_Initialize(&lcd,LCD_DEVICE_ID);
	   XGpio_SetDataDirection(&lcd, 1, 0x00C00000);

//		XGpio_mSetDataDirection(LCD_BASEADDR, 1, 0x00C00000);
		XGpio_WriteReg(LCD_BASEADDR, 1, 0x00000000);

		XromLCDClear();
		XromLCDPrint2Strings("Testing SMA Port", "Please Wait.....");
		sleep(1);

		result = XGpio_ReadReg(LCD_BASEADDR, 1) & 0x00C00000;
		xil_printf("Writing 0's Across Both SMA Cables...");
		if(result == 0x00000000) one = true;

		xil_printf("RESULT = %x  EXPECTED = %x\r\n", result, 0x00000000);
		//=====================================================
		XGpio_WriteReg(LCD_BASEADDR, 1, 0x01000000);
		
		result = XGpio_ReadReg(LCD_BASEADDR, 1) & 0x00C00000;
		xil_printf("Writing 1's Across Positive SMA Cable...");
		if(result == 0x00400000) two = true;

		xil_printf("RESULT = %x  EXPECTED = %x\r\n", result, 0x00400000);
		//=====================================================
		XGpio_WriteReg(LCD_BASEADDR, 1, 0x02000000);
		
		result = XGpio_ReadReg(LCD_BASEADDR, 1) & 0x00C00000;
		xil_printf("Writing 1's Across Negative SMA Cable...");
		if(result == 0x00800000) three = true;

		xil_printf("RESULT = %x  EXPECTED = %x\r\n", result, 0x00800000);
		//=====================================================

	if(one && two && three){
		XromLCDClear();
		XromLCDPrintString("Test Passed");
		xil_printf("Test Passed\r\n\r\n");
	}

	else{
		XromLCDClear();
		XromLCDPrintString("Test Failed");
		xil_printf("Test Failed\r\n\r\n");
	}

	XGpio_WriteReg(LCD_BASEADDR, 1, 0x00000000); 
//	XGpio_mSetDataDirection(LCD_BASEADDR, 1, 0x00000000);
   XGpio_SetDataDirection(&lcd, 1, 0x00000000);
}
