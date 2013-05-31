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
#include "xrom_led.h"
#include "xgpio_l.h"
#include "xgpio.h"
#include "memory_map.h"
#include "xparameters.h"
#include "sleep.h"
#include "xrom_push_button.h"
#include "xrom_lcd.h"


void XromPBsInit(){
//	XGpio_mSetDataDirection(PUSHB_CWSEN_BASEADDR, 1, 0x1F);
//	XGpio_mSetDataDirection(LEDS_CWSEN_BASEADDR, 1, 0x00);
    XGpio leds_cwsen_x;
    XGpio_Initialize(&leds_cwsen_x,LEDS_CWSEN_DEVICE_ID);
	 XGpio_SetDataDirection(&leds_cwsen_x, 1, 0x00000000);
}

int XromCheckButton(unsigned short button){
	unsigned short dataRead;

	dataRead = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) & 0x1F;

	if(dataRead == button) return 1;
	else return 0;
}

void XromPBAutoTest(){
	
	int i;
	unsigned short lights, dataRead;
	bool NB, SB, EB, WB, CB;

	NB = SB = EB = WB = CB = false;
	
	xil_printf("Press Each Push Button\r\n");
	xil_printf("If you do not press each button, the test will fail in 30 seconds\r\n\r\n");

	lights = 0x00;

	for(i=0;i<30000000;i++){

		dataRead = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1);
	    dataRead = dataRead & 0x1F;  // Clear out "unused" bits

		switch (dataRead)
     	{
      	case N_SW:
	        NB = true;
			lights = lights | dataRead;
        	break;
      	case E_SW:
			EB = true;
	        lights = lights | dataRead;
        	break;
      	case S_SW:
			SB = true;
	        lights = lights | dataRead;
        	break;
      	case W_SW:
			WB = true;
	        lights = lights | dataRead;
        	break;
      	case C_SW:
			CB = true;
	        lights = lights | dataRead;
        	break;
		}

		XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, lights);


		if(NB && SB && WB && EB && CB){
			//add logging
			XromLCDClear();
			XromLCDPrintString("Test Passed");
			xil_printf("Test Passed\r\n\r\n");
			
			XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, 0x0); //turn off LEDs
			return;
		}
		
		usleep(1);
	}

	XromLCDClear();
	XromLCDPrintString("Test Failed");
	xil_printf("Test Failed\r\n\r\n");
	//add logging

}

