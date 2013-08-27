#ifndef HardwareProjectXmlParser_h
#define HardwareProjectXmlParser_h

#include <iostream>
#include <map>
#include "ReconfigurableRegion.h"
#include "CommunicationHardware/CommunicationHardwareXmlParser.h"

class HardwareProjectXmlParser{
	public:
		std::string projectName;
		std::string projectPath;
		std::map<std::string, ReconfigurableRegion* > loadedReconfigurableRegions;
		CommunicationHardwareXmlParser *communicationHardwareXmlParser;

	public:
		HardwareProjectXmlParser();
		void parseProjectXmlDescription(std::string xmlUri);
		std::map<std::string, ReconfigurableRegion* > getReconfigurableRegions();
		std::string getProjectName();
		std::string getProjectPath();



};

#endif
