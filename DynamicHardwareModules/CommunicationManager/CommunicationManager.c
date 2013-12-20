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


CommunicationManager* createCommunicationManager(int supportedMessageSize){
	CommunicationManager* commMng = malloc(sizeof(CommunicationManager));

	commMng->supportedMessageSize = supportedMessageSize;
	commMng->communicationLink = createCommunicationLink(supportedMessageSize);
	commMng->communicationLoop = &communicationLoop;

	return commMng;
}

/*\brief This loop check for new messages and dispatch the registered callbacks*/
void communicationLoop(void *self){

	CommunicationManager* thiz = (CommunicationManager*)self;
	CommunicationLink* link = thiz->communicationLink;
	/*try to get some message from the server*/

	Message * msg = link->getMessage(link);

	HandlerNode *currentNode = thiz->handlerList->first;

	//loop over the callbacks and call if a suitable one is found for the current message.

	while (currentNode != NULL){
		if (msg->messageType == currentNode->messageType){
			int i;
			for(i=0; i<currentNode->numHandlers; i++){
				currentNode->handlers[i](currentNode->handlerArgs[i], msg);
			}
		}
		currentNode = currentNode->next;
	}

	/*TOTHINK: send messages in this loop or only receive?*/


}

void addMessageHandler(void *self, MessageType messageType, MessageHandler_t handler, void * handlerArgs){

}

void removeMessageHandler(void *self, MessageHandler_t handler){

}

