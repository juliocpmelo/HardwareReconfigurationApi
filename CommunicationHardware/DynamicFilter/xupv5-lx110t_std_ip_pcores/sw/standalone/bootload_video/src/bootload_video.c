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
* @file bootload_lcd.c
*
* The System ACE CF controller is commanded, through its MPU interface, to
* reconfigure the FPGA and load a software application from a user selected
* ACE file on the CompactFlash (CF) card.
*
* The production ML505/ML506/ML507 CF card included with the board contains
* the following ACE files:
*
* Config       Application loaded
* Address      via the ACE file
* -------      ------------------------
*   1          Virtex-5 Slide Show
*   2          Web Server Demo
*   3          Simon Game
*   4          Board Diagnostics (XROM)
*   5          USB Demo
*   6          My own ACE file
*   7          Ring Tone Player
*
* @note
*
* This version of bootload.c uses the serial port and the LCD character 
* display for output and does not require the DVI/VGA video display
*
* <pre>
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include <stdio.h>
#include "xio.h"
#include "xgpio_l.h"
#include "xbasic_types.h"
#include "sleep.h"
#include "xstatus.h"
#include "xsysace_l.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "lcd.h"
#include "xtft.h"
#include "xtft_l.h"
#include "graphics.h"
#include "boot_boxdef.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#ifndef BOARDNUM
#define BOARDNUM 509
#endif

#define ENCODER_OUTPUT_PUSH_FLAG 0x00000004		// bit 0 - MSB
#define ENCODER_OUTPUT_B_FLAG    0x00000002		// bit 1 
#define ENCODER_OUTPUT_A_FLAG    0x00000001		// bit 2 - LSB 

#define ENCODER_STATE_NO_ACTION 0
#define ENCODER_STATE_CW_PUSH 1
#define ENCODER_STATE_CCW_PUSH 2
#define ENCODER_STATE_CW_NO_PUSH 3
#define ENCODER_STATE_CCW_NO_PUSH 4
#define ENCODER_STATE_PUSH 5
#define BUTTON_PARSE_DELAY_501 5000
#define BUTTON_PARSE_DELAY_505 7500
#define BUTTON_PARSE_DELAY_506 7500
#define BUTTON_PARSE_DELAY_507 150000
#define BUTTON_PARSE_DELAY_509 7500
int get_rotary_switch_state();

#define STATUS_CHECK(Status) { if (Status != XST_SUCCESS) { return Status; } } 


static void LoadProgram(XTft *InstancePtr, Xuint32 num)
{
  xil_printf ("Rebooting to System ACE Configuration Address %d...\r\n",num);
  LCDClear();
  XTft_SetColor(InstancePtr, 0x00ffffff, 0x00000000);

  XTft_ClearScreen(InstancePtr);

  XSysAce_RegWrite16(SYSACE_BASEADDR + XSA_BMR_OFFSET, XSA_BMR_16BIT_MASK);
  XSysAce_SetControlReg(SYSACE_BASEADDR, XSA_CR_CFGRESET_MASK);
  XSysAce_SetControlReg(SYSACE_BASEADDR, (num << XSA_CR_CFGADDR_SHIFT) |
                                                 XSA_CR_FORCECFGADDR_MASK |
                                                 XSA_CR_CFGMODE_MASK |
                                                 XSA_CR_CFGSTART_MASK);
  while(1);
}

void DisplayBitMapImage1 (XTft *InstancePtr,
                          Xuint32 pixel_upper_left_corn_start_x,
                          Xuint32 pixel_upper_left_corn_start_y,
                          unsigned long *myBitmap)
  {
  Xuint32 count = 0;
  Xuint32 x, y;
  
  for(y=pixel_upper_left_corn_start_y; y<(pixel_upper_left_corn_start_y+myBitmap[1]); y++) {
    for(x=pixel_upper_left_corn_start_x; x<(pixel_upper_left_corn_start_x+myBitmap[0]); x++) {
      XTft_mSetPixel(*(Xuint32 *)InstancePtr->BaseAddress, x, y, myBitmap[count+4]);
      count++;
      }
    count++;
    }
  }
