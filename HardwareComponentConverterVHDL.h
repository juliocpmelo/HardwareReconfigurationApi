#ifndef HardwareComponentConverterVHDL_h
#define HardwareComponentConverterVHDL_h

#include "HardwareComponent.h"
#include <iostream>
#include <vector>
#include <systemc>
#include <utility>
#include <set>

class HardwareComponentConverterVHDL{
	public:

	public:
		HardwareComponentConverterVHDL();

		std::string translateType(HardwareComponent::DataType *type);
		std::string translatePort(HardwareComponent::PortInfo *port);
		std::string translateParam(HardwareComponent::Param* paramInfo);
		std::string translateSignal(sc_signal_resolved *signal);
		std::string translateDeclaration(HardwareComponent::HardwareComponentInfo* compInfo);

		std::string getNameForHardwareComponentFile(std::string projectPath, HardwareComponent *topComponent);
		void buildTopComponentFile(std::string projectPath, HardwareComponent *topComponent);

		std::set<HardwareComponent::HardwareComponentInfo* > getUsedComponents(HardwareComponent *comp);

	private:



};

#endif
