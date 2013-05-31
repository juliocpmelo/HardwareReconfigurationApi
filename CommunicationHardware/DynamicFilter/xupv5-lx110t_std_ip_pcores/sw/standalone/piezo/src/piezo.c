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
* @file piezo.c
*
* This example plays out RTTL ringtone files over the piezo speaker (SP1) on
* the ML505/ML506/ML507 board.  The System ACE CF controller along with the 
* XilFATfs libary is used to read the files from the ringtones directory on 
* the CompactFlash card.
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
#include <sysace_stdio.h>        
#include "xsysace_l.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "memory_map.h"

#ifdef PPC440
#include <sleep.h>
#include "xtime_l.h"
#else
#include <xtmrctr.h>
#endif

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif


#define CONFIG_WRITE
#define CONFIG_DIR_SUPPORT



/************************** Function Prototypes ******************************/
void playNote();
int getNoteInfo(int noteIndex);
void playSong();
int get_melody_string(char FileName[], int readFile);
char InputGetChar();


/************************** Constant Definitions *****************************/
#define ESCAPE                0x1b
#define DEFAULT_DURATION      4		 // RTTL defaults
#define DEFAULT_OCTAVE        6		 // RTTL defaults
#define DEFAULT_BEATS_PER_MIN 63         // RTTL defaults
#define PLB_CLK_MHZ           125
#define RINGTONE_LIMIT        1000
#define TIMER_COUNTER_0       0 
#define PIEZO_ON         0x1
#define PIEZO_OFF        0x0
#define END_OF_SONG           -1
#define SONG_UART_INTERRUPT   1
#define ASCII_CARRIAGE_RETURN 13
#define PLAY_SOUND            1



/************************** Global Variables *****************************/
//these variables characterize the musical note parsed from the string
int frequency; 
int noteDuration;
int beatsPerMin;
int isDottedNote;
//Holds the string with RTTTL ringtone
char melody[RINGTONE_LIMIT];



