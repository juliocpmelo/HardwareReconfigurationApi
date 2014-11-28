/*
 * HardwareComponent.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef HARDWARECOMPONENT_H_
#define HARDWARECOMPONENT_H_

#include "Util/List.h"

/*TODO: specific definition of this struct in order to support the 3 different
 * data types supported at server side
 **/
typedef struct DataType_t{
	char *typeString;
}DataType;

typedef enum PortType_t{
	PortType_in,
	PortType_out,
	PortType_inout
}PortType;

typedef enum BindType_t{
	BindType_portBind,
	BindType_signalBind
}BindType;

typedef struct PortBind_t{
	BindType type;
	void *bind;
}PortBind;

typedef struct Port_t{
	char* portName;
	PortType type; //in, out, inout
	DataType *dataType; //int<range>, vector <range> <size>
	int registerId;
	List *binds;
}Port;

typedef enum ChildType_t{
	ChildType_HardwareComponent,
	ChildType_Signal,
	ChildType_Port
}ChildType;

typedef struct ComponentChild_t{
	ChildType type;
	void *child;
}ComponentChild;

typedef struct PortSetNode_t{
	struct PortSetNode_t *next;
	Port *port;
}PortSetNode;

typedef struct PortSet_t{
	PortSetNode *first;
}PortSet;

typedef struct Signal_t{
	char* name;
	DataType *type;
	List *portsIn, *portsOut;
}Signal;


typedef struct HardwareComponentChild_t{
	int type; //Can be either HardwareComponent, Signal or Port
	void * child;
}HardwareComponentChild;

typedef int (*GetPortId_t)(void* self, const char* portName, int* portId);
typedef void (*SetPortValue_t) (void* self, const char* portName, int value);
typedef int (*GetPortValue_t) (void* self, const char* portName);
typedef Port* (*GetPort_t) (void* self, const char* portName);


typedef void (*AddChild_t) (void* self, ChildType type, void* child);

/*
 * hardware component info 
 */
typedef struct HardwareComponentInfo_t{
	char* componentTypeName;

	List *ports; //set of ComponentPort

} HardwareComponentInfo;

/*
 * Node of the HardwareReisterMap
 * Keeps the information about the port and registerId that is used to access register data
 */
typedef struct HardwareComponent_t{

	HardwareComponentInfo *componentInfo;
	PortSet *ports;
	char* instanceName;
	GetPortId_t getPortId;

	void* hardwareInterface;

	List *componentPorts; //set of ComponentPort

	List *children; //set of HardwreComponentChild


	/*member functions*/
	SetPortValue_t setPortValue;
	GetPortValue_t getPortValue;
	GetPort_t getPort;

	AddChild_t addChild;
	AddChild_t removeChild;


} HardwareComponent;

HardwareComponent* createHardwareComponent(char *instanceName, HardwareComponentInfo *info);
HardwareComponentInfo* createHardwareComponentInfo();
Port* createPort(char *portName, PortType type, DataType *dataType);
Signal* createSignal(char* signalName, DataType *dataType);
void portBind(Port *port, BindType type, void *bind);

#endif /* HARDWARECOMPONENT_H_ */
