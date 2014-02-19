

UartCommunicationLink::UartCommunicationLink(char* uartPort, speed_t portSpeed){


	uartPortFd = open("/dev/ttyS0", O_RDWR );

	if(uartPortFd == -1) // if open is unsucessful
	{
		perror("open_port: Unable to open /dev/ttyS0 - ");
	}

	configureUartPort(portSettings);


}

void UartCommunicationLink::configureUartPortSpeed(speed_t portSpeed)
{

	cfsetispeed(&port_settings, portSpeed);    // set baud rates
	cfsetospeed(&port_settings, portSpeed);

	port_settings.c_cflag |= 

}

/*sets the binary values of the port configuration structure*/
void UartCommunicationLink::setPortAttr(int attrToSet, bool value){

	struct termios port_settings;      // structure to store the port settings in
	tcgetattr(uartPort, &port_settings);

	if (value)
		port_settings |= attrToSet;
	else
		port_settings &= ~attrToSet;
	
	tcsetattr(uartPort, TCSANOW, &port_settings);    // apply the settings to the port
}


void UartCommunicationLink::implSendMessage (uint8_t * buffer, int bufferSize){
	int loopNumber = bufferSize  / 4 + (bufferSize % 4 != 0 ? 1 : 0);
	int bytesSent = 0;

	int bytesToWrite = 4;

	for(int i=0; i<loopNumber ; i++){
		if(loopNumber + 1 == loopNumber)
			bytesToWrite = bufferSize % 4 ;
		bytesSent += write(serialInterface, buf + bytesSent, bytesToWrite);
		usleep(300000); //pc was too fast to uart communication
	}


}


void UartCommunicationLink::implGetMessage (uint8_t * buffer, int messageSize){

	int bytesRead  = 0;
	while(bytesRead < messageSize)
		bytesRead += read(serialInterface, buffer + bytesRead, messageSize - bytesRead);

}


/*implementation required by CommunicationLink*/	
CommunicationLink* CommunicationLink::createCommunicationLink(){

	struct termios port_settings;

	UartCommunicationLink *uartCommLink =new UartCommunicationLink("/dev/ttyS0", B115200);

	uartCommLink->setPortAttr(PARENB, true);
	uartCommLink->setPortAttr(PARODD, true);
	uartCommLink->setPortAttr(CSTOPB, false);
	uartCommLink->setPortAttr(CSIZE, false);
	uartCommLink->setPortAttr(CS8, true);
	uartCommLink->setPortAttr(ICANON, true);
	uartCommLink->setPortAttr(ECHO, true);
	uartCommLink->setPortAttr(ECHOE, true);

/*	port_settings.c_cflag |= PARENB;   // set parity(odd), stop bits, data bits
	port_settings.c_cflag |= PARODD;
	port_settings.c_cflag &= ~CSTOPB;
	port_settings.c_cflag &= ~CSIZE;
	port_settings.c_cflag |= CS8;
	//port_settings.c_cflag |= (CLOCAL | CREAD);
	port_settings.c_lflag |= (ICANON | ECHO | ECHOE);
*/
	return uartCommLink;

}