/******************************************************************************
*
* This program plays songs either on the Compact Flash Card or User entered. 
*
* These specific files are needed. The User can place a ringtone in User.txt 
* 	char file1[] = "a:\\ringtone\\5thSym.txt";
*	char file2[] = "a:\\ringtone\\OdeToJoy.txt";
*	char file3[] = "a:\\ringtone\\MozartE.txt";
*	char file4[] = "a:\\ringtone\\MozartR.txt";
*	char file5[] = "a:\\ringtone\\BachAir.txt";
*	char file6[] = "a:\\ringtone\\BachMin.txt";
*	char file7[] = "a:\\ringtone\\User.txt";
*
* @return
*
* None.
*
* @note
*
* None.
*
****************************************************************************/
int main()
{
	char file1[] = "a:\\ringtone\\5thSym.txt";
	char file2[] = "a:\\ringtone\\OdeToJoy.txt";
	char file3[] = "a:\\ringtone\\MozartE.txt";
	char file4[] = "a:\\ringtone\\MozartR.txt";
	char file5[] = "a:\\ringtone\\BachMin.txt";
	char file6[] = "a:\\ringtone\\Enter.txt";
	char file7[] = "a:\\ringtone\\User.txt";
	char ch;
	int char_num;

    #ifdef PPC440CACHE
    XCache_EnableICache(PPC440_ICACHE);
    XCache_EnableDCache(PPC440_DCACHE);
    #endif

    XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
    XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);
    /*
     * Set GPIO tri-state register controlling the PIEZO speaker to all outputs
     */
    XIo_Out32 (PIEZO_BASEADDR+4, 0x0);

	xil_printf("\n\rThis program attempts to access the CF card's file system\n\r");
	xil_printf("Please insert a CF card with folder 'ringtones', which contains RTTTL ringtone files:\r\n");
	xil_printf("%s\r\n",file1);
	xil_printf("%s\r\n",file2);
	xil_printf("%s\r\n",file3);
	xil_printf("%s\r\n",file4);
	xil_printf("%s\r\n",file5);
	xil_printf("%s\r\n",file6);
	xil_printf("%s\r\n\r\n",file7);

    xil_printf("Press any key to continue after CF is inserted.\n\r\n\r");
   // while (!(XUartNs550_mGetLineStatusReg(UART_BASEADDR) & 0x1));
	InputGetChar(); //
	 
    // Reset the sysace controller to clean any bad state, leave it in MPU mode
    XSysAce_RegWrite16(SYSACE_BASEADDR + XSA_BMR_OFFSET, XSA_BMR_16BIT_MASK);
	XSysAce_SetControlReg(SYSACE_BASEADDR, XSA_CR_CFGSEL_MASK | XSA_CR_FORCECFGMODE_MASK);
	XSysAce_SetControlReg(SYSACE_BASEADDR, XSA_CR_CFGSEL_MASK | XSA_CR_FORCECFGMODE_MASK | XSA_CR_CFGRESET_MASK);
	XSysAce_SetControlReg(SYSACE_BASEADDR, XSA_CR_CFGSEL_MASK | XSA_CR_FORCECFGMODE_MASK);


	while(1){
		xil_printf("\r\n\r\n**********   Pick a Ringtone   ********** \r\n\r\n");
		xil_printf("1. Beethoven - 5th Symphony\r\n");	
		xil_printf("2. Beethoven - Ode to Joy\r\n");
		xil_printf("3. Mozart    - Eine Kleine Nachtmusik\r\n");
		xil_printf("4. Mozart    - Rondo Alla Turca\r\n");
		xil_printf("5. Bach      - Minuet\r\n");
		xil_printf("6. Joplin    - Entertainer\r\n");
		xil_printf("7. User      - From file 'User.txt'\r\n");
		xil_printf("8. User      - Type in your ringtone\r\n");
		ch =InputGetChar();

		switch(ch){
		case '1': char_num = get_melody_string(file1, 1); break;
		case '2': char_num = get_melody_string(file2, 1); break;
		case '3': char_num = get_melody_string(file3, 1); break;
		case '4': char_num = get_melody_string(file4, 1); break;
		case '5': char_num = get_melody_string(file5, 1); break;
		case '6': char_num = get_melody_string(file6, 1); break;
		case '7': char_num = get_melody_string(file7, 1); break;
		case '8': char_num = get_melody_string(file7, 0); break;
		default : char_num = 0; break;
		}

		
		
		if(char_num>0)
				playSong();	
	}	
    #ifdef PPC440CACHE
    XCache_DisableDCache();
    XCache_DisableICache();
    #endif
    return 0;
}

