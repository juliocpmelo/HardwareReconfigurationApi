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
/*****************************************************************************/
/**
* @file button_led_test.c
*
* This example uses the EDK GPIO peripheral to exercise the following 
* peripherals on the ML505/ML506/ML507 board:
*   GPIO LEDs 0-7     (DS17-DS10)
*   GPIO DIP Switch   (SW8)
*   ERR1, ERR2 LEDs   (DS6,DS5)
*   Pushbuttons     - Center,West,South,East,North (SW14,SW13,SW11,SW12,SW10)
*   Pushbutton LEDs - Center,West,South,East,North (DS24,DS23,DS22,DS21,DS20)
*
* @note
*
* None.
*
* <pre>
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/
#include "xgpio_l.h"
#include "xgpio.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "memory_map.h"
#include "xbasic_types.h"
#ifdef PPC440CACHE
#include "xcache_l.h"
#endif


/************************** Constant Definitions *****************************/
#define SHOW_BIT_ACCESS /* Undefine this for smaller version of code */
//#undef SHOW_BIT_ACCESS
 

static void myprintf(char *s)
{
  while (*s) {
    XUartNs550_SendByte(UART_BASEADDR, *s);
    s++;
  }
}

int main()
{
    XGpio leds_cwsen_x;
	 XGpio gpio_leds_x;
	 XGpio error_leds;
	 
  /* set gpio bits as outputs to POSITION LEDs */	 
    XGpio_Initialize(&leds_cwsen_x,LEDS_CWSEN_DEVICE_ID);
	 XGpio_SetDataDirection(&leds_cwsen_x, 1, 0x00000000);
	 
  /* set gpio bits as outputs to GPIO LEDs */
	 XGpio_Initialize(&gpio_leds_x,GPIO_LEDS_DEVICE_ID);
	 XGpio_SetDataDirection(&gpio_leds_x, 1, 0x00000000);
	 
  /* set gpio bits as outputs to ERROR LEDs */
	 XGpio_Initialize(&error_leds,ERR_LEDS_DEVICE_ID);
	 XGpio_SetDataDirection(&error_leds, 1, 0x00000000);
	 	 
#ifdef SHOW_BIT_ACCESS
	 Xboolean button_n, button_e, button_s, button_w, button_c;
	 Xboolean led_n, led_e, led_s, led_w, led_c;
	 Xboolean gpio_led3, gpio_led2, gpio_led1, gpio_led0;
	 Xboolean gpio_led7, gpio_led6, gpio_led5, gpio_led4;
	 Xboolean dip_sw8, dip_sw7, dip_sw6, dip_sw5, dip_sw4, dip_sw3, dip_sw2, dip_sw1; 
    unsigned int gpio_leds;
    unsigned int leds_cwsen;
#else
    unsigned int pushb_cwsen;
    unsigned int dipsw;
#endif

    #ifdef PPC440CACHE
    XCache_EnableICache(PPC440_ICACHE);
    XCache_EnableDCache(PPC440_DCACHE);
    #endif

    /* Setup 16550 Uart */
    XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
    XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

    /* Set GPIO bits as inputs or outputs */
//    XGpio_mSetDataDirection(GPIO_LEDS_BASEADDR, 1, 0x00000000);   // All Outputs
//    XGpio_mSetDataDirection(ERR_LEDS_BASEADDR, 1, 0x00000000);    // All Outputs
//    XGpio_mSetDataDirection(LEDS_CWSEN_BASEADDR, 1, 0x00000000);  // All Outputs
//    XGpio_mSetDataDirection(PUSHB_CWSEN_BASEADDR, 1, 0xFFFFFFFF); // All Inputs
//    XGpio_mSetDataDirection(DIPSW_BASEADDR, 1, 0xFFFFFFFF);       // All Inputs

    myprintf("Button and LED Test\r\n\r\n");
    myprintf("  Use DIP switch SW8 to turn on/off GPIO LEDs 0-7\r\n");
    myprintf("  Use Pushbuttons (C,W,S,E,N) to turn on corresponding LEDs\r\n");
    myprintf("  and the ERR1, ERR2 LEDs\r\n");
    while (1) 
    {

#ifdef SHOW_BIT_ACCESS
    button_c = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 4) & (0x00000001);
    button_w = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 3) & (0x00000001);
    button_s = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 2) & (0x00000001);
    button_e = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 1) & (0x00000001);
    button_n = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 0) & (0x00000001);

    dip_sw1  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 7) & (0x00000001);
    dip_sw2  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 6) & (0x00000001);
    dip_sw3  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 5) & (0x00000001);
    dip_sw4  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 4) & (0x00000001);
    dip_sw5  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 3) & (0x00000001);
    dip_sw6  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 2) & (0x00000001);
    dip_sw7  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 1) & (0x00000001);
    dip_sw8  = (XGpio_ReadReg(DIPSW_BASEADDR, 1) >> 0) & (0x00000001);

    led_c = button_c;
    led_w = button_w;
    led_s = button_s;
    led_e = button_e;
    led_n = button_n;

    gpio_led7 = dip_sw8;
    gpio_led6 = dip_sw7;
    gpio_led5 = dip_sw6;
    gpio_led4 = dip_sw5;
    gpio_led3 = dip_sw4;
    gpio_led2 = dip_sw3;
    gpio_led1 = dip_sw2;
    gpio_led0 = dip_sw1;

    gpio_leds = ((unsigned int) (gpio_led7) << 7)
              | ((unsigned int) (gpio_led6) << 6)
              | ((unsigned int) (gpio_led5) << 5)
              | ((unsigned int) (gpio_led4) << 4)
              | ((unsigned int) (gpio_led3) << 3)
              | ((unsigned int) (gpio_led2) << 2)
              | ((unsigned int) (gpio_led1) << 1)
              | ((unsigned int) (gpio_led0) << 0);
    XGpio_WriteReg(GPIO_LEDS_BASEADDR, 1, gpio_leds);

    leds_cwsen = ((unsigned int) (led_c) << 4)
               | ((unsigned int) (led_w) << 3)
               | ((unsigned int) (led_s) << 2)
               | ((unsigned int) (led_e) << 1)
               | ((unsigned int) (led_n) << 0);
    XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, leds_cwsen);

    if( button_c | button_w | button_s | button_e | button_n )
    {
         XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x3);
    }
    else
    {
         XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x0);
    }

#else 
/*************************************************************
 * This section of code is activated when SHOW_BIT_ACCESS is
 * undefined.  
 * The code within this section is much smaller and
 * provides equivalent functionality as the code outside this
 * section but does not break out the individual GPIO bits.
 *************************************************************/
 
    dipsw = XGpio_ReadReg(DIPSW_BASEADDR, 1);
    XGpio_WriteReg(GPIO_LEDS_BASEADDR, 1, dipsw);

    pushb_cwsen = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1);
    XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, pushb_cwsen);

    if( pushb_cwsen != 0)
    {
         XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x3);
    }
    else
    {
         XGpio_WriteReg(ERR_LEDS_BASEADDR, 1, 0x0);
    }

#endif 

    }
    #ifdef PPC440CACHE
    XCache_DisableDCache();
    XCache_DisableICache();
    #endif
    return 0;
}
