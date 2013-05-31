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

#include "xrom_main.h"
#include "xrom_input.h"
#include "memory_map.h"
#include "xparameters.h"
#include <stdio.h>

bool InputAvailable()
{
  return (bool) (XUartNs550_GetLineStatusReg(UART_BASEADDR) & 0x1);
}

char InputGetChar()
{
  char ch;
  
  while (!InputAvailable()) {};
  ch = XUartNs550_RecvByte(UART_BASEADDR);
  return ch;
  
}

void InputGetMenu()
{
  if (InputAvailable())
    handleInput(InputGetChar());
}


bool WaitForEnter(void)
{
  char ch;

  if(InputAvailable())
  {
    ch = InputGetChar();
    if(ch == ENTER)
      return true;
  }
  return false;
}

bool WaitForEscape(void)
{
  char ch;

  if(InputAvailable())
  {
    ch = InputGetChar();
    if(ch == ESCAPE)
		return true;
  }
  return false;
}

bool WaitForTab(void)
{
  char ch;

  if (InputAvailable())
  {
    ch = InputGetChar();
    if(ch == TAB)
      return true;
  }
  return false;
}

void printfloat(double x, int precision)
{
	int x_precision, i, x_int, rightOfDecimal;
	int multiplier = 1;

	x_int = x;
	xil_printf("%d", x_int);
	xil_printf(".");

	for(i=0; i<precision; i++)
		multiplier *= 10;

	x_precision = x * multiplier;
	rightOfDecimal = x_precision % multiplier;

	multiplier = 10;
	for(i=0; i<precision-1; i++){
		if(rightOfDecimal < multiplier)
			xil_printf("0");
		
		multiplier *= 10;
	}

	xil_printf("%d", rightOfDecimal);
}

void print_space(int num)
{
	while(num>0){
		xil_printf(" ");
		num--;
	}
}

void print_long_hex(long num)
{
	int i=0, shift_amt=0, num_temp=0;
	xil_printf("0x");
	
	for(i=1; i<=8; i++){
		shift_amt = 64 - 4*i;
		num_temp = num >> shift_amt;
		num_temp = num_temp & 0x0000000F;
		xil_printf("%x", num_temp);
	}
}

void print_longlong_hex(long long num)
{
	int i=0, shift_amt=0, num_temp=0;
	xil_printf("0x");
	
	for(i=1; i<=16; i++){
		shift_amt = 64 - 4*i;
		num_temp = num >> shift_amt;
		num_temp = num_temp & 0x000000000000000F;
		xil_printf("%x", num_temp);
	}
}
