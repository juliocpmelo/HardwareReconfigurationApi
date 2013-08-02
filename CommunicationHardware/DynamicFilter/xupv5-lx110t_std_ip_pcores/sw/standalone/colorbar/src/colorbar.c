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
*
* @file colorbar.c
*
* TGenerates a colorbar pattern
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xio.h"
#include "xparameters.h"
#include "xtft.h"
#include "memory_map.h"
#include "xuartns550_l.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#define DISPLAY_COLUMNS  640
#define DISPLAY_ROWS     480

int XTft_DrawSolidBox(XTft *Tft, int x1, int y1, int x2, int y2, unsigned int col)
{
   int xmin,xmax,ymin,ymax,i,j;

   if (x1 >= 0 &&
       x1 <= DISPLAY_COLUMNS-1 &&
       x2 >= 0 &&
       x2 <= DISPLAY_COLUMNS-1 &&
       y1 >= 0 &&
       y1 <= DISPLAY_ROWS-1 &&
       y2 >= 0 &&
       y2 <= DISPLAY_ROWS-1) {
      if (x2 < x1) {
         xmin = x2;
         xmax = x1;
      }
      else {
         xmin = x1;
         xmax = x2;
      }
      if (y2 < y1) {
         ymin = y2;
         ymax = y1;
      }
      else {
         ymin = y1;
         ymax = y2;
      }

      for (i=xmin; i<=xmax; i++) {
         for (j=ymin; j<=ymax; j++) {
	   XTft_SetPixel(Tft, i, j, col);
         }
      }
      return 0;
   }
   return 1;

}

int main(){

  XTft Tft;

  XTft_Initialize(&Tft, TFT_DEVICE_ID);
  
  #ifdef PPC440CACHE
  XCache_EnableICache(PPC440_ICACHE);
  XCache_EnableDCache(PPC440_DCACHE);
  #endif

  XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
  XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

  xil_printf("  Display color ");
  xil_printf("\r\n");
  XTft_SetColor(&Tft, 0, 0);
  XTft_ClearScreen(&Tft);
  
  xil_printf("  Writing Color Bar Pattern\r\n");

  XTft_DrawSolidBox(&Tft,   0, 0, 79,479,0x00ffffff); // white
  XTft_DrawSolidBox(&Tft,  80, 0,159,479,0x00ff0000); // red
  XTft_DrawSolidBox(&Tft, 160, 0,239,479,0x0000ff00); // green
  XTft_DrawSolidBox(&Tft, 240, 0,319,479,0x000000ff); // blue
  XTft_DrawSolidBox(&Tft, 320, 0,399,479,0x00ffffff); // white
  XTft_DrawSolidBox(&Tft, 400, 0,479,479,0x00AAAAAA); // grey
  XTft_DrawSolidBox(&Tft, 480, 0,559,479,0x00777777); // not-so-grey
  XTft_DrawSolidBox(&Tft, 560, 0,639,479,0x00333333); // lite grey


  xil_printf("  TFT test completed!\r\n");
  xil_printf("  You should see vertical color and grayscale bars\r\n");
  xil_printf("  across your VGA Output Monitor\r\n\r\n");
  
  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}