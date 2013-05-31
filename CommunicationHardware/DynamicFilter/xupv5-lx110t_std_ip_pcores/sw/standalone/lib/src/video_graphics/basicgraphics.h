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

#ifndef BASICGRAPHICS_H
#define BASICGRAPHICS_H

//#include "xtouchscreen.h"
#include "xtft.h"

void XTft_WriteString(XTft *InstancePtr, char *val);
int XTft_DrawPixel(XTft *InstancePtr, int x, int y, unsigned int col);
int XTft_DrawLine(XTft *InstancePtr, int x1, int y1, int x2, int y2, unsigned int col);
int XTft_DrawEmptyBox(XTft *InstancePtr, int x1, int y1, int x2, int y2, unsigned int col, int thickness);
int XTft_DrawSolidBox(XTft *InstancePtr, int x1, int y1, int x2, int y2, unsigned int col);
//int XTouchscreen_GetCoord(XTouchscreen *InstancePtr, Xuint32 *x, Xuint32 *y);
void CanvasClear(unsigned int col); // doesn't work yet

// Alvin's additions
//void InitGraphics(XTft *TftPtr, XTouchscreen *TouchscreenPtr, unsigned int fgCol, unsigned int bgCol);
void XTft_WriteColor(XTft *InstancePtr, unsigned char c, unsigned int fgcol, unsigned int bgCol);
void XTft_WriteColorString(XTft *InstancePtr, char *val, unsigned int fgCol, unsigned int bgCol);
void XTft_WriteColorCenteredString(XTft *InstancePtr, char * str, unsigned int fgCol, unsigned int bgCol, int ypos);
void XTft_WriteCenteredString(XTft *InstancePtr, char * str, int ypos);

#endif
