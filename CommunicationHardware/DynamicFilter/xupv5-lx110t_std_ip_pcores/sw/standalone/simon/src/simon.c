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
* @file simon.c
*
* This application demonstrates an embedded processor based pattern matching
* game that utilizes the pushbuttons, directional LEDs, piezo speaker, and
* the DVI/VGA video output.
*
* @note
*
* None.
*
* <pre>
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/
#include <stdio.h>
#include <xio.h>
#include <stdlib.h>
#include <string.h>
#include "xgpio_l.h"
#include "xgpio.h"
#include "xbasic_types.h"
#include "lcd.h"
#include "sleep.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "xtft.h"
#include "xtft_l.h"
#include "graphics.h"
#include "boot_boxdef.h"
#include "memory_map.h"

#ifdef PPC440
#include "xtime_l.h"
#else
#include <xtmrctr.h>
#endif

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/
#define ESCAPE          0x1b
#define PLAY_SOUND 1

#define STATUS_CHECK(Status) { if (Status != XST_SUCCESS) { return Status; } }

#define LED1_to_LED4     0
#define LED4_to_LED1     1
#define OPB_CLK_MHZ      100
#define TIMER_COUNTER_0  0 
#define TIMER_COUNTER_1  0  //For there exits only one timer.
#define PIEZO_ON         0x1
#define PIEZO_OFF        0x0
#define MOVES_LIMIT      100
#define WEST_BUTTON 0x08
#define SOUTH_BUTTON 0x04
#define EAST_BUTTON 0x02
#define NORTH_BUTTON 0x01
#define CENTER_BUTTON 0x10
#define PUSHB_MASK       0x0000001F
#define TONE_INTERRUPT   1

//graphics
#define COLOR_BLACK      0x00000000
#define COLOR_WHITE      0x00FFFFFF
#define COLOR_RED	     0x00FF0000
#define COLOR_GREEN	     0x0000FF00
#define COLOR_BLUE	     0x000000FF
#define COLOR_PURPLE	 0x00FF00FF
#define COLOR_YELLOW	 0x00FFFF00
#define BOX1_X1          250
#define BOX1_Y1          70
#define BOX1_X2          350
#define BOX1_Y2          170
#define BOX2_X1          100
#define BOX2_Y1          210
#define BOX2_X2          200
#define BOX2_Y2          310
#define BOX3_X1          250
#define BOX3_Y1          210
#define BOX3_X2          350
#define BOX3_Y2          310
#define BOX4_X1          400
#define BOX4_Y1          210
#define BOX4_X2          500
#define BOX4_Y2          310
#define BOX5_X1          250
#define BOX5_Y1          360
#define BOX5_X2          350
#define BOX5_Y2          460
#define BOX1_COLOR       COLOR_RED
#define BOX2_COLOR       COLOR_BLUE
#define BOX3_COLOR       COLOR_PURPLE
#define BOX4_COLOR       COLOR_GREEN
#define BOX5_COLOR       COLOR_YELLOW
#define BOX_MOVE_AMT     8
#define BOX_WIDTH        100
#define SIMON_STRING_Y   10
#define SIMON_STRING_X_INIT 282
#define SIMON_STRING_INCR 2
#define SIMON_STRING_BOX_X_INCR 32
#define SIMON_STRING_BOX_Y_INCR 45
#define SCORE_X          20
#define SCORE_Y          400
#define HISCORE_X        540
#define HISCORE_Y        400

// State Machine States
#define INIT            0
#define START           1
#define PLAYSYNC        3 
#define PLAY            4
#define TEST            5
#define FAIL            6

/************************** Function Prototypes ******************************/

void tone (int freq, int duration);
void tone_blink (int tone_select, int duration);
int ran_num_gen();
void example_3( void );
void flash_screen_button(int seed,XTft Tft);
void restore_screen_button(int seed,XTft Tft);
void drawScore(int score,XTft Tft,int drawCurrentScore);
void eraseScore(int score,XTft Tft,int drawCurrentScore);

int main() 
{
    // variables
    int     next_state;             // state variables for state machine
    int     seed=0;                 // 16 bit random number seed
    int     current_seed=0;         // current random seed
    int     note_count=1;           // counter for notes played
    int     score=0;                // score counter
    int     hiScore=0;              // High score counter
    int     current_note=1;         // counter for current note being played
    unsigned int buttonread;        // push button status (0=none presed, 1,2,4..=button number)
    unsigned int lastbuttonread=0;  // push button status (0=none presed, 1,2,4..=button number)
    int     button_hi=0;            // true if a button is pressed
    int     lamp_on;                // light currently on
    int     simon_string_x = SIMON_STRING_X_INIT; //x-coordinate of string
    int     simon_string_dir = 1;   // direction of string (0=left,1=right)
    int     i;
    char    line1[17];         // LCD Output buffer
    char	line2[17];         // LCD Output buffer
    char    moves[MOVES_LIMIT];     // list of moves
    char    buttonPressed;	    // currentButtonPressed
    Xboolean run_example_3;         // flag to run example_3 function
                                    // run if 1, skip otherwise

    XTft Tft;						// used for drawing
    XStatus Status;
	buttonPressed = ' ';

    #ifdef PPC440CACHE
    XCache_EnableICache(PPC440_ICACHE);
    XCache_EnableDCache(PPC440_DCACHE);
    #endif
	
    /* set gpio bits as all inputs to be able to read buttons */
//    XGpio_mSetDataDirection(PUSHB_CWSEN_BASEADDR, 1, 0x0000001F);

    /* set gpio bits as all outputs to directional LEDs */
//    XGpio_mSetDataDirection(LEDS_CWSEN_BASEADDR, 1, 0x00000000);
    XGpio leds_cwsen_x;
    XGpio_Initialize(&leds_cwsen_x,LEDS_CWSEN_DEVICE_ID);
	 XGpio_SetDataDirection(&leds_cwsen_x, 1, 0x00000000);

    /* set gpio bits as all outputs to LCD character display */
//    XGpio_mSetDataDirection(LCD_BASEADDR, 1, 0x00000000);

    /* set gpio bits as all outputs to piezo speaker */
//    XGpio_mSetDataDirection(PIEZO_BASEADDR, 1, 0x00000000);
    XGpio piezo;
    XGpio_Initialize(&piezo,PIEZO_DEVICE_ID);
	 XGpio_SetDataDirection(&piezo, 1, 0x00000000);

    /* Setup 16550 Uart */
    XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
    XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

    /* Initialize TFT */
    Status = XTft_Initialize(&Tft, TFT_DEVICE_ID);
    STATUS_CHECK(Status);

// Each example can be run and observed using:
// EP)  Embedded hardware platform (EP)
// MS)  Modelsim simulation (MS)
// CS)  Chipscope on an embedded hardware platform (CS)
// GDB) GDB on an embedded hardware platform (GDB)
// Comments for each type of test scenario are provided for
// the example code. Each example is also provided in a standalone
// source file within its own dedicated directory.
//
// ****************************************************************************
// Example_1a
// GPIO Output loop using GPIO access functions (gpio.c)
// ****************************************************************************
// EP)  On an embedded platform, each LED will be turned on/off
//      in sequence from LED1 to LED4. To change the sequencing
//      direction uncomment the alternative lamp_on assignment
//      statement. Note this LED sequencing will occur too
//      fast for visual observation unless the call to usleep()
//      is included in the loop.
// MS)  For Modelsim simulation include the sim_sleep.c file to
//      eliminate any time delays added by usleep() calls. Compiling
//      the software with sim_sleep.c saves one from having to modify 
//      or remove all the usleep() calls. Modelsim will show GPIO output
//      lines changing as determined by the code in the loop.
// CS)  Chipscope monitoring of GPIO output will show signals on a hardware
//      platform changing state as in the ModelSim simulation. To observe actual
//      signal timing information compile software without sim_sleep.c 
// GDB) LED output can be observed visually on a hardware platform using
//      GDB with a breakpoint set on the lamp_on assignment statement.
//      Delay time between LED writes is controlled by time interval between
//      user issued GDB "continue" commands. Compile without sim_sleep.c


    lamp_on = 0x1;
    for (i=0; i<10; i++)
    {
	 //GPIO_writeLED(lamp_on);
         XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, lamp_on);
         lamp_on = ((lamp_on << 1) | (lamp_on >> 4)) & 0x1f;
         //lamp_on = ((lamp_on >> 1) | (lamp_on << 4)) & 0x1f;
         //usleep(500000);
    }       
        

