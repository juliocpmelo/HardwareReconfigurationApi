/*
 * Copyright (c) 2007 Xilinx, Inc.  All rights reserved.
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

#include "arch/cc.h"

#include "xparameters.h"
#include "xintc.h"

#ifdef __MICROBLAZE__
#include "mb_interface.h"
#include "xtmrctr_l.h"
#elif __PPC__
#include "xexception_l.h"
#include "xtime_l.h"
#endif

#include "lwip/tcp.h"

void cpu_invalidate_dcache_range(unsigned addr, unsigned len)
{
#ifdef __MICROBLAZE__
	microblaze_init_dcache_range(addr, len);
#endif
}

void platform_enable_interrupts()
{
#ifdef __MICROBLAZE__
	microblaze_enable_interrupts();
#elif  __PPC__
    	XExc_mEnableExceptions(XEXC_NON_CRITICAL);
#endif
}

void
timer_callback()
{
	static int odd = 1;
	tcp_fasttmr();

	odd = !odd;
	if (odd)
		tcp_slowtmr();
}

#ifdef __MICROBLAZE__
void 
xadapter_timer_handler(void *p)
{
	unsigned *timer_base = (unsigned *)XPAR_XPS_TIMER_0_BASEADDR;
	unsigned tcsr = 0;

	timer_callback();

        /* Load timer, clear interrupt bit */
        XTmrCtr_SetControlStatusReg(XPAR_XPS_TIMER_0_BASEADDR, 0, XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK);
	XTmrCtr_SetControlStatusReg(XPAR_XPS_TIMER_0_BASEADDR, 0, 
			XTC_CSR_ENABLE_TMR_MASK | XTC_CSR_ENABLE_INT_MASK 
			| XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_DOWN_COUNT_MASK);

        /* start the timer */
        //XTmrCtr_mSetControlStatusReg(XPAR_XPS_TIMER_0_BASEADDR, 0, XTC_CSR_ENABLE_TMR_MASK | XTC_CSR_ENABLE_INT_MASK);

	XIntc_AckIntr(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_TIMER_0_INTERRUPT_MASK);
}

#define MHZ 66
#define TIMER_TLR (25000000*((float)MHZ/100))

void
setup_timer()
{
	/* set the number of cycles the timer counts before interrupting */
	/* 100 Mhz clock => .01us for 1 clk tick. For 100ms, 10000000 clk ticks need to elapse  */
	XTmrCtr_SetLoadReg(XPAR_XPS_TIMER_0_BASEADDR, 0, TIMER_TLR);

	/* reset the timers, and clear interrupts */
	XTmrCtr_SetControlStatusReg(XPAR_XPS_TIMER_0_BASEADDR, 0, XTC_CSR_INT_OCCURED_MASK | XTC_CSR_LOAD_MASK );

	/* start the timers */
	XTmrCtr_SetControlStatusReg(XPAR_XPS_TIMER_0_BASEADDR, 0, 
			XTC_CSR_ENABLE_TMR_MASK | XTC_CSR_ENABLE_INT_MASK 
			| XTC_CSR_AUTO_RELOAD_MASK | XTC_CSR_DOWN_COUNT_MASK);

	/* Register Timer handler */
	XIntc_RegisterHandler(XPAR_XPS_INTC_0_BASEADDR,
			XPAR_XPS_INTC_0_XPS_TIMER_0_INTERRUPT_INTR,
			(XInterruptHandler)xadapter_timer_handler,
			0);

	XIntc_EnableIntr(XPAR_XPS_INTC_0_BASEADDR, XPAR_XPS_TIMER_0_INTERRUPT_MASK);
}
#else
#define MHZ 300
#define PIT_INTERVAL (250*MHZ*1000)
void 
xadapter_timer_handler(void *p)
{
	timer_callback();

	XTime_TSRClearStatusBits(XREG_TSR_CLEAR_ALL);
}

void
setup_timer()
{
#ifdef XPAR_CPU_PPC440_CORE_CLOCK_FREQ_HZ
        XExc_RegisterHandler(XEXC_ID_DEC_INT, (XExceptionHandler)xadapter_timer_handler, NULL);

        /* Set PIT to interrupt every 250 mseconds */
        XTime_DECSetInterval(PIT_INTERVAL);
        XTime_TSRClearStatusBits(XREG_TSR_CLEAR_ALL);
        XTime_DECEnableAutoReload();
        //XTime_DECEnableInterrupt();
#else 
	XExc_RegisterHandler(XEXC_ID_PIT_INT, (XExceptionHandler)xadapter_timer_handler, NULL);

	/* Set PIT to interrupt every 250 mseconds */
	XTime_PITSetInterval(PIT_INTERVAL);
	XTime_TSRClearStatusBits(XREG_TSR_CLEAR_ALL);
	XTime_PITEnableAutoReload();
	XTime_PITEnableInterrupt();
#endif
}
#endif

XIntc intc;

void platform_setup_interrupts()
{
	XIntc *intcp;
	intcp = &intc;

    	XIntc_Initialize(intcp, XPAR_XPS_INTC_0_DEVICE_ID);
	XIntc_Start(intcp, XIN_REAL_MODE);

	/* Start the interrupt controller */
	XIntc_MasterEnable(XPAR_XPS_INTC_0_BASEADDR);

#ifdef __PPC__
   	XExc_Init();
    	XExc_RegisterHandler(XEXC_ID_NON_CRITICAL_INT,
                         (XExceptionHandler)XIntc_DeviceInterruptHandler,
                         (void*) XPAR_XPS_INTC_0_DEVICE_ID);
#endif

	setup_timer();

#ifdef XPAR_ETHERNET_MAC_IP2INTC_IRPT_MASK
	/* Enable timer and EMAC interrupts in the interrupt controller */
	XIntc_EnableIntr(XPAR_XPS_INTC_0_BASEADDR, 
#ifdef __MICROBLAZE__
			XPAR_XPS_TIMER_0_INTERRUPT_MASK | 
#endif
		  XPAR_ETHERNET_MAC_IP2INTC_IRPT_MASK);
#endif

#ifdef __MICROBLAZE__
	microblaze_register_handler((XInterruptHandler)XIntc_InterruptHandler, intcp);
#endif
}
