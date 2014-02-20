
#ifndef UartCommunicatioinLink_h
#define UartCommunicatioinLink_h
#include "CommunicationLink.h"

#include <termios.h>

#include <iostream>


class UartCommunicationLink : public CommunicationLink{
	public:
		int uartPortFd;

	public:
		UartCommunicationLink(std::string uartPort, struct termios portSettings);

		void configureUartPort(struct termios portSettings);
		void setPortAttr(int attrToSet, bool value);	

		/*inherit from CommunicationLink*/	
		virtual void implSendMessage (uint8_t * buffer, int bufferSize);
		virtual void implGetMessage (uint8_t * buffer, int messageSize);

};

#endif// UartCommunicatioinLink_h
