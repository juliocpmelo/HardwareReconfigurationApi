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
* @file hello.c
*
* This "Hello world" program prints a string to the standard output using libc
* and the EDK generated board support package for standalone software.
* As characters are received on the standard input they are echoed to the
* standard output.
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
#include "xuartns550_l.h"
#include "xparameters.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#define ESCAPE          0x1b

static void echo(void)
{
  int c;
  do {
    c = getchar();
    if ((char) c == '\r')
      putchar((int) '\n');
    putchar(c);
  } while (c != ESCAPE);
}

int main()
{

    #ifdef PPC440CACHE
    XCache_EnableICache(PPC440_ICACHE);
    XCache_EnableDCache(PPC440_DCACHE);
    #endif

    XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
    XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

    printf("\r\nThis \"Hello world\" program prints the string to the\r\n");
    printf("standard output using libc and a board support package.\r\n");
    printf("It then echoes characters received on the standard input to\r\n");
    printf("the standard output.\r\n\r\n");
    printf("Hello world!\r\n\r\n");
    echo();

    #ifdef PPC440CACHE
    XCache_DisableDCache();
    XCache_DisableICache();
    #endif
    return 0;
}
