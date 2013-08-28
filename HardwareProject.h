
#ifndef HardwareProject_h
#define HardwareProject_h 

#include "HardwareComponentXmlParser.h"
#include "HardwareProjectXmlParser.h"
#include "HardwareComponent.h"
#include "ReconfigurableRegion.h"
#include <iostream>
#include <map>
#include <vector>


class HardwareProject{
	public:
		std::string projectName;
		std::string projectPath;
		std::string deviceName;
		std::string deviceFamily;

		std::map<std::string, std::string> assigments;
		std::vector<std::string> projectFiles;

		std::map<std::string, ReconfigurableRegion*> managedReconfRegions;
		std::string projectXmlDescriptionUri;

		HardwareComponentXmlParser *hardwareComponentXmlParser;
		HardwareProjectXmlParser *hardwareProjectXmlParser;

		HardwareComponent *topLevelComponent;
	public:
		/**
		*\param projectName project name
		*\param projectPath project path location
		*/
		HardwareProject(std::string projectName, std::string projectPath);
		HardwareProject(std::string projectXmlDescriptionUri);

		/**
		 *\param topLevelComponent the top level component to this hardware project
		 */
		void setTopLevelComponent(HardwareComponent *topLevelComponent);

		
		/**
		*\brief sets the device target device name
		*\param deviceName the name of the device (e.g.:EP3C10F256C8) 
		*/
		void setDevice(std::string deviceName);
		void setDeviceFamily(std::string deviceName);
		
        /**
		*\brief burns the project in the passed interface
		*\param interface the interface name (e.g. : USB1)
		*/
		void burnProject(std::string cableName, std::string programmingMode);
		
		/**
		*\brief compiles the project by running 
        quartus_map, quartus_fit and quartus_asm
		*/
		void compileProject();

		void generateConfigFile();

		void generateHDLFiles(HardwareComponent *comp);

		/**
		 *\brief sets the assignments in the project
		 *\param assignmentTable a map where each key corresponds to a input/output in the design
		 * and each value corresponds to a IO port in the target FPGA
		 */
		void setAssignments(std::map<std::string, std::string> assignmentTable);
		
		void addFile(std::string addFile);
        

};

#endif
