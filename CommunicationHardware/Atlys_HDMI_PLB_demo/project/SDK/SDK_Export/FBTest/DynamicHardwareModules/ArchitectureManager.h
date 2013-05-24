/*
 * ArchitectureManager.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef ARCHITECTUREMANAGER_H_
#define ARCHITECTUREMANAGER_H_

#include "HardwareInterface.h"
#include "ComponentRepresentation/HardwareComponent.h"
#include "CommunicationManager.h"
#include "HardwareReconfigurationModule.h"

typedef struct ComponentSetNode_t {
	struct ComponentSetNode_t *next;
	HardwareComponent *comp;
}ComponentSetNode;

typedef struct ComponentSet_t{
	ComponentSetNode *first;
}ComponentSet;

/*
 * struct to keep information about the hardware
 */
typedef struct HardwareDeviceInfo_t{

	/*manufacturer ID: 0 = Xilinx, 1=Altera, ...*/
	int manufacturerID;
	/*
	 * part ID, coupled with the manufacturer id it will help the server to generate hardware
	 * component compatible with this device
	 * */
	int partID;
}HardwareDeviceInfo;

typedef void (*SetPortValueFunction_t) (void* self,const char* componentName, const char* portName, int value);
typedef int (*GetPortValueFunction_t) (void* self,const char* componentName, const char* portName);
typedef void (*ImplementArchitecture_t)(void *self, const char* topComponentName);

typedef struct ArchitectureManager_t {

	/*member attributes*/
	HardwareInterface *hardwareInterface;
	HardwareDeviceInfo *hardwareDeviceInfo;
	ComponentSet *components;
	CommunicationManager *communicationManager;
	HardwareReconfigurationModule *hardawareReconfigurationModule;


	/*member functions*/
	SetPortValueFunction_t setPortValue;
	GetPortValueFunction_t getPortValue;
	ImplementArchitecture_t implementArchitecture;


} ArchitectureManager;



/*creates a new instance of the ArchitectureManager*/
ArchitectureManager* createArchitectureManager();

#endif /* ARCHITECTUREMANAGER_H_ */
