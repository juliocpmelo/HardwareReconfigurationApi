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
#include "xrom_lcd.h"
#include "xrom_zbt_test.h"

static bool compError(unsigned int adr, unsigned int exp, unsigned int got,
                      unsigned int *errors, unsigned int maxerrors)
{
  (*errors)++;

    xil_printf("error; adr: %x\r\n", adr);
    xil_printf(", expected: %x\r\n", exp);
    xil_printf(", got: %x\r\n\r\n", got);

  return (maxerrors && (*errors >= maxerrors));
}


static bool TestRamWrite(
  unsigned int startAdr,
  unsigned int size,
  unsigned char startVal,
  unsigned char incr,
  unsigned char tsize,
  unsigned int *errors,
  unsigned int maxerrors)
{
  unsigned int i, j;
  unsigned int val;

  if (maxerrors && (*errors >= maxerrors))
    return false;

  /* write phase */
  i = 0;
  while (i < size)
  {
    val = 0;
    for(j=0; j < tsize; j++)
    {
      val = (val << 8) | startVal;
      startVal += incr;
    }
    switch(tsize)
    {
    case 1:
      *(volatile unsigned char *) startAdr = (unsigned char) val;
      startAdr++;
      break;
    case 2:
      *(volatile unsigned short *) startAdr = (unsigned short) val;
      startAdr += 2;
      break;
    case 4:
      *(volatile unsigned int *) startAdr = val;
      startAdr += 4;
      break;
    }
    i++;
  }

  return false;
}

static bool TestRamCompare(
  unsigned int startAdr,
  unsigned int size,
  unsigned char startVal,
  unsigned char incr,
  unsigned char tsize,
  unsigned int *errors,
  unsigned int maxerrors)
{
  unsigned int i, j;
  unsigned int val;
  unsigned int getVal=0;
  unsigned int curAdr;

  /* compare phase */
  i = 0;
  while (i < size)
  {
    val = 0;
    for(j=0; j < tsize; j++)
    {
      val = (val << 8) | startVal;
      startVal += incr;
    }

    curAdr = startAdr;
    switch(tsize)
    {
    case 1:
      getVal = (unsigned int) *(volatile unsigned char *) startAdr;
      startAdr++;
      break;
    case 2:
      getVal = (unsigned int) *(volatile unsigned short *) startAdr;
      startAdr += 2;
      break;
    case 4:
      getVal = *(volatile unsigned int *) startAdr;
      startAdr += 4;
      break;
    }

    if (getVal != val)
      if (compError(curAdr, val, getVal, errors, maxerrors))
        return false;

    i++;
  }

  return false;
}

static bool TestRamReadByte(
  unsigned int startAdr,
  unsigned int size,
  unsigned int *errors,
  unsigned int maxerrors)
{
  unsigned int i;
  unsigned char val;

  if (maxerrors && (*errors >= maxerrors))
    return false;

  /* read phase */
  i = 0;
  while (i < size)
  {
    val = *(volatile unsigned char *) startAdr;
    i++;
    startAdr++;
  }

  return false;
}

static bool TestRamWalkByte(
  unsigned int startAdr,
  unsigned int size,
  bool one,   /* true for walking ones, false for walking zeros */
  unsigned int *errors,
  unsigned int maxErrors)
{
  unsigned int i, j;
  unsigned char byte;
  unsigned char bit;
  unsigned char initVal;
  unsigned char bitVal;

  if (maxErrors && (*errors >= maxErrors))
    return false;

  if (one)
    initVal = 0x0;
  else
    initVal = 0xff;

  i = 0;
  while (i < size * 8)
  {
    if(TestRamWrite(startAdr, size, initVal, 0x0, 1, errors, maxErrors))
      return true;
    byte = i / 8;
    bit = i % 8;
    bitVal = 1 << bit;
    if (!one)
      bitVal = ~bitVal;

    if(TestRamWrite(startAdr+byte, 1, bitVal, 0x0, 1, errors, maxErrors))
      return true;

    /* compare */
    j = 0;
    while(j < byte)
    {
      if (TestRamCompare(startAdr+j, 1, initVal, 0, 1, errors, maxErrors))
        return true;
      j++;
    }
    if (TestRamCompare(startAdr+j, 1, bitVal, 0, 1, errors, maxErrors))
      return true;
    j++;
    while (j < size)
    {
      if (TestRamCompare(startAdr+j, 1, initVal, 0, 1, errors, maxErrors))
        return true;
      j++;
    }

    if (maxErrors && (*errors >= maxErrors))
      return false;

    i++; 
  }
  return false;
}

static unsigned int CalcWalkAddress(unsigned int startAdr, unsigned int size,
                                    unsigned int adr, bool one)
{

  if (one)
    return (startAdr + ((~adr) % size));
  else
    return (startAdr + adr);
}

