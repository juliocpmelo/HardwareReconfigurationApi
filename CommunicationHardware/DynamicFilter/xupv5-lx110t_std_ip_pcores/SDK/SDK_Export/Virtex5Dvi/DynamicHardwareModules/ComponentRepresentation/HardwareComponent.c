/*
 * HardwareComponent.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */


#include "HardwareComponent.h"
#include "../HardwareInterface.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
 * Gets the register id for a given por name
 * @param self a reference to an instance of the HardwareComponent class
 * @param portName the name of the port to search
 * @param portId a reference to be filled with the portId found
 * @return 0 when the port is found, 1 otherwise
 */
int getPortId(void *self, const char* portName, int* portId){

	HardwareComponent* selfInstance = (HardwareComponent*) self;

	PortSetNode* actPortIt = selfInstance->ports->first;

	while (actPortIt != NULL) {
		if(strcmp(actPortIt->port->portName,portName) == 0){
			(*portId) = actPortIt->port->registerId;
			return 0;
		}
		else
			actPortIt = actPortIt->next;
	}
	return 1;
}

/*
 * Adds a new port into the component
 * @param self a reference to an instance of the HardwareComponent class
 * @param portName the name of the port to search
 * @param portId a reference to be filled with the portId found
 */
void addPort(void *self, const char* portName, int portId){

	HardwareComponent* selfInstance = (HardwareComponent*) self;
	PortSetNode *portIt = malloc(sizeof(PortSetNode));
	portIt->next = NULL;

	HardwareComponentPort* newPort = malloc(sizeof(HardwareComponentPort));
	newPort->portName = strdup(portName);
	newPort->registerId = portId;
	portIt->port = newPort;

	PortSetNode* firstPort = selfInstance->ports->first;

	if(firstPort != NULL){
		portIt->next = firstPort;
		selfInstance->ports->first = portIt;
	}
	else{
		selfInstance->ports->first = portIt;
	}
}

/*
 * sets a port value into a specific component
 * @param self a reference to a instance of the HardwareComponent class
 * @param componentName the name of the component that has the desired port
 * @param portName the name of the port to be accessed
 * @param value the value to be set into the port
 */
void setPortValue(void* self, const char* portName, int value){

	HardwareComponent* selfInstance = (HardwareComponent*) self;
	int portId;

	int errorVal = selfInstance->getPortId(selfInstance, portName, &portId);
	if(errorVal == 0){
		HardwareInterface* hardwareInterface = (HardwareInterface*)selfInstance->hardwareInterface;
		hardwareInterface->setRegisterValue(hardwareInterface, portId, value);
	}


}

/*
 * gets the value set into a specific port from a component
 * @param self a reference to a instance of the HardwareComponent class
 * @param componentName the name of the component that has the desired port
 * @param portName the name of the port to be accessed
 * @return the value in the desired port
 */
int getPortValue(void* self, const char* portName){

	HardwareComponent* selfInstance = (HardwareComponent*) self;
	int portId;
	int errorVal = selfInstance->getPortId(selfInstance, portName, &portId);
	if(errorVal == 0){
		HardwareInterface* hardwareInterface = (HardwareInterface*)selfInstance->hardwareInterface;
		return hardwareInterface->getRegisterValue(hardwareInterface, portId);
	}

	return 0;
}


/*
 * Creates a new reference to the HardwareComponent class
 * @param componentName the instance name of the component
 * @return the newly createde reference of the class
 */
HardwareComponent* createHardwareComponent(char *instanceName, void* hardwareInterface){
	HardwareComponent *comp = malloc(sizeof(HardwareComponent));
	comp->instanceName = strdup(instanceName);
	comp->setPortValue = setPortValue;
	comp->getPortValue = getPortValue;
	comp->getPortId = getPortId;
	comp->hardwareInterface = hardwareInterface;
	return comp;
}
