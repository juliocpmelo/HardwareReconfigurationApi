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
#include <string.h>
#include "globaltypes.h"
#include "xrom_ddr_test.h"
#include "xrom_lcd.h"
#include "xrom_input.h"

#ifndef BOARDNUM
#define BOARDNUM 509
#endif

#if BOARDNUM == 401
#define LCD_LINE1 "ML401 Diag/Test"
#endif
#if BOARDNUM == 402
#define LCD_LINE1 "ML402 Diag/Test"
#endif
#if BOARDNUM == 403
#define LCD_LINE1 "ML403 Diag/Test"
#endif
#if BOARDNUM == 405
#define LCD_LINE1 "ML405 Diag/Test"
#endif
#if BOARDNUM == 501
#define LCD_LINE1 "ML501 Diag/Test"
#endif
#if BOARDNUM == 505
#define LCD_LINE1 "ML505 Diag/Test"
#endif
#if BOARDNUM == 506
#define LCD_LINE1 "ML506 Diag/Test"
#endif
#if BOARDNUM == 507
#define LCD_LINE1 "ML507 Diag/Test"
#endif
#if BOARDNUM == 509
#define LCD_LINE1 "ML509 Diag/Test"
#endif

/*********************************************************************
*
* FUNCTION : ml501_ddr_mem_test
*
*********************************************************************/
long ml501_ddr_mem_test(
  unsigned long startAdr,
  unsigned long size)
{
  unsigned long myAdr;
  unsigned long writeAdr;
  unsigned long data2store_f=0xFFFFFFFF;
  // unsigned long data2store_0=0x00000000;
  // unsigned int  ERROR=0;
  int           i=0, j=0, t=0, h=0;
  unsigned long baseAddr;
  unsigned long dataRead[32];
  // int           pass_count=1;
  char  line1[17], line2[17]; // LCD Output buffers
  // test5 test variables
  unsigned char   dataByte;
  unsigned short  dataHW;
  unsigned long   dataLong;

        unsigned int count=0, errors=0;
/*
  XromTimerInit(0x0);
  count = XromTimerStart();
        xil_printf("START COUNT TEST 0 = %x\r\n", count);
*/

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR MEM TEST");
  XromLCDPrint2Strings(line1,line2);

for(;;){

        xil_printf("DDR Test Summary: Passes: %d  Errors: %d\r\n", count, errors);
        xil_printf("Press ESC to return to the main menu\r\n\r\n");
        count++;

  // ---------------------------------------
  //  TEST0 - Write all zeros and verify
  // ---------------------------------------
  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST0 - W");
  XromLCDPrint2Strings(line1,line2);

        xil_printf("Test 0: Writing Zeros\r\n");

  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
       h++;
       if (( h & 100 ) == 0) 
             {
           if(WaitForEscape()) return 0; 
         }
       * (volatile unsigned long *) myAdr = 0x00000000;
    }

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST0 - R");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 0: Read-Verifying Zeros\r\n");

  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
      h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }
      dataRead[0] = *(volatile unsigned long *) myAdr;

      if (dataRead[0] != 0x00000000)
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST0!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 0 Failed  Data Expected: 0x00000000  Actual: %x, Adr: %x\r\n", dataRead[0], myAdr);
                  xil_printf("ERROR: Test 0 Failed  Data Expected: 0x00000000  Actual: %x, Adr: %x\r\n", *(volatile unsigned long *) myAdr, myAdr);
                  //return (DDR_TEST0_FAILED);
                  errors++;
        }
    }

  xil_printf("Test 0: PASSED\r\n\r\n");

//      count = XromTimerStop();
//      xil_printf("STOP COUNT TEST 0 = %x\r\n", count);
//      XromTimerInit(0x0);

  // ---------------------------------------
  //  TEST1 - Write all ones and verify
  // ---------------------------------------
//  count = XromTimerStart();
//      xil_printf("START COUNT TEST 1 = %x\r\n", count);

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST1 - W");
  XromLCDPrint2Strings(line1,line2);

        xil_printf("Test 1: Writing Ones\r\n");
 
  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
       h++;
       if (( h & 100 ) == 0) 
             {
           if(WaitForEscape()) return 0; 
         }
       * (volatile unsigned long *) myAdr = 0xFFFFFFFF;
    }

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST1 - R");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 1: Read-Verifying Ones\r\n");

  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
      h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }
      dataRead[0] = *(volatile unsigned long *) myAdr;

      if (dataRead[0] != 0xFFFFFFFF)
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST1!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 1 Failed  Data Expected: 0xFFFFFFFF  Actual: %x, Adr: %x\r\n", dataRead[0], myAdr);
                  xil_printf("ERROR: Test 1 Failed  Data Expected: 0xFFFFFFFF  Actual: %x, Adr: %x\r\n", *(volatile unsigned long *) myAdr, myAdr);
                   //return (DDR_TEST1_FAILED);
                  errors++;
        }
    }

        xil_printf("Test 1: PASSED\r\n\r\n");

