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

#include <stdio.h>
#include "globaltypes.h"
#include "xrom_input.h"
#include "xrom_main.h"
#include "xrom_led.h"
#include "xrom_lcd.h"
#include "xrom_sma.h"
#include "xgpio_l.h"
#include "xrom_ddr_test.h"
#include "xrom_push_button.h"
#include "xrom_dip_switch.h"
#include "xrom_vga.h"
#include "xrom_piezo_test.h"
#include "xrom_zbt_test.h"
#include "memory_map.h"

#ifndef BOARDNUM
#define BOARDNUM 505
#endif

//INSTANTIATION OF IIC TEST STRUCTURE
static  ptrIIC_MANU_TEST_STRUCT   ptr2testStruct   = (IIC_MANU_TEST_STRUCT *)   (DDR_BASEADDR + 0x03FF0000); // set ptr to known OK memory space

//static void doLog(char *s, unsigned int memStart, unsigned int memLen)
//{
//  xil_printf(s);
//  xil_printf(" [");
//  xil_printf("%x", memStart);
//  xil_printf(" - ");
//  xil_printf("%x", memStart+memLen-1);
//  xil_printf("]\r\n");
//}

void TestsMenu()
{
  xil_printf("\r\nML%d Diagnostic Tests\r\n", BOARDNUM);
  xil_printf("======================\r\n");
  xil_printf("  1. Test DDR SDRAM\r\n");
  xil_printf("  2. Test ZBT SRAM\r\n");
  xil_printf("  3. Test LEDs\r\n");
  xil_printf("  4. Test Push Buttons\r\n");
  if ((BOARDNUM == 401) ||  (BOARDNUM == 402) || (BOARDNUM == 501) || (BOARDNUM == 505) || (BOARDNUM == 506) || (BOARDNUM == 507) || (BOARDNUM == 509))
    xil_printf("  5. Test Dip Switches\r\n");
  xil_printf("  6. Test Character LCD\r\n");
  xil_printf("  7. Test PS2 - Keyboard\r\n");
  xil_printf("  8. Test SMA Connectors\r\n");
  xil_printf("  9. Test VGA Output\r\n");
  if ((BOARDNUM != 501) || (BOARDNUM != 505) || (BOARDNUM == 506) || (BOARDNUM == 507))
    xil_printf("  A. Test Flash Memory\r\n");
  xil_printf("  B. Print IIC EEPROM Contents\r\n");
  if ((BOARDNUM == 501) || (BOARDNUM == 505) || (BOARDNUM == 506) || (BOARDNUM == 507) || (BOARDNUM == 509))
    xil_printf("  C. Test Piezo\r\n");
  xil_printf("  0. Return to the Main Menu\r\n\r\n");
}

