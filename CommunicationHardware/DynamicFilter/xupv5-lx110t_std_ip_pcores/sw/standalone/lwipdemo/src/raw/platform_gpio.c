#include "platform_gpio.h"
#include "xparameters.h"

#if defined(XPAR_LEDS_8BIT_BASEADDR)
#define LED_BASE XPAR_LEDS_8BIT_BASEADDR 
#elif defined(XPAR_LEDS_4BIT_BASEADDR )
#define LED_BASE XPAR_LEDS_4BIT_BASEADDR 
#endif

#if defined(XPAR_DIP_SWITCHES_8BIT_BASEADDR)
#define DIP_BASE XPAR_DIP_SWITCHES_8BIT_BASEADDR 
#elif defined(XPAR_DIPS_4BIT_BASEADDR)
#define DIP_BASE XPAR_DIPS_4BIT_BASEADDR
#elif defined(XPAR_PUSH_BUTTONS_POSITION_BASEADDR )
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
