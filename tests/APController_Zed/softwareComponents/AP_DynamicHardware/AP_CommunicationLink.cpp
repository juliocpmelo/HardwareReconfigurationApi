

#include "AP_CommunicationLink.h"
#include <iostream>
using namespace std;
using namespace AP_HAL;

AP_CommunicationLink* AP_CommunicationLink::selfInstance = NULL;

// @implements setupImplSendAndImplReceive from CommunicationLink.h
void setupImplSendAndImplReceive(CommunicationLink *communicationLink){
	/*make the setup for send and receive functions*/
	communicationLink->implSendMessage = &AP_sendMessage;
	communicationLink->implGetMessage = &AP_receiveMessage;
	communicationLink->implAvailable = &AP_available;
}

// @implements connectToServer from CommunicationLink.h
void connectToServer(char* serverAddr){
	/*do nothing for uart connection*/
}

void AP_receiveMessage(uint8_t* buffer, int messageSize){
	AP_CommunicationLink::selfInstance->receiveMessage(buffer, messageSize);
}

void AP_sendMessage(uint8_t* buffer, int messageSize){

	AP_CommunicationLink::selfInstance->sendMessage(buffer, messageSize);
}

int AP_available(){
	return AP_CommunicationLink::selfInstance->available();
}

AP_CommunicationLink::AP_CommunicationLink(UARTDriver* uartLink){
	this->uartLink = uartLink;
}

void AP_CommunicationLink::sendMessage(uint8_t *buffer, int size){
	uartLink->write(buffer, size);
}

int AP_CommunicationLink::available(){
	if(uartLink->available() >= 0)
		return uartLink->available();
	return 0;
}


void AP_CommunicationLink::receiveMessage(uint8_t *buffer, int size){
	int messageSize = 0;
	while (messageSize < size && uartLink->available() > 0){
		buffer[messageSize] = (uint8_t) uartLink->read();
		messageSize ++;
	}

}



void AP_CommunicationLink::update(){
}

bool AP_CommunicationLink::initCommunicationLink(){
	if(selfInstance)
		return false;
	else{
		selfInstance = this;
		
	}
	return true;

}