/* Returns state of rotary encoder
ENCODER_STATE_NO_ACTION;    // no action
ENCODER_STATE_CW_PUSH;      // cw and push
ENCODER_STATE_CCW_PUSH;     // ccw and push
ENCODER_STATE_CW_NO_PUSH;   // cw and no push
ENCODER_STATE_CCW_NO_PUSH;  // ccw and no push
ENCODER_STATE_PUSH;         // push only
*/
int get_rotary_switch_state()
{
  // outputs from rotary encoder
  Xuint32 encoderValue1,encoderValue2;
	
  // A,B from first reading
  int A_1, B_1;
  // A, B, Push from second reading
  int A_2, B_2 , PUSH;
  int state=ENCODER_STATE_NO_ACTION;

	
  // get 1st encoder value
  encoderValue1=XIo_In32 (ROTARY_ENCODER_BASEADDR );
  usleep(500);
  // get 2nd encoder value
  encoderValue2= XIo_In32 (ROTARY_ENCODER_BASEADDR );

  // From encoder output, assign A, B, Push outputs
  if((encoderValue1 & ENCODER_OUTPUT_A_FLAG)==ENCODER_OUTPUT_A_FLAG)
    A_1=1;
  else 
    A_1=0;

  if((encoderValue1 & ENCODER_OUTPUT_B_FLAG)==ENCODER_OUTPUT_B_FLAG)
    B_1=1;	
  else 
    B_1=0;

  if((encoderValue2 & ENCODER_OUTPUT_A_FLAG)==ENCODER_OUTPUT_A_FLAG)
    A_2=1;
  else 
    A_2=0;

  if((encoderValue2 & ENCODER_OUTPUT_B_FLAG)==ENCODER_OUTPUT_B_FLAG)
    B_2=1;	
  else 
    B_2=0;

  if((encoderValue2 & ENCODER_OUTPUT_PUSH_FLAG)==ENCODER_OUTPUT_PUSH_FLAG)
    PUSH=1;
  else 
    PUSH=0;


  //only transition on these states..
  //Reason is AB=00 denotes both the idle state and a transition state
  if(A_2==0 && B_2==1 && A_1==1 && B_1==1)
  {
    if (PUSH==1) state = ENCODER_STATE_CW_PUSH;  // cw and push
    else state = ENCODER_STATE_CW_NO_PUSH;       // cw and no push
  }
  else if(A_2==1 && B_2==0 && A_1==1 && B_1==1)
  {
  if (PUSH==1) 
    state = ENCODER_STATE_CCW_PUSH;     // ccw and push
  else 
    state = ENCODER_STATE_CCW_NO_PUSH;  // ccw and no push
  }
  else if (PUSH==1) 
    state = ENCODER_STATE_PUSH;
  else 
    state = ENCODER_STATE_NO_ACTION;

  return state;
}


