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
* @file iic_eeprom.c
*
* This file consists of a polled mode design example which uses the Xilinx
* IIC peripheral in dynamic mode and its low-level driver to access an
* EEPROM on the ML505/ML506/ML507 board.
*
* The EEPROM is at address 0x50 on the IIC_SCL_MAIN, IIC_SDA_MAIN IIC chain.
*
* @note
*
* This example re-uses code created for access to a generic IIC EEPROM.
*
*
* <pre>
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/
#include "xio.h"
#include "xbasic_types.h"
#include "xiic.h"
#include "xuartns550_l.h"
#include "xuartns550.h"
#include "xparameters.h"
#include "memory_map.h"

#ifdef PPC440CACHE
#include "xcache_l.h"
#endif

/************************** Constant Definitions *****************************/

/*
 * The Starting address in the IIC EEPROM on which this test is performed.
 */
#define EEPROM_TEST_START_ADDRESS   0x0

/*
 * The following constant defines the address of the IIC
 * device on the IIC bus. Note that since the address is only 7 bits, this
 * constant is the address divided by 2.
 */
#define EEPROM_ADDRESS 0x50

/*
 * The page size determines how much data should be written at a time.
 * The ML310/ML300 board supports a page size of 32 and 16.
 * The write function should be called with this as a maximum byte count.
 */
#define PAGE_SIZE   64

#define IIC_SLAVE_ADDRESS   1

/**************************** Type Definitions *******************************/

typedef Xuint8 AddressType;

/************************** Function Prototypes ******************************/

XStatus XIicLowLevelEepromDump();
XStatus XIicLowLevelEepromInit();

Xuint8 EepromReadByte(AddressType Address, Xuint8 *BufferPtr,
					  Xuint8 ByteCount);
Xuint8 EepromWriteByte(AddressType Address, Xuint8 *BufferPtr,
					   Xuint8 ByteCount);

/************************** Variable Definitions *****************************/

Xuint8 WriteBuffer[PAGE_SIZE];        /* Write buffer for writing a page. */

Xuint8 ReadBuffer[PAGE_SIZE];         /* Read buffer for reading a page.  */

/************************** Function Definitions *****************************/

/*****************************************************************************/
/**
* Main function to call the low level EEPROM example.
*
* @param    None.
*
* @return   XST_SUCCESS if successful else XST_FAILURE.
*
* @note     None.
*
******************************************************************************/
XStatus TestStatus=XST_FAILURE;
int main (void)
{

   #ifdef PPC440CACHE
   XCache_EnableICache(PPC440_ICACHE);
   XCache_EnableDCache(PPC440_DCACHE);
   #endif

   /* Initialize RS232_Uart_1 - Set baudrate and number of stop bits */
   XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
   XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS); 

    print("IIC Dynamic mode EEPROM access example - ");
    /*
     * Initialize the IIC Core.
     */
    TestStatus = XIicLowLevelEepromInit();
    if (TestStatus != XST_SUCCESS)
    {
      print("Test failed (during initialization)\r\n");
		return XST_FAILURE;
    }

    /*
     * Perform the Read operation.
     */
    TestStatus = XIicLowLevelEepromDump();
    if (TestStatus != XST_SUCCESS)
    {
      print("Test failed\r\n");
        return XST_FAILURE;
    }

    print ("Test passed\r\n");
    #ifdef PPC440CACHE
    XCache_DisableDCache();
    XCache_DisableICache();
    #endif
	return XST_SUCCESS;
}

/******************************************************************************
* The function uses the low level driver of IIC to read from the IIC device
*
* @param    None.
*
* @return   XST_SUCCESS if successful else XST_FAILURE.
*
* @note     None.
*
******************************************************************************/
XStatus XIicLowLevelEepromDump()
{
    Xuint8 BytesRead;
    Xuint8 BytesWritten;
    Xuint32 StatusReg;
    Xuint8 Index;

    /*
     * Make sure all the Fifo's are cleared and Bus is Not busy.
     */
    do
    {
         StatusReg = XIo_In32(IIC_BASE_ADDRESS + XIIC_SR_REG_OFFSET);
         StatusReg = StatusReg & (XIIC_SR_RX_FIFO_EMPTY_MASK |
			          XIIC_SR_TX_FIFO_EMPTY_MASK |
                                  XIIC_SR_BUS_BUSY_MASK);
    }while (StatusReg != (XIIC_SR_RX_FIFO_EMPTY_MASK |
			  XIIC_SR_TX_FIFO_EMPTY_MASK));

    /*
     * Initialize the read buffer, the write buffer is not used in this example.
     */
    for (Index = 0; Index < PAGE_SIZE; Index++)
    {
         WriteBuffer[Index] = Index;
         ReadBuffer[Index] = 0;
    }

/*
 * Skip writing to the EEPROM.
 */
/********************
	BytesWritten =  EepromWriteByte(EEPROM_TEST_START_ADDRESS, WriteBuffer,
									PAGE_SIZE);
*********************/

    xil_printf("\r\nCalling EEPROM ReadByte Routine\r\n");
    /*
     * Read from the EEPROM.
     */
    BytesRead = EepromReadByte(EEPROM_TEST_START_ADDRESS, ReadBuffer,
    						   PAGE_SIZE);
    xil_printf("\r\nBytesRead = %d\r\n", BytesRead);
    if(BytesRead != PAGE_SIZE)
    {
		return XST_FAILURE;
    }

    /*
     * Display read buffer.
     */
    for (Index = 0; Index < PAGE_SIZE; Index++)
    {
/*****************************************************************
		if (ReadBuffer[Index] != WriteBuffer[Index])
		{
			return XST_FAILURE;
		}

		ReadBuffer[Index] = 0;
******************************************************************/
         xil_printf("ReadBuffer[%d] = %02X\r\n", Index, ReadBuffer[Index]);
    }

    return XST_SUCCESS;
}