// ****************************************************************************
// Example_1b
// GPIO Input and GPIO Output loop using GPIO access functions (gpio.c)
// ****************************************************************************
// This provides a means to observe the turnaround time between
// consecutive GPIO read and GPIO write calls.
// EP)  On an embedded platform, the LED state will reflect the
//      state of the corresponding pushbutton state.
//      ( Eg. PUSH1 Pressed -> LED1 ON )
//      Note this LED code will occur too fast for visual observation
//      unless the usleep() call in included within the loop. To increase
//      the chance capturing a user pressing the pushbutton the maximum
//      count value in the for loop can be increased to a larger number.
//      Compile without sim_sleep.c
// MS)  For Modelsim simulation include the sim_sleep.c file to
//      eliminate any time delays added by usleep() calls. Compiling
//      the software with sim_sleep.c saves one from having to modify 
//      or remove all the usleep() calls. Modelsim will show GPIO output
//      lines changing through loop control.
// CS)  Chipscope monitoring of GPIO output will show signals on a hardware
//      platform changing state as in ModelSim simulation. To observe actual
//      signal timing information compile software without sim_sleep.c 
// GDB) LED output can be observed visually on a hardware platform using
//      GDB with a breakpoint set on the buttonread assignment statement.
//      Delay time between LED write and the next sampling of the pushbutton
//      is controlled by time interval between user issued
//      GDB "continue" commands. Compile without sim_sleep.c

    //for (i=0; i<1000000; i++) 
    for (i=0; i<3; i++) 
    {
         buttonread = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1);//set GDB breakpoint here
                                               //on reaching breakpoint,
                                               //press and hold pushbutton
                                               //let GDB continue
	buttonread &= PUSHB_MASK;
        XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, buttonread); //LED should reflect pushbutton state
        //usleep(500000);
    }

// ****************************************************************************
// Example_2
// Modify LCD text message
// ****************************************************************************
// EP)  On an embedded platform, the LCD will show the
//      user selected text string. Compile without sim_sleep.c
// MS)  For Modelsim simulation include the sim_sleep.c file to
//      eliminate any time delays added by usleep() calls. Compiling
//      the software with sim_sleep.c saves one from having to modify 
//      or remove all the usleep() calls. Modelsim will show the 
//      selected LCD text message on the appropriate GPIO output lines.
// CS)  Chipscope monitoring of GPIO output will show signals on a hardware
//      platform changing state as in ModelSim simulation. To observe actual
//      signal timing information and proper LCD operation compile software 
//      without sim_sleep.c 
// GDB) Modify the LCD text message via GDB by activating the breakpoint at
//      the location shown below. Open a local variables window in GDB and
//      alter the contents of the "line1" character array as desired. Make
//      sure the last character remains the end of string (Eg. '\0' or 0x00)
//      After issuing the GDB "continue" command the first line of the LCD
//      will display the new user text message.


    
//  LCD_Init();  // ADD LCD FUNCTIONALITY LATER
//  XTft_SetColor(&Tft, 0x00ffffff, 0x00404040);

    XTft_ClearScreen(&Tft);

    LCDOn();
    LCDInit();
    LCDClear();


	strcpy (line1, "Simon           ");
    strcpy (line2, "for ML50x       ");

    LCDPrintString(line1, line2);

    // Example_3
    // See comments at beginning of example_3 function definition below
    // run_example_3 = XTRUE;
    run_example_3 = XFALSE;
    if( run_example_3 == XTRUE ) //set GDB breakpoint here to modify
    {                            //run_example_3 at run-time
         example_3();		 //XTRUE == 1, run example_3
    }                            //XFALSE == 0, skip example_3

    // draw startup screen

    XTft_SetPos(&Tft, simon_string_x, SIMON_STRING_Y); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_WHITE, /*0x00404040*/COLOR_BLACK);
    // draw boxes
    XTft_DrawSolidBox(&Tft, BOX1_X1,BOX1_Y1,BOX1_X2,BOX1_Y2, BOX1_COLOR);
    XTft_DrawSolidBox(&Tft, BOX2_X1,BOX2_Y1,BOX2_X2,BOX2_Y2, BOX2_COLOR);
    XTft_DrawSolidBox(&Tft, BOX3_X1,BOX3_Y1,BOX3_X2,BOX3_Y2, BOX3_COLOR);
    XTft_DrawSolidBox(&Tft, BOX4_X1,BOX4_Y1,BOX4_X2,BOX4_Y2, BOX4_COLOR);
    XTft_DrawSolidBox(&Tft, BOX5_X1,BOX5_Y1,BOX5_X2,BOX5_Y2, BOX5_COLOR);
    XTft_SetPos(&Tft, BOX1_X1 + SIMON_STRING_BOX_X_INCR, BOX1_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX1_COLOR);
    XTft_SetPos(&Tft, BOX2_X1 + SIMON_STRING_BOX_X_INCR, BOX2_Y1 + SIMON_STRING_BOX_Y_INCR);
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX2_COLOR);
    XTft_SetPos(&Tft, BOX3_X1 + SIMON_STRING_BOX_X_INCR, BOX3_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX3_COLOR);
    XTft_SetPos(&Tft, BOX4_X1 + SIMON_STRING_BOX_X_INCR, BOX4_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX4_COLOR);
    XTft_SetPos(&Tft, BOX5_X1 + SIMON_STRING_BOX_X_INCR, BOX5_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX5_COLOR);
    // draw score
    XTft_SetPos(&Tft, SCORE_X-10, SCORE_Y-20);
    XTft_WriteColorString(&Tft, "SCORE", COLOR_WHITE, COLOR_BLACK);
    XTft_SetPos(&Tft, HISCORE_X-17, HISCORE_Y-20);
    XTft_WriteColorString(&Tft, "HIGH SCORE", COLOR_WHITE, COLOR_BLACK);
    drawScore( score, Tft,1);
    drawScore(hiScore, Tft,0);
    // XIo_Out32(0xD0000200, &Tft);



    //
    //XIo_Out32(0xD0000200, &Tft);
