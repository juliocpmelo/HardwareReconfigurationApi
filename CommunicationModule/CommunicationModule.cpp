#include "CommunicationModule.h"
#include <iostream>
#include <algorithm>

using namespace std;

CommunicationModule::CommunicationModule(CommunicationLink* communicationLink){
	this->communicationLink = communicationLink; 

}

void CommunicationModule::communicationLoop(){
	/*the get message method in the communication link can or not be blocking
		thus this method should be called externally by the main or a secondary thread
		making it multi thread or single thread when possible*/
	Message * msg = communicationLink->getMessage();

	//loop over the callbacks and call if a suitable one is found for the current message.

	if (msg != NULL){

		std::vector<MessageHandler*> handlers;

		if(handlersTable.count((MessageType) msg->messageType) > 0){
			handlers = handlersTable[(MessageType) msg->messageType];

			for (std::vector<MessageHandler*>::iterator it = handlers.begin(); it != handlers.end(); it++){
				(*it)->handleMessage(msg);
			}
		}
	}
	/*loop over messages and send them throuth the actual communication link*/
	if ( ! communicationLink->messagePool.empty() ){
		communicationLink->sendMessages();
	}

}

void CommunicationModule::addMessageHandler(MessageType messageType, MessageHandler *handler){
	if(handlersTable.count(messageType) > 0){
		std::vector<MessageHandler*>::iterator begin = handlersTable[messageType].begin();
		std::vector<MessageHandler*>::iterator end = handlersTable[messageType].begin();
		if(std::find(begin, end, handler) == end)
			handlersTable[messageType].push_back(handler);
	}
	else
		handlersTable[messageType].push_back(handler);

}

void CommunicationModule::addMessageHandler(std::vector<MessageType> messageTypes, MessageHandler *handler){
	vector<MessageType>::iterator it = messageTypes.begin();
	for (; it != messageTypes.end(); it++)
		addMessageHandler(*it, handler);
}

void CommunicationModule::removeMessageHandler(MessageType messageType, MessageHandler *handler){
	if(handlersTable.count(messageType) > 0){
		std::vector<MessageHandler*>::iterator begin = handlersTable[messageType].begin();
		std::vector<MessageHandler*>::iterator end = handlersTable[messageType].begin();
		std::remove (begin, end, handler);
	}
}
