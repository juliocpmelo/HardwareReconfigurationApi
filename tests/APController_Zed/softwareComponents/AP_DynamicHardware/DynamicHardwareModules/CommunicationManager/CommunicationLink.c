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
#include <Util/BufferFunctions.h>

static uint8_t *receiveBuffer;
static uint8_t *sendBuffer;


int messageCompare(void *messageA, void* messageB){
	Message *msgA = (Message*)messageA;
	Message *msgB = (Message*)messageB;
	if (msgA->messageType == msgB->messageType && msgA->messageSize == msgB->messageSize &&
			msgA->messageContent == msgB->messageContent){
		return 1;
	}
	return 0;
}

CommunicationLink* createCommunicationLink(uint32_t maxMessageSize, char* serverAddr){

	CommunicationLink* commLinkToReturn = (CommunicationLink*) malloc(sizeof(CommunicationLink));
	commLinkToReturn->maxMessageSize = maxMessageSize;
	commLinkToReturn->setupCommunicationLink = &setupCommunicationLink;
	commLinkToReturn->getMessage = &getMessage;
	commLinkToReturn->sendMessage = &sendMessage;
	commLinkToReturn->sendNACKMessage = &sendNACKMessage;
	commLinkToReturn->sendACKMessage = &sendACKMessage;
	commLinkToReturn->flushMessage = &flushMessage;
	commLinkToReturn->createMessage = &createMessage;

	commLinkToReturn->sendPooledMessages = &sendPooledMessages;
	commLinkToReturn->messagePool = createList(&messageCompare);

	receiveBuffer = (uint8_t*)malloc (sizeof(uint8_t) * 10); //used only for the headers
	sendBuffer = (uint8_t*)malloc (sizeof(uint8_t) * maxMessageSize);

	connectToServer(serverAddr);
	setupImplSendAndImplReceive(commLinkToReturn);
	return commLinkToReturn;
}

void setupCommunicationLink(void* self){
	sendSetupMessage(self);
}

/*default message destructor*/
void defaultMessageDestructor(void** message){
	Message *msg = (Message*)(*message);
	switch (msg->messageType){
		case MessageType_ACK:
		case MessageType_NACK:
		{
			free(msg);
			break;
		}
		default:
		{
			free((uint8_t*)msg->messageContent);
			free(msg);
			break;
		}
	}
}


Message* createMessage(uint32_t messageType, uint32_t messageSize, unsigned char* messageContent, MessageDestructor_t destructor){
	Message* msg = (Message*) malloc(sizeof (Message));
	msg->messageType = messageType;
	msg->messageSize = messageSize;
	if(destructor)
		msg->destructor = destructor;
	else
		msg->destructor = &defaultMessageDestructor;
	msg->messageContent = messageContent;
	msg->reserve = 0;

	return msg;
}


/*sends a setup message with the maximum supporte packet size*/
void sendSetupMessage(void* self){
	CommunicationLink* thiz= (CommunicationLink*) self;
	Message* msg = createMessage(MessageType_Setup, 4, NULL, &defaultMessageDestructor);

	msg->messageContent = (unsigned char*) malloc(sizeof(char) * msg->messageSize);

	uint32_t maxMessageSize = thiz->maxMessageSize - 8;//always subtract the header size
	BufferFunctions_writeInt(msg->messageContent, maxMessageSize);

	thiz->sendMessage(thiz, msg);

}

void sendACKMessage(void* self){
	CommunicationLink* thiz= (CommunicationLink*) self;
	Message* msg = createMessage(MessageType_ACK, 0, NULL, &defaultMessageDestructor);
	thiz->sendMessage(thiz, msg);
}

void sendNACKMessage(void* self){
	CommunicationLink* thiz= (CommunicationLink*) self;
	Message* msg = createMessage(MessageType_NACK, 0, NULL, &defaultMessageDestructor);
	thiz->sendMessage(thiz, msg);
}

static int actMessageType = -1;
static int actMessageSize = -1;

/**
 * \brief implementation of the API CommunicationLink's getMessage function
 * \param self a reference to the CommunicationLink struct
 **/