int main()
{
  XTft Tft;
  XStatus Status;
  Xboolean button_n, button_e, button_s, button_w, button_c;
  Xboolean button_pushed, uart_input_avail;
  Xuint32 CurrentSel = 1, LastSel = 1;
  Xuint32 SelColor;


  //  Xuint32 y_pos;
  char ch;
  int rotary_state;

  #ifdef PPC440CACHE
  XCache_EnableICache(PPC440_ICACHE);
  XCache_EnableDCache(PPC440_DCACHE);
  #endif

  XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
  XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

  /* set gpio bits to be able to read buttons */
//  XGpio_mSetDataDirection(PUSHB_CWSEN_BASEADDR, 1, 0x0000001F);

  /* set gpio bits as outputs to LCD character display */
//  XGpio_mSetDataDirection(LCD_BASEADDR, 1, 0x00000000);

  /* Initialize TFT */
  Status = XTft_Initialize(&Tft, TFT_DEVICE_ID);
  STATUS_CHECK(Status);
  
  /* Initialize TFT and display */
  XTft_SetColor(&Tft, 0x00ffffff, 0x00404040);
  XTft_ClearScreen(&Tft);
  XTft_SetPos(&Tft, 400, 200);
  XTft_WriteColorString(&Tft, "Note: Some demos require", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 400, 215);
  XTft_WriteColorString(&Tft, "use of the serial port. ", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 400, 230);
  XTft_WriteColorString(&Tft, "Connect null modem cable", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 400, 245);
#if BOARDNUM == 501
  XTft_WriteColorString(&Tft, "from the ML501 to a host", 0x00FFFFFF, 0x00404040);
#endif
#if BOARDNUM == 505
  XTft_WriteColorString(&Tft, "from the ML505 to a host", 0x00FFFFFF, 0x00404040);
#endif
#if BOARDNUM == 506
  XTft_WriteColorString(&Tft, "from the ML506 to a host", 0x00FFFFFF, 0x00404040);
#endif
#if BOARDNUM == 507
  XTft_WriteColorString(&Tft, "from the ML507 to a host", 0x00FFFFFF, 0x00404040);
#endif
#if BOARDNUM == 509
  XTft_WriteColorString(&Tft, "from the ML509 to a host", 0x00FFFFFF, 0x00404040);
#endif
  XTft_SetPos(&Tft, 400, 260);
  XTft_WriteColorString(&Tft, "(such as a PC) running  ", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 400, 275);
  XTft_WriteColorString(&Tft, "a serial terminal. Use  ", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 400, 290);
  XTft_WriteColorString(&Tft, "the settings: 9600 Baud ", 0x00FFFFFF, 0x00404040);
  XTft_SetPos(&Tft, 400, 305);
  XTft_WriteColorString(&Tft, "8-N-1, No flow control. ", 0x00FFFFFF, 0x00404040);
  XTft_DrawEmptyBox(&Tft, 390,190,600,320, 0x00FFFFFF, 0x2);

  XTft_WriteColorCenteredString(&Tft, "                                                                           ", 0x00FFFFFF, 0x00006000, 15);
  XTft_WriteColorCenteredString(&Tft, "                                                                           ", 0x00FFFFFF, 0x00006000, 25);
#if BOARDNUM == 501
  XTft_WriteColorCenteredString(&Tft, " Welcome to the Xilinx Virtex-5 ML501 Evaluation Platform Bootloader Menu! ", 0x00FFFFFF, 0x00006000, 20);
#endif
#if BOARDNUM == 505
  XTft_WriteColorCenteredString(&Tft, " Welcome to the Xilinx Virtex-5 ML505 Evaluation Platform Bootloader Menu! ", 0x00FFFFFF, 0x00006000, 20);
#endif
#if BOARDNUM == 506
  XTft_WriteColorCenteredString(&Tft, " Welcome to the Xilinx Virtex-5 ML506 Evaluation Platform Bootloader Menu! ", 0x00FFFFFF, 0x00006000, 20);
#endif
#if BOARDNUM == 507
  XTft_WriteColorCenteredString(&Tft, " Welcome to the Xilinx Virtex-5 ML507 Evaluation Platform Bootloader Menu! ", 0x00FFFFFF, 0x00006000, 20);
#endif
#if BOARDNUM == 509
  XTft_WriteColorCenteredString(&Tft, " Welcome to the Xilinx Virtex-5 ML509 Evaluation Platform Bootloader Menu! ", 0x00FFFFFF, 0x00006000, 20);
#endif
  XTft_WriteColorCenteredString(&Tft, "Please use the directional buttons to choose a demo", 0x00FFFFFF, 0x00404040, 50);
  XTft_WriteColorCenteredString(&Tft, "Press the center button to start the selected demo", 0x00FFFFFF, 0x00404040, 63);

  XTft_DrawFixedSizeButton(&Tft, BOX_1_X_LEFT, BOX_1_Y_LEFT, BOX_1_X_RIGHT, BOX_1_Y_RIGHT, "1. Virtex-5 Slide Show      ", 29, 0x0000FF00);
  XTft_DrawFixedSizeButton(&Tft, BOX_2_X_LEFT, BOX_2_Y_LEFT, BOX_2_X_RIGHT, BOX_2_Y_RIGHT, "2. Web Server Demo          ", 29, 0x00FFFF00);

  XTft_DrawFixedSizeButton(&Tft, BOX_3_X_LEFT, BOX_3_Y_LEFT, BOX_3_X_RIGHT, BOX_3_Y_RIGHT, "3. Simon Game               ", 29, 0x00FFFF00);
  XTft_DrawFixedSizeButton(&Tft, BOX_4_X_LEFT, BOX_4_Y_LEFT, BOX_4_X_RIGHT, BOX_4_Y_RIGHT, "4. Board Diagnostics (XROM) ", 29, 0x00FFFF00);

  XTft_DrawFixedSizeButton(&Tft, BOX_5_X_LEFT, BOX_5_Y_LEFT, BOX_5_X_RIGHT, BOX_5_Y_RIGHT, "5. USB Demo                 ", 29, 0x00FFFF00);
  XTft_DrawFixedSizeButton(&Tft, BOX_6_X_LEFT, BOX_6_Y_LEFT, BOX_6_X_RIGHT, BOX_6_Y_RIGHT, "6. My own ACE file          ", 29, 0x00FFFF00);
  XTft_DrawFixedSizeButton(&Tft, BOX_7_X_LEFT, BOX_7_Y_LEFT, BOX_7_X_RIGHT, BOX_7_Y_RIGHT, "7. Ring Tone Player         ", 29, 0x00FFFF00);
  /* Print Copy of directions to UART */
  xil_printf ("Welcome to the Xilinx Virtex-5 ML%d Evaluation Platform Bootloader Menu!\r\n\r\n", BOARDNUM);
  xil_printf ("Please choose a demo by typing in the number of the demo you want to use\r\n\r\n");
  xil_printf ("Or select a demo using the directional buttons (C,W,S,E,N)\r\n");
  xil_printf ("  (Then press the center (C) button to start the selected demo)\r\n\r\n");
  xil_printf ("1. Virtex-5 Slide Show\r\n");
  xil_printf ("2. Web Server Demo\r\n");
  xil_printf ("3. Simon Game\r\n");
  xil_printf ("4. Board Diagnostics (XROM)\r\n");
  xil_printf ("5. USB Demo\r\n");
  xil_printf ("6. My own ACE file\r\n");
  xil_printf ("7. Ring Tone Player\r\n");

  /* Clear UART input buffer */
  while (XUartNs550_GetLineStatusReg(UART_BASEADDR) & 0x1)
    ch = XUartNs550_RecvByte(UART_BASEADDR);

  /* print directions to LCD screen */
  LCDOn();
  LCDInit();
  LCDPrintString ("Choose Demo: \x7f\x2b\x7e","1.Slideshow     ");

  while (1)
  {
    /* Get Input Selection */
    do
    {
      ch=0;
      button_pushed = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) & 0x0000001F);
      uart_input_avail = (XUartNs550_GetLineStatusReg(UART_BASEADDR) & 0x1);

      if (uart_input_avail)
        ch = XUartNs550_RecvByte(UART_BASEADDR);
#if (BOARDNUM == 505 || BOARDNUM == 506 || BOARDNUM == 507 || BOARDNUM == 509)
      rotary_state=get_rotary_switch_state();
		
    } while((rotary_state==ENCODER_STATE_NO_ACTION) && !button_pushed && !(uart_input_avail && (ch > '0') && (ch < '8'))); 
