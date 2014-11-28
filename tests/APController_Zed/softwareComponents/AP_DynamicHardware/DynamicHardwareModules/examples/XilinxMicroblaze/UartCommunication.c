/* $Id: xuartlite_intr_example.c,v 1.1.2.1 2009/11/24 05:14:23 svemula Exp $ */
/******************************************************************************
*
* (c) Copyright 2002-2009 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/
/******************************************************************************/
/**
*
* @file xuartlite_intr_example.c
*
* This file contains a design example using the UartLite driver (XUartLite) and
* hardware device using the interrupt mode.
*
* @note
*
* The user must provide a physical loopback such that data which is
* transmitted will be received.
*
* MODIFICATION HISTORY:
* <pre>
* Ver   Who  Date     Changes
* ----- ---- -------- -----------------------------------------------
* 1.00a jhl  02/13/02 First release
* 1.00b rpm  10/01/03 Made XIntc declaration global
* 1.00b sv   06/09/05 Minor changes to comply to Doxygen and coding guidelines
* 2.00a ktn  10/20/09 Updated to use HAL Processor APIs and minor changes
*		      for coding guidelnes.
* </pre>
******************************************************************************/

#include "UartCommunication.h"
#include "CommunicationLink.h"
#include "CommunicationManager.h"

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

/************************** Variable Definitions *****************************/

 XUartLite UartLite;            /* The instance of the UartLite Device */

 XIntc InterruptController;     /* The instance of the Interrupt Controller */

/*
 * The following variables are shared between non-interrupt processing and
 * interrupt processing such that they must be global.
 */


#define UART_BUFFER_SIZE 16
/*
 * The following buffers are used in this example to send and receive data
 * with the UartLite.
 */
u8 sendBuffer[UART_BUFFER_SIZE]; //for some reason this buffer needs to be a vector
u8 receiveBuffer[UART_BUFFER_SIZE];



int getNumChunks(Message* newBitstreamMessage){
	if(newBitstreamMessage->messageType == MessageType_NewBitstream){
		unsigned char * message = newBitstreamMessage->messageContent;
		int chunkNum = readInt(message);
		return chunkNum;
	}
	else
		return 0;
}

int UartLitePolledExample(u16 DeviceId)
{
	int Status;

	/*
	 * Initialize the UartLite driver so that it is ready to use.
	 */
	Status = XUartLite_Initialize(&UartLite, DeviceId);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Perform a self-test to ensure that the hardware was built correctly.
	 */
	Status = XUartLite_SelfTest(&UartLite);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	CommunicationLink *commLink = createCommunicationLink(2000);
	commLink->setupCommunicationLink(commLink);

	//bzero(receiveBuffer, TEST_BUFFER_SIZE);
	//char message[TEST_BUFFER_SIZE];
//	bzero(message, TEST_BUFFER_SIZE);

	uint32_t numChunks = 0, chunkCount;
	while (1) {
		//first reads always the size of the upcoming message

		xil_printf("waiting messages \n");

		Message * msg = commLink->getMessage(commLink);

		if(msg != NULL){
			if(msg->messageType == MessageType_NewBitstream){
				numChunks = readInt(msg->messageContent);
				xil_printf("New bitstream message received, num chunks=%d!!\n", numChunks);
				int i;
				xil_printf("Num chunks\n[ ");
				for (i =0; i<msg->messageSize; i++)
					xil_printf("%x ", msg->messageContent[i]);
				xil_printf("]\n");
				chunkCount = 0;
				free(msg->messageContent);
				free(msg);
			}
			else if(msg->messageType == MessageType_DataChunk){
				xil_printf("Bitstream chunk %d from %d received !!\n", chunkCount, numChunks);

				free(msg->messageContent);
				free(msg);
				chunkCount ++;
			}
		}
		else{
			xil_printf("NULL message received !!\n");
		}




	}

	/*
	 * Check the receive buffer data against the send buffer and verify the
	 * data was correctly received.
	 */
//	for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
//		if (SendBuffer[Index] != RecvBuffer[Index]) {
//			return XST_FAILURE;
//		}
//	}

	return XST_SUCCESS;
}

/**
 * \brief this function will block until a complete message is received
 * \param buffer a buffer with enough to store the message
 * \param messageSize the size of message to receive in bytes
 **/
void uartReceiveMessage(uint8_t* buffer, int messageSize){
	int bytesReceived = 0, totalBytesReceived = 0 , bytesToReceive;
	if (messageSize <= UART_BUFFER_SIZE)
		bytesToReceive = messageSize;
	else
		bytesToReceive = UART_BUFFER_SIZE;
	while (totalBytesReceived < messageSize){
		bytesReceived += XUartLite_Recv(&UartLite, receiveBuffer + bytesReceived, bytesToReceive - bytesReceived);
		if (bytesReceived >= messageSize || bytesReceived >= bytesToReceive){
			memcpy(buffer + totalBytesReceived, receiveBuffer, bytesReceived);
			totalBytesReceived += bytesReceived;
			xil_printf("%s::%d %d\n", __FUNCTION__, messageSize, totalBytesReceived);
			if(totalBytesReceived + UART_BUFFER_SIZE > messageSize)
				bytesToReceive = messageSize % UART_BUFFER_SIZE;
			bytesReceived = 0;
		}
	}
}


/**
 * \brief this function will block until a complete message is sent
 * \param buffer a buffer with the message to be sent
 * \param messageSize the size of message to sent in bytes
 **/
void uartSendMessage(uint8_t* buffer, int messageSize){
	int bytesSent = 0;
	//int i;
	memcpy(sendBuffer, buffer, messageSize);

//	xil_printf("sending message\n[");
//	for( i=0; i< messageSize; i++)
//		xil_printf(" %x ", buffer[i]);
//	xil_printf("]\n");
//	//xil_printf("sending message\n[");
//	for( i=0; i< messageSize; i++)
//		xil_printf(" %x ", sendBuffer[i]);
//	xil_printf("]\n");
	while (bytesSent < messageSize){
		bytesSent += XUartLite_Send(&UartLite, sendBuffer + bytesSent,messageSize - bytesSent);
	}

//	xil_printf("message sent!\n");
}

void setupImplSendAndImplReceive(CommunicationLink *communicationLink){
	communicationLink->implGetMessage = &uartReceiveMessage;
	communicationLink->implSendMessage = &uartSendMessage;

	//sendBuffer = (u8*) malloc(sizeof(u8) * communicationLink->maxMessageSize);
	//receiveBuffer = (u8*) malloc(sizeof(u8) * communicationLink->maxMessageSize);
}
