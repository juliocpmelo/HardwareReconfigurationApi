/*
 * CommunicationLink.c
 *
 *  Created on: 29.11.2013
 *      Author: Julio
 */
#include "CommunicationLink.h"
#include "CommunicationManager.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static uint8_t *receiveBuffer;
static uint8_t *sendBuffer;

CommunicationLink* createCommunicationLink(uint32_t maxMessageSize){

	CommunicationLink* commLinkToReturn = (CommunicationLink*) malloc(sizeof(CommunicationLink));
	commLinkToReturn->maxMessageSize = maxMessageSize;
	commLinkToReturn->setupCommunicationLink = &setupCommunicationLink;
	commLinkToReturn->getMessage = &getMessage;
	commLinkToReturn->sendMessage = &sendMessage;
	commLinkToReturn->sendNACKMessage = &sendNACKMessage;
	commLinkToReturn->sendACKMessage = &sendACKMessage;
	commLinkToReturn->flushMessage = &flushMessage;


	receiveBuffer = (uint8_t*)malloc (sizeof(uint8_t) * 10); //used only for the headers
	//sendBuffer = (uint8_t*)malloc (sizeof(uint8_t) * maxMessageSize);

	setupImplSendAndImplReceive(commLinkToReturn);
	return commLinkToReturn;
}
void setupCommunicationLink(void* self){
	sendSetupMessage(self);
}

/*sends a setup message with the maximum supporte packet size*/
void sendSetupMessage(void* self){
	CommunicationLink* thiz= (CommunicationLink*) self;
	Message* msg = (Message*) malloc(sizeof (Message));
	msg->messageType = MessageType_Setup;
	msg->messageSize = 4;

	msg->messageContent = (unsigned char*) malloc(sizeof(char) * msg->messageSize);

	uint32_t maxMessageSize = thiz->maxMessageSize - 8;//always subtract the header size
	memcpy(msg->messageContent, (void*)&(maxMessageSize), 4);

	thiz->sendMessage(thiz, msg);
}

void sendACKMessage(void* self){
	CommunicationLink* thiz= (CommunicationLink*) self;
	Message* msg = (Message*) malloc(sizeof (Message));
	msg->messageType = MessageType_ACK;
	msg->messageSize = 0;

	msg->messageContent = NULL;
	thiz->sendMessage(thiz, msg);
}

void sendNACKMessage(void* self){
	CommunicationLink* thiz= (CommunicationLink*) self;
	Message* msg = (Message*) malloc(sizeof (Message));
	msg->messageType = MessageType_NACK;
	msg->messageSize = 0;

	msg->messageContent = NULL;
	thiz->sendMessage(thiz, msg);
}

/**
 * \brief implementation of the API CommunicationLink's getMessage function
 * \param self a reference to the CommunicationLink struct
 **/
Message* getMessage(void* self){

	Message* messageToReturn = (Message*) malloc(sizeof(Message));
	CommunicationLink* thiz = (CommunicationLink*) self;


	//printf("receiving message");

	thiz->implGetMessage(receiveBuffer, 4); //receives the type first

	messageToReturn->messageType = readInt(receiveBuffer);
	printf("Message type %d\n",(unsigned int)messageToReturn->messageType);



	thiz->implGetMessage(receiveBuffer, 4); //receives the size

	messageToReturn->messageSize = readInt(receiveBuffer);
	printf("Message size %d\n",(unsigned int)messageToReturn->messageSize);
//	aux = receiveBuffer[1];
//	messageToReturn->messageType |= aux<<8;
//	aux = receiveBuffer[2];
//	messageToReturn->messageType |= aux<<16;
//	aux = receiveBuffer[3];
//	messageToReturn->messageType |= aux<<24;
//	printf("Message size %d\n",(unsigned int)messageToReturn->messageSize);

	if(messageToReturn->messageSize > thiz->maxMessageSize){
		printf("Message size %d greater than max message size %d\n",(unsigned int) messageToReturn->messageSize, (unsigned int)thiz->maxMessageSize);
		thiz->flushMessage(thiz, messageToReturn);
		thiz->sendNACKMessage(thiz);
		free(messageToReturn);
		return NULL;
	}

	messageToReturn->messageContent = (unsigned char*) malloc (sizeof(unsigned char) * messageToReturn->messageSize);


	if(!messageToReturn->messageContent){
		printf("Unable to alloc %d bytes to message \n", (unsigned int) messageToReturn->messageSize);
		thiz->flushMessage(thiz, messageToReturn);
		thiz->sendNACKMessage(thiz);
		free(messageToReturn);
		return NULL;
	}

	//bzero (messageToReturn->messageContent, messageToReturn->messageSize);
	thiz->implGetMessage(messageToReturn->messageContent,messageToReturn->messageSize);

//
	xil_printf("message received\n[ t=%x, s=%x ]\n", messageToReturn->messageType, messageToReturn->messageSize);


	thiz->sendACKMessage(thiz);

	return messageToReturn;
}

/**
 * \brief implementation of the API CommunicationLink's sendMessage function
 * \param self a reference to the CommunicationLink struct
 * \param msg a the message to be sent
 **/
void sendMessage(void * self, Message* msg){

	CommunicationLink* thiz = (CommunicationLink*) self;

	//bzero(sendBuffer,thiz->maxMessageSize);

	sendBuffer = (uint8_t*) malloc(sizeof(uint8_t) * msg->messageSize + 8 );

	unsigned char* tmpBuffePtr = sendBuffer;
	memcpy(tmpBuffePtr, (uint8_t*)&(msg->messageType), 4);
	memcpy(tmpBuffePtr+4, (uint8_t*)&(msg->messageSize), 4);
	memcpy(tmpBuffePtr+8, (uint8_t*)(msg->messageContent), msg->messageSize);

	thiz->implSendMessage(sendBuffer, msg->messageSize + 8);

	free (sendBuffer);

}

/**
 * \brief Flushes the contents of a message from the rcv buffer, in this function it was used
 * the number 100 as a
 * \param self a reference to the CommunicationLink struct
 * \param msg a reference to a valid Message struct
 *
 */
void flushMessage(void *self, Message *msg){
	CommunicationLink* thiz = (CommunicationLink*) self;
	//call receive function a number of times untill the message is totally flushed
	int bytesToDiscart, i;
	if (msg->messageSize > thiz->maxMessageSize)
		bytesToDiscart = thiz->maxMessageSize;
	else
		bytesToDiscart = msg->messageSize;


	int nTimes = (msg->messageSize / bytesToDiscart) + ((msg->messageSize % bytesToDiscart != 0) ? 1 : 0);

	xil_printf("flushing %d bytes with %d rcv calls\n",msg->messageSize, nTimes);
	for (i=0; i<nTimes; i++){
		//in the last call, flushes only the rest of the message instead of the entire 100 bytes
		if(i + 1 == nTimes && msg->messageSize % bytesToDiscart != 0)
			thiz->implGetMessage(receiveBuffer, msg->messageSize % bytesToDiscart);
		else
			thiz->implGetMessage(receiveBuffer, bytesToDiscart);
	}
	xil_printf("flushed %d bytes with %d rcv calls\n",msg->messageSize, nTimes);

}


/**
 * \brief reads the first 4 bytes in buf and coverts then as the first
 * four bytes of a int value, using the little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
uint32_t readInt(uint8_t *buff){
	uint32_t aux, retVal;
	retVal = buff[3];
	aux = buff[2];
	retVal |= aux<<8;
	aux = buff[1];
	retVal |= aux<<16;
	aux = buff[0];
	retVal |= aux<<24;
	return retVal;
}
