#include "CommunicationModule.h"
#include <iostream>
using namespace std;

CommunicationModule::CommunicationModule(){
	this->communicationLink = CommunicationLink::createCommunicationLink();

	handlersTable = new std::map<MessageType, std::vector<MessageHandler*>* >();

}

void CommunicationModule::communicationLoop(){
	/*the get message method in the communication link can or not be blocking
		thus this method should be called externally by the main or a secondary thread
		making it multi thread or single thread when possible*/
	Message * msg = communicationLink->getMessage();


	//loop over the callbacks and call if a suitable one is found for the current message.

	if (msg != NULL){

		std::vector<MessageHandler*> *handlers;

		if(handlersTable->count((MessageType) msg->messageType) > 0){
			handlers = (*handlersTable)[(MessageType) msg->messageType];

			for (std::vector<MessageHandler*>::iterator it = handlers->begin(); it != handlers->end(); it++){
				(*it)->handleMessage(msg);
			}
		}
	}
}

void CommunicationModule::addMessageHandler(MessageType messageType, MessageHandler *handler){
	

}

void CommunicationModule::removeMessageHandler(MessageType messageType, MessageHandler *handler){

}