#endif
#if BOARDNUM == 501
    if(button_pushed)
      usleep(BUTTON_PARSE_DELAY_501);
    } while(!button_pushed && !(uart_input_avail && (ch > '0') && (ch < '8'))); 
#endif

    button_n = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 0) & (0x00000001);
    button_e = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 1) & (0x00000001);
    button_s = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 2) & (0x00000001);
    button_w = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 3) & (0x00000001);
    button_c = (XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1) >> 4) & (0x00000001);

    /* get new selection number */
    LastSel = CurrentSel;
#if BOARDNUM == 501
    if (button_n | button_w) CurrentSel--;
    if (button_s | button_e) CurrentSel++;
    #if (BOARDNUM == 501)
        usleep(BUTTON_PARSE_DELAY_501);
    #endif
#endif
#if (BOARDNUM == 505 || BOARDNUM == 506 || BOARDNUM == 507 || BOARDNUM == 509)
    if (button_n | button_w | (rotary_state==ENCODER_STATE_CCW_NO_PUSH))  CurrentSel--;
    if (button_s | button_e | (rotary_state==ENCODER_STATE_CW_NO_PUSH)) CurrentSel++;
    #if (BOARDNUM == 505)
        usleep(BUTTON_PARSE_DELAY_505);
    #endif
    #if (BOARDNUM == 506)
        usleep(BUTTON_PARSE_DELAY_506);
    #endif
    #if (BOARDNUM == 507)
    usleep(BUTTON_PARSE_DELAY_507);
    #endif
	 #if (BOARDNUM == 509)
    usleep(BUTTON_PARSE_DELAY_509);
    #endif
