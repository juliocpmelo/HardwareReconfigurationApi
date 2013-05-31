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
#include "xparameters.h"
#include "sleep.h"
#include "xrom_ps2.h"
#include "xgpio_l.h"
#include "xrom_push_button.h"
#include "xps2_l.h"
#include "xrom_lcd.h"
#include "xrom_input.h"

#define PS2_OLD_BASEADDR_0 XPAR_OPB_PS2_DUAL_REF_0_BASEADDR_0
#define PS2_OLD_BASEADDR_1 XPAR_OPB_PS2_DUAL_REF_0_BASEADDR_1


int XromPs2TestPort_Keyboard(unsigned int baseAdr)
{
  unsigned char c, status;

	xil_printf("Waiting for Keyboard Ack\r\n");
	xil_printf("  You should see output to the Terminal\r\n");
	xil_printf("  PS/2 keyboard scan codes are displayed\r\n\r\n");
	xil_printf("Press Escape to Finish or Abort\r\n\r\n");

	XromLCDClear();
	XromLCDPrint2Strings("Press Esc", "To Abort");

	XPs2_SendByte(baseAdr, 0xff);
	c = 0;

	do {
		// check if there's something to receive
		status = XPs2_mGetStatus(baseAdr);
	
		if (status & 0x1) {
			c = XPs2_RecvByte(baseAdr);
			xil_printf("%x ", c);
		}

		usleep(1);

	}while (!WaitForEscape());
	
	XromLCDClear();
	xil_printf("\r\n\r\n");
	return 1;
}

void XromTestPs2_Keyboard(void)
{
	char ch;

  	xil_printf("Plug keyboard into PS/2 \"MOUSE\" Port\r\n");
	xil_printf("After keyboard is plugged in, Press any key to continue\r\n\r\n");
	
	while(1){
		if(InputAvailable()) {
			ch = InputGetChar();
			break;
		}
	}

	XromPs2TestPort_Keyboard(PS2_OLD_BASEADDR_0);

	xil_printf("Plug keyboard into PS/2 \"KEYBOARD\" Port\r\n");
	xil_printf("After keyboard is plugged in, Press any key to continue\r\n\r\n");

	while(1){
		if(InputAvailable()) {
			ch = InputGetChar();
			break;
		}
	}

	XromPs2TestPort_Keyboard(PS2_OLD_BASEADDR_1);
	return;
}

