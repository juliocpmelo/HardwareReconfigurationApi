/*
 * Copyright (c) 2008 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include "platform_gpio.h"
#include "xparameters.h"

/* Based on the design the application is targeted to, the LEDs/DIP Switches
 * could have different names. The following macros just provide a single 
 * LED_BASE and DIP_BASE definition based on the design
 */
#if defined(XPAR_LEDS_8BIT_BASEADDR)
#define LED_BASE XPAR_LEDS_8BIT_BASEADDR 
#elif defined(XPAR_LEDS_4BIT_BASEADDR)
#define LED_BASE XPAR_LEDS_4BIT_BASEADDR
#endif

#if defined(XPAR_DIP_SWITCHES_8BIT_BASEADDR)
#define DIP_BASE XPAR_DIP_SWITCHES_8BIT_BASEADDR 
#elif defined(XPAR_DIPS_4BIT_BASEADDR)
#define DIP_BASE XPAR_DIPS_4BIT_BASEADDR
#elif defined(XPAR_PUSH_BUTTONS_POSITION_BASEADDR)
#define DIP_BASE XPAR_PUSH_BUTTONS_POSITION_BASEADDR
#endif

void
platform_init_gpios()
{
    /* set led gpio data direction to output */
    *(volatile unsigned int*)(LED_BASE + 4) = 0;

    /* set dip switch gpio data direction to in */
    *(volatile unsigned int*)(DIP_BASE + 4) = ~0;

    /* initialize leds to OFF */
    *(volatile int *)(LED_BASE) = 0;
}

int 
toggle_leds()
{
    static int state = 0;
    state = ~state;
    *(volatile int *)(LED_BASE) = state;
    return state;
}

unsigned int 
get_switch_state()
{
    return *(volatile unsigned int *)(DIP_BASE);
}
