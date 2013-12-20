
#ifndef CommunicationModule_h
#define CommunicationModule_h

#include "CommunicationLink.h"
#include <map>
#include <vector>


class MessageHandler{
	/*handles the message received*/
	virtual void handleMessage(Message* message) = 0;
};

/*TODO make it multi thread?*/

class CommunicationModule{
	public:
		std::map<MessageType, std::vector<MessageHandler*> > handlers;

		CommunicationLink *communicationLink;

	public:
		CommunicationModule();
		void addMessageHandler(MessageType messageType, MessageHandler *handler);
		void removeMessageHandler(MessageType messageType, MessageHandler *handler);

		void communicationLoop();

};


#endif //CommunicationModule_h
