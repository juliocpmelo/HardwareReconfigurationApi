/*
 * CommunicationLink.h
 *
 *  Created on: 27.11.2013
 *      Author: Julio
 */

#ifndef COMMUNICATIONLINK_H_
#define COMMUNICATIONLINK_H_

#include <string.h>
#include <Util/Types.h>
#include <Util/List.h>

typedef void (*MessageDestructor_t) (void **message);

typedef struct Message_t{
	//message type identifier so the engine can recognize which message it has received
	uint32_t messageType;

	//message size to allow the receiver to know the size of the upcomming message
	uint32_t messageSize;

	//message content in bytes
	unsigned char* messageContent;

	//reserve flag, used to avoid message data deletion after all receive handlers are called
	uint8_t reserve;

	//destructor used to destroy this specific message
	MessageDestructor_t destructor;
}Message;

/**
 * \brief gets the next message in the communication link
 * \param self a reference to a communication link structure
 * \return a reference to the message retrieved from the communication link
 * */
typedef Message* (*GetMessage_t)(void * self);

/**
 * \brief sends a message through communication link
 * \param self a reference to a communication link structure
 * \param message the message to send
 **/
typedef void (*SendMessage_t)(void * self, Message *);
typedef void (*SetupCommunicationLink_t)(void* self);
typedef void (*SendAckNackMessage_t) (void *self);
typedef void (*FlushMessage_t) (void *self, Message *);
typedef void (*SendPooledMessages_t) (void *self);
typedef Message* (*CreateMessage_t) (uint32_t messageType, uint32_t messageSize, unsigned char* messageContent, MessageDestructor_t destructor);

typedef void (*SendMessageImpl_t) (uint8_t * buffer, int bufferSize);
typedef void (*GetMessageImpl_t) (uint8_t * buffer, int messageSize);
typedef int (*AvailableImpl_t) ();



typedef struct CommunicationLink_t{
	/*attributes*/
	uint32_t maxMessageSize;
	List *messagePool;

	/*member functions*/
	SendMessage_t sendMessage;
	GetMessage_t getMessage;
	FlushMessage_t flushMessage;
	SendAckNackMessage_t sendACKMessage;
	SendAckNackMessage_t sendNACKMessage;
	SendPooledMessages_t sendPooledMessages;
	CreateMessage_t createMessage;


	/*implementation dependant functions*/
	/*should block until messageSize bytes are written*/
	SendMessageImpl_t implSendMessage;
	/*should block until messageSize bytes are read*/
	GetMessageImpl_t implGetMessage;
	/*should return 0 when no bytes are available to read, 1 otherwise*/
	AvailableImpl_t implAvailable;


	SetupCommunicationLink_t setupCommunicationLink;
}CommunicationLink;


CommunicationLink* createCommunicationLink(uint32_t maxMessageSize, char* serverAddr);

/**
 * \brief this function should be called after the sendMessage and getMessage funtions where filled, then
 * this function will send a setup message to the server allowing the communication to begin
 **/
void setupCommunicationLink(void *self);
void sendSetupMessage(void *self);

void sendMessage(void *self, Message *msg);
Message* getMessage(void *self);
void flushMessage(void *self, Message *msg);

void sendACKMessage(void *self);
void sendNACKMessage(void *self);
void sendPooledMessages(void *self);

Message* createMessage(uint32_t messageType, uint32_t messageSize, unsigned char* messageContent, MessageDestructor_t destructor);

/**
 * \brief setup the implementation dependent send and receive functions
 **/
void setupImplSendAndImplReceive(CommunicationLink *communicationLink);

/**
 * \brief implementation dependent connection to specific server
 **/
void connectToServer(char *serverAddr);


#endif /* COMMUNICATIONLINK_H_ */