/*  XTft_DrawSolidBox(&Tft, BOX1_X1,BOX1_Y1,BOX1_X2,BOX1_Y2, BOX1_COLOR);
    XTft_DrawSolidBox(&Tft, BOX2_X1,BOX2_Y1,BOX2_X2,BOX2_Y2, BOX1_COLOR);
    XTft_DrawSolidBox(&Tft, BOX3_X1,BOX3_Y1,BOX3_X2,BOX3_Y2, BOX1_COLOR);
    XTft_DrawSolidBox(&Tft, BOX4_X1,BOX4_Y1,BOX4_X2,BOX4_Y2, BOX1_COLOR);
    XTft_DrawSolidBox(&Tft, BOX5_X1,BOX5_Y1,BOX5_X2,BOX5_Y2, BOX1_COLOR);
    XTft_SetPos(&Tft, BOX1_X1 + SIMON_STRING_BOX_X_INCR, BOX1_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX1_COLOR);
    XTft_SetPos(&Tft, BOX2_X1 + SIMON_STRING_BOX_X_INCR, BOX2_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX2_COLOR);
    XTft_SetPos(&Tft, BOX3_X1 + SIMON_STRING_BOX_X_INCR, BOX3_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX3_COLOR);
    XTft_SetPos(&Tft, BOX4_X1 + SIMON_STRING_BOX_X_INCR, BOX4_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX4_COLOR);
    XTft_SetPos(&Tft, BOX5_X1 + SIMON_STRING_BOX_X_INCR, BOX5_Y1 + SIMON_STRING_BOX_Y_INCR); 
    XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX5_COLOR);
*/
    // play a few tones
    for (i=0;i<5;i++) tone_blink(i,500000);
    for (i=0;i<5;i++) tone_blink(i,500000);

    strcpy (line1, "   High Score: 0");
    strcpy (line2, "Simon's Score: 0");
    LCDPrintString(line1, line2);

    // variable initialization
    next_state = INIT;

// ****************************************************************************
// Example_4
// Simon application code
// ****************************************************************************
// EP)  On an embedded hardware platform, the pushbuttons and LEDs are used
//      to interact with a user and the Simon application. The LCD screen
//      displays the score. Compile without sim_sleep.c
// MS)  For Modelsim simulation include the sim_sleep.c file to
//      eliminate any time delays added by usleep() calls. Compiling
//      the software with sim_sleep.c saves one from having to modify 
//      or remove all the usleep() calls.
// CS)  Chipscope monitoring of GPIO output will show signals on a hardware
//      platform changing state as in ModelSim simulation. To observe actual
//      signal timing information compile software without sim_sleep.c 
// GDB) Compile without sim_sleep.c for EP setup using GDB. Set breakpoints
//      as desired while interacting with simon.