//  count = XromTimerStop();
//      xil_printf("STOP COUNT TEST 1 = %x\r\n", count);
//      XromTimerInit(0x0);

  // ---------------------------------------
  //  TEST2 - Test for stuck together address bits
  // ---------------------------------------


//  count = XromTimerStart();
//      xil_printf("START COUNT TEST 2 = %x\r\n", count);

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST2 - C");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 2: Clearing DDR Memory\r\n");

  // clear all of memory
  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
      h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }
      * (volatile unsigned long *) myAdr = 0x00000000;
    }

  writeAdr = startAdr;  // reset value to baseaddr of memory

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST2 - T");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 2: Testing for stuck together address bits\r\n");

  for (j = 2; j < ML501_TEST2_SHIFT_VALUE; j++) // Value needs to be update for mem size....
  {
    // write out the value we'll be checking for later
    * (volatile unsigned long *) writeAdr = data2store_f;
    i = 1;
    myAdr = startAdr;
    while (myAdr < startAdr+size)
    {
    h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }

      // read back a word of data
      dataRead[0] = *(volatile unsigned long *) myAdr;
      i++;
      // check to make sure it is zero
      if (dataRead[0] != 0)
        {
          if (writeAdr == myAdr)
            {
                          if (dataRead[0] != data2store_f)
                            {
                  XromLCDClear();
                  strcpy (line1, LCD_LINE1);
                  strcpy (line2, "FAIL DDR TEST2!");
                  XromLCDPrint2Strings(line1,line2);
                          //return (DDR_TEST2_FAILED);
                                  xil_printf("ERROR: Test 2 Failed  Data Expected: %x  Actual: %x, Adr: %x\r\n", data2store_f, dataRead[0], myAdr);
                                  errors++;
                                }

                        }  // logical ELSE: this is where we wrote, is ok.
          else
           {
             XromLCDClear();
             strcpy (line1, LCD_LINE1);
             strcpy (line2, "FAIL DDR TEST2!");
             XromLCDPrint2Strings(line1,line2);
                     //return (DDR_TEST2_FAILED);
                         xil_printf("ERROR: Test 2 Failed  Data Expected: %x  Actual: %x\r\n", data2store_f, dataRead[0]);
                         errors++;
           }
        }

      myAdr  = startAdr + (unsigned long) (1<<i);
    }
    // Clean out the old value before pointer update....
    * (volatile unsigned long *) writeAdr = 0x00000000;
    writeAdr = startAdr + (unsigned long) (1<<j);

  }

  xil_printf("Test 2: Clearing DDR Memory for Test 3\r\n");

 // clear all of memory to 0x00110055 for prepping next test
  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST2 - P");
  XromLCDPrint2Strings(line1,line2);
  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
      h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }
      * (volatile unsigned long *) myAdr = 0x00110055;
    }
  
  xil_printf("Test 2: PASSED\r\n\r\n");
//  count = XromTimerStop();
//      xil_printf("STOP COUNT TEST 2 = %x\r\n", count);
//      XromTimerInit(0x0);

  // ---------------------------------------
  //  TEST3 - MAX BA/ROW/COL NOISE
  // ---------------------------------------


