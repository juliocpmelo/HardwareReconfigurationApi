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


#define ADDRESS_INCREMENT 0x800000

int main()
{
  char *lcd_text = "Design #0 Loaded";
  XTft Tft;
  XStatus Status;
  //  Xuint32 i;
  char *vga_text = "This is flash configuration 0";

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
  XTft_WriteColorString(&Tft, "The FPGA has been configured from the Linear Flash memory (BPI Mode)", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 5, 15);
  vga_text[28] = CONFIGURATION + '0'; 
  XTft_WriteColorString(&Tft, vga_text, 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 5, 45);

  xil_printf("\n\rThe FPGA has been configured from the Linear Flash memory (BPI Mode)\n\r");
  xil_printf("This is flash configuration %d\n\r", CONFIGURATION);
  xil_printf("On the reference design, this bit file is at memory location 0x%08X\n\r",
             FLASH_BASEADDR + (CONFIGURATION * ADDRESS_INCREMENT));
  xil_printf("\n\r\n\r");

  /* print directions to LCD screen */
  LCDOn();
  LCDInit();

  //lcd_text[8] = CONFIGURATION + '0';
  LCDPrintString (lcd_text, "Using Flash");

  while (1) {}
  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}