Message* getMessage(void* self){

	CommunicationLink* thiz = (CommunicationLink*) self;


	//printf("receiving message");
	if(thiz->implAvailable() ){
		if(actMessageSize <0 && actMessageType < 0){//receives the type and size first
			thiz->implGetMessage(receiveBuffer, 8);
			actMessageType = BufferFunctions_readInt(receiveBuffer);
			actMessageSize = BufferFunctions_readInt(receiveBuffer+4);
			//printf("Types and size received: [t=%d s=%d]\n",actMessageType, actMessageSize);
			if(actMessageSize > thiz->maxMessageSize){
				Message* messageToReturn = createMessage(actMessageType, actMessageSize, NULL, NULL);
				thiz->flushMessage(thiz, messageToReturn);
				defaultMessageDestructor((void**)&messageToReturn);
				actMessageSize = -1;
				actMessageType = -1;
			}
		}
	}
	if (thiz->implAvailable()){
		if(actMessageSize >= 0 && actMessageType >= 0){
			Message* messageToReturn = createMessage(actMessageType, actMessageSize, NULL, &defaultMessageDestructor);
			messageToReturn->messageContent = (unsigned char*) malloc (sizeof(unsigned char) * messageToReturn->messageSize);
			if(!messageToReturn->messageContent){
				printf("Unable to alloc %d bytes to message \n", (unsigned int) messageToReturn->messageSize);
				thiz->flushMessage(thiz, messageToReturn);
				defaultMessageDestructor((void**)&messageToReturn);
				actMessageSize = -1;
				actMessageType = -1;
				return NULL;
			}
			thiz->implGetMessage(messageToReturn->messageContent,messageToReturn->messageSize);

			actMessageSize = -1;
			actMessageType = -1;
			//printf("Message received: [t=%d s=%d]\n", messageToReturn->messageType, messageToReturn->messageSize);
			return messageToReturn;
		}
	}
	return NULL;

}







/**
 * \brief implementation of the API CommunicationLink's sendMessage function
 * \param self a reference to the CommunicationLink struct
 * \param msg a the message to be sent
 **/
void sendMessage(void * self, Message* msg){
	CommunicationLink* thiz = (CommunicationLink*) self;
	list_push_back(thiz->messagePool,msg);
}

/*send messages will be destroyed afterwards if they have propper destructor*/
void sendPooledMessages(void * self){


	CommunicationLink* thiz = (CommunicationLink*) self;
	ListNode *currentNode = thiz->messagePool->first;

	while(currentNode != NULL){
		//bzero(sendBuffer,thiz->maxMessageSize);

		//sendBuffer = (uint8_t*) malloc(sizeof(uint8_t) * msg->messageSize + 8 );
		Message *msg = (Message*)currentNode->data;

		unsigned char* tmpBufferPtr = sendBuffer;
		/*msb/lsb independent data*/

		BufferFunctions_writeInt(tmpBufferPtr, msg->messageType);
		BufferFunctions_writeInt(tmpBufferPtr + 4, msg->messageSize);

		memcpy(tmpBufferPtr+8, (uint8_t*)(msg->messageContent), msg->messageSize);

		thiz->implSendMessage(sendBuffer, msg->messageSize + 8);
		printf("Message sent: [t=%d s=%d]\n",msg->messageType, msg->messageSize);
		currentNode = currentNode->next;
		
		if(msg->destructor)
			msg->destructor((void**)&msg);
	}

	list_clear(thiz->messagePool);
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

	printf("flushing %d bytes with %d rcv calls\n",msg->messageSize, nTimes);
	for (i=0; i<nTimes; i++){
		//in the last call, flushes only the rest of the message instead of the entire 100 bytes
		if(i + 1 == nTimes && msg->messageSize % bytesToDiscart != 0)
			thiz->implGetMessage(receiveBuffer, msg->messageSize % bytesToDiscart);
		else
			thiz->implGetMessage(receiveBuffer, bytesToDiscart);
	}
	printf("flushed %d bytes with %d rcv calls\n",msg->messageSize, nTimes);

}



