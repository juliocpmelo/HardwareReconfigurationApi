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
#include "sleep.h"
#include "xgpio_l.h"
#include "xgpio.h"
#include "xrom_main.h"
#include "xparameters.h"
#include "xrom_input.h"
#include "memory_map.h"

#define INIT_DELAY 5000 //usec delay timer during initialization, important to change if clock speed changes
#define INST_DELAY 5000 //usec delay timer between instructions
#define DATA_DELAY 250 //usec delay timer between data

/*
#------------------------------------------------------------------------------
# IO Pad Location Constraints / Properties for Character LCD GPIO
#------------------------------------------------------------------------------

NET gpio_char_lcd<6> LOC = AE13; # LCD_E
NET gpio_char_lcd<6> PULLDOWN;
NET gpio_char_lcd<5> LOC = AC17; # LCD_RS
NET gpio_char_lcd<4> LOC = AB17; # LCD_RW
NET gpio_char_lcd<3> LOC = AF12; # LCD_DB7
NET gpio_char_lcd<2> LOC = AE12; # LCD_DB6
NET gpio_char_lcd<1> LOC = AC10; # LCD_DB5
NET gpio_char_lcd<0> LOC = AB10; # LCD_DB4
*/

//==============================================================================
//
//                                                              INTERNAL FUNCTIONS
//
//==============================================================================



void XromInitInst(void){
                XGpio_WriteReg(LCD_BASEADDR, 1, 0x00000003);
                usleep(1);
                XGpio_WriteReg(LCD_BASEADDR, 1, 0x00000043); //set enable and data
                usleep(1);
                XGpio_WriteReg(LCD_BASEADDR, 1, 0x00000003);
                usleep(INIT_DELAY);
}

void XromWriteInst(unsigned long inst1, unsigned long inst2){
        
        unsigned long printinst;

        printinst = 0x00000040 | inst1;
        
        XGpio_WriteReg(LCD_BASEADDR, 1, inst1); //write data
        usleep(1);
        XGpio_WriteReg(LCD_BASEADDR, 1, printinst); //set enable
        usleep(1);
        XGpio_WriteReg(LCD_BASEADDR, 1, inst1); //turn off enable
        usleep(1);
        
        printinst = 0x00000040 | inst2;

        XGpio_WriteReg(LCD_BASEADDR, 1, printinst); //set enable and data
        usleep(1);
        XGpio_WriteReg(LCD_BASEADDR, 1, inst2); //turn off enable

        usleep(INST_DELAY);     

}

void XromWriteData(unsigned long data1, unsigned long data2){
        
        unsigned long rs_data, enable_rs_data;

        rs_data = 0x00000020 | data1; //sets rs, data1
        enable_rs_data = 0x00000060 | data1;

        XGpio_WriteReg(LCD_BASEADDR, 1, rs_data); //write data, rs
        usleep(1);
        XGpio_WriteReg(LCD_BASEADDR, 1, enable_rs_data); //set enable, keep data, rs
        usleep(1);
        XGpio_WriteReg(LCD_BASEADDR, 1, rs_data); //turn off enable
        usleep(1);
        
        rs_data = 0x00000020 | data2; //sets rs, data2
        enable_rs_data = 0x00000060 | data2; //sets rs, data2

        XGpio_WriteReg(LCD_BASEADDR, 1, enable_rs_data); //set enable, rs, data
        usleep(1);
        XGpio_WriteReg(LCD_BASEADDR, 1, rs_data); //turn off enable
        
        usleep(DATA_DELAY);
}

//==================================================================================
//
//                                                              EXTERNAL FUNCTIONS
//
//==================================================================================

void XromMoveCursorHome(){
        XromWriteInst(0x00000000, 0x00000002);
}

void XromMoveCursorLeft(){
        XromWriteInst(0x00000001, 0x00000000);
}

void XromMoveCursorRight(){
        XromWriteInst(0x00000001, 0x00000004);
}

void XromLCDOn(){
        //xil_printf("DISPLAY ON\r\n");
                XromWriteInst(0x00000000, 0x0000000E);
}

void XromLCDOff(){
        //xil_printf("DISPLAY OFF\r\n");
                XromWriteInst(0x00000000, 0x00000008);
}

void XromLCDClear(){
        //xil_printf("DISPLAY CLEAR\r\n");
                XromWriteInst(0x00000000, 0x00000001);
                //                XromWriteInst(0x00000000, 0x00000010);
                // XromMoveCursorHome();
}

void XromLCDInit(){
//        XGpio_mSetDataDirection(LCD_BASEADDR, 1, 0x00000000); //Sets CHAR LCD Reg to Write Mode
		  XGpio lcd;
		  XGpio_Initialize(&lcd,LCD_DEVICE_ID);
		  XGpio_SetDataDirection(&lcd, 1, 0x00000000);

        XGpio_WriteReg(LCD_BASEADDR, 1, 0x00000000); //Zeroes CHAR LCD Reg

        //LCD INIT
        usleep(2*15000);  //After VCC>4.5V Wait 15ms to Init Char LCD
                XromInitInst();
        usleep(2*4100); //Wait 4.1ms
                XromInitInst();
        usleep(2*100); //Wait 100us
                XromInitInst();
                XromInitInst();

        //Function Set
                XromWriteInst(0x00000002, 0x00000002);
        
        //Display Off
                XromWriteInst(0x00000000, 0x00000008);

        //Display Clear
                XromWriteInst(0x00000000, 0x00000001);

        //Entry Mode Set
                XromWriteInst(0x00000000, 0x00000006);

        //Display On
                XromWriteInst(0x00000000, 0x0000000E);
}


