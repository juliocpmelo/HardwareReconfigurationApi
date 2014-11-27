
#ifndef CommunicationLink_h
#define CommunicationLink_h

#include <stdint.h>
#include <vector>
#include <map>
#include <iostream>



class Message{
	public:
		//message type identifier so the engine can recognize which message it has received
		uint32_t messageType;

		//message size to allow the receiver to know the size of the upcomming message
		uint32_t messageSize;

		//message content in bytes
		uint8_t *messageContent;

	~Message(){
		delete[] messageContent;
	}
};

class CommunicationLink{
	public:
		uint32_t maxMessageSize;
		std::vector<Message*> messagePool; 

	public:
		CommunicationLink();
		/*put message into messagePool to be sent*/
		void sendMessage(Message * msg);
		Message* getMessage();
		void sendAckMessage();
		void sendNackMessage();
		void flushMessage(Message *msg);

		void sendSetupMessage();
		/*send all messages from the message pool*/
		void sendMessages();
		void sendChunkMessages(Message *msg);
		inline int getNumChunkMessages(int bytes);
		inline uint32_t getMaxMessageSize();
		inline uint32_t getMaxChunkMessageSize();

		/*needs to be implemented by the specific communication link*/
		virtual bool available () = 0;
		static CommunicationLink* createCommunicationLink(std::map<std::string, std::string> linkParams);
	
	private:
		/*direct call to implemented sendMessage, ignoring messagePool*/
		void send(Message *message);

		virtual void sendMessage (uint8_t * buffer, int bufferSize) = 0;
		virtual void getMessage (uint8_t * buffer, int messageSize) = 0;


};


#endif //CommunicationLink_h
