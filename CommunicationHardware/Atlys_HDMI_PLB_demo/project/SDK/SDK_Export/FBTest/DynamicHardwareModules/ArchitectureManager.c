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

HardwareComponent* getHardwareComponent(ArchitectureManager* architectureManager, const char* componentName){

	ComponentSetNode *actComponentIt = architectureManager->components->first;
	while (actComponentIt != NULL){
		if(strcmp(actComponentIt->comp->instanceName,componentName) == 0)
			return actComponentIt->comp;
		else
			actComponentIt = actComponentIt->next;
	}
	return NULL;
}

void insertHardwareComponent(ArchitectureManager* architectureManager, HardwareComponent* comp){

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
 * sets a port value into a specific component
 * @param self a reference to a instance of the ArchitectureManager class
 * @param componentName the name of the component that has the desired port
 * @param portName the name of the port to be accessed
 * @param value the value to be set into the port
 */
void setPortValue(void* self,const char* componentName, const char* portName, int value){

	ArchitectureManager* selfInstance = (ArchitectureManager*) self;
	HardwareComponent *comp = getHardwareComponent(selfInstance, componentName);
	int portId;
	if (comp!=NULL){
		int errorVal = comp->getPortId(portName, &portId);
		if(errorVal == 0)
			selfInstance->hardwareInterface->setRegisterValue(selfInstance->hardwareInterface,portId,value);
	}

}

/*
 * gets the value set into a specific port from a component
 * @param self a reference to a instance of the ArchitectureManager class
 * @param componentName the name of the component that has the desired port
 * @param portName the name of the port to be accessed
 * @return the value in the desired port
 */
int getPortValue(void* self,const char *componentName, const char* portName){

	ArchitectureManager* selfInstance = (ArchitectureManager*) self;
	HardwareComponent *comp = getHardwareComponent(selfInstance, componentName);
	int portId;


	if (comp!=NULL){
		int errorVal = comp->getPortId(portName, &portId);
		if(errorVal == 0)
			return selfInstance->hardwareInterface->getRegisterValue(selfInstance->hardwareInterface,portId);
	}
	return 0;
}

/*
 * implements a specific hardware component into the dynamic region
 * @param self a reference to a instance of the ArchitectureManager class
 * @param topComponentName the name of the component to be implemented
 */
void implementArchitecture(void *self, const char* topComponentName){
	/*test if the component is already cached*/
	/*if its not cached, request the component:*/
	 	/* send component specification to the server*/
		/* setup a hook to notify when the component is ready*/
	/*if its cached, implement the design by:*/
		/*calling forth the HardwareReconfiguration module and use it to implement the hardware*/
}



/*
 * creates a new instance of the ArchitectureManager class connected into the given server
 * @param serverId a identifier to the server
 */
ArchitectureManager* createArchitectureManager(const char* serverId, HardwareDeviceInfo *info){

	CommunicationManager *commMgr = createCommunicationManager(serverId);
	HardwareReconfigurationModule *hardwareReconfMdl = createHardwareReconfigurationModule();

	ArchitectureManager* archManager = malloc(sizeof(ArchitectureManager));
	archManager->getPortValue = getPortValue;
	archManager->setPortValue = setPortValue;
	archManager->implementArchitecture = implementArchitecture;
	archManager->hardwareDeviceInfo = info;
	archManager->communicationManager = commMgr;

	archManager->hardawareReconfigurationModule = hardwareReconfMdl;

	return archManager;
}