void XromLCDSetLine(int line){ //line1 = 1, line2 = 2
        
        int i;

        if((line - 1)) {
                XromMoveCursorHome();
                for(i=0; i<40; i++)
                        XromMoveCursorRight();
        }
        else
                XromMoveCursorHome();
                
}

void XromLCDPrintChar(char c){
        XromWriteData(((c >> 4) & 0x0000000F), (c & 0x0000000F));
}

void XromLCDPrintString(char * line){

        int i=0;
                while(line[i]){
                        XromLCDPrintChar(line[i]);
                        i++;
                }

        return;
}

void XromLCDPrint2Strings(char * line1, char * line2){

        int i=0;

                XromLCDSetLine(1);

                for(i=0; i<16; i++){
                        if(line1[i])
                                XromLCDPrintChar(line1[i]);
                        else break;
                }       

                XromLCDSetLine(2);
        
                for(i=0; i<16; i++){
                        if(line2[i])
                                XromLCDPrintChar(line2[i]);
                        else break;
                }       
        return;
}


/************************************************************/
/* LogNum:  Converts number to character                    */
/************************************************************/
void XromLCDPrintNum(unsigned int x, unsigned int base)
{
  static char hex[]="0123456789ABCDEF";
  char digit[10];
  int i;

  i = 0;
  do
  {
    digit[i] = hex[x % base];
    x = x / base;
    i++;
  } while (x != 0);

  while (i > 0)
  {
        i--;
    XromLCDPrintChar(digit[i]);
  }
}

/************************************************************/
/* tft_WriteInt:  handles the negative case, calls LogNum   */
/*                w/ unsigned value                         */
/************************************************************/
void XromLCDPrintInt(unsigned int x)
{
  unsigned int val;

  if (x < 0)
  {
    XromLCDPrintChar('-');
    val = ((unsigned int) ~x ) + 1;
  }
  else
    val = (unsigned int) x;

  XromLCDPrintNum(val, 10);
}

void XromLCDPrintFloat(float x, int precision){

        int x_precision, i, x_int, rightOfDecimal;
        int multiplier = 1;

        x_int = x;
        XromLCDPrintInt(x_int);
        XromLCDPrintChar('.');

        for(i=0; i<precision; i++)
                multiplier *= 10;

        x_precision = x * multiplier;
        rightOfDecimal = x_precision % multiplier;

        multiplier = 10;
        for(i=0; i<precision-1; i++){
                if(rightOfDecimal < multiplier)
                        XromLCDPrintChar('0');
                
                multiplier *= 10;
        }

        XromLCDPrintInt(rightOfDecimal);

        /* DEBUG SIGNALS
        xil_printf("printnum1 = %d\r\n", xint);
        xil_printf("multiplier = %d\r\n", multiplier);
        xil_printf("decimal = %d\r\n", decimal);
        xil_printf("printnum2 = %d\r\n", decimal % multiplier);
        */
}


//==============================================================================
//
//                                                              TEST FUNCTIONS
//
//==============================================================================

void XromLCDTest(){
        char c;
        bool done; 
        int linePosition; //line1 = 0, line2 = 1

        XromLCDClear();

        xil_printf("\r\nYou should see your keystrokes appear on the LCD as you type\r\n");
        xil_printf("Press TAB to move between Line1 and Line2\r\n");
        xil_printf("Prses BACKSPACE to clear the LCD\r\n");
        xil_printf("Press ESC to conclude the test\r\n");

        linePosition = 0;
        done = 0;       

        do{
        c = InputGetChar();

        switch(c){
                case 0x9: 
                        linePosition = !linePosition;
                        XromLCDSetLine(linePosition + 1);
                break;
                
                case 0x1b: 
                        doPrintMenu = true;
                        done = 1; 
                        XromLCDClear();
                break;

                case 0x8:
                        linePosition = 0;
                        XromLCDClear();
                break;

                default:
                        XromLCDPrintChar(c);
                break;
        }

        }while(!done);
}

void LCDTestMenu()
{
  xil_printf("\r\nCharacter LCD Tests\r\n");
  xil_printf("\r\n===================\r\n");
  xil_printf("  1. Turn LCD On\r\n");
  xil_printf("  2. Turn LCD Off\r\n");
  xil_printf("  3. Write To LCD\r\n");
  xil_printf("  4. Print Hello World\r\n");
  xil_printf("  5. Clear LCD\r\n\r\n");

  xil_printf("  0. Return to the Main Menu\r\n");
}

void LCDTestInput(char ch)
{
  switch(ch)
  {
  case '1':
    XromLCDOn();
    break;
  case '2':
        XromLCDOff();
    break;
  case '3':
    XromLCDTest();
    break;
  case '4':
        XromLCDClear();
        XromLCDPrint2Strings("Hello", "World");
        break;
  case '5':
        XromLCDClear();
        break;
  case 0x1b:
  case '0':
    PopMenu(&printMenu, &handleInput);
    doPrintMenu = true;
    break;
  default:
    doPrintMenu = true;
    break;
  }
}
