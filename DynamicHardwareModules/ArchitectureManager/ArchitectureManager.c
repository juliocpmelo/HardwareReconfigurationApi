/*
 * ArchitectureManager.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#include "ArchitectureManager.h"
#include "CommunicationManager/CommunicationManager.h"

#include "ReconfigurationManager/HardwareReconfigurationModule.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

HardwareComponent* getHardwareComponent(void* self, const char* componentInstanceName){

	ArchitectureManager* architectureManager = (ArchitectureManager*) self;
	ComponentSetNode *actComponentIt = architectureManager->components->first;
	while (actComponentIt != NULL){
		if(strcmp(actComponentIt->comp->instanceName,componentInstanceName) == 0)
			return actComponentIt->comp;
		else
			actComponentIt = actComponentIt->next;
	}
	return NULL;
}

void insertHardwareComponent(void* self, HardwareComponent* comp){

	ArchitectureManager* architectureManager = (ArchitectureManager*) self;
	ComponentSetNode *componentIt = malloc(sizeof(ComponentSetNode));
	componentIt->next = NULL;
	componentIt->comp = comp;

	ComponentSetNode *firstComponent = architectureManager->components->first;
	if(firstComponent != NULL){
		componentIt->next = firstComponent;
		architectureManager->components->first = componentIt;
	}
	else{
		architectureManager->components->first = componentIt;
	}
}


/**
 * \brief callback when a HardwareUpdate message is sent from the server*/
void hardwareUpdateHandler(void* handlerArgs, Message* message){

	/*test*/

}

void bitstreamReceivedHandler(void* handlerArgs, Message *message){
	/*it sends this Message to the RecocnfigurationManager that will
	 * handle the bitstream messages accordingly*/

}

Message* architectureRequestMessage(HardwareComponent* topComponent){
	Message *archRequest = (Message*)malloc(sizeof(Message));
	archRequest->messageType = MessageType_ArchitectureRequest;

	/*fill message with the description of the requested architecture*/
	archRequest->messageSize = 1;
	archRequest->messageContent = (char*)malloc(sizeof(char));
	archRequest->messageContent[0] = 'a';
	/*fill message with the description of the requested architecture*/

	return archRequest;
}

/*
 * implements a specific hardware component into the dynamic region
 * @param self a reference to a instance of the ArchitectureManager class
 * @param topComponent the a reference to the topComponent to be implemented
 */
void implementArchitecture(void *self, HardwareComponent* topComponent){

	ArchitectureManager* thiz = (ArchitectureManager*) self;
	HardwareReconfigurationModule *hardawareReconfigurationModule = thiz->hardawareReconfigurationModule;
	CommunicationManager *communicationManager = thiz->communicationManager;
	CommunicationLink* communicationLink =communicationManager->communicationLink;

//	if(hardawareReconfigurationModule->isBitstreamCached(hardawareReconfigurationModule, topComponent)){
//
//		//burn bitstream into reconf area
//	}
//	else{

		Message *architectureRequest = architectureRequestMessage(topComponent);
		communicationLink->sendMessage(communicationLink, architectureRequest); // send message with hardware request

		communicationManager->addMessageHandler(communicationManager,MessageType_NewBitstream, thiz->bitStreamReceivedHandler,NULL);

	//}

	/*test if the component is already cached*/
	/*if its not cached, request the component:*/
	 	/* send component specification to the server*/
		/* setup a hook to notify when the component is ready*/
		/* call the HardwareReconfiguration module and use it to implement the hardware*/
	/*if its cached, implement the design:*/
		/*call the HardwareReconfiguration module and use it to implement the hardware*/
}

/*
 * implements a specific hardware component into the dynamic region
 * @param self a reference to a instance of the ArchitectureManager class
 * @param callback a reference	 to a callback to be called when a new component is ready to be implemented into the hardware
 */
//void registerComponentReadyCallback(void *self, ComponentReadyCallback_t *callback)


/*
 * creates a new instance of the ArchitectureManager class connected into the given server
 * @param serverId a identifier to the server
 */
ArchitectureManager* createArchitectureManager(const char* serverId, HardwareDeviceInfo *info){

	CommunicationManager *commMgr = createCommunicationManager(1000);
	HardwareReconfigurationModule *hardwareReconfMdl = createHardwareReconfigurationModule();
	HardwareInterface *hardwareInterfaceModule = createHardwareInterface();

	ArchitectureManager* archManager = malloc(sizeof(ArchitectureManager));
	archManager->implementArchitecture = implementArchitecture;
	archManager->hardwareDeviceInfo = info;
	archManager->communicationManager = commMgr;
	archManager->getHardwareComponent = getHardwareComponent;
	archManager->insertHardwareComponent = insertHardwareComponent;

	archManager->hardawareReconfigurationModule = hardwareReconfMdl;
	archManager->hardwareInterfaceModule = hardwareInterfaceModule;

	archManager->bitStreamReceivedHandler = &bitstreamReceivedHandler;
	archManager->hardwareUpdateHandler = &hardwareUpdateHandler;

	commMgr->addMessageHandler(commMgr, MessageType_ArchitectureUpdate, archManager->hardwareUpdateHandler, NULL);

	return archManager;
}





void executeCheckingLoop(void *self){

	ArchitectureManager* thiz = (ArchitectureManager*) self;
	CommunicationManager *communicationManager = thiz->communicationManager;

	//communicationManager->messageLoop();

}
