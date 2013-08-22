#ifndef ReconfigurableRegion_h
#define ReconfigurableRegion_h

#include <systemc>
#include "HardwareComponent.h"

class ReconfigurableRegion {

	public:
		/*
		 * communication hardware generated to grant software and
		 * external port acess to the emcapsulated componentns 
		 * in this reconfigurable region
		 */
		HardwareComponent *communicationHardware;
	public:
			

		ReconfigurableRegion();
		/*
		 * !param the name of a port contained in this reconfigurable region
		 * interface
		 * returns a reference to a port contained in the communication
		 * hardware instance from this region
		 */
		sc_port_base* getPort(std::string portName){
			return communicationHardware->getPort(portName);
		}

};

#endif 
