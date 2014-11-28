// tab-width: 2; 
#ifdef ENABLE_DYNAMIC_HARDWARE

#ifndef AP_DynamicHardware_h
#define AP_DynamicHardware_h

#include <AP_Math.h>
#include <AP_AHRS.h>
#include <AP_Param.h>
#include <AP_Navigation.h>
#include <AP_HAL.h>
#include "AP_CommunicationLink.h"
#include "AP_HardwareInterface.h"

extern "C"{
	#include "DynamicHardwareModules/ArchitectureManager/ArchitectureManager.h"
	#include <stdio.h>
}


/*create loop to check env variables
 * create reference to DynamicHardware modules
 * create communication component based on the mavlink protocol
 * TODO create a dynamicHardware.pde in order to interface with this class
 */
class AP_DynamicHardware {
	public:
		AP_DynamicHardware(AP_AHRS *ahrs, AP_HAL::UARTDriver *uartDriver);

		/*
		 * updates the execution/environment variables check
		 */
		bool update();
		
		ArchitectureManager *architectureManager;

	private:
		AP_HAL::UARTDriver *uartDriver;

	// reference to the AHRS object
    AP_AHRS *ahrs;

		//instance of communicaion link
		AP_CommunicationLink *commLink;
		//instance of hw interface
		AP_HardwareInterface *hwInterface;


		bool connected;

};


#endif //AP_DynamicHardware_h

#endif //ENABLE_DYNAMIC_HARDWARE
