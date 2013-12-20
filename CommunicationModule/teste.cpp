#include <iostream>
#include <assert.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>

#include <sys/stat.h>
#include <sys/types.h>
#include <sstream>

#include <stdio.h>   // standard input / output functions
#include <stdlib.h>  // general standard library functions
#include <unistd.h>  // UNIX standard function definitions
#include <fcntl.h>   // File control definitions
#include <termios.h> // POSIX terminal control definitionss
#include <stdint.h>

using namespace std;

int open_port(void);
int configure_port(int fd , speed_t st);
int read_lines(int fd, char* buf, int lines);

typedef enum MessageType_t{
	MessageType_ACK = 0,
	MessageType_NACK,
	MessageType_Setup,
	MessageType_ArchitectureRequest,
	MessageType_ArchitectureUpdate,
	MessageType_NewBitstream,
	MessageType_DataChunk,
}MessageType;

typedef struct Message_t{
	//message type identifier so the engine can recognize which message it has received
	uint32_t messageType;

	//message size to allow the receiver to know the size of the upcomming message
	uint32_t messageSize;

	//message content in bytes
	unsigned char* messageContent;
}Message;

Message* getMessage(int serialInterface);
void sendMessage(int serialInterface, Message* msg);



void uartReceiveMessage(unsigned char* buffer, int messageSize){
	int bytesReceived = 0;


}


void uartSendMessage(unsigned char* buffer, int messageSize){


}

/**
 * \brief reads the first 4 bytes in buf and coverts then as the first
 * for bytes of a int value, using the little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
int readInt(unsigned char *buf){
	int retVal = buf[3];
	int aux = buf[2];
	retVal = retVal | aux << 8;
	aux = buf[1] ;
	retVal = retVal | aux << 16;
	aux = buf[0];
	retVal = retVal | aux << 24;
	return retVal;
}

/**
 * \brief writes the bytes of value into buf using little endian format. Thus buf[0] is the
 * msb and buf[3] is the lsb.
 **/
void writeInt(unsigned char *destBuf, int value){

	destBuf[3] = (unsigned char) (value & 0x000000ff);
	destBuf[2] = (unsigned char) ((value & 0x0000ff00) >> 8);
	destBuf[1] = (unsigned char) ((value & 0x00ff0000) >> 16);
	destBuf[0] = (unsigned char) ((value & 0xff000000) >> 24);
}

void sendMessage(int serialInterface, Message* msg){

	unsigned char *buf;
	int bytesSent = 0;

	buf = new unsigned char[msg->messageSize + 8];

	writeInt(buf, msg->messageType);
	writeInt(buf+4, msg->messageSize);

	memcpy(buf+8, msg->messageContent, msg->messageSize );

	
/*	cout << " sending message" << endl << "[";
	for (int i = 8; i< 8 + 4; i ++)
		cout <<hex<< " " << (unsigned int)buf[i] << " ";
	cout <<dec<< "]"<<endl;
*/
//	while (bytesSent < msg->messageSize + 8){
	for(int i=0; i< (msg->messageSize + 8)/4 ; i++){
		bytesSent += write(serialInterface, buf + bytesSent, 4);
		usleep(300000); //pc was too fast to uart communication
	}
		//sleep(1);
	//}

	//cout << "messag sent !" <<endl;


	cout << "waiting ack "<< endl;
	Message* ack = getMessage(serialInterface);
	

	if(ack->messageType != MessageType_ACK)
		cout << "ACK message not received after transfer"<<endl;
	else
		cout << "ack received!!!" <<endl;




}

/*communication link here should be good*/
Message* getMessage(int serialInterface){

	unsigned char buf[20];

	Message *messageToReturn = new Message;

	int bytesRead = 0;
//	cout << "waiting on the message type"<<endl;
	while(bytesRead < 4)
		bytesRead +=	read(serialInterface, buf + bytesRead, 4 - bytesRead);

	messageToReturn->messageType = readInt(buf);

//	cout << "type == "<<messageToReturn->messageType<<endl;
	

	bytesRead = 0;
//	cout << "waiting on the message size"<<endl;
	while(bytesRead < 4)
		bytesRead += read(serialInterface, buf+4+bytesRead, 4-bytesRead);

	messageToReturn->messageSize = readInt(buf + 4);

//	cout << "size == "<<messageToReturn->messageSize<<endl;

	messageToReturn->messageContent = new unsigned char[messageToReturn->messageSize];

	bytesRead = 0;
//	cout << "waiting on the message content"<<endl;
	while(bytesRead < messageToReturn->messageSize)
		bytesRead += read(serialInterface, messageToReturn->messageContent + bytesRead, messageToReturn->messageSize - bytesRead);


	/*cout << " message received" << endl << "[";
	for (int i = 0; i< 8; i ++)
		cout <<hex<< " " << (unsigned int)buf[i] << " ";

	for (int i = 0; i< messageToReturn->messageSize; i ++)
		cout <<hex<< " " << (unsigned int)messageToReturn->messageContent[i] << " ";
	cout <<dec<< "]"<<endl;
	*/


	return messageToReturn;
}




