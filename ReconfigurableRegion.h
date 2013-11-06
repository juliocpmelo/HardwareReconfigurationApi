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

		/*
		 * top component encapsulated in this reconfigurable region 
		 */
		HardwareComponent *assignedTopComponent;

		/*
		 * name is used to distinguish the reconfigurable regions in a
		 * hardware project.
		 */
		std::string name;

		std::string totalBitstream;

		std::string partialBitstream;
	public:
			

		ReconfigurableRegion(std::string name, HardwareComponent *communicationHardware);
		/*
		 * !param the name of a port contained in this reconfigurable region
		 * interface
		 * returns a reference to a port contained in the communication
		 * hardware instance from this region
		 */
		sc_port_base* getPort(std::string portName);
		
		/*
		 * Assign a component to the current ReconfigurableRegion only one component
		 * can be assigned at each time, but each assigned component could reference illimited
		 * ammount of other components in its implementation
		 * !param component the component to be assigned
		 */
		void assignTopComponent(HardwareComponent* component);

		void setBitstreams(std::string totalBitstream, std::string partialBitstream);
		

};

#endif 