//  count = XromTimerStart();
//      xil_printf("START COUNT TEST 3 = %x\r\n", count);

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST3 - T");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 3: Max Ba/Row/Col Noise Test\r\n");

  // setup initial values
  writeAdr = startAdr;
  myAdr = writeAdr;
  baseAddr = startAdr & ~(ML501_DDR_BA_CONSTANT | ML501_DDR_RA_CONSTANT | ML501_DDR_CA_CONSTANT);

  for (i = 0; i < (size/64) ; i++) // Going to ping pong and meet in middle
  {
    if (writeAdr > startAdr + size - 0x40)
      {
        XromLCDClear();
        strcpy (line1, LCD_LINE1);
        strcpy (line2, "FAIL DDR TEST3!");
        XromLCDPrint2Strings(line1,line2);
                xil_printf("ERROR: Test 3 Failed  Write Address %x  Exceeds %x\r\n", writeAdr, startAdr + size - 0x40);
                errors++;
        //return (DDR_TEST3_FAILED);
      }
    // write the LOW addresses (e.g. 0x10000000), 64 bytes
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x00
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x04
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x08
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x0C
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x10
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x14
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x18
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x1C
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x20
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x24
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x28
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x2C
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x30
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;       // Write Address +0x34
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;       // Write Address +0x38
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr = myAdr;   // Write Address +0x3C,  set WriteAdr back to +0x00
    dataRead[0]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x00
    dataRead[1]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x04
    dataRead[2]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x08
    dataRead[3]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x0C
    dataRead[4]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x10
    dataRead[5]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x14
    dataRead[6]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x18
    dataRead[7]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x1C
    dataRead[8]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x20
    dataRead[9]  = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x24
    dataRead[10] = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x28
    dataRead[11] = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x2C
    dataRead[12] = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x30
    dataRead[13] = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x34
    dataRead[14] = *(volatile unsigned long *) writeAdr; writeAdr +=4;      // Read from Address +0x38
    dataRead[15] = *(volatile unsigned long *) writeAdr; writeAdr = myAdr;  // Read from Address +0x3C, set WriteAdr back to +0x00

    // lets compare the results to the Data Expected values now....
        //  Data Patern should be 0xFFFFFFFF, 0x00000000 repeated eight times
    for (t=0; t < 16; t +=2)
    {
      if      (dataRead[t] != 0xFFFFFFFF)
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST3!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 3 Failed  Data Expected: 0xFFFFFFFF  Actual: %x, Adr: %x\r\n", dataRead[t], myAdr + t*4);
                  errors++;
                  //return (DDR_TEST3_FAILED);
        }
      else if (dataRead[t+1] != 0x00000000)
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST3!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 3 Failed  Data Expected: 0x00000000  Actual: %x, Adr: %x\r\n", dataRead[t+1], myAdr + t*4 + 4);
                  errors++;
                  //return (DDR_TEST3_FAILED);
        }
    }

    
    // Calculate the inverse address for DDR SDRAM
        // writeAdr and myAdr now contain the lowest address of this segment of the test.  
        // The above section has tested the first 64 bytes, and now we need to test the top 64 bytes
        // have to calculated the inverse address to do so.  When this section done, will invert again and
        // add 64 to the location.
        writeAdr = ~writeAdr;  // invert every bit
        writeAdr = (writeAdr & (ML501_DDR_BA_CONSTANT | ML501_DDR_RA_CONSTANT | ML501_DDR_CA_CONSTANT)) | baseAddr; // mask the value
        writeAdr = writeAdr - 60;  // get writeAdr to the inverse value minus 60 to get to even location (0x00, 0x40, 0x80 or 0xC0)
    myAdr = writeAdr;

    //  write out 16 words, read them back
    if (writeAdr > startAdr + size - 0x40)
      {
        XromLCDClear();
        strcpy (line1, LCD_LINE1);
        strcpy (line2, "FAIL DDR TEST3!");
        XromLCDPrint2Strings(line1,line2);
                xil_printf("ERROR: Test 3 Failed  Write Address %x  Exceeds %x\r\n", writeAdr, startAdr + size - 0x40);
                errors++;
        //return (DDR_TEST3_FAILED);
      }
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0xFFFFFFFF; writeAdr +=4;
    * (volatile unsigned long *) writeAdr = 0x00000000; writeAdr = myAdr;
    dataRead[16] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[17] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[18] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[19] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[20] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[21] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[22] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[23] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[24] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[25] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[26] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[27] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[28] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[29] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[30] = *(volatile unsigned long *) writeAdr; writeAdr +=4;
    dataRead[31] = *(volatile unsigned long *) writeAdr;

    // lets compare the results to the Data Expected values now....
    for (t=16; t < 32; t +=2)
    {
      if      (dataRead[t] != 0xFFFFFFFF)
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST3!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 3 Failed  Data Expected: 0xFFFFFFFF  Actual: %x\r\n", dataRead[t]);
                  errors++;
                  //return (DDR_TEST3_FAILED);
        }
      else if (dataRead[t+1] != 0x00000000)
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST3!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 3 Failed  Data Expected: 0x00000000  Actual: %x\r\n", dataRead[t+1]);
                  errors++;
                  //return (DDR_TEST3_FAILED);
        }
    }



    // Calculate the "normal" address for the next cycles
        // invert address back to "0x00000000" logical + offset for this time
        writeAdr = ~writeAdr;  // invert every bit
        writeAdr = (writeAdr & (ML501_DDR_BA_CONSTANT | ML501_DDR_RA_CONSTANT | ML501_DDR_CA_CONSTANT)) | baseAddr; // mask the value
        writeAdr = writeAdr + 64;  // get writeAdr to the inverse value plus 64 to get to even location (0x00, 0x40, 0x80 or 0xC0)
        myAdr = writeAdr; // preserve the value for later

  }
  xil_printf("Test 3: PASSED\r\n\r\n");

