/*******************************************************************************
*
*     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
*     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR
*     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION
*     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION
*     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS
*     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
*     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
*     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
*     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
*     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
*     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
*     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
*     FOR A PARTICULAR PURPOSE.
*     
*     (c) Copyright 2007 Xilinx, Inc.
*     All rights reserved.
*
******************************************************************************/

#ifndef GRAPHICS_H
#define GRAPHICS_H

#include "basicgraphics.h"

/* from tft.c */
#define CHAR_WIDTH       	8
#define CHAR_HEIGHT      	12

void XTft_DrawButton(XTft *InstancePtr, int x, int y, 
		     char * text, int textLen, unsigned int baseColor);
void XTft_DrawFlashButton(XTft *InstancePtr, int x, int y, 
			  char * text, int textLen, unsigned int baseColor, unsigned int flashColor);
void XTft_DrawFixedSizeButton(XTft *InstancePtr, int x1, int y1, int x2, int y2, 
			      char * text, int textLen, unsigned int baseColor);
void XTft_DrawFixedSizeFlashButton(XTft *InstancePtr, int x1, int y1, int x2, int y2, 
				   char * text, int textLen, unsigned int baseColor, unsigned int flashColor);


#endif
