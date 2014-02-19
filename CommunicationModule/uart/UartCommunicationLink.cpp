
#ifndef UartCommunicatioinLink_h
#define UartCommunicatioinLink_h
#include "CommunicationLink.h"

#include <termios.h>

class UartCommunicationLink : public CommunicationLink{
	public:
		int uartPortFd;

	public:
		UartCommunicationLink(char* uartPort, speed_t portSpeed);

		void configureUartPortSpeed(speed_t portSpeed);
		void setPortAttr(int attrToSet, bool value);	

		/*inherit from CommunicationLink*/	
		virtual void implSendMessage (uint8_t * buffer, int bufferSize);
		virtual void implGetMessage (uint8_t * buffer, int messageSize);

};

#endif// UartCommunicatioinLink_h