static bool TestRamWalkAddress(
  unsigned int startAdr,
  unsigned int size,
  bool one,   /* true for walking ones, false for walking zeros */
  unsigned int *errors,
  unsigned int maxErrors)
{
  unsigned int adri, adrj;
  unsigned int adr;

  if (maxErrors && (*errors >= maxErrors))
    return false;

  adri = 1;
  while (adri < size)
  {
    if(TestRamWrite(startAdr, size, 0, 0x0, 1, errors, maxErrors))
      return true;

    adr = CalcWalkAddress(startAdr, size, adri, one);
    if(TestRamWrite(adr, 1, 0xff, 0x0, 1, errors, maxErrors))
      return true;

    /* compare */
    adrj = 1;
    while(adrj < adri)
    {
      adr = CalcWalkAddress(startAdr, size, adrj, one);
      if (TestRamCompare(adr, 1, 0, 0, 1, errors, maxErrors))
        return true;
      adrj *= 2;
    }
    adr = CalcWalkAddress(startAdr, size, adrj, one);
    if (TestRamCompare(adr, 1, 0xff, 0, 1, errors, maxErrors))
      return true;
    adrj *= 2;
    while (adrj < size)
    {
      adr = CalcWalkAddress(startAdr, size, adrj, one);
      if (TestRamCompare(adr, 1, 0, 0, 1, errors, maxErrors))
        return true;
      adrj *= 2;
    }

    if (maxErrors && (*errors >= maxErrors))
      return false;

    adri *= 2;
  }
  return false;
}

void TestRam(
  unsigned int startAdr,
  unsigned int size,
  unsigned int maxErrors,
  unsigned int sleepTime)
{
  unsigned int errors;

  errors = 0;

  /**************************************************************************/
  /* do single byte/half-word/word accesses                                 */
  /**************************************************************************/

  //Add Char LCD output
  XromLCDOn();
  XromLCDClear();
  XromLCDPrint2Strings("Testing ZBT SRAM", "Please Wait.....");

    xil_printf("  * Single byte/half-word/word accesses\r\n");

  /* read only test */
    xil_printf("  Testing for memory availability\r\n");
  if (TestRamReadByte(startAdr, size, &errors, maxErrors))
    return;

  /* test for stuck at 1 errors; write all zeros and compare */
    xil_printf("  Testing for data lines stuck at one\r\n");
  if (TestRamWrite(startAdr, 8, 0x0, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr, 8, 0x0, 0x0, 1, &errors, maxErrors))
    return;

  /* test for stuck at 0 errors; write all ones and compare */
     xil_printf("  Testing for data lines stuck at zero\r\n");
  if (TestRamWrite(startAdr, 8, 0xff, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr, 8, 0xff, 0x0, 1, &errors, maxErrors))
    return;

  /* test for shorts in adjacent data lines; do walking ones */
    xil_printf("  Testing for walking one data errors\r\n");
  if (TestRamWalkByte(startAdr, 8, true, &errors, maxErrors))
    return;

  /* test for shorts in adjacent data lines; do walking zeros */
     xil_printf("  Testing for walking zero data errors\r\n");
  if (TestRamWalkByte(startAdr, 8, false, &errors, maxErrors))
    return;

  /* test for address lines stuck at 1 errors */
  /* set memory to zero, write 0xff to zero, find change at other address */
    xil_printf("  Testing for address lines stuck at one\r\n");
  if (TestRamWrite(startAdr, size, 0x0, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamWrite(startAdr, 1, 0xff, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr, 1, 0xff, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr+1, size-1, 0x0, 0x0, 1, &errors, maxErrors))
    return;

  /* test for address lines stuck at 0 errors */
  /* set memory to zero, write 0xff to size-1, find change at other address */
    xil_printf("  Testing for address lines stuck at zero\r\n");
  if (TestRamWrite(startAdr, size, 0x0, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamWrite(startAdr+size-1, 1, 0xff, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr, size-1, 0x0, 0x0, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr+size-1, 1, 0xff, 0x0, 1, &errors, maxErrors))
    return;

  /* test for shorts in adjacent address lines; do walking ones */
    xil_printf("  Testing for walking one address errors\r\n");
  if (TestRamWalkAddress(startAdr, size, true, &errors, maxErrors))
    return;

  /* test for shorts in adjacent address lines; do walking zeros */
    xil_printf("  Testing for walking zero address errors\r\n");
  if (TestRamWalkAddress(startAdr, size, false, &errors, maxErrors))
    return;

  /* test for pseudo-random data */
    xil_printf("  Testing for pseudo-random data errors\r\n");
  if (TestRamWrite(startAdr, size, 0x0, 0x19, 1, &errors, maxErrors))
    return;
  if (TestRamCompare(startAdr, size, 0x0, 0x19, 1, &errors, maxErrors))
    return;

    xil_printf("\r\nRAM test completed\r\n", errors);

  //Adding Char LCD output
  	//ADD LOGGING

	XromLCDClear();
	if(errors == 0){
		XromLCDPrint2Strings("Test Passed", "No Errors");
		  xil_printf("Test Passed, No Errors\r\n\r\n");
	}
	else{
		XromLCDPrint2Strings("Test Failed", "Errors: ");
		  xil_printf("Test Failed, %d Errors\r\n\r\n", errors);
		XromLCDPrintInt(errors);

		//while(!XromCheckAnyButton()){}
	}
}
