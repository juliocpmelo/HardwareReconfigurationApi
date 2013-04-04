#ifndef HardwareComponentConverterVHDL_h
#define HardwareComponentConverterVHDL_h

#include "HardwareComponent.h"
#include <iostream>
#include <vector>
#include <systemc>
#include <set>

class HardwareComponentConverterVHDL{
	public:

	public:
		HardwareComponentConverterVHDL();

		std::string translateType(HardwareComponent::DataType type, int size);
		std::string translatePort(HardwareComponent::PortInfo* port);
		std::string translateSignal(sc_signal_resolved *signal);

		void buildTopComponentFile(std::string projectPath, HardwareComponent *topComponent);

		std::vector<sc_signal_resolved* > getSignals(HardwareComponent *comp);
		std::set<HardwareComponent::HardwareComponentInfo* > getUsedComponents(HardwareComponent *comp);
		std::vector<HardwareComponent* > getChildModules(HardwareComponent *comp);
		sc_port_base* getConnectedPort(sc_object* channel, sc_module* component);

	private:



};

#endif
