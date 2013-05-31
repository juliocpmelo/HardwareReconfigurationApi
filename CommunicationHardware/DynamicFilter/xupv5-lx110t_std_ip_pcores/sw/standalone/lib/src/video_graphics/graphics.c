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

#include "graphics.h"

#define BUTTON_HEIGHT 	 	40
#define BUTTON_WIDTH_PAD 	10
#define BUTTON_3D_PAD 		2

#define TEXT_COLOR 		0x000000

static int strlen(char * str);

void XTft_DrawFixedSizeFlashButton(XTft *InstancePtr,
				   int x1, int y1, int x2, int y2, 
				   char * text, int len, 
				   unsigned int baseColor, unsigned int flashColor)
{
  
  int i, j;
  int xpos;
  int ypos;
  int textLen;
  
  textLen = (len == -1) ? strlen(text) : len;
  xpos = (x2 - x1) / 2 + x1 - (textLen * CHAR_WIDTH) / 2;
  ypos = y1 + ((y2 - y1) / 2) - CHAR_HEIGHT /2;
  
#ifdef SIMPLE_BUTTON
  XTft_DrawEmptyBox(InstancePtr, 
		    x1 - BUTTON_3D_PAD - 1, y1 - BUTTON_3D_PAD - 1,
		    x2 + BUTTON_3D_PAD + 1, y2 + BUTTON_3D_PAD + 1, 
		    0x000000, 1);
  
  /* black */
  XTft_DrawSolidBox(InstancePtr,
		    x1, y1, 
		    x2 + BUTTON_3D_PAD, y2 + BUTTON_3D_PAD, 
		    0x000000);
  
  /* white */
  XTft_DrawSolidBox(InstancePtr,
		    x1 - BUTTON_3D_PAD, y1 - BUTTON_3D_PAD, 
		    x2, y2, 
		    0xFFFFFF);
#endif
  
  if (baseColor == flashColor) {
    XTft_DrawSolidBox(InstancePtr, x1, y1, x2, y2, baseColor);
    if (textLen > 0) {
      XTft_SetPos(InstancePtr, xpos, ypos);
      XTft_WriteColorString(InstancePtr, text, TEXT_COLOR, baseColor);
    }
    return;
  }
  else {
    for (i = 0; i < 3; i++) {
      if (i % 2) {
	XTft_DrawSolidBox(InstancePtr, x1, y1, x2, y2, baseColor);
	if (textLen > 0) {
	  XTft_SetPos(InstancePtr, xpos, ypos);
	  XTft_WriteColorString(InstancePtr, text, TEXT_COLOR, baseColor);
	}
	    }
      else {
	XTft_DrawSolidBox(InstancePtr, x1, y1, x2, y2, flashColor);
	if (textLen > 0) {
	  XTft_SetPos(InstancePtr, xpos, ypos);
	  XTft_WriteColorString(InstancePtr, text, TEXT_COLOR, flashColor);
	}
      }
      
      for (j = 0; j < 3000000; j++) {} /* sleep */
    }
  }
}

void XTft_DrawButton(XTft *InstancePtr,
		     int x, int y, char * text, int textLen,
		     unsigned int baseColor)
{
  int totalWidth = CHAR_WIDTH * textLen + 2 * BUTTON_WIDTH_PAD;
  XTft_DrawFixedSizeFlashButton(InstancePtr, 
				x, y, 
				x + totalWidth, y + BUTTON_HEIGHT, 
				text, textLen, baseColor, baseColor);
}

void XTft_DrawFixedSizeButton(XTft *InstancePtr,
			      int x1, int y1, int x2, int y2, char * text, int textLen,
			      unsigned int baseColor)
{
  XTft_DrawFixedSizeFlashButton(InstancePtr, x1, y1, x2, y2, 
				text, textLen, baseColor, baseColor);
}


void XTft_DrawFlashButton(XTft *InstancePtr,
			  int x, int y, char * text, int textLen,
			  unsigned int baseColor, unsigned int flashColor)
{
	int totalWidth = CHAR_WIDTH * textLen + 2 * BUTTON_WIDTH_PAD;
	XTft_DrawFixedSizeFlashButton(InstancePtr, 
				      x, y, x + totalWidth, y + BUTTON_HEIGHT, 
				      text, textLen, baseColor, flashColor);
}

static int strlen(char * str)
{
  int count = 0;
  int i = 0;
  
  while(str[i]) {
    count++;
    i++;
  }

  return count;
}