#endif
    if (CurrentSel == 0) CurrentSel = 7;
    if (CurrentSel == 8) CurrentSel = 1;
    if (uart_input_avail && (ch > '0') && (ch < '8'))
      CurrentSel = ch - '0';

    /* Redraw previous selection */
    if (LastSel == 1) XTft_DrawFixedSizeButton(&Tft, BOX_1_X_LEFT, BOX_1_Y_LEFT, BOX_1_X_RIGHT, BOX_1_Y_RIGHT, "1. Virtex-5 Slide Show      ", 29, 0x00FFFF00);
    if (LastSel == 2) XTft_DrawFixedSizeButton(&Tft, BOX_2_X_LEFT, BOX_2_Y_LEFT, BOX_2_X_RIGHT, BOX_2_Y_RIGHT, "2. Web Server Demo          ", 29, 0x00FFFF00);
    if (LastSel == 3) XTft_DrawFixedSizeButton(&Tft, BOX_3_X_LEFT, BOX_3_Y_LEFT, BOX_3_X_RIGHT, BOX_3_Y_RIGHT, "3. Simon Game               ", 29, 0x00FFFF00);
    if (LastSel == 4) XTft_DrawFixedSizeButton(&Tft, BOX_4_X_LEFT, BOX_4_Y_LEFT, BOX_4_X_RIGHT, BOX_4_Y_RIGHT, "4. Board Diagnostics (XROM) ", 29, 0x00FFFF00);
    if (LastSel == 5) XTft_DrawFixedSizeButton(&Tft, BOX_5_X_LEFT, BOX_5_Y_LEFT, BOX_5_X_RIGHT, BOX_5_Y_RIGHT, "5. USB Demo                 ", 29, 0x00FFFF00);
    if (LastSel == 6) XTft_DrawFixedSizeButton(&Tft, BOX_6_X_LEFT, BOX_6_Y_LEFT, BOX_6_X_RIGHT, BOX_6_Y_RIGHT, "6. My own ACE file          ", 29, 0x00FFFF00);
    if (LastSel == 7) XTft_DrawFixedSizeButton(&Tft, BOX_7_X_LEFT, BOX_7_Y_LEFT, BOX_7_X_RIGHT, BOX_7_Y_RIGHT, "7. Ring Tone Player         ", 29, 0x00FFFF00);

    /* Draw new selection in correct color */
    if (button_c || (uart_input_avail && (ch > '0') && (ch < '8'))) SelColor = 0x00FF0000;
      else SelColor = 0x0000FF00;
    if (CurrentSel == 1) XTft_DrawFixedSizeButton(&Tft, BOX_1_X_LEFT, BOX_1_Y_LEFT, BOX_1_X_RIGHT, BOX_1_Y_RIGHT, "1. Virtex-5 Slide Show      ", 29, SelColor);
    if (CurrentSel == 2) XTft_DrawFixedSizeButton(&Tft, BOX_2_X_LEFT, BOX_2_Y_LEFT, BOX_2_X_RIGHT, BOX_2_Y_RIGHT, "2. Web Server Demo          ", 29, SelColor);
    if (CurrentSel == 3) XTft_DrawFixedSizeButton(&Tft, BOX_3_X_LEFT, BOX_3_Y_LEFT, BOX_3_X_RIGHT, BOX_3_Y_RIGHT, "3. Simon Game               ", 29, SelColor);
    if (CurrentSel == 4) XTft_DrawFixedSizeButton(&Tft, BOX_4_X_LEFT, BOX_4_Y_LEFT, BOX_4_X_RIGHT, BOX_4_Y_RIGHT, "4. Board Diagnostics (XROM) ", 29, SelColor);
    if (CurrentSel == 5) XTft_DrawFixedSizeButton(&Tft, BOX_5_X_LEFT, BOX_5_Y_LEFT, BOX_5_X_RIGHT, BOX_5_Y_RIGHT, "5. USB Demo                 ", 29, SelColor);
    if (CurrentSel == 6) XTft_DrawFixedSizeButton(&Tft, BOX_6_X_LEFT, BOX_6_Y_LEFT, BOX_6_X_RIGHT, BOX_6_Y_RIGHT, "6. My own ACE file          ", 29, SelColor);
    if (CurrentSel == 7) XTft_DrawFixedSizeButton(&Tft, BOX_7_X_LEFT, BOX_7_Y_LEFT, BOX_7_X_RIGHT, BOX_7_Y_RIGHT, "7. Ring Tone Player         ", 29, SelColor);
    if (CurrentSel == 1) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","1.Slideshow     ");
    if (CurrentSel == 2) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","2.Web Server    ");
    if (CurrentSel == 3) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","3.Simon Game    ");
    if (CurrentSel == 4) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","4.Board Diags   ");
    if (CurrentSel == 5) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","5.USB Demo      ");
    if (CurrentSel == 6) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","6.My ACE File   ");
    if (CurrentSel == 7) LCDPrintString ("Choose Demo: \x7f\x2b\x7e","7.Ring Tones    ");

    /* if center enter button then call LoadProgram */
    if ((button_c) || (rotary_state==ENCODER_STATE_CW_PUSH) || (rotary_state==ENCODER_STATE_CCW_PUSH) || (rotary_state==ENCODER_STATE_PUSH) || (uart_input_avail && (ch > '0') && (ch < '8')))
    {
       LoadProgram(&Tft, CurrentSel);
    }
   
#if BOARDNUM == 501
    if ((button_c) || (uart_input_avail && (ch > '0') && (ch < '8')))
    {
       LoadProgram(&Tft, CurrentSel);
    }
#endif
#if (BOARDNUM == 505 || BOARDNUM == 506 || BOARDNUM == 507 || BOARDNUM == 509)
    if ((button_c) || (rotary_state==ENCODER_STATE_CW_PUSH) || (rotary_state==ENCODER_STATE_CCW_PUSH) || (rotary_state==ENCODER_STATE_PUSH) || (uart_input_avail && (ch > '0') && (ch < '8')))
    {
       LoadProgram(&Tft, CurrentSel);
    }
#endif

  }
  #ifdef PPC440CACHE
  XCache_DisableDCache();
  XCache_DisableICache();
  #endif
  return 0;
}
