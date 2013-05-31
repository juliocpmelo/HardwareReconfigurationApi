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
* @file hello_uart_1.c
*
* The low level UART driver I/O routines are used to print "Hello World!" to
* the COM2 (J61) header pins and then continually echo any
* characters typed on the keyboard.
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
#include "xuartns550_l.h"
#include "xparameters.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#define ESCAPE          0x1b

static void myprintf(char *s)
{
  while (*s) {
    XUartNs550_SendByte(UART2_BASEADDR, *s);
    s++;
  }
}

void echo()
{
  char s;
  
  do {
    s = XUartNs550_RecvByte(UART2_BASEADDR);
    if(s == '\r')
      XUartNs550_SendByte(UART2_BASEADDR, '\n');
    XUartNs550_SendByte(UART2_BASEADDR, s); 
  } while (s != ESCAPE);
}

int main()
{

  #ifdef PPC440CACHE
  XCache_EnableICache(PPC440_ICACHE);
  XCache_EnableDCache(PPC440_DCACHE);
  #endif

  XUartNs550_SetBaud(UART2_BASEADDR, UART_CLOCK, UART_BAUDRATE);
  XUartNs550_SetLineControlReg(UART2_BASEADDR, XUN_LCR_8_DATA_BITS);
  
  myprintf("Hello world! Using low-level UART driver\r\n");
  echo();
  
  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}
