#include "CommunicationLink.h"
#include "CommunicationModule.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <iostream>
using namespace std;

static uint8_t *receiveBuffer;
static uint8_t *sendBuffer;

/**
 * \brief reads the first 4 bytes in buf and coverts then as the first
 * for bytes of a int value, using the little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
int readInt(unsigned char *buf){
  int retVal = buf[3];
  int aux = buf[2];
  retVal = retVal | aux << 8;
  aux = buf[1] ;
  retVal = retVal | aux << 16;
  aux = buf[0];
  retVal = retVal | aux << 24;
  return retVal;
}

/**
 * \brief writes the bytes of value into buf using little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
void writeInt(unsigned char *destBuf, int value){

  destBuf[3] = (unsigned char) (value & 0x000000ff);
  destBuf[2] = (unsigned char) ((value & 0x0000ff00) >> 8);
  destBuf[1] = (unsigned char) ((value & 0x00ff0000) >> 16);
  destBuf[0] = (unsigned char) ((value & 0xff000000) >> 24);
}



CommunicationLink::CommunicationLink(){
	
}

/*sends a setup message with the maximum supporte packet size*/
void CommunicationLink::sendSetupMessage(){
	Message* msg = new Message;
	msg->messageType = MessageType_Setup;
	msg->messageSize = 4;

	msg->messageContent = new unsigned char[msg->messageSize];

	uint32_t maxMessageSize = this->maxMessageSize - 8;//always subtract the header size
	memcpy(msg->messageContent, (void*)&(maxMessageSize), 4);

	this->sendMessage(msg);
}

void CommunicationLink::sendAckMessage(){
	Message* msg = new Message;
	msg->messageType = MessageType_ACK;
	msg->messageSize = 0;

	msg->messageContent = NULL;
	this->sendMessage( msg);
}

void CommunicationLink::sendNackMessage(){
	Message* msg = new Message;
	msg->messageType = MessageType_NACK;
	msg->messageSize = 0;

	msg->messageContent = NULL;
	this->sendMessage( msg);
}

/**
 * \brief implementation of the API CommunicationLink's getMessage function
 * \param self a reference to the CommunicationLink struct
 **/
Message* CommunicationLink::getMessage(){

	Message* messageToReturn = new Message;


	//printf("receiving message");

	this->implGetMessage(receiveBuffer, 4); //receives the type first

	messageToReturn->messageType = readInt(receiveBuffer);
	printf("Message type %d\n",(unsigned int)messageToReturn->messageType);



	this->implGetMessage(receiveBuffer, 4); //receives the size

	messageToReturn->messageSize = readInt(receiveBuffer);
	printf("Message size %d\n",(unsigned int)messageToReturn->messageSize);
//	aux = receiveBuffer[1];
//	messageToReturn->messageType |= aux<<8;
//	aux = receiveBuffer[2];
//	messageToReturn->messageType |= aux<<16;
//	aux = receiveBuffer[3];
//	messageToReturn->messageType |= aux<<24;
//	printf("Message size %d\n",(unsigned int)messageToReturn->messageSize);

	messageToReturn->messageContent = new unsigned char [messageToReturn->messageSize];


	//bzero (messageToReturn->messageContent, messageToReturn->messageSize);
	this->implGetMessage(messageToReturn->messageContent,messageToReturn->messageSize);

//
	printf("message received\n[ t=%x, s=%x ]\n", messageToReturn->messageType, messageToReturn->messageSize);


	/*TODO send this to a specific implementation module*/
//	this->sendACKMessage(this);

	return messageToReturn;
}

/**
 * \brief implementation of the API CommunicationLink's sendMessage function
 * \param self a reference to the CommunicationLink struct
 * \param msg a the message to be sent
 **/
void CommunicationLink::sendMessage(Message* msg){


	//bzero(sendBuffer,this->maxMessageSize);

	sendBuffer = new uint8_t [msg->messageSize];

	unsigned char* tmpBuffePtr = sendBuffer;
	memcpy(tmpBuffePtr, (uint8_t*)&(msg->messageType), 4);
	memcpy(tmpBuffePtr+4, (uint8_t*)&(msg->messageSize), 4);
	memcpy(tmpBuffePtr+8, (uint8_t*)(msg->messageContent), msg->messageSize);

	this->implSendMessage(sendBuffer, msg->messageSize + 8);

	delete sendBuffer;

}

/**
 * \brief Flushes the contents of a message from the rcv buffer, in this function it was used
 * the number 100 as a
 * \param self a reference to the CommunicationLink struct
 * \param msg a reference to a valid Message struct
 *
 */
void CommunicationLink::flushMessage(Message *msg){
	//call receive function a number of times untill the message is totally flushed
	int bytesToDiscart, i;
	if (msg->messageSize > (uint32_t)this->maxMessageSize)
		bytesToDiscart = this->maxMessageSize;
	else
		bytesToDiscart = msg->messageSize;


	int nTimes = (msg->messageSize / bytesToDiscart) + ((msg->messageSize % bytesToDiscart != 0) ? 1 : 0);

	printf("flushing %d bytes with %d rcv calls\n",msg->messageSize, nTimes);
	for (i=0; i<nTimes; i++){
		//in the last call, flushes only the rest of the message instead of the entire 100 bytes
		if(i + 1 == nTimes && msg->messageSize % bytesToDiscart != 0)
			this->implGetMessage(receiveBuffer, msg->messageSize % bytesToDiscart);
		else
			this->implGetMessage(receiveBuffer, bytesToDiscart);
	}
	printf("flushed %d bytes with %d rcv calls\n",msg->messageSize, nTimes);

}