// begin simon game
// main routine - loop forever
					
  while (1) 
  {

     // state machine
     switch (next_state)
     {
       // INIT: Initialize State
       case INIT:
         next_state = START;
         seed = 0;
         current_seed = 0;
         score = 0;
         note_count = 1;
         current_note = 1;
         button_hi = 0;
         lamp_on = 0x1;
         buttonread = 1234;	
         lastbuttonread=0;
         //restore simon strings on buttons after FAIL state
         XTft_SetPos(&Tft, BOX1_X1 + SIMON_STRING_BOX_X_INCR, BOX1_Y1 + SIMON_STRING_BOX_Y_INCR); 
         XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX1_COLOR);
         XTft_SetPos(&Tft, BOX2_X1 + SIMON_STRING_BOX_X_INCR, BOX2_Y1 + SIMON_STRING_BOX_Y_INCR); 
         XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX2_COLOR);
         XTft_SetPos(&Tft, BOX3_X1 + SIMON_STRING_BOX_X_INCR, BOX3_Y1 + SIMON_STRING_BOX_Y_INCR); 
         XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX3_COLOR);
         XTft_SetPos(&Tft, BOX4_X1 + SIMON_STRING_BOX_X_INCR, BOX4_Y1 + SIMON_STRING_BOX_Y_INCR); 
         XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX4_COLOR);
         XTft_SetPos(&Tft, BOX5_X1 + SIMON_STRING_BOX_X_INCR, BOX5_Y1 + SIMON_STRING_BOX_Y_INCR); 
         XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX5_COLOR);
         break; // INIT  
       // START: Flash lights until any button press, generate random seed
       case START:				
         // shift through the lamps
         //GPIO_writeLED(lamp_on);
         XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, lamp_on);
         lamp_on = ((lamp_on << 1) | (lamp_on >> 4)) & 0x1f;
         usleep (50000); // delay 50ms for each lamp change
	 //draw scrolling simon string
         XTft_SetPos(&Tft, simon_string_x, SIMON_STRING_Y); 
         XTft_WriteColorString(&Tft, "SIMON: Press any button to start", COLOR_BLACK, COLOR_BLACK);
         simon_string_x += (SIMON_STRING_INCR*simon_string_dir);
         if(simon_string_x>345){
           simon_string_dir=-1;
         }
         else if (simon_string_x<=70){
           simon_string_dir=1;
         }
         XTft_SetPos(&Tft, simon_string_x, SIMON_STRING_Y); 
         XTft_WriteColorString(&Tft, "SIMON: Press any button to start", COLOR_WHITE, COLOR_BLACK);
          
         // if start button press & released then go to play state
         buttonread = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1);
         buttonread &= PUSHB_MASK;
         if (buttonread != 0) 
         {
           button_hi =1;
           lamp_on = 0; // turn off lamps
           // clear an old score
           line2[14] = 0x30; line2[15] = 0x30;
           drawScore( score, Tft,1);
           LCDClear();
           LCDPrintString(line1, line2);

           //clear simon strings on buttons
           XTft_SetPos(&Tft, BOX1_X1 + SIMON_STRING_BOX_X_INCR, BOX1_Y1 + SIMON_STRING_BOX_Y_INCR); 
           XTft_WriteColorString(&Tft, "SIMON", BOX1_COLOR, BOX1_COLOR);
           XTft_SetPos(&Tft, BOX2_X1 + SIMON_STRING_BOX_X_INCR, BOX2_Y1 + SIMON_STRING_BOX_Y_INCR); 
           XTft_WriteColorString(&Tft, "SIMON", BOX2_COLOR, BOX2_COLOR);
           XTft_SetPos(&Tft, BOX3_X1 + SIMON_STRING_BOX_X_INCR, BOX3_Y1 + SIMON_STRING_BOX_Y_INCR); 
           XTft_WriteColorString(&Tft, "SIMON", BOX3_COLOR, BOX3_COLOR);
           XTft_SetPos(&Tft, BOX4_X1 + SIMON_STRING_BOX_X_INCR, BOX4_Y1 + SIMON_STRING_BOX_Y_INCR); 
           XTft_WriteColorString(&Tft, "SIMON", BOX4_COLOR, BOX4_COLOR);
           XTft_SetPos(&Tft, BOX5_X1 + SIMON_STRING_BOX_X_INCR, BOX5_Y1 + SIMON_STRING_BOX_Y_INCR); 
           XTft_WriteColorString(&Tft, "SIMON", BOX5_COLOR, BOX5_COLOR);
         }                                       
         else // button press -- go to next state
           if (button_hi) next_state = PLAYSYNC;
             break; // START

                // PLAYSYNC: Delay and go to START after .5 sec
       case PLAYSYNC://
	 //erase old string
         XTft_SetPos(&Tft, simon_string_x, SIMON_STRING_Y); 
         XTft_WriteColorString(&Tft, "SIMON: Press any button to start", COLOR_BLACK, COLOR_BLACK);
         XTft_SetPos(&Tft, simon_string_x, SIMON_STRING_Y); 
         XTft_WriteColorString(&Tft, "SIMON", COLOR_WHITE, COLOR_BLACK);

         usleep (500000);
         button_hi = 0;
         current_note = 1; // reset to first note for playback
         next_state = PLAY;
         break; // PLAYSYNC

       // PLAY: play a note up to current max note count
       case PLAY:
         // if all notes played for this cycle then go to test state
         if (current_note > note_count)
         {
           current_note = 1; // reset counter and seed to initial values
           current_seed = seed;
           button_hi = 0;
           next_state = TEST; 
         } // next state setup
         else
         // otherwise play the note and increment the counters
         {      	
           if (current_note < note_count)
           {
             //need to read back old seed
							if(moves[current_note]=='C')
                 current_seed=0;
							else if(moves[current_note]=='W')
                 current_seed=1;
							else if(moves[current_note]=='S')
                 current_seed=2;
							else if(moves[current_note]=='E')
                 current_seed=3;
							else if(moves[current_note]=='N')
                 current_seed=4;
           }
           else
           {
             //need to generate new note
             current_seed = ran_num_gen();  // generate a new random number
                                            // store the move
             if((current_seed % 5)== 0)
										moves[current_note]='C';
             else if((current_seed % 5)== 1)
										moves[current_note]='W';
             else if((current_seed % 5)== 2)
										moves[current_note]='S';
             else if((current_seed % 5)== 3)
										moves[current_note]='E';
             else if((current_seed % 5)== 4)
										moves[current_note]='N';
           }
				
             // play the note
             flash_screen_button(current_seed % 5,Tft);
             tone_blink(current_seed % 5, 300000); 
             restore_screen_button(current_seed % 5,Tft);
						
             usleep (150000);
             current_note = current_note + 1; // increment note count

         } // increment for next note
         break; // PLAY

       // TEST:  poll the buttons for a correct push
       case TEST:
         buttonread = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1);
         buttonread &= PUSHB_MASK;
         //1st time button is initially pressed
         if (buttonread !=0 && button_hi==0 /*|| lastbuttonread!=buttonread*/)
         {
           lastbuttonread=buttonread;
           button_hi = 1;
           // find correct button
								if(buttonread== CENTER_BUTTON){
									buttonPressed ='C';
             current_seed=0;
           }
								else if(buttonread== WEST_BUTTON){
									buttonPressed ='W';
             current_seed=1;
           }
								else if(buttonread== SOUTH_BUTTON){
									buttonPressed ='S';
             current_seed=2;
           }
								else if(buttonread== EAST_BUTTON){
									buttonPressed ='E';
             current_seed=3;
           }
								else if(buttonread== NORTH_BUTTON){
									buttonPressed ='N';
             current_seed=4;
           }

           // if correct button is pressed then play the note and flash button
           if (buttonPressed == moves[current_note])
           {
             flash_screen_button(current_seed % 5,Tft);
             tone_blink(current_seed % 5, 300000); 
             restore_screen_button(current_seed % 5,Tft);
							
           // if not correct button then go to FAIL state
           }
           else{
             //reset seed (to display correct button)
									if(moves[current_note]=='C')
               current_seed=0;
									else if(moves[current_note]=='W')
               current_seed=1;
									else if(moves[current_note]=='S')
               current_seed=2;
									else if(moves[current_note]=='E')
               current_seed=3;
									else if(moves[current_note]=='N')
               current_seed=4;
               next_state = FAIL;
           }

         }
         // if button release then stop note and prepare for next button press
       else if ((buttonread ==0 && button_hi==1 ) ||lastbuttonread!=buttonread)
       {
         lastbuttonread=buttonread;
         button_hi = 0;
         // if have passed current test round then go back to play
         if (current_note >= note_count)
         {
           eraseScore( score, Tft,1);
           note_count = note_count + 1; // increment note counter to test with one more note
           score = score + 1;           // update new score on the display
           line2[14] = (score / 10) + 0x30; line2[15] = (score %10) + 0x30;
           drawScore( score, Tft,1);
           LCDClear();
           LCDPrintString(line1, line2);
           next_state = PLAYSYNC;
         }
         else
         {
            current_note = current_note + 1;
         }
       } // test for button release
       break; // TEST

       // FAIL: play correct note several times if fail
       case FAIL:
         // stutter sound
         for (i=0; i < 5; i++)
         {
           flash_screen_button(current_seed % 5,Tft);
                            tone_blink(current_seed % 5, 100000); 
           usleep(50000);
           restore_screen_button(current_seed % 5,Tft);
           usleep(50000);
                        
         }

         if(score>hiScore)
	 {
           eraseScore( hiScore, Tft,0);
           hiScore=score;
           drawScore( hiScore, Tft,0);
           line1[14] = (score / 10) + 0x30; line1[15] = (score %10) + 0x30;
           LCDClear();
           LCDPrintString(line1, line2);
			
           int reps;
           for(reps=0;reps<10;reps++)
           {
             XTft_SetPos(&Tft, simon_string_x, SIMON_STRING_Y); 
             if((reps % 2) ==0)
             XTft_WriteColorString(&Tft, "SIMON: NEW HIGH SCORE!!!!", COLOR_WHITE, COLOR_BLACK);
else
             XTft_WriteColorString(&Tft, "SIMON: NEW HIGH SCORE!!!!", COLOR_BLACK, COLOR_BLACK);
             tone_blink(reps % 5, 150000);
           }
           //XTft_WriteColorString(&Tft, "SIMON: NEW HIGH SCORE!!!!", COLOR_BLACK, COLOR_BLACK);
         }
         current_seed = ran_num_gen();       // generate a new random number
         next_state = INIT;
         break; // FAIL

       } // State Machine Switch
     } // end of while
     #ifdef PPC440CACHE
     XCache_DisableDCache();
     XCache_DisableICache();
     #endif
     return 0;
}  //  end of main


