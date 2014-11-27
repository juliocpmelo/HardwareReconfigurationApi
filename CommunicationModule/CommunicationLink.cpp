#include "CommunicationLink.h"
#include "CommunicationModule.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <iostream>

#include <Util/BufferFunctions.h>

using namespace Util;

using namespace std;


static uint8_t *receiveBuffer;
static uint8_t *sendBuffer;


CommunicationLink::CommunicationLink(){
	receiveBuffer = new uint8_t[1024]; //change it to max message size
}

/*sends a setup message with the maximum supporte packet size*/
void CommunicationLink::sendSetupMessage(){
	Message* msg = new Message;
	msg->messageType = MessageType_Setup;
	msg->messageSize = 4;

	msg->messageContent = new unsigned char[msg->messageSize];

	uint32_t maxMessageSize = getMaxMessageSize();//always subtract the header size
	writeInt(msg->messageContent, maxMessageSize);

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


Message* messageToReturn = new Message;
static int actMessageSize = -1;
static int actMessageType = -1;

/**
 * \brief implementation of the API CommunicationLink's getMessage function, communication model
 * is to be non blocking, however it is assumpted, that once one byte is available, the entire message
 * will be received.
 * \param self a reference to the CommunicationLink struct
 **/
Message* CommunicationLink::getMessage(){



	//printf("receiving message");

	if (this->available()){
		if(actMessageType < 0 && actMessageSize < 0){
			cout<<__FILE__<<"::"<<__LINE__<<" -> Got sizes "<<endl;
			this->getMessage(receiveBuffer, 8); //receives the type first
			actMessageType = readInt(receiveBuffer);

			actMessageSize = readInt(receiveBuffer+4);
		}
	}
	if (this->available()){ 
		if(actMessageType > 0 && actMessageSize > 0){
			messageToReturn = new Message;
			messageToReturn->messageSize = actMessageSize;
			messageToReturn->messageType = actMessageType;
			messageToReturn->messageContent = new uint8_t [messageToReturn->messageSize];

			this->getMessage(messageToReturn->messageContent,messageToReturn->messageSize);

			cout<<__FILE__<<"::"<<__LINE__<<endl<< "Message Received [t="<<actMessageType<<", s="<<actMessageSize<<"]"<<endl;
			actMessageSize = -1;
			actMessageType = -1;
			//printf("message received\n[ t=%x, s=%x ]\n", messageToReturn->messageType, messageToReturn->messageSize);
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
void CommunicationLink::sendMessage(Message* msg){

	this->messagePool.push_back(msg);

	//bzero(sendBuffer,this->maxMessageSize);
}

void CommunicationLink::sendChunkMessages(Message *msg){

	int numChunks = getNumChunkMessages(msg->messageSize);

	int bytesCopied = 0;

	cout << "creating chunk messages for message size "<< msg->messageSize << endl; 
	for (int i=0; i < numChunks; i++){
		
		int actSize = getMaxChunkMessageSize(); //max message size reduced by the chunk header size
		
		cout<<__FILE__<<"::"<<__LINE__<<endl;
		int maxChunkMessageSize = getMaxChunkMessageSize();
		
		if(msg->messageSize % maxChunkMessageSize != 0){
			if(i == numChunks - 1)
				actSize = msg->messageSize % maxChunkMessageSize;
		}

		Message *dataChunk = new Message;

		dataChunk->messageType = MessageType_DataChunk;
		dataChunk->messageSize = actSize + 12; //size plus header size
		dataChunk->messageContent = new uint8_t [actSize + 12]; //size plus header size

		writeInt(dataChunk->messageContent,msg->messageType); //subtype
		writeInt(dataChunk->messageContent + 4,actSize); //internal content size
		writeInt(dataChunk->messageContent + 8,i); //chunk index

		memcpy(dataChunk->messageContent + 12, msg->messageContent + bytesCopied, actSize);

		bytesCopied += actSize;
		send(dataChunk);
		cout<<"sent message chunk [t="<<msg->messageType<<", s="<<actSize<<", i="<<i<<"]"<<endl;

		delete dataChunk;
/*send message*/

	}
}

void CommunicationLink::send(Message *message){

	sendBuffer = new uint8_t [message->messageSize + 8]; //messageSize + headerSize
	writeInt(sendBuffer, message->messageType);
	writeInt(sendBuffer+4, message->messageSize);
	memcpy(sendBuffer+8, message->messageContent, message->messageSize);
	this->sendMessage(sendBuffer, message->messageSize + 8);
	delete[] sendBuffer;
}

void CommunicationLink::sendMessages(){

	for	(std::vector<Message*>::iterator it = messagePool.begin(); it != messagePool.end(); it++){
		Message* msg = *it;
		if(msg->messageSize > getMaxMessageSize()){ //check this value
			sendChunkMessages(msg);
		}
		else{
			send(msg);
			cout<<"sent message [t="<<msg->messageType<<", s="<<msg->messageSize<<"]"<<endl;
		}
		delete msg;
	}
	messagePool.clear();
}

/**
 * \brief gets the number of chunk messages required to send the ammount of bytes given
 * \param bytes the amount of bytes that are going to be sent
 * \return the number of chunk messages required
 **/
int CommunicationLink::getNumChunkMessages(int bytes){
	//subtract the maxMessageSize from the number of bytes required for a chunkMessage
	//4 type
	//4 messageContentSize
	//4 index of the current chunk
	uint32_t maxChunkMessageSize = getMaxChunkMessageSize();//always subtract the header size
	if(bytes % maxChunkMessageSize == 0)
		return bytes / maxChunkMessageSize;
	else
		return bytes / maxChunkMessageSize + 1;
}

uint32_t CommunicationLink::getMaxMessageSize(){
	return maxMessageSize - 8; //max alowed message size minus header size
}

uint32_t CommunicationLink::getMaxChunkMessageSize(){

	return getMaxMessageSize() - 12; //max allowed message size minus chunk message header size
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
			this->getMessage(receiveBuffer, msg->messageSize % bytesToDiscart);
		else
			this->getMessage(receiveBuffer, bytesToDiscart);
	}
	printf("flushed %d bytes with %d rcv calls\n",msg->messageSize, nTimes);

}


