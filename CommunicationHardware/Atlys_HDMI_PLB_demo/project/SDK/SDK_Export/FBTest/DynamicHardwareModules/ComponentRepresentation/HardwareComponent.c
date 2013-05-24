/*
 * HardwareComponent.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */


#include "HardwareComponent.h"
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
 * Creates a new reference to the HardwareComponent class
 * @param componentName the instance name of the component
 * @return the newly createde reference of the class
 */
HardwareComponent* createHardwareComponent(char *instanceName){
	HardwareComponent *comp = malloc(sizeof(HardwareComponent));
	comp->instanceName = strdup(instanceName);
	return comp;
}