//  count = XromTimerStop();
//      xil_printf("STOP COUNT TEST 3 = %x\r\n", count);
//      XromTimerInit(0x0);

  // ---------------------------------------
  //  TEST4 - DATA = !ADDR test
  // ---------------------------------------

//  count = XromTimerStart();
//      xil_printf("START COUNT TEST 4 = %x\r\n", count);

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST4 - W");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 4: Writing Data = !Address\r\n");
  
  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {
      h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }
      * (volatile unsigned long *) myAdr = ~myAdr;
    }


  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST4 - R");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 4: Read-Verifying\r\n");
  
  // read it all back
  for(myAdr = startAdr; myAdr < startAdr+size; myAdr=myAdr+4)
    {

      h++;
      if (( h & 100 ) == 0) 
            {
              if(WaitForEscape()) return 0; 
        }

      dataRead[0] = *(volatile unsigned long *) myAdr;

      if (dataRead[0] == ~myAdr)
        {
        }
      else
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST4!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 4 Failed  Data Expected: %x  Actual: %x, Adr: %x\r\n", ~myAdr, dataRead[0], myAdr);
                  errors++;
                  //return (DDR_TEST4_FAILED);
        }
    }

  xil_printf("Test 4: PASSED\r\n\r\n");

//  count = XromTimerStop();
//      xil_printf("STOP COUNT TEST 4 = %x\r\n", count);
//      XromTimerInit(0x0);

  // ---------------------------------------
  //  TEST5 - Byte, Half-word and Word tests
  // ---------------------------------------

//  count = XromTimerStart();
//      xil_printf("START COUNT TEST 5 = %x\r\n", count);

  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST5 - B");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("Test 5: Writing 256 Bytes\r\n");
  
  // write 256 bytes
  for (i = 0; i < 256; i++)
    {
      myAdr = startAdr + i;
      * (volatile unsigned char *) myAdr = i;
    }

  // read 256 bytes back
  for (i = 0; i < 256; i++)
    {
      myAdr = startAdr + i;
      dataByte = *(volatile unsigned char *) myAdr;

      if (dataByte == i)
        {
        }
      else
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST5!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 5 Failed  Data Expected: %x  Actual: %x\r\n", i, dataByte);
                  errors++;
                  //return (DDR_TEST5_FAILED);
        }
    }


  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST5 - H");
  XromLCDPrint2Strings(line1,line2);
  
  xil_printf("Test 5: Writing 65536 Half-Words\r\n");

  // write 65536 halfwords
  for (i = 0; i < 65536; i++)
    {
      myAdr = startAdr + 0x100 + i*2;
      * (volatile unsigned short *) myAdr = i;
    }

  // read 65536 halfwords back
  for (i = 0; i < 65536; i++)
    {
      myAdr = startAdr + 0x100 + i*2;
      dataHW = *(volatile unsigned short *) myAdr;

      if (dataHW == i)
        {
        }
      else
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST5!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 5 Failed  Data Expected: %x  Actual: %x\r\n", i, dataHW);
                  errors++;
                  //return (DDR_TEST5_FAILED);
        }
    }


  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST5 - W");
  XromLCDPrint2Strings(line1,line2);
  
  xil_printf("Test 5: Writing 65536 Words\r\n");
  // write 65536 words
  for (i = 0; i < 65536; i++)
    {
      myAdr = startAdr + 0x120 + i*4;
      * (volatile unsigned long *) myAdr = i;
    }

  // read 65536 words back
  for (i = 0; i < 65536; i++)
    {
      myAdr = startAdr + 0x120 + i*4;
      dataLong = *(volatile unsigned long *) myAdr;

      if (dataLong == i)
        {
        }
      else
        {
          XromLCDClear();
          strcpy (line1, LCD_LINE1);
          strcpy (line2, "FAIL DDR TEST5!");
          XromLCDPrint2Strings(line1,line2);
                  xil_printf("ERROR: Test 5 Failed  Data Expected: %x  Actual: %x\r\n", i, dataLong);
                  errors++;
                  //return (DDR_TEST5_FAILED);
        }
    }

  xil_printf("Test 5: PASSED\r\n\r\n");

}

/*
  XromLCDClear();
  strcpy (line1, LCD_LINE1);
  strcpy (line2, "  DDR TEST PASS");
  XromLCDPrint2Strings(line1,line2);

  xil_printf("ALL DDR MEMORY TESTS PASSED\r\n");
*/
/*
  count = XromTimerStop();
        xil_printf("STOP COUNT TEST 5 = %x\r\n", count);
        XromTimerInit(0x0);
*/
//return (DDR_TESTS_PASSED);

}
