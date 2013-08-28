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

		/*
		 * reference to the described reconfigurable regions described into the xml file parsed
		 */
		std::map<std::string, ReconfigurableRegion* > loadedReconfigurableRegions;

		CommunicationHardwareXmlParser *communicationHardwareXmlParser;

	public:
		HardwareProjectXmlParser();
		
		/*
		 * Parses the xml given and fill the corresponding structures provided by it
		 * !param xmlUri the file location of the xml description
		 */
		void parseProjectXmlDescription(std::string xmlUri);
		
		/*
		 * internal function used to parse the 
		 * !param hardwareProjectNode libxml node to the hardwareProject tag
		 */
		void parseHardwareProject(xmlNode *hardwareProjectNode);

		std::map<std::string, ReconfigurableRegion* > getReconfigurableRegions();
		std::string getProjectName();
		std::string getProjectPath();
};

#endif
