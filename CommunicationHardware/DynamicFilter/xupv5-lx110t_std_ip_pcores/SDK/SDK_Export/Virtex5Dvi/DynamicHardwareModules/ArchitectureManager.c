/*
 * ArchitectureManager.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#include "ArchitectureManager.h"
#include "CommunicationManager.h"
#include "HardwareReconfigurationModule.h"
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



/*
 * implements a specific hardware component into the dynamic region
 * @param self a reference to a instance of the ArchitectureManager class
 * @param topComponent the a reference to the topComponent to be implemented
 */
void implementArchitecture(void *self, HardwareComponent* topComponent){
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
 * @param callback a reference to a callback to be called when a new component is ready to be implemented into the hardware
 */
//void registerComponentReadyCallback(void *self, ComponentReadyCallback_t *callback)


/*
 * creates a new instance of the ArchitectureManager class connected into the given server
 * @param serverId a identifier to the server
 */
ArchitectureManager* createArchitectureManager(const char* serverId, HardwareDeviceInfo *info){

	CommunicationManager *commMgr = createCommunicationManager(serverId);
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

	return archManager;
}
