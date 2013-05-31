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

#ifndef XROM_LCD_H
#define XROM_LCD_H

//=====================
//	TEST FUNCTIONS
//=====================
void XromLCDTest();
void LCDTestMenu();
void LCDTestInput(char ch);


//=====================
//	EXTERNAL FUNCTIONS
//=====================
void XromLCDOn();
void XromLCDOff();
void XromLCDClear();
void XromLCDInit();

void XromMoveCursorHome();
void XromMoveCursorRight();
void XromMoveCursorLeft();

void XromLCDSetLine(int line);

void XromLCDPrintChar(char c);
void XromLCDPrintString(char * line);
void XromLCDPrint2Strings(char * line1, char * line2);

void XromLCDPrintNum(unsigned int x, unsigned int base);
void XromLCDPrintInt(unsigned int x);
void XromLCDPrintFloat(float x, int precision);

//=====================
//	INTERNAL FUNCTIONS
//=====================
void XromInitInst(void);
void XromWriteInst(unsigned long inst1, unsigned long inst2);
void XromWriteData(unsigned long data1, unsigned long data2);

#endif
