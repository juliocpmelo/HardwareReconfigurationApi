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
/***************************** Include Files *********************************/

#include <stdio.h>
#include "xio.h"
#include "xbasic_types.h"
#include "xstatus.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "lcd.h"
#include "xtft.h"
#include "xtft_l.h"
#include "graphics.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#define STATUS_CHECK(Status) { if (Status != XST_SUCCESS) { return Status; } }


int main()
  {
  XTft Tft;
  XStatus Status;

  #ifdef PPC440CACHE
  XCache_EnableICache(PPC440_ICACHE);
  XCache_EnableDCache(PPC440_DCACHE);
  #endif

  XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
  XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

  /* Initialize TFT */
  Status = XTft_Initialize(&Tft, TFT_DEVICE_ID);
  STATUS_CHECK(Status);
  
  /* Initialize TFT and display */
  XTft_SetColor(&Tft, 0x00ffffff, 0x00404040);
  XTft_ClearScreen(&Tft);
  XTft_SetPos(&Tft, 5, 0);
  XTft_WriteColorString(&Tft, "*** Put Your Own Platform Flash Design Here! ***", 0x0000FF80, 0x00404040);

  xil_printf ("*** Put Your Own Platform Flash Design Here! ***\r\n\r\n");

  LCDOn();
  LCDInit();
  LCDPrintString ("Put Your Own","Design Here!");

  while (1) {}
  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}