void TestsInput(char ch)
{
        char c;
        long ddr_result;
        bool done;

  switch(ch)
  {
  case '1':
        XromLCDClear();
        XromLCDPrintString("DDR RAM Test");

        xil_printf("\r\nDDR RAM Test\r\n");
        xil_printf("============\r\n\r\n");
#if ((BOARDNUM == 501) || (BOARDNUM == 505) || (BOARDNUM == 506) || (BOARDNUM == 507))
        ddr_result = ml501_ddr_mem_test(DDR_BASEADDR, 1024*1024*256);
#else
        ddr_result = ml501_ddr_mem_test(DDR_BASEADDR, 1024*1024*64);
#endif
    break;

  case '2':     
        XromLCDClear();
        XromLCDPrintString("ZBT SRAM Test");
        
        xil_printf("\r\nZBT SRAM Test\r\n");
        xil_printf("=============\r\n\r\n");
#ifdef PPC
        TestRam(SRAM_BASEADDR, 0x00100000, 10, 0);
#else
        TestRam(SRAM_BASEADDR, 0x00100000, 10, 0);
#endif
    break;

  case '3':
        XromLCDClear();
        XromLCDPrintString("LED Test");
  
        xil_printf("\r\nLED Test\r\n");
        xil_printf("========\r\n\r\n");

        XromLedInit();
    XromTestLed();
    break;

  case '4':
        XromLCDClear();
        XromLCDPrintString("Push Button Test");
  
        xil_printf("\r\nPush Button Test\r\n");
        xil_printf("================\r\n\r\n");
        
        XromPBsInit();
        XromPBAutoTest();
        sleep(2);
        //XGpio_mSetDataDirection(CPU_RESET_BASEADDR, 1, 0x0); //switch CPU Reset back to normal functionality
    break;

  case '5':
    if ((BOARDNUM == 401) ||  (BOARDNUM == 402) || (BOARDNUM == 501) || (BOARDNUM == 505) || (BOARDNUM == 506) || (BOARDNUM == 507) || (BOARDNUM == 509)) {
        XromLCDClear();
        XromLCDPrintString("Dip Switch Test");
        xil_printf("\r\nDip Switch Test\r\n");
        xil_printf("===============\r\n\r\n");
        XromDipsInit();
        XromTestDips();
    }
    break;

  case '6':
        XromLCDOn();
    printMenu = LCDTestMenu;
    handleInput = LCDTestInput;
        PushMenu(TestsMenu, TestsInput);
    break;

  case '7':     
        XromLCDClear();
        XromLCDPrintString("PS/2 Test");
        
        xil_printf("\r\nPS/2 Keyboard Test\r\n");
        xil_printf("==================\r\n\r\n");
        //XromTestPs2_Keyboard();
	    xil_printf("Test Currently Unavailable\r\n");
    break;

  case '8':
        XromLCDClear();
        XromLCDPrintString("SMA Port Test");

        xil_printf("\r\nSMA Port Test\r\n");
        xil_printf("=============\r\n\r\n");    

	xil_printf("Test Currently Unavailable\r\n");
/*************************************************************
        xil_printf("Connect SMA Cable from DIFF CLK IN P to DIFF CLK OUT P\r\n");
        xil_printf("Connect SMA Cable from DIFF CLK IN N to DIFF CLK OUT N\r\n");
        xil_printf("  Press ENTER to continue or ESC to exit\r\n\r\n");
                
        do{
                c = InputGetChar();

                if(c == 0xd) {
                        XromTestSma();
                        break;
                }
                else if(c == 0x1b)
                        break;

        }while(1);
*************************************************************/
    break;

  case '9':
        XromLCDClear();
        XromLCDPrintString("VGA Test");

        xil_printf("\r\nVGA Test\r\n");
        xil_printf("========\r\n\r\n");
        xil_printf("Connect VGA Output to Display using a VGA Cable\r\n");
        xil_printf("  Press ENTER to continue or ESC to exit\r\n\r\n");

        XromTftInit();

        do{
                c = InputGetChar();

                if(c == 0xd) {
                        XromTestTft();
                        break;
                }
                else if(c == 0x1b)
                        break;

        }while(1);
    break;

  case 'A': case 'a':
    done = 0;
        XromLCDClear();
        XromLCDPrintString("Flash Mem Test");

        xil_printf("\r\nFlash Memory Test\r\n");
        xil_printf("=================\r\n\r\n");
	xil_printf("Test Currently Unavailable\r\n");
    break;

    case 'B': case 'b':
        done = 0;
        XromLCDClear();
        XromLCDPrintString("Print IIC EEPROM");

        xil_printf("\r\nPrinting IIC EERPOM Contents\r\n");
        xil_printf("============================\r\n\r\n");
        do{
                xil_printf("WARNING: This test will not run properly if you have modified IIC EEPROM!\r\n\r\n");
                xil_printf("NOTE:\r\n");
                xil_printf("* IIC EEPROM addresses 0x4C1 to 0xFFF are available for user use.\r\n");
                xil_printf("* Addresses 0x000 to 0x4C0 are reserved for Xilinx use and must not be\r\n");
        xil_printf("  modified or your board may no longer function properly.\r\n\r\n");
                xil_printf("If the Xilinx reserved addresses have been modified this test may print garbage\r\n");
                xil_printf("You may wish to capture the output to a file\r\n\r\n");
                xil_printf("Do you want to continue (Y/N)?\n\r\r\n");

                c = InputGetChar();

                switch(c){
                        case 'Y': case 'y': done = 1; break;
                        case 'N': case 'n': doPrintMenu = true; return; break;
                        default: done = 0; break;
                }

        }while(!done);

        print_ml501_test_struct(ptr2testStruct);
    break;
	case 'C': case 'c':
		if (BOARDNUM == 501 || BOARDNUM == 505 || BOARDNUM == 506 || BOARDNUM == 507) 
        XromLCDClear();
        XromLCDPrintString("Piezo Test");

		xil_printf("\r\nPiezo Test\r\n");
        xil_printf("============================\r\n\r\n");
        XromPiezoTest();
		
        
    break;

  case '0':
    PopMenu(&printMenu, &handleInput);
    doPrintMenu = true;
    break;

  default:
    break;
  }
    doPrintMenu = true;
}
