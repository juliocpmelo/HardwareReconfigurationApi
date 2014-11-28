/*
 * CommunicationManager.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef COMMUNICATIONMANAGER_H_
#define COMMUNICATIONMANAGER_H_

#include "CommunicationLink.h"
#include "Util/List.h"

/**
 * \brief This enum contains a fixed set of message ids used internally by the API,
 * the application should not use those ids
 **/
typedef enum MessageType_t{
	MessageType_ACK = 0,
	MessageType_NACK,
	MessageType_Setup,
	MessageType_ArchitectureRequest,
	MessageType_ArchitectureUpdate,
	MessageType_NewArchitecture,
	MessageType_DataChunk,
}MessageType;


typedef void (*CommunicationLoop_t)(void * self);
typedef void (*MessageHandler_t)(void* handlerArgs, Message* message);
typedef void (*AddMessageHandler_t)(void *self, MessageType messageType, MessageHandler_t handler, void * handlerArgs);
typedef void (*RemoveMessageHandler_t)(void *self, MessageHandler_t handler);

/**
 * \brief struct to store a vector of message handlers, thus each handler
 * will be linked with a specific message type, then only receiving desired messages
 **/
typedef struct HandlerNode_t{
	List *handlers;

	//\brief when a handler is called, its given handlerArgs will used as parameter.
	List *handlerArgs;

	//\brief message type will be used to identify message internal structure, thus it should be unique
	int messageType;

}HandlerNode;

typedef struct CommunicationManager_t{
	/*attributes*/
	int supportedMessageSize;
	CommunicationLink* communicationLink;

	/**
	 * works as a table messageHandlerList[i] has a set of handlers for message
	 * type i
	 **/
	List *messageHandlerList;

	/*member functions*/
	AddMessageHandler_t addMessageHandler;
	CommunicationLoop_t communicationLoop;
	RemoveMessageHandler_t removeMessageHandler;
}CommunicationManager;

/**
 *\brief create a communication manager, with the given arguments.
 *\param supportedMessageSize the maximum size of message that needs to be used in the communication process
 *\param serverAddr address of the remote server(addr:port) in case this is a remote connection
 **/
CommunicationManager* createCommunicationManager(int supportedMessageSize, char* serverAddr);

/**
 * \brief adds a handler to the handler list
 * \param self a valid reference to a CommunicationManager
 * \param handler the handler to be added
 * \param handlerArgs the args to be used when calling this handler
 **/
void addMessageHandler(void *self, MessageType messageType, MessageHandler_t handler, void * handlerArgs);

/**
 * \brief removes a handler from the handler list. The handler args related with this handler are also removed.
 * \param self a valid reference to a CommunicationManager
 * \param handler the handler to be added
 **/
void removeMessageHandler(void *self, MessageHandler_t handler);

void communicationLoop(void *self);

/*datachunk message specifc methods*/
MessageType getDataChunckType(Message* datachunkMessage);
uint32_t getDataChunkDataSize(Message* datachunkMessage);
uint32_t getDataChunkIndex(Message* datachunkMessage);
uint8_t* getDataChunckData(Message* datachunkMessage);


#endif /* COMMUNICATIONMANAGER_H_ */
