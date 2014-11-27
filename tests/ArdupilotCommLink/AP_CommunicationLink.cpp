#include "AP_CommunicationLink.h"

#include <stdlib.h>

#include <stdio.h>

#include <netdb.h>

#include <string.h>
#include <errno.h>

using namespace std;
CommunicationLink* CommunicationLink::createCommunicationLink(std::map<std::string, std::string> linkParams){
	return (CommunicationLink*) new AP_CommunicationLink( linkParams["serverAddress"],linkParams["portNumber"].c_str());
}

/*
 * Communication Module for Ardupilot is done through a client socket
 */

AP_CommunicationLink::AP_CommunicationLink(std::string serverAddress, std::string portNumber){

	this->maxMessageSize = 256;
	this->portno = atoi(portNumber.c_str());
	this->serverAddress = serverAddress;

	this->server = gethostbyname(this->serverAddress.c_str());
	this->error = false;
	if (server == NULL) {
		this->error = true;
		cout<<__FILE__<<">>ERROR: no such host or malformed host name\n"<<endl;
	}
	cout<< "got host: " << this->serverAddress<< endl;

	bzero((char *) &this->serv_addr, sizeof(serv_addr));
	this->serv_addr.sin_family = AF_INET;
	bcopy( (char *)(this->server->h_addr), 
			   (char *)&(this->serv_addr.sin_addr.s_addr),
			   this->server->h_length);

	serv_addr.sin_port = htons(this->portno);

	/* Create a socket point */
	this->sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (this->sockfd < 0) 
	{
		this->error = true;
		perror("ERROR opening socket");
	}


	/* Now connect to the server */
	if (connect(this->sockfd,
						  (struct sockaddr *)&(this->serv_addr),
							sizeof(this->serv_addr)) < 0) 
	{
		this->error = true;
		perror("ERROR connecting");
	}	

	/*set socket as non blocking for read*/
/* dont need this if using select with timeout
 	unsigned v = fcntl(this->sockfd, F_GETFL, 0);
	fcntl(this->sockfd, F_SETFL, v | O_NONBLOCK);
*/

}

void AP_CommunicationLink::sendMessage (uint8_t * buffer, int32_t bufferSize){
	int bytesWritten = 0;
	/* Send message to the server */
		while(bytesWritten < bufferSize){
			int actBytesWritten = write(sockfd,buffer,bufferSize);
			if (bytesWritten < 0) 
			{
				cout<<__FILE__<<">>ERROR: writing to server"<<serverAddress<<"::"<<portno<<endl;
			}
			else
				bytesWritten += actBytesWritten;

		}
		/* Now read server response */
	
}


void AP_CommunicationLink::getMessage (uint8_t * buffer, int32_t messageSize){

	int bytesRead = 0;

 // fd_set fds;
 // struct timeval tv;

  //FD_ZERO(&fds);
  //FD_SET(this->sockfd, &fds);

  // zero time means immediate return from select()
 // tv.tv_sec = 0;
 // tv.tv_usec = 0;

	//if (select(this->sockfd+1, &fds, NULL, NULL, &tv) == 1) {
		/*there is at least 1 byte to be read*/
		while(bytesRead < messageSize){
			int actBytesRead = read(this->sockfd,buffer + bytesRead,messageSize - bytesRead);
			if (actBytesRead > 0 ){
				bytesRead += actBytesRead;
			}
			else if(actBytesRead <0){
				cerr<< "error reading file"<< strerror(errno)<<endl;
			}
		}

	//}

}

bool AP_CommunicationLink::available(){
	int bytesRead = 0;

  fd_set fds;
  struct timeval tv;

  FD_ZERO(&fds);
  FD_SET(this->sockfd, &fds);

  // zero time means immediate return from select()
  tv.tv_sec = 0;
  tv.tv_usec = 0;

	if (select(this->sockfd+1, &fds, NULL, NULL, &tv) > 0) 
		return true;
	else
		return false;
	
}
