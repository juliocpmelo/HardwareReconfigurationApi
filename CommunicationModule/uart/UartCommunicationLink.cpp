#include "UartCommunicationLink.h"

#include <stdio.h>   // standard input / output functions
#include <fcntl.h>   // File control definitions
#include <unistd.h>


using namespace std;

CommunicationLink* CommunicationLink::createCommunicationLink(){

	struct termios portSettings;
	cfsetispeed(&portSettings, B115200);    // set baud rates
	cfsetospeed(&portSettings, B115200);

	portSettings.c_cflag |= PARENB;   // set parity(odd), stop bits, data bits
	portSettings.c_cflag |= PARODD;
	portSettings.c_cflag &= ~CSTOPB;
	portSettings.c_cflag &= ~CSIZE;
	portSettings.c_cflag |= CS8;
	//port_settings.c_cflag |= (CLOCAL | CREAD);
	portSettings.c_lflag |= (ICANON | ECHO | ECHOE);


	return (CommunicationLink*) new UartCommunicationLink(string("/dev/ttyS0"), portSettings);
}

UartCommunicationLink::UartCommunicationLink(std::string uartPort,  struct termios portSettings){


	uartPortFd = open("/dev/ttyS0", O_RDWR );

	if(uartPortFd == -1) // if open is unsucessful
	{
		perror("open_port: Unable to open /dev/ttyS0 - ");
	}

	configureUartPort(portSettings);


}

void UartCommunicationLink::configureUartPort(struct termios portSettings)
{
	tcsetattr(uartPortFd, TCSANOW, &portSettings);
}

/*sets the binary values of the port configuration structure*/
void UartCommunicationLink::setPortAttr(int attrToSet, bool value){

	struct termios port_settings;      // structure to store the port settings in
	tcgetattr(uartPortFd, &port_settings);

	if (value)
		port_settings.c_cflag |= attrToSet;
	else
		port_settings.c_cflag &= ~attrToSet;
	
	tcsetattr(uartPortFd, TCSANOW, &port_settings);    // apply the settings to the port
}


void UartCommunicationLink::implSendMessage (uint8_t * buffer, int bufferSize){
	int loopNumber = bufferSize  / 4 + (bufferSize % 4 != 0 ? 1 : 0);
	int bytesSent = 0;

	int bytesToWrite = 4;

	for(int i=0; i<loopNumber ; i++){
		if(loopNumber + 1 == loopNumber)
			bytesToWrite = bufferSize % 4 ;
		bytesSent += write(uartPortFd, buffer + bytesSent, bytesToWrite);
		usleep(300000); //pc was too fast to uart communication
	}


}


void UartCommunicationLink::implGetMessage (uint8_t * buffer, int messageSize){

	int bytesRead  = 0;
	while(bytesRead < messageSize)
		bytesRead += read(uartPortFd, buffer + bytesRead, messageSize - bytesRead);

}


