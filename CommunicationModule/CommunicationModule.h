
#ifndef CommunicationModule_h
#define CommunicationModule_h

#include "CommunicationLink.h"
#include <map>
#include <vector>

typedef enum MessageType_t{

	MessageType_ACK = 0,
	MessageType_NACK,
	MessageType_Setup,
	
	/**
	 * starts from client to server
	 * contains the description of the architecture requested
	 **/
	MessageType_ArchitectureRequest,

	/**
	 * starts from server to client
	 * signals that a component in the managed architecture have changed
	 **/
	MessageType_ArchitectureUpdate,

	/**
	 * starts from server to client
	 * contains a set of new bitstreams and archictecture description to be donwloaded from the server to the client
	 **/
	MessageType_NewArchitecture,

	/**
	 * starts from either client or server
	 * contains a chunk of message, used when messageSize > maxMessageSize - 8
	 * messages from type DataChunk will contain the usual type and size
	 * messageContent will contain:
	 * 	messageContent[3 .. 0] = messageType : message type being broken into chunks
	 * 	messageContent[7 .. 4] = index : chunck number
	 * 	messageContent[8 .. maxMessageSize - 8] = data chunk of the entire message
	 **/
	MessageType_DataChunk
}MessageType;


class MessageHandler{
	/*handles the message received*/
	public:
		virtual void handleMessage(Message* message) = 0;
};

/*TODO make it multi thread?*/

class CommunicationModule{
	public:
		std::map<MessageType, std::vector<MessageHandler*> > handlersTable;

		CommunicationLink *communicationLink;

	public:
		CommunicationModule(CommunicationLink *communicationLink);
		void addMessageHandler(MessageType messageType, MessageHandler *handler);
		void addMessageHandler(std::vector<MessageType> messageTypes, MessageHandler *handler);
		void removeMessageHandler(MessageType messageType, MessageHandler *handler);

		void communicationLoop();

};


#endif //CommunicationModule_h
