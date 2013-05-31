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
#include "globaltypes.h"
#include "xrom_version.h"
#include "xuartns550_l.h"
#include "xrom_main.h"
#include "xrom_input.h"
#include "xrom_tests.h"
#include "xrom_lcd.h"
#include "xparameters.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#ifdef BOARDNUM
#define HEADER_STRING    "XROM for"
#else
#define BOARDNUM 401
#define HEADER_STRING    "XROM for"
#endif

  static unsigned int baudRates[] =
  {
    300,
    600,
    1200,
    2400,
    4800,
    9600,
    19200,
    38400,
    57600,
    115200
  };

#define DEFAULTBAUDRATE      5
#define MAXBAUDRATES      (sizeof(baudRates) / sizeof(unsigned int))

unsigned int UartBaseAdr;
unsigned int UartBaud;
static unsigned int NewUartBaseAdr;
static unsigned int NewUartBaud;

MenuProc printMenu;
InputProc handleInput;
bool doPrintMenu;

typedef struct MenuStackEntry
{
  MenuProc menu;
  InputProc input;
} MenuStackEntry;

struct MenuStackEntry MenuStack[5];
int menuStackPtr = 0;

void PushMenu(MenuProc menu, InputProc input)
{
  /*  assert(menuStackPtr < 5); */
  MenuStack[menuStackPtr].menu = menu;
  MenuStack[menuStackPtr].input = input;
  menuStackPtr++;
}

void PopMenu(MenuProc *menu, InputProc *input)
{
  /*  assert(menuStackPtr > 0); */
  menuStackPtr--;
  *menu = MenuStack[menuStackPtr].menu;
  *input = MenuStack[menuStackPtr].input;
}

static void XromMenu(void)
{
#ifndef SPEED_UP
  xil_printf("\r\n%s", HR);
  xil_printf("%s ML%d %s\r\n", HEADER_STRING, BOARDNUM, VERSION_STRING);
  xil_printf("%s\r\n", HR);
#endif

  xil_printf("  1. Tests\r\n");
/*
#ifndef V2PDK
  xil_printf("  2. Communication settings\r\n");
#endif
*/
}

void ComMenu()
{
  xil_printf("\r\nMain.Communication Settings\r\n");
  xil_printf("  1. Select UART: UART");
  
  if (NewUartBaseAdr == UART_BASEADDR)
    xil_printf("1");
  else
    xil_printf("2");

  xil_printf("\r\n  2. Select baud rate: %d\r\n", baudRates[NewUartBaud]);
  xil_printf("  0. Set and Exit to Main Menu\r\n");
}

void ComInput(char ch)
{
  switch(ch)
  {
  case '1':
    doPrintMenu = true;
    break;
  case '2':
    NewUartBaud = (NewUartBaud + 1) % MAXBAUDRATES;
    doPrintMenu = true;
    break;
  case '0':
    UartBaseAdr = NewUartBaseAdr;
    UartBaud = NewUartBaud;
    XUartNs550_SetBaud(UartBaseAdr, UART_CLOCK, baudRates[UartBaud]);
    XUartNs550_SetLineControlReg(UartBaseAdr, XUN_LCR_8_DATA_BITS);
    PopMenu(&printMenu, &handleInput);
    doPrintMenu = true;
    break;
  case 0x1b:
    NewUartBaseAdr = UartBaseAdr;
    NewUartBaud = UartBaud;
    PopMenu(&printMenu, &handleInput);
    doPrintMenu = true;
    break;
  default:
    doPrintMenu = true;
    break;
  }
}


static void XromInput(char ch)
{
  switch(ch)
  {
  case '1':
    printMenu = TestsMenu;
    handleInput = TestsInput;
    PushMenu(XromMenu, XromInput);
    doPrintMenu = true;
    break;
/*
#ifndef V2PDK
  case '2':
    printMenu = ComMenu;
    handleInput = ComInput;
    PushMenu(ComMenu, ComInput);
    doPrintMenu = true;
    break;
#endif
*/
  default:
    doPrintMenu = true;
    break;
  }
}

void XromUartInit(){

  UartBaseAdr = UART_BASEADDR;
  UartBaud = DEFAULTBAUDRATE;
  NewUartBaseAdr = UartBaseAdr;
  NewUartBaud = UartBaud;
  XUartNs550_SetBaud(UartBaseAdr, UART_CLOCK, baudRates[UartBaud]);
  XUartNs550_SetLineControlReg(UartBaseAdr, XUN_LCR_8_DATA_BITS);
}

int main()
{

        #ifdef PPC440CACHE
        XCache_EnableICache(PPC440_ICACHE);
        XCache_EnableDCache(PPC440_DCACHE);
        #endif

        usleep(1000);

        //Turn UART ON
        XromUartInit();

        //Turn LCD ON
        XromLCDInit();
        usleep(1000);
        XromLCDOn();

        usleep(1000);

        XromLCDClear();
        XromLCDPrintString("ML");
        XromLCDPrintNum(BOARDNUM, 10);
        XromLCDPrintString(" Diag/Test");
        XromLCDSetLine(2);
        XromLCDPrintChar(0x7E);
        XromLCDPrintString("Use Serial Port");

  printMenu = XromMenu;
  handleInput = XromInput;
  doPrintMenu = true;

  for(;;)
  {
    if(doPrintMenu)
    {
      printMenu();
      doPrintMenu = false;
    }

    InputGetMenu();
  }

  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}
