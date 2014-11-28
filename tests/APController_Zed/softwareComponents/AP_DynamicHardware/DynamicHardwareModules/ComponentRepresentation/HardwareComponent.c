/*
 * HardwareComponent.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */


#include "HardwareComponent.h"
#include "ArchitectureManager/HardwareInterface.h"
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

	Port* newPort = malloc(sizeof(Port));
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

void addChild(void* self, ChildType type, void* child){
	HardwareComponent* thiz = (HardwareComponent*) self;
	ComponentChild *childNode = malloc(sizeof(ComponentChild));
	childNode->type = type;
	childNode->child = child;

	list_push_back(thiz->children, childNode);
}

Port* getPort(void* self, const char* portName){
	HardwareComponent* thiz = (HardwareComponent*) self;
	ListNode *currentNode = thiz->componentPorts->first;
	while(currentNode != NULL){ //component instance lookup
		Port *port = (Port*)currentNode->data;
		if(strcmp(port->portName, portName) == 0)
			return port;
		currentNode = currentNode->next;
	}
	return NULL;
}

DataType* copyDataType(DataType *t){
	DataType *newDataType = malloc(sizeof(DataType));
	newDataType->typeString = malloc (sizeof(char) * strlen(t->typeString));
	strcpy(newDataType->typeString,t->typeString);
	return newDataType;
}

/**
 * @breif  copies name, type and dataType from the port struct
 * 				 binds and register id fields are reinitialized
 * @param  p port to be copied
 * @return a new instance of the port object, with the name, 
 * 				 type and dataType of the given port.
 **/
Port* copyPort(const Port *p){
	Port *newPort = malloc(sizeof(Port));
	newPort->portName = strdup(p->portName);
	newPort->type = p->type;
	newPort->dataType = copyDataType(p->dataType);
	newPort->registerId = -1;
	newPort->binds = createList(NULL);
	return newPort;
}

Port* createPort(char *portName, PortType type, DataType *dataType){
	Port *port = malloc(sizeof(Port));
	port->portName = strdup(portName);
	port->type = type;
	port->dataType = dataType;
	port->registerId = -1;
	port->binds = createList(NULL);
	return port;
}

/*
 * Creates a new reference to the HardwareComponent class
 * @param componentName the instance name of the component
 * @return the newly createde reference of the class
 */
HardwareComponent* createHardwareComponent(char *instanceName, HardwareComponentInfo *info){
	HardwareComponent *comp = malloc(sizeof(HardwareComponent));
	comp->instanceName = strdup(instanceName);
	comp->setPortValue = &setPortValue;
	comp->getPortValue = &getPortValue;
	comp->getPortId = &getPortId;
	comp->hardwareInterface = NULL;
	comp->addChild = &addChild;
	comp->getPort = &getPort;

	comp->componentInfo = info;

	comp->componentPorts = createList(NULL);
	comp->children = createList(NULL);

	ListNode *currentNode = info->ports->first;

	while(currentNode){
		Port *localPort = copyPort((Port*)currentNode->data);
		list_push_back(comp->componentPorts, localPort);
		currentNode = currentNode->next;
	}

	return comp;
}

HardwareComponentInfo* createHardwareComponentInfo(){
	HardwareComponentInfo *compInfo = malloc(sizeof(HardwareComponentInfo));
	compInfo->ports = createList(NULL);
	return compInfo;
}

Signal* createSignal(char* signalName, DataType *dataType){
	
	Signal* signal;
	signal = malloc(sizeof(Signal));

	signal->name = strdup(signalName); 
	signal->type = dataType;
	signal->portsIn = createList(NULL);
	signal->portsOut = createList(NULL);

	return signal;
}



void portBind(Port *port, BindType type, void *bind){
	switch(type){
		case BindType_portBind: //TODO this function should check wrong connection cases
		{
			/*binds portA to portB*/
			Port* portB = (Port*) bind;
			PortBind *bind = malloc(sizeof(PortBind));
			bind->type = type;
			bind->bind = portB;
			list_push_back(port->binds,bind);

			/*binds portB to portA*/
			bind = malloc(sizeof(PortBind));
			bind->type = type;
			bind->bind = port;
			list_push_back(portB->binds,bind);

			break;
		}
		case BindType_signalBind:
		{
			Signal *signal = (Signal*)bind;
			PortBind *bind = malloc(sizeof(PortBind));
			bind->type = type;
			bind->bind = signal;
			list_push_back(port->binds,bind);

			if(port->type == PortType_in){
				list_push_back(signal->portsIn, port);
			}
			else if(port->type == PortType_out ){
				if(signal->portsOut->size < 1) //only one output
					list_push_back(signal->portsOut, port);
				else
					printf ("signal %s alread has %d inputs and %d outputs\n", signal->name, signal->portsIn->size, signal->portsOut->size);
			}
			else if(port->type == PortType_inout ){
				printf ("inout type not supported for signal bind\n");
			}
			break;
		}
	}
}