char* convertIntToChar(int value){
	
}




int main(int argc, char* argv[])
{
	int serialInterface = open_port();
	char rate_info[255];
	int position;

	configure_port(serialInterface, B115200);

	char *buf;

	string bitstream (argv[1]);
	FILE* bitstreamFile = fopen(bitstream.c_str(), "rb");

	cout<< "waiting on setup message "<<endl;
	Message *setup = getMessage(serialInterface);
	int maxMessageSize = 0;

	cout<< "first message received "<<setup->messageType<<endl;
	if(setup->messageType == MessageType_Setup){

		maxMessageSize = readInt(setup->messageContent);

		cout<< "setup message received maxMessageSize=" << maxMessageSize <<endl;

	}
	
	
	fseek(bitstreamFile, 0, SEEK_END);
	int bitstreamSize = ftell(bitstreamFile);

	rewind(bitstreamFile);
	
	int chunksSent = 0;

	int chunksToSend = bitstreamSize / (maxMessageSize) + ( ( ( bitstreamSize % (maxMessageSize) ) != 0 ) ? 1 : 0); // 2 bytes to the message header

	int actChunkSize = maxMessageSize;

	int bytesSent =0;

	if(bitstreamSize > maxMessageSize){
		cout<<"Bitstream size(" <<bitstreamSize<<") greater than maxMessageSize("<<maxMessageSize<<")"<<endl;
		cout<<"Number of chunks to send " << chunksToSend << endl;
	}


	while (chunksSent < chunksToSend){

	
		if(!bitstreamFile){
			cout<<"bitstream "<<bitstream<< " not found "<< strerror(errno)<<endl;
			return -1;
			break;
		}
		else{

			/**/

			Message* newBitstream = new Message;

			newBitstream->messageType = MessageType_NewBitstream;

			newBitstream->messageSize = 4;

			newBitstream->messageContent = new unsigned char[4];
			
			writeInt(newBitstream->messageContent,chunksToSend);

			cout << "sending new bitstream, num chunks"<<endl<<"[ ";
			for (int i = 0; i< newBitstream->messageSize; i ++)
				cout <<hex<<" "<< (unsigned int)newBitstream->messageContent[i]<< " ";
			cout <<dec<< "]"<<endl;


			sendMessage(serialInterface, newBitstream);

			while (chunksSent < chunksToSend){

				if(chunksToSend - 1 == chunksSent) // last chunk
					actChunkSize =  bitstreamSize % (maxMessageSize);

				Message* bitstreamChunk = new Message;

				bitstreamChunk->messageType = MessageType_DataChunk;

				bitstreamChunk->messageSize = actChunkSize;

				bitstreamChunk->messageContent = new unsigned char[bitstreamChunk->messageSize];

				bytesSent += fread(bitstreamChunk->messageContent, 1, actChunkSize, bitstreamFile);
			
				cout << "Sending bitstream chunk"<<endl;
			
				sendMessage(serialInterface, bitstreamChunk);

				delete bitstreamChunk->messageContent;
				delete bitstreamChunk;


				cout << "sent " << bytesSent << " bytes from " << bitstreamSize << " bytes "<< endl;

				chunksSent ++;

			}

			delete newBitstream->messageContent;
			delete newBitstream;



//			sleep(10);


		}
	}

	fclose (bitstreamFile);
	close(serialInterface);



	return 0;
}


/*Function to open a serial port*/
int open_port(void)
{
   int fd; // file description for the serial port

   fd = open("/dev/ttyS0", O_RDWR );

   if(fd == -1) // if open is unsucessful
   {
      perror("open_port: Unable to open /dev/ttyS0 - ");
   }

   return(fd);
}

/*Port configuration*/
int configure_port(int fd , speed_t st)
{
   struct termios port_settings;      // structure to store the port settings in

   tcgetattr(fd, &port_settings);
   cfsetispeed(&port_settings, st);    // set baud rates
   cfsetospeed(&port_settings, st);

	 port_settings.c_cflag |= PARENB;		// set parity(odd), stop bits, data bits
   port_settings.c_cflag |= PARODD;    
   port_settings.c_cflag &= ~CSTOPB;
   port_settings.c_cflag &= ~CSIZE;
   port_settings.c_cflag |= CS8;
   //port_settings.c_cflag |= (CLOCAL | CREAD);
   port_settings.c_lflag |= (ICANON | ECHO | ECHOE);

   tcsetattr(fd, TCSANOW, &port_settings);    // apply the settings to the port

   return(fd);
}

