/* $Id: xilflash_devicecontrol_example.c,v 1.1 2007/10/26 12:44:56 svemula Exp $ */
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
* @file xilflash_devicecontrol_example.c
*
* This file contains a design example using the Flash Library.
* This example displays the Flash device geometry and properties. The geometry
* and properties are fetched using Device Control API.
*
*
* @note		None.
*
*<pre>
* MODIFICATION HISTORY:
*
* Ver   Who  Date     Changes
* ----- ---- -------- ---------------------------------------------------------
* 1.01a mta   10/09/07 First release
*</pre>
******************************************************************************/

/***************************** Include Files *********************************/

#include <xilflash.h>
#include <xbasic_types.h>
#include "xstatus.h"
#include "xio.h"
#include "xuartns550_l.h"
#include "xparameters.h"
#include "memory_map.h"

/************************** Constant Definitions *****************************/
#define FLASH_TEST_SIZE		256        /* Size of Read and Write Buffers */
                                           /* in half-words (16-bits)        */ 
#define START_ADDRESS		0x0        /* Offset from FLASH Base Address */

#define BUFFER_DISPLAY_COUNT    16         /* Half-words */

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/

/************************** Function Prototypes ******************************/
int FlashDeviceControlExample(void);
int FlashReadWriteExample(void);
int  InputAvailable(void);
char InputGetChar(void);
/************************** Variable Definitions *****************************/
XFlash FlashInstance; /* XFlash Instance. */

/*
 * Buffers used during read and write transactions.
 */
u16 ReadBuffer[FLASH_TEST_SIZE]; /* Buffer used to store the data read. */
u16 WriteBuffer[FLASH_TEST_SIZE]; /* Write buffer. */

/************************** Function Definitions ******************************/

