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

	private:
		/* 
		 * !brief generats a vhd pad string according the given parameters. The pad string should
		 * be concatened with the actual string in order to obtain the right data size.
		 * !param size the size of the actual valid data
		 * !param desiredSize the desired size of the resulting string after the pading process
		 * !returns a vhdl pad string containing 0's when the size is smaller from the desired size
		 */
		std::string getPadString(int size, int desiredSize);
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
