/*
 * CommunicationManager.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#include "CommunicationManager.h"
#include <stdio.h>
#include <stdlib.h>

/*
 * Setup callbacks according the D:\Users\Julio\Downloads\xapp1026\xapp1026\xapp1026_14_3\sp605_EthernetLite_32kb_Cache
 * example
 */


int HandlerNdoe_compare(void *handlerNodeA, void* handlerNodeB){
	HandlerNode* handlerA = (HandlerNode*) handlerA;
	HandlerNode* handlerB = (HandlerNode*) handlerB;
	if(handlerA->messageType == handlerB->messageType)
		return 1;
	return 0;
}

CommunicationManager* createCommunicationManager(int supportedMessageSize, char* serverAddr){
	CommunicationManager* commMng = malloc(sizeof(CommunicationManager));

	commMng->supportedMessageSize = supportedMessageSize;
	commMng->communicationLink = createCommunicationLink(supportedMessageSize, serverAddr);
	commMng->communicationLoop = &communicationLoop;
	commMng->addMessageHandler = &addMessageHandler;
	commMng->removeMessageHandler = &removeMessageHandler;
	commMng->messageHandlerList = createList(&HandlerNdoe_compare);

	return commMng;
}

/*\brief This loop check for new messages and dispatch the registered callbacks*/
void communicationLoop(void *self){

	CommunicationManager* thiz = (CommunicationManager*)self;
	CommunicationLink* link = thiz->communicationLink;
	/*try to get some message from the server*/

	Message * msg = link->getMessage(link);

	ListNode *currentNode = thiz->messageHandlerList->first;

	//loop over the callbacks and call if a suitable one is found for the current message.

	if (msg != NULL ){ //message could be null when no messages are available
		while (currentNode != NULL){
			HandlerNode *currentHandlerNode = (HandlerNode*) currentNode->data;
			//printf("%s::%d >> comparing %d %d\n",__FILE__, __LINE__, msg->messageType, currentHandlerNode->messageType);
			if (msg->messageType == currentHandlerNode->messageType ||
					(msg->messageType == MessageType_DataChunk && 
					 getDataChunckType(msg) == currentHandlerNode->messageType))
			{
				/*iteraction over handlers and arguments*/
				ListNode *currentNodeHandlers = currentHandlerNode->handlers->first;
				ListNode *currentNodeHandlersArgs = currentHandlerNode->handlerArgs->first;
				while (currentNodeHandlers != NULL){
					MessageHandler_t currentHandler = (MessageHandler_t)currentNodeHandlers->data;
					void* currentHandlerArg = currentNodeHandlersArgs->data;
					(*currentHandler)(currentHandlerArg, msg);
					currentNodeHandlers = currentNodeHandlers->next;
					currentNodeHandlersArgs = currentNodeHandlersArgs->next;
				}
				//delete message after handlers are called and the reserve flag is not set
				if(!msg->reserve)
					msg->destructor((void**)&msg);
			}
			currentNode = currentNode->next;
		}
	}
	link->sendPooledMessages(link);
}

HandlerNode* createHandlerNode(List *handlers, List *handlerArgs, int messageType){

	HandlerNode* retVal = malloc(sizeof (HandlerNode));
	retVal->messageType = messageType;
	retVal->handlerArgs = handlerArgs;
	retVal->handlers = handlers;
	return retVal;
}

void addMessageHandler(void *self, MessageType messageType, MessageHandler_t handler, void * handlerArg){
	
	CommunicationManager* thiz = (CommunicationManager*)self;
	ListNode *currentNode = thiz->messageHandlerList->first;
	int messageTypeNotFound = 1;
	//loop over the callbacks and call if a suitable one is found for the current message.

	while (currentNode != NULL){
		HandlerNode *currentHandlerNode = (HandlerNode *) currentNode->data;
		if (messageType == currentHandlerNode->messageType){
			printf("%s::%d >> Adding Message type %d\n",__FILE__, __LINE__, messageType);
			list_push_back(currentHandlerNode->handlers, handler);
			list_push_back(currentHandlerNode->handlerArgs, handlerArg);
			messageTypeNotFound = 0;
			break;
		}
		currentNode = currentNode->next;
	}
	/*create new entry point in table for the given messageType*/
	if(messageTypeNotFound){
		printf("%s::%d >> Adding Message type %d\n",__FILE__, __LINE__, messageType);
		List *newHandlersList;
		newHandlersList = createList(NULL);
		list_push_back(newHandlersList, handler);

		List *newHandlerArgs;
		newHandlerArgs = createList(NULL);
		list_push_back(newHandlerArgs, handlerArg);

		HandlerNode* node = createHandlerNode(newHandlersList, newHandlerArgs, messageType);
		list_push_back(thiz->messageHandlerList, node);
		
	}
}

void removeMessageHandler(void *self, MessageHandler_t handler){
/*TODO: find a better list */
}


MessageType getDataChunckType(Message* dataChunkMessage){
	return BufferFunctions_readInt(dataChunkMessage->messageContent); //original message type always at pos 0
}

uint32_t getDataChunkDataSize(Message* dataChunkMessage){
	return BufferFunctions_readInt(dataChunkMessage->messageContent + 4); //original message type always at pos 0
}

uint32_t getDataChunkIndex(Message* dataChunkMessage){
	return BufferFunctions_readInt(dataChunkMessage->messageContent + 8); //original message type always at pos 0
}

uint8_t* getDataChunckData(Message* dataChunkMessage){
	return (dataChunkMessage->messageContent + 12); //skip type, size and index
}


