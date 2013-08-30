#ifndef CommunicationHardwareConverterVHDL_h
#define CommunicationHardwareConverterVHDL_h

#include <iostream>

#include "HardwareComponent.h"
#include "HardwareComponentConverterVHDL.h"
#include "ReconfigurableRegion.h"

class CommunicationHardwareConverterVHDL : public HardwareComponentConverterVHDL
{
	public:
		/*variables*/
	public:
		/*methods*/
		CommunicationHardwareConverterVHDL();
		/*
		 * !brief generates a .vhl output containing a component description of the specific
		 * communication hardware given as argument.
		 * !param componentPath path to put the component declaration
		 * !param communicationHardware instance of a communication hardware
		 */
		void buildComponentDescription(std::string componentPath, HardwareComponent* communicationHardware);

		sc_signal_resolved* getSignalToSwInterface(HardwareComponent::PortInfo *swInterface);
			
		void buildEntityForReconfigurableRegion(ReconfigurableRegion *reg, std::string projectPath);
		void buildRegisterSet(HardwareComponent* topComponent);
		void buildReadProcess();
		void buildWriteProcess();
};

#endif
