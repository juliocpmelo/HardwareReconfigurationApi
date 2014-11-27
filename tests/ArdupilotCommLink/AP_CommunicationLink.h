
#ifndef AP_CommunicationLink_h
#define AP_CommunicationLink_h
#include <CommunicationModule/CommunicationLink.h>

#include <termios.h>
#include <stdio.h>   // standard input / output functions
#include <fcntl.h>   // File control definitions
#include <unistd.h>

#include <netinet/in.h>

#include <iostream>


class AP_CommunicationLink : public CommunicationLink{
	public:
		int sockfd, portno;

		struct sockaddr_in serv_addr;

		struct hostent *server;

		std::string serverAddress;

		bool error;

	public:
		AP_CommunicationLink(std::string serverAddress, std::string portNumber);

		/*inherit from CommunicationLink*/	
		virtual void sendMessage (uint8_t * buffer, int bufferSize);
		virtual void getMessage (uint8_t * buffer, int messageSize);
		virtual bool available();

};

#endif// UartCommunicatioinLink_h
