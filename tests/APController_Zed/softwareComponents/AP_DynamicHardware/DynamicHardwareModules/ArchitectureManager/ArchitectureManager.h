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
#include "ComponentRepresentation/ReconfigurableRegion.h"
#include "CommunicationManager/CommunicationManager.h"
#include "ReconfigurationManager/HardwareReconfigurationModule.h"

typedef enum ArchitectureManagerState_t{
	ArchtectureManagerState_init,
	ArchtectureManagerState_waitForSetup,
	ArchtectureManagerState_handleArchitectureUpdate,
	ArchtectureManagerState_wait
}ArchitectureManagerState;
	
typedef enum ArchitectureUpdateState_t{
		ArchitectureUpdateState_sendArchitectureRequest,
		ArchitectureUpdateState_waitArchitecture,
		ArchitectureUpdateState_finished
}ArchitectureUpdateState;

typedef enum ManufacturerId_t{
	ManufacturerId_Xilinx,
	ManufacturerId_Altera
}ManufacturerId;

typedef void (*ArchitectureUpdateListener_t) (ReconfigurableRegion *region, Architecture *arch, void* listenerArgs);
typedef struct ArchitectureUpdateListenerNode_t{
	ArchitectureUpdateListener_t listener;
	void *listenerArgs;
}ArchitectureUpdateListenerNode;

typedef struct ComponentSetNode_t {
	struct ComponentSetNode_t *next;
	HardwareComponent *comp;
}ComponentSetNode;

typedef struct ComponentSet_t{
	ComponentSetNode *first;
}ComponentSet;

typedef void (*SetReconfigurableRegionsConfigFile_t) (void *architectureInfo, const char* configFile);

/*
 * struct to keep information about the hardware
 */
typedef struct ArchitectureInfo_t{

	/*manufacturer ID: 0 = Xilinx, 1=Altera, ...*/
	int manufacturerID;
	/*
	 * part ID, coupled with the manufacturer id it will help the server to generate hardware
	 * component compatible with this device
	 * */
	int partID;

	/**
	 * path to the configuration file for this instance of architecture manager
	 * this file should be provided at project time with, at least, the default configuration
	 * for the reconfigurable regions in this hardware project.
	 **/
	char* reconfigurableRegionsConfigFile;

	SetReconfigurableRegionsConfigFile_t setReconfigurableRegionsConfigFile;	
}ArchitectureInfo;

typedef void (*ImplementArchitecture_t)(void *self, ReconfigurableRegion *region, Architecture* architecture);
typedef HardwareComponent* (*GetHardwareComponent_t)(void* self, const char* componentInstanceName);
typedef void (*InsertHardwareComponent_t)(void* self, HardwareComponent* comp);
typedef void (*ArchManagerMainLoop_t)(void *self);

typedef void (*NotifyArchitectureUpdate_t)(void *self, int reconfigurableRegionIndex);
typedef void (*AddArchitectureUpdateListener_t)(void *self, ArchitectureUpdateListener_t listener, void *listenerArgs);

typedef struct ArchitectureManager_t {

	/*member attributes*/
	ArchitectureInfo *architectureInfo;
	ComponentSet *components;
	CommunicationManager *communicationManager;
	HardwareReconfigurationModule *hardawareReconfigurationModule;
	HardwareInterface *hardwareInterfaceModule;

	/*list containing all reconfigurableRegions being handled by this ArchitectureManager*/
	List *managedReconfigurableRegions;

	/*list containing listeners to the status of the reconfigurable regions*/
	List *regionUpdateListeners;

	/*list containing all loaded Architectures*/
	List *loadedArchitectures;

	uint8_t *modifiedRegions;

	/*used to control the internal state of the manager*/
	ArchitectureManagerState state;
	int setupReceived;
	int architectureUpdateReceived;
 	int	acceptNewArchitecture;
	int newArchitectureReceived;

	ArchitectureUpdateState architectureUpdateState;
	/*member functions*/
	ImplementArchitecture_t implementArchitecture;
	GetHardwareComponent_t getHardwareComponent;
	InsertHardwareComponent_t insertHardwareComponent;
	ArchManagerMainLoop_t archManagerMainLoop;
	AddArchitectureUpdateListener_t addArchitectureUpdateListener;
	NotifyArchitectureUpdate_t notifyArchitectureUpdate;
	

	MessageHandler_t newArchitectureReceivedHandler;
	MessageHandler_t architectureUpdateHandler;
	MessageHandler_t setupMessageHandler;


} ArchitectureManager;



/**
 * \brief creates a new instance of the ArchitectureManager
 * \param info a struct informing the hardware device running
 * \param commMgr a instance of the communication manager
 **/
ArchitectureManager* createArchitectureManager(ArchitectureInfo *info, CommunicationManager *commMgr);

ArchitectureInfo* createArchitectureInfo();

#endif /* ARCHITECTUREMANAGER_H_ */
