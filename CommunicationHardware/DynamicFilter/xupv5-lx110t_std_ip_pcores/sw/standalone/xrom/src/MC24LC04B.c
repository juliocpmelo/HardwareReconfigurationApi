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

//  This file is the higher level "driver" for the MC24LC04B 4Kbit EEPROM
//  IIC device.  It contains all MC24LC04B specific code.

#include "MC24LC04B.h"
#include "gpio_iic.h"



/*---------------------------------------------------------------------------*/
/*   MC24LC04B_readByte - Reads a byte from the specified address            */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function places a byte of data from the specified address    */
/*         in the pointer that was sent into the function.                   */
/*                                                                           */
/*         This routine does not require any extra waiting for the IIC       */
/*         device.  Only writes require a time delay to ensure proper EEPROM */
/*         updating.                                                         */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long addr - which address in the EEPROM to read          */
/*         unsigned char * readData - pointer to where data should be put    */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         char error - indicates an IIC error if non-zero                   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long MC24LC04B_readByte  (
	unsigned long addr,
	char * readData
	)
{
    unsigned long long myVal=0x0;
    unsigned     short error=0x0;
    unsigned      char readByte=0x0;

    
    if (addr < 0x200)
	{ // addr is safe to use

	  // Read the value of addr
	  if (addr < 0x100)
	  {  // Read Block B0 of memory (first 256 bytes)
      myVal = GPIO_IIC_Device_A8P8D8_Read (
                                             MC24LC04B_IIC_BaseAddr | MC24LC04B_IIC_Block_Addr_B0,  // Read Block B0
                                             addr
                                            );
      }
	  else
	  { // read Block B1 of memory (second 256 bytes)
      myVal = GPIO_IIC_Device_A8P8D8_Read (
                                             MC24LC04B_IIC_BaseAddr | MC24LC04B_IIC_Block_Addr_B1,  // Read Block B1
                                             addr
                                            );
	  }
      // check for errors...
      error = CheckForIIC_Error(myVal);

    }
	else
	{
	  error = (unsigned short) MC24LC04B_ADDR_OUT_OF_BOUNDS_ERROR;
	}
    if (error)
     {
		 // should not get here!
		 return(error);
     }

    // return the data we got
    readByte = 0x00000000000000FF & myVal;
    // Now put it into the array
    *readData = readByte;

    return (0x0);
}



/*---------------------------------------------------------------------------*/
/*   MC24LC04B_writeByte - Writes a byte to the specified address            */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function grabs the data byte from the supplied writeData     */
/*         pointer and writes it to the device starting at the supplied      */
/*         address.                                                          */
/*                                                                           */
/*         It returns a non-zero error value if there is a problem on the    */
/*         IIC bus.  This routine requires extra waiting time for the IIC    */
/*         device.  Writes require a time delay to ensure proper EEPROM      */
/*         updating.                                                         */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned long addr - which address in the EEPROM to read          */
/*         unsigned char * writeData - pointer to data that is to be stored  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         char error - indicates an IIC error if non-zero                   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long MC24LC04B_writeByte  (
	unsigned long addr,
	char * writeData
	)
{

    unsigned long long myVal=0x0;
    unsigned     short error=0x0;
    unsigned      char writeByte=0x0;

    // get the value from the variable...
    writeByte = *writeData;

    if (addr < 0x200)
	{ // addr is safe to use

      // Write the value to the Addr
	  if (addr < 0x100)
	  { // Write to Block B0
      myVal = GPIO_IIC_Device_A8P8D8_Write (
                                             MC24LC04B_IIC_BaseAddr | MC24LC04B_IIC_Block_Addr_B0,  // Write Block B0
                                             addr,
                                             writeByte
                                            );
      }
	  else
	  { // Write to Block B1
      myVal = GPIO_IIC_Device_A8P8D8_Write (
                                             MC24LC04B_IIC_BaseAddr | MC24LC04B_IIC_Block_Addr_B1,  // Write Block B1
                                             addr,
                                             writeByte
                                            );
	  }
      // check for errors...
      error = CheckForIIC_Error(myVal);
    

      // Try to read back to make sure EEPROM is done  (Need to set myVal first time thru)
      myVal = GPIO_IIC_Device_A8P8D8_Read (
                                            MC24LC04B_IIC_BaseAddr,
                                            addr
                                           );
      // wait for ACK as then EEPROM is done
      while (myVal & GPIO_IIC_ADDR_ACK_ERR)
        {
          myVal = GPIO_IIC_Device_A8P8D8_Read (
                                                MC24LC04B_IIC_BaseAddr,
                                                addr
                                               );
	    }

    }
	else
	{
	  error = (unsigned short) MC24LC04B_ADDR_OUT_OF_BOUNDS_ERROR;
	}

	if (error)
     {
		 // should not get here!
		 return(error);
     }

    return (0x0);
}


/*---------------------------------------------------------------------------*/
/*   MC24LC04B_writeProtect - Allows the MC24LC04B to be Write Protected     */
/*---------------------------------------------------------------------------*/
/*      Purpose of Function:                                                 */
/*                                                                           */
/*         This function allows the MC24LC04B to be write protected so that  */
/*      the EEPROM contents may not be disturbed.  Note:  This requires the  */
/*      use of a GPIO bit to accomplish.  The board default is to UNprotect  */
/*                                                                           */
/*      Input to Function:                                                   */
/*                                                                           */
/*         unsigned char writeProtect - 1 = write protect, 0 = write enable  */
/*                                                                           */
/*      Outputs from Function:                                               */
/*                                                                           */
/*         char error - indicates an IIC error if non-zero                   */
/*                                                                           */
/*---------------------------------------------------------------------------*/
unsigned long MC24LC04B_writeProtect (
	char writeProtect
	)
{
// Unimplemented 
	return (0x0);
}
