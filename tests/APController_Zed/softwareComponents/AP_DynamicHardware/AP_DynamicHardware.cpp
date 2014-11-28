#ifdef ENABLE_DYNAMIC_HARDWARE

#include "AP_DynamicHardware.h"
#include <iostream>

extern "C"{
	void architectureUpdateHandler(ReconfigurableRegion *region, Architecture *arch, void *apDynamicHardware){

		AP_DynamicHardware *thiz = (AP_DynamicHardware*) apDynamicHardware;

		printf("Region update event received %s updated\n", region->name);
		thiz->architectureManager->implementArchitecture(thiz->architectureManager, region, arch);
	}
}

AP_DynamicHardware::AP_DynamicHardware(AP_AHRS *ahrs, AP_HAL::UARTDriver *uartDriver)
{
	this->ahrs = ahrs;
	this->commLink = new AP_CommunicationLink(uartDriver);
	this->commLink->initCommunicationLink();

	this->hwInterface = new AP_HardwareInterface();
	hwInterface->initHardwareInterface();

	CommunicationManager *commManager = createCommunicationManager(256, NULL); //max message size, server addr
	ArchitectureInfo *info = createArchitectureInfo();
	info->manufacturerID = ::ManufacturerId_Xilinx;
	info->setReconfigurableRegionsConfigFile(info, "/usr/local/APM/reconfRegionsConfig.cfg");
	
	this->architectureManager = createArchitectureManager(info, commManager); //null arch info for now

	this->architectureManager->addArchitectureUpdateListener(this->architectureManager,&architectureUpdateHandler,this);
	this->uartDriver = uartDriver;
	connected = false;

}


bool AP_DynamicHardware::update(){

	if (!connected){
		if(uartDriver->available() >= 0)
			connected = true;
	}
	else{	
		architectureManager->archManagerMainLoop(architectureManager);
		if(architectureManager->architectureUpdateReceived){
			/*use logic here to check when the system is up to receive a new architecture*/
			architectureManager->acceptNewArchitecture = 1;
		}
	}/*check the environment variable data set*/
	return true;
} 

#endif //ENABLE_DYNAMIC_HARDWARE