// tone generator -- frequency in Hz and duration in microseconds
//if interrupt is 1, a button press stops playing the tone
#ifdef PPC440
void tone (int freq, int duration)
{
	
	Xuint32 period;
    Xuint32 halfPeriod;
    Xuint32 timeDuration;
	Xuint32 End_Time;
	Xuint32 Current_Time;
	Xuint32 cycle_start_time;
	Xuint32 transition_time;
	Xuint32 clockRate;
	XTime tEnd, tCur;

	clockRate=CPU_CORE_FREQUENCY/1e6; 
	#if TONE_INTERRUPT
	unsigned int buttonread;        // push button status (0=none presed, 1,2,4..=button number)
	#endif	
   timeDuration=duration;
   if( freq!=0)
   {
     period=1e6/((Xuint32) freq);
     halfPeriod=(Xuint32)period/2;
   }
   else
   {
     //can assign any value here for freq=0
     period=1e6/440;
     halfPeriod=period/2;
   }
    
   // Reset PPC time
	XTime_SetTime(0x0);

	//calculate how long to play note
	XTime_GetTime(&tCur);
	Current_Time = tCur;
	End_Time=Current_Time + (timeDuration * clockRate);	

	do{
		//get start time
		XTime_GetTime(&tCur);
		cycle_start_time = tCur;
#if TONE_INTERRUPT
     buttonread = XGpio_mGetDataReg(PUSHB_CWSEN_BASEADDR, 1);
     buttonread &= PUSHB_MASK;
     Current_Time = End_Time; //will exit loop
#endif
		//get time where sound should go low
		transition_time = cycle_start_time + (halfPeriod * clockRate); //convert to ticks
		XTime_GetTime(&tCur);
		Current_Time = tCur;
		
		//set high to speaker
		#if PLAY_SOUND
     if(freq>20 )XIo_Out32 (PIEZO_BASEADDR, PIEZO_ON);
		#endif

		//while(current_time is less than half_period_time) set high to speaker
		while(Current_Time < transition_time ){
			XTime_GetTime(&tCur);
			Current_Time = tCur;
		}

		//set low to speaker
		XIo_Out32 (PIEZO_BASEADDR, PIEZO_OFF);
		
		//get time where period ends
		transition_time = cycle_start_time + ((Xuint32)2 * halfPeriod * clockRate);
		XTime_GetTime(&tCur);
		Current_Time = tCur;

		//while(current_time is less than 2nd half_period_time) do nothing;
		while(Current_Time < transition_time) {
			XTime_GetTime(&tCur);
			Current_Time = tCur;
		}
	}while(Current_Time < End_Time ); //while(still time left in current note);

}
#else
void tone (int freq, int duration)
{
    float period;
	
   Xuint32 clockRate;
   Xuint32 halfPeriod;
   Xuint32 timeDuration;
   Xuint32 End_Time;
   Xuint32 Current_Time;
   Xuint32 cycle_start_time;
   Xuint32 transition_time;
   clockRate=OPB_CLK_MHZ;
   Xuint32 ControlStatus;
#if TONE_INTERRUPT
   unsigned int buttonread;        // push button status (0=none presed, 1,2,4..=button number)
#endif	
   timeDuration=duration;
   if( freq!=0)
   {
     period=1e6/((Xuint32) freq);
     halfPeriod=(Xuint32)period/2;
   }
   else
   {
     //can assign any value here for freq=0
     period=1e6/440;
     halfPeriod=period/2;
   }
    
   // Clear the Control Status Register
   XTmrCtr_SetControlStatusReg(TMRCTR_BASEADDR, TIMER_COUNTER_0,0x0);

   // Reset timer
   XTmrCtr_SetLoadReg(TMRCTR_BASEADDR, TIMER_COUNTER_0, 0x0);
   XTmrCtr_LoadTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);

   // Clear the Load Timer bit in the Control Status Register
   ControlStatus = XTmrCtr_GetControlStatusReg(TMRCTR_BASEADDR,TIMER_COUNTER_0);
   XTmrCtr_SetControlStatusReg(TMRCTR_BASEADDR, TIMER_COUNTER_0, ControlStatus & (~XTC_CSR_LOAD_MASK));
   XTmrCtr_Enable(TMRCTR_BASEADDR, TIMER_COUNTER_0);
	
   //calculate how long to play note
   Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
   End_Time=Current_Time + timeDuration * clockRate;	

   do{
     //get start time
     cycle_start_time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
#if TONE_INTERRUPT
     buttonread = XGpio_ReadReg(PUSHB_CWSEN_BASEADDR, 1);
     buttonread &= PUSHB_MASK;
     Current_Time = End_Time; //will exit loop
#endif
     //get time where sound goes low
     transition_time = cycle_start_time + halfPeriod*clockRate; //convert to ticks
     Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
		
#if PLAY_SOUND
     //set high to speaker
     if(freq>20 )XIo_Out32 (PIEZO_BASEADDR, PIEZO_ON);
#endif		
     //while(current_time is less than half_period_time) set high to speaker
     while(Current_Time < transition_time )
     Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);

     //set low to speaker
     XIo_Out32 (PIEZO_BASEADDR, PIEZO_OFF);	

     //get time where period ends
     transition_time = cycle_start_time + (Xuint32)2*halfPeriod*clockRate;
     Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);

     //while(current_time is less than half_period_time) do nothing;
     while(Current_Time < transition_time)
     Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);

   }while(Current_Time < End_Time ); //while(still time left in current note);

   XTmrCtr_Disable(TMRCTR_BASEADDR, TIMER_COUNTER_0);
}
#endif