/*****************************************************************************/
/**
*
* Main function to execute the Flash device control example.
*
* @param	None
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
int main(void)
{
	int Status;
	int done;
	char c;

        XUartNs550_SetBaud(UART_BASEADDR, UART_CLOCK, UART_BAUDRATE);
        XUartNs550_SetLineControlReg(UART_BASEADDR, XUN_LCR_8_DATA_BITS);

	xil_printf("\n\r*******************************************************\n\r");
	xil_printf("\n\rLinear Flash Test\n\r");
	xil_printf("\n\r*******************************************************\n\r");
	xil_printf("\n\r");


        do
	{
               xil_printf("This test will ERASE and MODIFY contents\r\n");
               xil_printf("of the Linear Flash\r\n\r\n");
               xil_printf("Do you want to continue (Y/N)?\r\n");
	       c = InputGetChar();
	       switch(c)
	       {
                     case 'Y':
                     case 'y':
                               done = 1;
			       break;
                     default:
			       xil_printf("\r\n******* Linear Flash Test Aborted - DONE\r\n");
	                       xil_printf("\n\r*******************************************************\n\r");
                               return XST_FAILURE;
			       break;
	       }
	}while(!done);


	xil_printf("\n\r******* Flash Device Query - START\n\r");
	Status = FlashDeviceControlExample();
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - Flash Device Query\n\r");
		return XST_FAILURE;
	}
	xil_printf("\n\r******* Flash Device Query - DONE\n\r");
	xil_printf("\n\r\n\r");


	xil_printf("\n\r******* Flash Write-Read-Compare - START\n\r\n\r");
	Status = FlashReadWriteExample();
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - Flash Write-Read-Compare\n\r");
		return XST_FAILURE;
	}
	xil_printf("\n\r******* Compare SUCCESSFUL\n\r");
	xil_printf("\n\r******* Flash Write-Read-Compare - DONE\n\r\n\r");
	xil_printf("\n\r*******************************************************\n\r");

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
*
* This function fetches and displays the geometry and properties of the Flash *
* device.
*
* @param	None.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
int FlashDeviceControlExample(void)
{
	u32 StartAddress;
	int Status;
	u32 Index;
	DeviceCtrlParam IoctlParams;

	/*
	 * Initialize the Flash Library.
	 */
	Status = XFlash_Initialize(&FlashInstance);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_Initialize\n\r");
		return XST_FAILURE;
	}

	/*
	 * Reset the Flash Device. This clears the Status registers and puts
	 * the device in Read mode.
	 */
	Status = XFlash_Reset(&FlashInstance);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_Reset\n\r");
		return XST_FAILURE;
	}

	/*
	 * Fetch the flash device properties and display.
	 */
	Status = XFlash_DeviceControl(&FlashInstance,
				XFL_DEVCTL_GET_PROPERTIES, &IoctlParams);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_DeviceControl\n\r");
		return XST_FAILURE;
	}

	xil_printf("\n\r\t\tFlash Properties\n\r");
	xil_printf("FlashProperties->PartID.ManufacturerID = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						PartID.ManufacturerID);

	xil_printf("FlashProperties->PartID.DeviceID = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
							PartID.DeviceID);

	xil_printf("FlashProperties->PartID.CommandSet = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
							PartID.CommandSet);

	xil_printf("FlashProperties->TimeTypical.WriteSingle_Us = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeTypical.WriteSingle_Us);

	xil_printf("FlashProperties->TimeTypical.WriteBuffer_Us = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeTypical.WriteBuffer_Us);

	xil_printf("FlashProperties->TimeTypical.EraseBlock_Ms = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeTypical.EraseBlock_Ms);

	xil_printf("FlashProperties->TimeTypical.EraseChip_Ms = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeTypical.EraseChip_Ms);

	xil_printf("FlashProperties->TimeMax.WriteSingle_Us = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeMax.WriteSingle_Us);

	xil_printf("FlashProperties->TimeMax.WriteBuffer_Us = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeMax.WriteBuffer_Us);

	xil_printf("FlashProperties->TimeMax.EraseBlock_Ms = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeMax.EraseBlock_Ms);

	xil_printf("FlashProperties->TimeMax.EraseChip_Ms = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						TimeMax.EraseChip_Ms);

	xil_printf("FlashProperties->ProgCap.WriteBufferSize = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						ProgCap.WriteBufferSize);

	xil_printf("FlashProperties->ProgCap.WriteBufferAlignMask = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->ProgCap.
						WriteBufferAlignmentMask);

	xil_printf("FlashProperties->ProgCap.EraseQueueSize = 0x%x\n\r",
			IoctlParams.PropertiesParam.PropertiesPtr->
						ProgCap.EraseQueueSize);

	/*
	 * Fetch the flash device geometry and display.
	 */
	Status = XFlash_DeviceControl(&FlashInstance,
				XFL_DEVCTL_GET_GEOMETRY, &IoctlParams);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	xil_printf("\n\r\n\r\t\tFlash Geometry\n\r");

	xil_printf("FlashGeometry->BaseAddress = 0x%x\n\r",
			IoctlParams.GeometryParam.GeometryPtr->BaseAddress);

	xil_printf("FlashGeometry->MemoryLayout = 0x%x\n\r",
			IoctlParams.GeometryParam.GeometryPtr->MemoryLayout);

	xil_printf("FlashGeometry->DeviceSize = 0x%x\n\r",
			IoctlParams.GeometryParam.GeometryPtr->DeviceSize);

	xil_printf("FlashGeometry->NumEraseRegions = 0x%x\n\r",
			IoctlParams.GeometryParam.GeometryPtr->NumEraseRegions);

	xil_printf("FlashGeometry->NumBlocks = 0x%x\n\r",
			IoctlParams.GeometryParam.GeometryPtr->NumBlocks);

	for(Index = 0; Index < IoctlParams.GeometryParam.GeometryPtr->
					NumEraseRegions; Index++) {
		xil_printf("\tErase region %d\n\r", Index);

		xil_printf("Absolute Offset = 0x%x\n\r",
				IoctlParams.GeometryParam.GeometryPtr->
					EraseRegion[Index].AbsoluteOffset);

		xil_printf("Absolute Block = 0x%x\n\r",
				IoctlParams.GeometryParam.GeometryPtr->
					EraseRegion[Index].AbsoluteBlock);

		xil_printf("Num Of Block = 0x%x\n\r",
				IoctlParams.GeometryParam.GeometryPtr->
						EraseRegion[Index].Number);

		xil_printf("Size Of Block = 0x%x\n\r",
				IoctlParams.GeometryParam.GeometryPtr->
						EraseRegion[Index].Size);
	}

	return XST_SUCCESS;
}


/*****************************************************************************/
/**
*
* This function writes, reads, and verifies the data to the Flash device.
*
* @param	None
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
int FlashReadWriteExample(void)
{
	int Status;
	u32 Index;
	u8 *WriteBufferBytePtr;

	/*
	 * Reset the Flash Device. This clears the Status registers and puts
	 * the device in Read mode.
	 */
	Status = XFlash_Reset(&FlashInstance);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_Reset\n\r");
		return XST_FAILURE;
	}

	/*
	 * Unlock Flash block before the Erase operation.
	 */
	Status = XFlash_Unlock(&FlashInstance, START_ADDRESS, FLASH_TEST_SIZE);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_Unlock\n\r");
		return XST_FAILURE;
	}

	/*
	 * Perform the Erase operation.
	 */
	Status = XFlash_Erase(&FlashInstance, START_ADDRESS, FLASH_TEST_SIZE);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_Erase\n\r");
		return XST_FAILURE;
	}

	/*
	 * Prepare the write buffer. Fill in the data need to be written into
	 * Flash Device.
	 */
	WriteBufferBytePtr = (u8*)WriteBuffer;
	for(Index = 0; Index < (2 * FLASH_TEST_SIZE); Index++) {
		*WriteBufferBytePtr++ = (u8)(Index + 1);
	}

	/* View WriteBuffer */
	for(Index = 0; Index < BUFFER_DISPLAY_COUNT; Index++)
	{
		xil_printf("WriteBuffer[%02d] = 0x%04X\r\n", Index, WriteBuffer[Index]);
	}

	/*
	 * Perform the Write operation. Pass in Byte Count to Write. Uses Out16.
	 */
	Status = XFlash_Write(&FlashInstance, START_ADDRESS, (2*FLASH_TEST_SIZE),
								WriteBuffer);
	if(Status != XST_SUCCESS) {
	        xil_printf("\n\rxflash:Error - XFlash_Write\n\r");
		return XST_FAILURE;
	}

	/*
	 * Perform the read operation. Pass in Byte Count to Read. Uses In16.
	 */
	Status = XFlash_Read(&FlashInstance, START_ADDRESS, (2*FLASH_TEST_SIZE),
								ReadBuffer);
		if(Status != XST_SUCCESS) {
	                xil_printf("\n\rxflash:Error - XFlash_Read\n\r");
			return XST_FAILURE;
	}

	xil_printf("\r\n---------------------------------------------\r\n\r\n");

	/* View ReadBuffer */
	for(Index = 0; Index < BUFFER_DISPLAY_COUNT; Index++)
	{
		xil_printf("ReadBuffer[%02d] = 0x%04X\r\n", Index, ReadBuffer[Index]);
	}

	/*
	 * Compare the data read against the data Written.
	 */

	for(Index = 0; Index < FLASH_TEST_SIZE; Index++) {
		if(ReadBuffer[Index] != WriteBuffer[Index]) {
	                xil_printf("\n\rxflash:Error - Write/Read Comparison Mismatch at Index = %d\n\r", Index);
		        xil_printf("\n\r(ReadBuffer[%02d] = %04X, WriteBuffer[%02d] = %04X\r\n", Index, ReadBuffer[Index], Index, WriteBuffer[Index]);
			return XST_FAILURE;
		}
	}

	return XST_SUCCESS;
}
