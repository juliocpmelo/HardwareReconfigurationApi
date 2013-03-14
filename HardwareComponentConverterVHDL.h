#ifndef HardwareComponentConverterVHDL_h
#define HardwareComponentConverterVHDL_h

#include "HardwareComponent.h"
#include <iostream>
#include <vector>
#include <systemc>

class HardwareComponentConverterVHDL{
	public:

	public:
		HardwareComponentConverterVHDL();

		std::string translateType(HardwareComponent::DataType type, int size);
		std::string translatePort(sc_port_base* port);
		std::string translateSignal(sc_signal_resolved *signal);
		std::vector<sc_signal_resolved*>* getSignals(HardwareComponent topComponent);

		void buildTopComponentFile(std::string projectPath, HardwareComponent *topComponent);

		std::vector<sc_signal_resolved* > * getSignals(HardwareComponent *comp);

	private:



};

#endif
