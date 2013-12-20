/*
 * HardwareComponent.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef HARDWARECOMPONENT_H_
#define HARDWARECOMPONENT_H_

typedef int (*GetPortId_t)(void* self, const char* portName, int* portId);
typedef void (*SetPortValue_t) (void* self, const char* portName, int value);
typedef int (*GetPortValue_t) (void* self, const char* portName);

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
	GetPortId_t getPortId;

	void* hardwareInterface;

	SetPortValue_t setPortValue;
	GetPortValue_t getPortValue;
} HardwareComponent;

HardwareComponent* createHardwareComponent(char *componentName, void* hardwareInterface);

#endif /* HARDWARECOMPONENT_H_ */