/******************************************************************************
*
* Given an index of the current location within an RTTL string, this function
* stores the next note's information ( i.e frequency, note duration distinction,
* beats per min, and if its a dotted note). These values are stored in global variables
*
* @input 	noteIndex = current position in the string to find the next note
*
* @return	returns the starting position in the melody string of the next note to be played
*				or END_OF_SONG denoting the end of the string
*
* @note		Following parameters need to be defined: DEFAULT_DURATION,DEFAULT_OCTAVE,DEFAULT_BEATS_PER_MIN
*			If there is whitespace in the string, the result is undefined
*				
*			Sample melody variable:
*			melody[] ={"Beethoven_OdeToJoy:d=4,o=5,b=100:a4,a4,a4,c,c,a4,a4,g4,f4,f4,g4,a4,a.4,
						8g4,2g4,a4,a4,a4,c,c,a4,a4,g4,f4,f4,g4,a4,g.4,8f4,2f4,g4,g4,a4,f4,g4,8a4,
						8a4,a4,f4,g4,8a4,8a4,a4,g4,f4,g4,c4,2a4,a4,a4,c,c,a4,a4,g4,f4,f4,g4,a4,g.4,8f4,2f4"};
******************************************************************************/
int getNoteInfo( int noteIndex)
{
   //When function is initially called,
   //these vaules are set to the default or by the input string's options field 
   static int defaultDuration = DEFAULT_DURATION;
   static int defaultOctave = DEFAULT_OCTAVE;
   static int defaultBeatsPerMin = DEFAULT_BEATS_PER_MIN;
   static int notesPlayed = 0;

   noteDuration=defaultDuration;
   beatsPerMin=defaultBeatsPerMin;
   isDottedNote=0;

   //reset
   if(noteIndex==0)  notesPlayed=0; 

	//if notes played, need to parse out name and options fields
   if(! notesPlayed){

		//drop song name
	    //xil_printf("Playing",)
	   while(melody[noteIndex] != ':') {
         if(melody[noteIndex] == 0)
				return END_OF_SONG;

			noteIndex++;
	   }

	   noteIndex++;//skip :
		
		//check if any options are defined
		int tempIndex;
		tempIndex=noteIndex;
		while( melody[tempIndex]!=':'){
         if(melody[tempIndex] == 0)
				return END_OF_SONG;
			tempIndex++;
		}
		
		//If they exist, set options (only d,o,b options)		
		if(melody[tempIndex]==':'){
while((melody[noteIndex] != ':') &&  (melody[tempIndex]!=0)){ //until end of options field
				
				if(melody[noteIndex] =='d'){
					
					noteIndex+=2; //skip '='
				
					if ((melody[noteIndex] == '6') && (melody[noteIndex+1] == '4')) {
						defaultDuration = 64;
						noteIndex += 2;
					}
					else if ((melody[noteIndex] == '3') && (melody[noteIndex+1] == '2')) {
						defaultDuration = 32;
						noteIndex += 2;
					}
					else if ((melody[noteIndex] == '1') && (melody[noteIndex+1] == '6')) {
						defaultDuration = 16;
						noteIndex += 2;
					}
					else if (melody[noteIndex]  == '8'){
						defaultDuration = 8;
						noteIndex++;
					}
					else if (melody[noteIndex]  == '4') {
						defaultDuration = 4;
						noteIndex++;
					}
					else if (melody[noteIndex] == '2') {
						defaultDuration = 2;
						noteIndex++;
					}
					else if (melody[noteIndex] == '1') {
						defaultDuration = 1;
						noteIndex++;
					} 
				}
				else if(melody[noteIndex]=='o'){
					noteIndex+=2; //skip '='
					
					if (melody[noteIndex]== '4') {
						defaultOctave = 4;
						noteIndex++;
					} 
					else if (melody[noteIndex] == '5') {
						defaultOctave = 5;
						noteIndex++;
					} 
					else if (melody[noteIndex]== '6') {
						defaultOctave = 6;
						noteIndex++;
					}
					else if (melody[noteIndex] == '7') {
						defaultOctave = 7;
						noteIndex++;
					}
				}
				else if(melody[noteIndex] =='b'){
					noteIndex+=2; //skip '='
					defaultBeatsPerMin=0;
					
					while( melody[noteIndex]!=':' && melody[noteIndex]!=','){
						defaultBeatsPerMin*=10;
						if(melody[noteIndex]=='1') defaultBeatsPerMin++;
						else if(melody[noteIndex]=='2') defaultBeatsPerMin+=2;
						else if(melody[noteIndex]=='3') defaultBeatsPerMin+=3;
						else if(melody[noteIndex]=='4') defaultBeatsPerMin+=4;
						else if(melody[noteIndex]=='5') defaultBeatsPerMin+=5;
						else if(melody[noteIndex]=='6') defaultBeatsPerMin+=6;
						else if(melody[noteIndex]=='7') defaultBeatsPerMin+=7;
						else if(melody[noteIndex]=='8') defaultBeatsPerMin+=8;
						else if(melody[noteIndex]=='9') defaultBeatsPerMin+=9;
						noteIndex++;
					}
					beatsPerMin=defaultBeatsPerMin;  
				}
				else noteIndex++;

				//if reached end of song
if(melody[noteIndex]==0)		
					return END_OF_SONG;
			}
			noteIndex++;//rid option fields's ':'
			
		}

   }


   
   //skip whitespace and comma
   while(melody[noteIndex]==',' || melody[noteIndex]==' '|| melody[noteIndex]=='\t'|| melody[noteIndex]=='\n' ||melody[noteIndex]==ASCII_CARRIAGE_RETURN || melody[noteIndex]==0)
   {
	   //if reached end of song
if(melody[noteIndex]==0)		
			return END_OF_SONG;
	   noteIndex++;
   }

   //Now Parsing Notes	 
   //Perform assignments if reach a duration symbol
   if(melody[noteIndex]!='a' && melody[noteIndex]!='b' && melody[noteIndex]!='c' && melody[noteIndex]!='d' 
		&& melody[noteIndex]!='e' && melody[noteIndex]!='f'&& melody[noteIndex]!='g'&& melody[noteIndex]!='p')
   {
      
      if ((melody[noteIndex] == '6') && (melody[noteIndex+1] == '4')) {
			noteDuration = 64;
         noteIndex += 2;
      }
      else if ((melody[noteIndex] == '3') && (melody[noteIndex+1] == '2')) {
         noteDuration = 32;
         noteIndex += 2;
      }
      else if ((melody[noteIndex]== '1') && (melody[noteIndex+1]== '6')) {
         noteDuration = 16;
         noteIndex += 2;
      }
      else if (melody[noteIndex] == '8'){
         noteDuration = 8;
         noteIndex++;
		
      }
      else if (melody[noteIndex] == '4') {
         noteDuration = 4;
         noteIndex++;
      }
      else if (melody[noteIndex] == '2') {
         noteDuration = 2;
         noteIndex++;
      }
      else if (melody[noteIndex] == '1') {
         noteDuration = 1;
         noteIndex++;
      } 
   }
   // set frequency of note
   if(melody[noteIndex]=='a'&& melody[noteIndex+1]=='#'){
		frequency=466;
		noteIndex+=2;
	}
   else if(melody[noteIndex]=='a'){ 
		frequency=440;
		noteIndex++;
	}
   else if(melody[noteIndex]=='b'){              
		frequency=494;
		noteIndex++;
	}
   else if (melody[noteIndex]=='c'&& melody[noteIndex+1]=='#'){            
//		frequency=554; Wrong octave
		frequency=277;
		noteIndex+=2;
	}
   else if(melody[noteIndex]=='c'){
//		frequency=523;
		frequency=262;
		noteIndex++;
	}
   else if (melody[noteIndex]=='d'&& melody[noteIndex+1]=='#'){          
//		frequency=622;
		frequency=311;
		noteIndex+=2;
	}
   else if(melody[noteIndex]=='d'){   
//		frequency=587;
		frequency=294;
		noteIndex++;
	}
   else if(melody[noteIndex]=='e'){                                           
//		frequency=659;
		frequency=330;
		noteIndex++;
	}
   else if (melody[noteIndex]=='f'&& melody[noteIndex+1]=='#'){     
//		frequency=740;
		frequency=370;
		noteIndex+=2;
	}
   else if(melody[noteIndex]=='f'){     
//		frequency=698;
		frequency=349;
		noteIndex++;
	}
   else if (melody[noteIndex]=='g'&& melody[noteIndex+1]=='#'){      
//		frequency=831;
		frequency=415;
		noteIndex+=2;
	}
   else if(melody[noteIndex]=='g'){  
//		frequency=784;
		frequency=392;
		noteIndex++;
	}
   else if (melody[noteIndex]=='p'){ 
		frequency=0;
		noteIndex++;
	}

   //some ringtones have '_' here, even though its note RTTTL format
	if (melody[noteIndex]=='_')noteIndex++;

   //Perform assignments if reach an octave or dottedHalfnote symbol
   int useDefaultOctave;
   useDefaultOctave=1;
   while((melody[noteIndex]!=',') && (melody[noteIndex]!=0)	){
	  

		if(melody[noteIndex]=='4'){
			useDefaultOctave=0;
			noteIndex++;
		}//frequency stays	
		else if(melody[noteIndex]=='5')
		{ 
			useDefaultOctave=0;
			(frequency)*=2;
			noteIndex++;
		}
		else if(melody[noteIndex]=='6'){ 
			useDefaultOctave=0;
			(frequency)*=4;
			noteIndex++;
		}
		else if(melody[noteIndex]=='7'){ 
			useDefaultOctave=0;
			(frequency)*=8;
			noteIndex++;
		}
		else if(melody[noteIndex]=='.'){
			isDottedNote=1;
			noteIndex++;
		}	
		else 
			noteIndex++;
   }

	//change frequency if octave != 4   
   if(useDefaultOctave==1)
   {
      if (defaultOctave==5)(frequency)*=2;
      else if (defaultOctave==6)(frequency)*=4;
      else if (defaultOctave==7)(frequency)*=8;
   }

	//if(melody[noteIndex]==',' || melody[noteIndex]==' '|| melody[noteIndex]=='\t'|| melody[noteIndex]=='\n' ||melody[noteIndex]==ASCII_CARRIAGE_RETURN)
	//	noteIndex++;

   notesPlayed++;
   
   return noteIndex;
}