/*****************************************************************************/
/**
* This function writes a buffer of bytes to the IIC serial EEPROM.
*
* @param    Address contains the start address in the EEPROM to write to.
* @param    BufferPtr contains the address of the data to write.
* @param    ByteCount contains the number of bytes in the buffer to be written.
*           Note that this should not exceed the page size of the EEPROM as
*           noted by the constant PAGE_SIZE.
*
* @return   The number of bytes written, a value less than that which was
*           specified as an input indicates an error.
*
* @note     None.
*
******************************************************************************/
Xuint8 EepromWriteByte(AddressType Address, Xuint8 *BufferPtr,
					   Xuint8 ByteCount)
{
    Xuint8 SentByteCount;
    Xuint8 WriteBuffer[sizeof(Address) + PAGE_SIZE];
    Xuint8 Index;

    /*
     * A temporary write buffer must be used which contains both the address
     * and the data to be written, put the address in first based upon the
     * size of the address for the EEPROM
     */
    if (sizeof(AddressType) == 2)
    {
        WriteBuffer[0] = (Xuint8)(Address >> 8);
        WriteBuffer[1] = (Xuint8)(Address);
    }
    else if (sizeof(AddressType) == 1)
    {
        WriteBuffer[0] = (Xuint8)(Address);
    }

    /*
     * Put the data in the write buffer following the address.
     */
    for (Index = 0; Index < ByteCount; Index++)
    {
        WriteBuffer[sizeof(Address) + Index] = BufferPtr[Index];
    }

    /*
     * Write a page of data at the specified address to the EEPROM.
     */
    SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, EEPROM_ADDRESS, WriteBuffer,
                                 sizeof(Address) + PAGE_SIZE, XIIC_STOP);

    /*
     * Return the number of bytes written to the EEPROM.
     */
    return SentByteCount - sizeof(Address);
}

/******************************************************************************
* This function reads a number of bytes from the IIC serial EEPROM into a
* specified buffer.
*
* @param    Address contains the start address in the EEPROM to read from.
* @param    BufferPtr contains the address of the data buffer to be filled.
* @param    ByteCount contains the number of bytes in the buffer to be read.
*           This value is constrained by the page size of the device such
*           that up to 64K may be read in one call.
*
* @return   The number of bytes read. A value less than the specified input
*           value indicates an error.
*
* @note     None.
*
******************************************************************************/
Xuint8 EepromReadByte(AddressType Address, Xuint8 *BufferPtr,
 					  Xuint8 ByteCount)
{
    Xuint8 ReceivedByteCount;
    Xuint8 SentByteCount;
    Xuint16 StatusReg;

    /*
     * Position the Read pointer to specific location in the EEPROM.
     */
    do
    {

    	StatusReg = XIo_In8(IIC_BASE_ADDRESS + XIIC_SR_REG_OFFSET);
    	if(!(StatusReg & XIIC_SR_BUS_BUSY_MASK))
    	{
    		SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, EEPROM_ADDRESS,
    					 (Xuint8 *)&Address, sizeof(Address),
    								 XIIC_REPEATED_START);
	}
    }while(SentByteCount != sizeof(Address));

    /*
     * Receive the data.
     */
    ReceivedByteCount = XIic_DynRecv(IIC_BASE_ADDRESS, EEPROM_ADDRESS,
    								 BufferPtr, ByteCount);

    /*
     * Return the number of bytes received from the EEPROM.
    */
    return ReceivedByteCount;
}

/******************************************************************************
* The function uses the low level driver of IIC to initialize the core.
*
* @param    None.
*
* @return   XST_SUCCESS if successful else XST_FAILURE.
*
* @note     None.
*
******************************************************************************/
XStatus XIicLowLevelEepromInit()
{
   XStatus Status;

   /*
    * Initialize the IIC Core.
    */
   Status = XIic_DynInit(IIC_BASE_ADDRESS);
   if(Status != XST_SUCCESS)
   {
       return XST_FAILURE;
   }

   return XST_SUCCESS;
}

