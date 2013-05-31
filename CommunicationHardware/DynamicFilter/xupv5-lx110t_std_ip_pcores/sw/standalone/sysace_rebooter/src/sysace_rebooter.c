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
* @file sysace_rebooter.c
*
* This application demonstrates the ability of an embedded processor to
* initiate a hardware and/or software reconfiguration using the
* System ACE CF controller.
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
#include <stdio.h>
#include "xio.h"
#include "xsysace_l.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif


/************************** Constant Definitions *****************************/
int main()
{
    Xuint8 c;

    #ifdef PPC440CACHE
    XCache_EnableICache(PPC440_ICACHE);
    XCache_EnableDCache(PPC440_DCACHE);
    #endif

    XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
    XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

    xil_printf("This program issues a command to system ace to cause\r\n");
    xil_printf("it to reboot to the System ACE address entered below\r\n\r\n");
    xil_printf("Which System ACE config address would you like to reboot to (0-7)?\r\n");
    do
    {
      // Wait for a char to be typed before continuing
      while (!(XUartNs550_GetLineStatusReg(UART_BASEADDR) & 0x1));
      c = XUartNs550_RecvByte(UART_BASEADDR);

    }  while (((char) c != '0') && ((char) c != '1')
           && ((char) c != '2') && ((char) c != '3')
           && ((char) c != '4') && ((char) c != '5')
           && ((char) c != '6') && ((char) c != '7'));
    xil_printf("\r\n\r\nRebooting to System ACE configuration address... %c\r\n",c);

    c = (char) c - '0';
    XSysAce_RegWrite16(SYSACE_BASEADDR + XSA_BMR_OFFSET, XSA_BMR_16BIT_MASK);
    XSysAce_SetControlReg(SYSACE_BASEADDR, XSA_CR_CFGRESET_MASK);
    XSysAce_SetControlReg(SYSACE_BASEADDR, (c << XSA_CR_CFGADDR_SHIFT) |
                                             XSA_CR_FORCECFGADDR_MASK |
                                             XSA_CR_CFGMODE_MASK |
                                             XSA_CR_CFGSTART_MASK);
    while (1);
    #ifdef PPC440CACHE
    XCache_DisableDCache();
    XCache_DisableICache();
    #endif
    return 0;
}