/******************************************************************************
*
* This function plays a note to the speaker on the ml50x board
* 
* The inputs below are global variables
*
* @input    frequency is the frequency of the note played, units are Mhz
*           
* @input    noteDuration is the length that the note is held, specified by RTTTL
*           
* @input    beatsPerMin is the speed at which the song is played, specified by RTTTL
*
* @input    isDottedNote is either 1 or 0, denoting if input note is a dotted note
*
* @note		PLB_CLK_MHZ should be defined to be plb timer clock rate in MHz
******************************************************************************/
#ifdef PPC440
void playNote(){
	
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
	timeDuration=60e6/((Xuint32) beatsPerMin);
    if( frequency!=0 )
	{
		period=1e6/((Xuint32) frequency);
		halfPeriod=(Xuint32)period/2;
	}
	else
	{
		//can assign any value here
		period=1e6/440;
		halfPeriod=period/2;
	}

	/** Calculate the length of time to play note */
   switch(noteDuration)
   {
	  case 1:
		 timeDuration*=4e0;
         break;
      case 2:
         timeDuration*=2e0;
         break;
      case 4:
         break;
      case 8:
        timeDuration/=2e0;
        break;
      case 16:
        timeDuration/=4e0;
        break;
      case 32:
        timeDuration/=8e0;
        break;
      case 64:
        timeDuration/=16e0;
        break;
   }

   if(isDottedNote) timeDuration*=1.5;
    
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

		//get time where sound should go low
		transition_time = cycle_start_time + (halfPeriod * clockRate); //convert to ticks
		XTime_GetTime(&tCur);
		Current_Time = tCur;
		
		//set high to speaker
		#if PLAY_SOUND
		if(frequency>20 )XIo_Out32 (PIEZO_BASEADDR, PIEZO_ON);
		#endif

		//while(current_time is less than half_period_time) set high to speaker
		while(Current_Time < transition_time ){
			#if PLAY_SOUND
			if(frequency>20 )XIo_Out32 (PIEZO_BASEADDR, PIEZO_ON);
			#endif
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

	//reset frequency
	frequency=0;
}
#else
void playNote(){
	
	Xuint32 period;
    Xuint32 halfPeriod;
    Xuint32 timeDuration;
	Xuint32 End_Time;
	Xuint32 Current_Time;
	Xuint32 cycle_start_time;
	Xuint32 transition_time;
	Xuint32 ControlStatus;
	Xuint32 clockRate=PLB_CLK_MHZ;

	timeDuration=60e6/((Xuint32) beatsPerMin);
   if( frequency!=0)
	{
		period=1e6/((Xuint32) frequency);
		halfPeriod=(Xuint32)period/2;
	}
	else
	{
		//can assign any value here
		period=1e6/440;
		halfPeriod=period/2;
	}

	/** Calculate the length of time to play note */
   switch(noteDuration)
   {
	  case 1:
		 timeDuration*=4e0;
         break;
      case 2:
         timeDuration*=2e0;
         break;
      case 4:
         break;
      case 8:
        timeDuration/=2e0;
        break;
      case 16:
        timeDuration/=4e0;
        break;
      case 32:
        timeDuration/=8e0;
        break;
      case 64:
        timeDuration/=16e0;
        break;
   }


   if(isDottedNote) timeDuration*=1.5;
	
  
    
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
	End_Time=Current_Time + (timeDuration * clockRate);	

	do{
		//get start time
		cycle_start_time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
		
		//get time where sound should go low
		transition_time = cycle_start_time + (halfPeriod * clockRate); //convert to ticks
		Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
		
		//set high to speaker
#if PLAY_SOUND
		if(frequency>20 )XIo_Out32 (PIEZO_BASEADDR, 0x1);
#endif
		//while(current_time is less than half_period_time) set high to speaker
		while(Current_Time < transition_time ){
#if PLAY_SOUND
			if(frequency>20 )XIo_Out32 (PIEZO_BASEADDR, 0x1);
#endif
			Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
		}
		//set low to speaker
		XIo_Out32 (PIEZO_BASEADDR, 0x0);

		
		//get time where period ends
		transition_time = cycle_start_time + ((Xuint32)2 * halfPeriod * clockRate);
		Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);
		
		//while(current_time is less than 2nd half_period_time) do nothing;
		while(Current_Time < transition_time)
			Current_Time = XTmrCtr_GetTimerCounterReg(TMRCTR_BASEADDR, TIMER_COUNTER_0);

	}while(Current_Time < End_Time ); //while(still time left in current note);
	
	//reset frequency
	frequency=0;
   XTmrCtr_Disable(TMRCTR_BASEADDR, TIMER_COUNTER_0);
}
#endif

