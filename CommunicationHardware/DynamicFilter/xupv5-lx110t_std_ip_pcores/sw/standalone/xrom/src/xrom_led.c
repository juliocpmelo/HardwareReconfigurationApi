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

#include "globaltypes.h"
#include "sleep.h"
#include "xrom_lcd.h"
#include "xgpio_l.h"
#include "xgpio.h"
#include "xparameters.h"
#include "xrom_push_button.h"
#include "xrom_input.h"
#include <stdio.h>
#include "memory_map.h"

void XromLedInit(void)
{
//  XGpio_mSetDataDirection(GPIO_LEDS_BASEADDR, 1, 0x00);
//  XGpio_mSetDataDirection(ERR_LEDS_BASEADDR, 1, 0x0);
	 XGpio gpio_leds_x;
	 XGpio error_leds;
	 
	 XGpio_Initialize(&gpio_leds_x,GPIO_LEDS_DEVICE_ID);
	 XGpio_Initialize(&error_leds,ERR_LEDS_DEVICE_ID);
	 
	 XGpio_SetDataDirection(&gpio_leds_x, 1, 0x00000000);
	 XGpio_SetDataDirection(&error_leds, 1, 0x00000000);
}

void XromTestLed(void)
{
  int i, moveRight;
  unsigned short eightbit_value, position_value;

  position_value = 0x01;
  eightbit_value = 0x01;
  moveRight = 0;
  i = 0;

  XromPBsInit();	
	xil_printf("You should see the LEDs move in a pattern\r\n");
	xil_printf("Press ESC to return to the main menu\r\n");

  for (;;)
  {
	usleep(250000);


	if(eightbit_value == 0x01){
		moveRight = 0;
		eightbit_value = eightbit_value*2;
	}

	else if(eightbit_value == 0x80){
		moveRight = 1;
		eightbit_value = eightbit_value/2;
	}

	else{
		if(moveRight) eightbit_value = eightbit_value /2;
		else	eightbit_value = eightbit_value *2;
	}
		
/*	if(eightbit_value == 0x00000010)
  	    eightbit_value = 0x08000000;
	else if(eightbit_value == 0x04000000)
  	    eightbit_value = 0x00000008;
*/
	
	switch(i){
	case 0:	position_value = 0x01; break;
	case 1:	position_value = 0x02; break;
	case 2:	position_value = 0x04; break;
	case 3:	position_value = 0x08; break;
	case 4:	position_value = 0x10; break;
	}

	if(i%2) {XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x1);}
	else {XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x2);}

	if(i==5) i=0;
	else i++;

	XGpio_WriteReg(GPIO_LEDS_BASEADDR, 1, eightbit_value);
    XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, position_value);

	if(WaitForEscape()) break;
  }
	
  XGpio_WriteReg(GPIO_LEDS_BASEADDR, 1, 0x0);
  XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x0);
  /*XGpio_mSetDataDirection(ERR_LEDS_BASEADDR, 1, 0x0000003C);*/

}
