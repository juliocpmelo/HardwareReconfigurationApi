// tab-width: 2; 

#ifndef AP_CommunicationLink_h
#define AP_CommunicationLink_h

#include <AP_Math.h>
#include <AP_AHRS.h>
#include <AP_Param.h>
#include <AP_Navigation.h>
#include <AP_HAL.h>

extern "C"{
	#include "DynamicHardwareModules/ArchitectureManager/ArchitectureManager.h"
	#include "DynamicHardwareModules/CommunicationManager/CommunicationLink.h"

	/*c-like send and receive functions*/
	void AP_receiveMessage(uint8_t* buffer, int messageSize);
	void AP_sendMessage(uint8_t* buffer, int messageSize);
	int AP_available();	

}

/*create loop to check env variables
 * create reference to DynamicHardware modules
 * create communication component based on the mavlink protocol
 * TODO create a dynamicHardware.pde in order to interface with this class
 */
class AP_CommunicationLink {
	public:
		AP_CommunicationLink(AP_HAL::UARTDriver* uartLink);

		void sendMessage(uint8_t *buffer, int size);
		void receiveMessage(uint8_t *buffer, int size);
		int available();
		
		bool initCommunicationLink();

	public:
		static AP_CommunicationLink* selfInstance;

	private:
		// reference to a uart driver implementation
		AP_HAL::UARTDriver* uartLink;


		/*
		 * send/receive pending messages
		 */
		void update();


};


#endif //AP_CommunicationLink_h
