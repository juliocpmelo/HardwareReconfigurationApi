
#ifndef HardwareComponentConverterTxt_h
#define HardwareComponentConverterTxt_h

#include "HardwareComponent.h"
#include "ReconfigurableRegion.h"
#include <iostream>
#include <vector>
#include <systemc>
#include <utility>
#include <set>


class HardwareComponentConverterTxt{
	public:

	public:
		HardwareComponentConverterTxt();

		std::string translateType(HardwareComponent::DataType *type);
		std::string translatePort(HardwareComponent::PortInfo *port);
		std::string translateParam(HardwareComponent::Param* paramInfo);
		std::string translateSignal(sc_signal_resolved *signal);
		std::string translateDeclaration(HardwareComponent::HardwareComponentInfo* compInfo);

		std::string getNameForHardwareComponentFile(std::string projectPath, HardwareComponent *topComponent);

		std::set<HardwareComponent::HardwareComponentInfo* > getUsedComponents(HardwareComponent *comp);
		void buildTopComponentFile(std::string filePath, HardwareComponent *topComponent);
		void buildReconfRegionsDescriptionFile(std::string path, std::string projectName, ReconfigurableRegion *region);
		std::string buildArchitectureDescriptionFile(std::string path, Architecture *arch);

	private:



};



#endif //HardwareComponentConverterTxt_h
