
#ifndef CommunicationLink_h
#define CommunicationLink_h

#include <stdint.h>


typedef enum MessageType_t{
	MessageType_ACK = 0,
	MessageType_NACK,
	MessageType_Setup,
	MessageType_ArchitectureRequest,
	MessageType_ArchitectureUpdate,
	MessageType_NewBitstream,
	MessageType_DataChunk,
}MessageType;


class Message{
	public:
	//message type identifier so the engine can recognize which message it has received
  uint32_t messageType;

  //message size to allow the receiver to know the size of the upcomming message
  uint32_t messageSize;

  //message content in bytes
  uint8_t *messageContent;
};

class CommunicationLink{
	public:
		int maxMessageSize;

	public:
		CommunicationLink();
		void sendMessage(Message * msg);
		Message* getMessage();
		void setupCommunicationLink();
		void sendAckMessage();
		void sendNackMessage();
		void flushMessage(Message *msg);

		void sendSetupMessage();

		/*needs to be implemented by the specific communication link*/
		virtual void implSendMessage (uint8_t * buffer, int bufferSize) = 0;
		virtual void implGetMessage (uint8_t * buffer, int messageSize) = 0;

		/*needs to be implemented by the specific communication link*/
		static CommunicationLink* createCommunicationLink();

};


#endif //CommunicationLink_h
