/*
 * HardwareComponent.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef HARDWARECOMPONENT_H_
#define HARDWARECOMPONENT_H_

typedef int (*GetPort_t)(const char* portName, int* portId);

typedef struct HardwareComponentPort_t{
	char* portName;
	int registerId;
}HardwareComponentPort;

/*
 * Node of the HardwareReisterMap
 * Keeps the information about the port and registerId that is used to access register data
 */
typedef struct PortSetNode_t{
	struct PortSetNode_t *next;
	HardwareComponentPort *port;
}PortSetNode;

typedef struct PortSet_t{
	PortSetNode *first;
}PortSet;

typedef struct HardwareComponent_t{
	PortSet *ports;
	char* instanceName;
	GetPort_t getPortId;
} HardwareComponent;

HardwareComponent* createHardwareComponent(char *componentName);

#endif /* HARDWARECOMPONENT_H_ */