/******************************************************************************
*
* This function plays a melody, given a string in RTTTL format
******************************************************************************/
void playSong(){
	
	
	int noteIndex=0;
	int lastNoteIndex;//used for error detection
	Xuint8 status;
	
	/* while still more notes to play */
	while(noteIndex!=END_OF_SONG){ 
		
		/* Get the next note from the string */
		/* Note parameters are stored in global variables
				int frequency; 
				int noteDuration;
				int beatsPerMin;
				int isDottedNote;
		*/

		lastNoteIndex=noteIndex;
		noteIndex=getNoteInfo(noteIndex);     
		if(lastNoteIndex==noteIndex)
			noteIndex=END_OF_SONG;

		/* If got a valid note, play note */
		if (noteIndex!=END_OF_SONG)
			playNote();
		
#if SONG_UART_INTERRUPT
		//if user entered a character, then song interrupts
		status= XUartNs550_GetLineStatusReg(UART_BASEADDR);
		
		if(( status & 0x1) != 0){
			noteIndex=END_OF_SONG;
			xil_printf("%c",XUartNs550_RecvByte(UART_BASEADDR));

			XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

		};	
		
#endif	
	}
}


/*Reads character string in file FileName and stores the string
in string melody */
int get_melody_string (char FileName[], int readFile)
{
        unsigned char readBuffer[512];
        SYSACE_FILE *ptest;
        int i= 0;
        int numread = 0;
        int total_bytes_read = 0;
        char file_data;
		char *melodyPtr=&melody[0];
		char ch;
		
	if(readFile==1)
	{
       ptest = sysace_fopen(FileName , "r" );
	   

        if(ptest) {
                do {
                        numread = sysace_fread(readBuffer, 1, 512, ptest);
                        total_bytes_read = total_bytes_read + numread;
                        i = 0;							
						while( i < (numread )) 
						{                         
							file_data = readBuffer[i];
							*melodyPtr=readBuffer[i];
                            i++;
							melodyPtr++;
						}
                } while(numread);

                sysace_fclose (ptest);      
				melody[total_bytes_read]=0;
				return total_bytes_read;
        } else {
                xil_printf("Failed to open %s: check if file present\n\r", FileName);
				return -1;
        }
	}
	else{ //read from input
	
		xil_printf("Type in RTTTL ringtone, then press the RETURN\n\r");

		ch=InputGetChar();
		i = 0;
		while(ch!=ASCII_CARRIAGE_RETURN)
		{
			*melodyPtr=ch;
			i++;
			melodyPtr++;
			xil_printf("%c",ch);
			ch=InputGetChar();
		}

		*melodyPtr=0;

		return i;
	}
}    

char InputGetChar()
{
  char ch;
   
  while ((XUartNs550_GetLineStatusReg(UART_BASEADDR) & 0x1) == 0) {}; //loop until valid input 
  ch = XUartNs550_RecvByte(UART_BASEADDR);
  return ch;
  
}