// tone_blink -- play one of three tones and flash matching lamp (0 to 2) 
void tone_blink (int tone_select, int duration)
{
        //GPIO_writeLED( 1 << tone_select);
        XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, (1 << (4-tone_select) ));

        tone (200 * (tone_select+1), duration);
        //GPIO_writeLED(0);
        XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, 0);
}

//assumes seed={0,1,2,3,4}
void flash_screen_button(int seed,XTft Tft)
{

	if(seed == 0){
		XTft_SetPos(&Tft, BOX3_X1 + SIMON_STRING_BOX_X_INCR, BOX3_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX3_COLOR);
		XTft_DrawSolidBox(&Tft, BOX3_X1,BOX3_Y1,BOX3_X2,BOX3_Y1+BOX_MOVE_AMT, COLOR_BLACK);
		XTft_DrawSolidBox(&Tft, BOX3_X1,BOX3_Y1+BOX_WIDTH,BOX3_X2,BOX3_Y1+BOX_WIDTH+BOX_MOVE_AMT, BOX3_COLOR);
	}
	else if(seed == 1){
		XTft_SetPos(&Tft, BOX2_X1 + SIMON_STRING_BOX_X_INCR, BOX2_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX2_COLOR);
		XTft_DrawSolidBox(&Tft, BOX2_X1,BOX2_Y1,BOX2_X2,BOX2_Y1+BOX_MOVE_AMT, COLOR_BLACK);
		XTft_DrawSolidBox(&Tft, BOX2_X1,BOX2_Y1+BOX_WIDTH,BOX2_X2,BOX2_Y1+BOX_WIDTH+BOX_MOVE_AMT, BOX2_COLOR);
	}
	else if(seed == 2){
		XTft_SetPos(&Tft, BOX5_X1 + SIMON_STRING_BOX_X_INCR, BOX5_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX5_COLOR);
		XTft_DrawSolidBox(&Tft, BOX5_X1,BOX5_Y1,BOX5_X2,BOX5_Y1+BOX_MOVE_AMT, COLOR_BLACK);
		XTft_DrawSolidBox(&Tft, BOX5_X1,BOX5_Y1+BOX_WIDTH,BOX5_X2,BOX5_Y1+BOX_WIDTH+BOX_MOVE_AMT, BOX5_COLOR);
	}
	else if (seed ==3){
		XTft_SetPos(&Tft, BOX4_X1 + SIMON_STRING_BOX_X_INCR, BOX4_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX4_COLOR);	
		XTft_DrawSolidBox(&Tft, BOX4_X1,BOX4_Y1,BOX4_X2,BOX4_Y1+BOX_MOVE_AMT, COLOR_BLACK);
		XTft_DrawSolidBox(&Tft, BOX4_X1,BOX4_Y1+BOX_WIDTH,BOX4_X2,BOX4_Y1+BOX_WIDTH+BOX_MOVE_AMT, BOX4_COLOR);
	}
	else {
		 XTft_SetPos(&Tft, BOX1_X1 + SIMON_STRING_BOX_X_INCR, BOX1_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", COLOR_BLACK, BOX1_COLOR);
		XTft_DrawSolidBox(&Tft, BOX1_X1,BOX1_Y1,BOX1_X2,BOX1_Y1+BOX_MOVE_AMT, COLOR_BLACK);
		XTft_DrawSolidBox(&Tft, BOX1_X1,BOX1_Y1+BOX_WIDTH,BOX1_X2,BOX1_Y1+BOX_WIDTH+BOX_MOVE_AMT, BOX1_COLOR);
	}
	
}

void restore_screen_button(int seed,XTft Tft)
{
	
	if(seed == 0){
		XTft_SetPos(&Tft, BOX3_X1 + SIMON_STRING_BOX_X_INCR, BOX3_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", BOX3_COLOR, BOX3_COLOR);
		XTft_DrawSolidBox(&Tft, BOX3_X1,BOX3_Y1,BOX3_X2,BOX3_Y1+BOX_MOVE_AMT, BOX3_COLOR);
		XTft_DrawSolidBox(&Tft, BOX3_X1,BOX3_Y1+BOX_WIDTH,BOX3_X2,BOX3_Y1+BOX_WIDTH+BOX_MOVE_AMT, COLOR_BLACK);
	}
	else if(seed == 1){
		XTft_SetPos(&Tft, BOX2_X1 + SIMON_STRING_BOX_X_INCR, BOX2_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", BOX2_COLOR, BOX2_COLOR);
		XTft_DrawSolidBox(&Tft, BOX2_X1,BOX2_Y1,BOX2_X2,BOX2_Y1+BOX_MOVE_AMT, BOX2_COLOR);
		XTft_DrawSolidBox(&Tft, BOX2_X1,BOX2_Y1+BOX_WIDTH,BOX2_X2,BOX2_Y1+BOX_WIDTH+BOX_MOVE_AMT, COLOR_BLACK);
	}
	else if(seed == 2){
		XTft_SetPos(&Tft, BOX5_X1 + SIMON_STRING_BOX_X_INCR, BOX5_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", BOX5_COLOR, BOX5_COLOR);
		XTft_DrawSolidBox(&Tft, BOX5_X1,BOX5_Y1,BOX5_X2,BOX5_Y1+BOX_MOVE_AMT, BOX5_COLOR);
		XTft_DrawSolidBox(&Tft, BOX5_X1,BOX5_Y1+BOX_WIDTH,BOX5_X2,BOX5_Y1+BOX_WIDTH+BOX_MOVE_AMT, COLOR_BLACK);
	}
	else if (seed ==3){
		XTft_SetPos(&Tft, BOX4_X1 + SIMON_STRING_BOX_X_INCR, BOX4_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", BOX4_COLOR, BOX4_COLOR);	
		XTft_DrawSolidBox(&Tft, BOX4_X1,BOX4_Y1,BOX4_X2,BOX4_Y1+BOX_MOVE_AMT, BOX4_COLOR);
		XTft_DrawSolidBox(&Tft, BOX4_X1,BOX4_Y1+BOX_WIDTH,BOX4_X2,BOX4_Y1+BOX_WIDTH+BOX_MOVE_AMT, COLOR_BLACK);
	}
	else {
		XTft_SetPos(&Tft, BOX1_X1 + SIMON_STRING_BOX_X_INCR, BOX1_Y1 + SIMON_STRING_BOX_Y_INCR + BOX_MOVE_AMT); 
		XTft_WriteColorString(&Tft, "SIMON", BOX1_COLOR, BOX1_COLOR);
		XTft_DrawSolidBox(&Tft, BOX1_X1,BOX1_Y1,BOX1_X2,BOX1_Y1+BOX_MOVE_AMT, BOX1_COLOR);
		XTft_DrawSolidBox(&Tft, BOX1_X1,BOX1_Y1+BOX_WIDTH,BOX1_X2,BOX1_Y1+BOX_WIDTH+BOX_MOVE_AMT, COLOR_BLACK);
	}
}


//MAX is 99
//can rewrite this to only draw digits
void drawScore(int score,XTft Tft,int drawCurrentScore)
{
	int score1,score0;
	
	score0 = score % 10;
	score1 = (score - score0) / 10;

	if(drawCurrentScore)
	{
		XTft_SetPos(&Tft, SCORE_X, SCORE_Y); 
	}
	else //draw hiScore
	{
		XTft_SetPos(&Tft, HISCORE_X+10, HISCORE_Y); 
	}

	//1st digit
	if(score1==1)
		XTft_WriteColorString(&Tft, "1", COLOR_WHITE, COLOR_BLACK);
	else if (score1==2)
		XTft_WriteColorString(&Tft, "2", COLOR_WHITE, COLOR_BLACK);
	else if (score1==3)
		XTft_WriteColorString(&Tft, "3", COLOR_WHITE, COLOR_BLACK);
	else if (score1==4)
		XTft_WriteColorString(&Tft, "4", COLOR_WHITE, COLOR_BLACK);
	else if (score1==5)
		XTft_WriteColorString(&Tft, "5", COLOR_WHITE, COLOR_BLACK);
	else if (score1==6)
		XTft_WriteColorString(&Tft, "6", COLOR_WHITE, COLOR_BLACK);
	else if (score1==7)
		XTft_WriteColorString(&Tft, "7", COLOR_WHITE, COLOR_BLACK);
	else if (score1==8)
		XTft_WriteColorString(&Tft, "8", COLOR_WHITE, COLOR_BLACK);
	else if (score1==9)
		XTft_WriteColorString(&Tft, "9", COLOR_WHITE, COLOR_BLACK);

	//2nd digit
	
	if(drawCurrentScore)
	{
		XTft_SetPos(&Tft, SCORE_X+10, SCORE_Y); 	
	}
	else //draw hiScore
	{
		XTft_SetPos(&Tft, HISCORE_X+20, HISCORE_Y); 
	}

	if(score0==0)
		XTft_WriteColorString(&Tft, "0", COLOR_WHITE, COLOR_BLACK);	
	else if(score0==1)
		XTft_WriteColorString(&Tft, "1", COLOR_WHITE, COLOR_BLACK);
	else if (score0==2)
		XTft_WriteColorString(&Tft, "2", COLOR_WHITE, COLOR_BLACK);
	else if (score0==3)
		XTft_WriteColorString(&Tft, "3", COLOR_WHITE, COLOR_BLACK);
	else if (score0==4)
		XTft_WriteColorString(&Tft, "4", COLOR_WHITE, COLOR_BLACK);
	else if (score0==5)
		XTft_WriteColorString(&Tft, "5", COLOR_WHITE, COLOR_BLACK);
	else if (score0==6)
		XTft_WriteColorString(&Tft, "6", COLOR_WHITE, COLOR_BLACK);
	else if (score0==7)
		XTft_WriteColorString(&Tft, "7", COLOR_WHITE, COLOR_BLACK);
	else if (score0==8)
		XTft_WriteColorString(&Tft, "8", COLOR_WHITE, COLOR_BLACK);
	else if (score0==9)
		XTft_WriteColorString(&Tft, "9", COLOR_WHITE, COLOR_BLACK);
	
}

void eraseScore(int score,XTft Tft,int drawCurrentScore)
{
	int score1,score0;
	
	score0 = score % 10;
	score1 = (score - score0) / 10;

	if(drawCurrentScore)
	{
		XTft_SetPos(&Tft, SCORE_X, SCORE_Y); 
	}
	else //draw hiScore
	{
		XTft_SetPos(&Tft, HISCORE_X+10, HISCORE_Y); 
	}

	//1st digit
	if(score1==0)
		XTft_WriteColorString(&Tft, "0", COLOR_BLACK, COLOR_BLACK);	
	else if(score1==1)
		XTft_WriteColorString(&Tft, "1", COLOR_BLACK, COLOR_BLACK);
	else if (score1==2)
		XTft_WriteColorString(&Tft, "2", COLOR_BLACK, COLOR_BLACK);
	else if (score1==3)
		XTft_WriteColorString(&Tft, "3", COLOR_BLACK, COLOR_BLACK);
	else if (score1==4)
		XTft_WriteColorString(&Tft, "4", COLOR_BLACK, COLOR_BLACK);
	else if (score1==5)
		XTft_WriteColorString(&Tft, "5", COLOR_BLACK, COLOR_BLACK);
	else if (score1==6)
		XTft_WriteColorString(&Tft, "6", COLOR_BLACK, COLOR_BLACK);
	else if (score1==7)
		XTft_WriteColorString(&Tft, "7", COLOR_BLACK, COLOR_BLACK);
	else if (score1==8)
		XTft_WriteColorString(&Tft, "8", COLOR_BLACK, COLOR_BLACK);
	else if (score1==9)
		XTft_WriteColorString(&Tft, "9", COLOR_BLACK, COLOR_BLACK);

	//2nd digit
	
	if(drawCurrentScore)
	{
		XTft_SetPos(&Tft, SCORE_X+10, SCORE_Y); 	
	}
	else //draw hiScore
	{
		XTft_SetPos(&Tft, HISCORE_X+20, HISCORE_Y); 
	}

	if(score0==0)
		XTft_WriteColorString(&Tft, "0", COLOR_BLACK, COLOR_BLACK);	
	else if(score0==1)
		XTft_WriteColorString(&Tft, "1", COLOR_BLACK, COLOR_BLACK);
	else if (score0==2)
		XTft_WriteColorString(&Tft, "2", COLOR_BLACK, COLOR_BLACK);
	else if (score0==3)
		XTft_WriteColorString(&Tft, "3", COLOR_BLACK, COLOR_BLACK);
	else if (score0==4)
		XTft_WriteColorString(&Tft, "4", COLOR_BLACK, COLOR_BLACK);
	else if (score0==5)
		XTft_WriteColorString(&Tft, "5", COLOR_BLACK, COLOR_BLACK);
	else if (score0==6)
		XTft_WriteColorString(&Tft, "6", COLOR_BLACK, COLOR_BLACK);
	else if (score0==7)
		XTft_WriteColorString(&Tft, "7", COLOR_BLACK, COLOR_BLACK);
	else if (score0==8)
		XTft_WriteColorString(&Tft, "8", COLOR_BLACK, COLOR_BLACK);
	else if (score0==9)
		XTft_WriteColorString(&Tft, "9", COLOR_BLACK, COLOR_BLACK);
	
}

	




// random number generator
// returns random 16-bit seed
#ifdef PPC440
int ran_num_gen()
{

	Xuint32 Current_Time;
	XTime tEnd, tCur;
	
	// Clear the Control Status Register
   //XTmrCtr_mSetControlStatusReg(TMRCTR_BASEADDR, TIMER_COUNTER_1,0x0);

   //check if timer reached limit
	XTime_GetTime(&tCur);
	Current_Time = tCur;
   // if reached limit, reset timer
   if(Current_Time==0)
   {
	   //XTmrCtr_mSetLoadReg(TMRCTR_BASEADDR, TIMER_COUNTER_1, 0x0);
	   //XTmrCtr_mLoadTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_1);
   }

   // Clear the Load Timer bit in the Control Status Register
   //ControlStatus = XTmrCtr_mGetControlStatusReg(TMRCTR_BASEADDR,TIMER_COUNTER_1);
   //XTmrCtr_mSetControlStatusReg(TMRCTR_BASEADDR, TIMER_COUNTER_1, ControlStatus & (~XTC_CSR_LOAD_MASK));
   //XTmrCtr_mEnable(TMRCTR_BASEADDR, TIMER_COUNTER_1);
		
	XTime_GetTime(&tCur);
	Current_Time = tCur;
	
	// Noticed that the lowest 16 bits were not very random; usually were returning only even numbers
	// Tested the distribution of bits 4-11 and found the distrubution more acceptable.
	return ((Current_Time&0xff0)>>4);
}       
#else
int ran_num_gen()
{

	Xuint32 Current_Time;
	Xuint32 ControlStatus;
	
	// Clear the Control Status Register
   XTmrCtr_SetControlStatusReg(TMRCTR_BASEADDR, TIMER_COUNTER_1,0x0);

   //check if timer reached limit
   Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_1);
   // if reached limit, reset timer
   if(Current_Time==0)
   {
	   XTmrCtr_SetLoadReg(TMRCTR_BASEADDR, TIMER_COUNTER_1, 0x0);
	   XTmrCtr_LoadTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_1);
   }

   // Clear the Load Timer bit in the Control Status Register
   ControlStatus = XTmrCtr_GetControlStatusReg(TMRCTR_BASEADDR,TIMER_COUNTER_1);
   XTmrCtr_SetControlStatusReg(TMRCTR_BASEADDR, TIMER_COUNTER_1, ControlStatus & (~XTC_CSR_LOAD_MASK));
   XTmrCtr_Enable(TMRCTR_BASEADDR, TIMER_COUNTER_1);
		
	Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_1);
	
	// Noticed that the lowest 16 bits were not very random; usually were returning only even numbers
	// Tested the distribution of bits 4-11 and found the distrubution more acceptable.
	return ((Current_Time&0xff0)>>4);
}       
#endif

// ****************************************************************************
// Example_3
// Changing LED update delay and sequencing direction 
// ****************************************************************************
// EP)  On an embedded hardware platform, the LEDs will sequence from LED4
//      to LED1 with an LED on-time determined by a delay. This sequence will
//      be repeated twice. The sequence direction and LED on-time are set
//      by local variables. To change code at compile time:
//      1) uncomment desired lines of code below to introduce new settings
//      2) save file
//      3) Tools > Compile Program Sources to generate new executable ELF file
//      Compile without sim_sleep.c
// MS)  For Modelsim simulation include the sim_sleep.c file to
//      eliminate any time delays added by usleep() calls. Compiling
//      the software with sim_sleep.c saves one from having to modify 
//      or remove all the usleep() calls. Modelsim will show GPIO output
//      lines changing through loop control.
// CS)  Chipscope monitoring of GPIO output will show signals on a hardware
//      platform changing state as in ModelSim simulation. To observe actual
//      signal timing information compile software without sim_sleep.c 
// GDB) Compile without sim_sleep.c for EP setup using GDB. By setting a
//      breakpoint just before entering the inner for loop one can alter
//      the execution flow by modifying:
//      1) usleep_delay to change time interval between LED updates 
//      2) led_direction to alter LED sequencing direction
//


void example_3()
{
        volatile unsigned int usleep_delay;
        volatile unsigned int led_direction;
        int i,j;
        int lamp_on;

        lamp_on = 1;
        for (i=0; i<2; i++)
        {
          //usleep_delay = (unsigned int)500000;
          usleep_delay = (unsigned int)200000;
        
          //led_direction = (unsigned int)LED1_to_LED4;
          led_direction = (unsigned int)LED4_to_LED1;

          // set breakpoint here to modify usleep_delay
          // or led_direction before entering LED output loop
          for (j=0; j<8; j++)
          {
                //GPIO_writeLED(lamp_on);
                XGpio_WriteReg(LEDS_CWSEN_BASEADDR, 1, lamp_on);
                usleep(usleep_delay); //delay usleep_delay microseconds
                // Select direction of LED sequencing 
                // LED1 to LED4
                if (led_direction == LED1_to_LED4 )
                {
                        lamp_on = ((lamp_on << 1) | (lamp_on >> 4)) & 0x1f;
                }
                else
                {
                // LED4 to LED1
                        lamp_on = ((lamp_on >> 1) | (lamp_on << 4)) & 0x1f;
                }
          }
        }
}
