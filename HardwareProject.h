
#ifndef HardwareProject_h
#define HardwareProject_h 

#include "HardwareComponentXmlParser.h"
#include "HardwareProjectXmlParser.h"
#include "HardwareComponent.h"
#include "ReconfigurableRegion.h"
#include "XilinxProjectHandler.h"
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
		std::string architectureDescriptionFile;

		HardwareComponentXmlParser *hardwareComponentXmlParser;
		HardwareProjectXmlParser *hardwareProjectXmlParser;


		/**
		 *\member reconfRegionsProjectHandlers will hold a ProjectHanlder instance to each reconfigurable
		 *region managed
		 */
		std::map<std::string, XilinxProjectHandler*> reconfRegionsProjectHandlers;
	public:
		/**
		*\param projectName project name
		*\param projectPath project path location
		*/
		HardwareProject(std::string projectName, std::string projectPath);
		HardwareProject(std::string projectXmlDescriptionUri);

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

		void generateHDLFiles();

		void generateComponentDescriptionFiles();

		std::string generateArchitectureDescription(Architecture *arch);

		/**
		 *\brief sets the assignments in the project
		 *\param assignmentTable a map where each key corresponds to a input/output in the design
		 * and each value corresponds to a IO port in the target FPGA
		 */
		void setAssignments(std::map<std::string, std::string> assignmentTable);
		
		void addFile(std::string addFile);


		/**
		 *\brief gets a loaded reconfigurable region
		 *\param name name of a reconfigurable region described in the project xml description 
		 *\return the reconfigurable region requested or null in case of not found
		*/
		ReconfigurableRegion* getReconfigurableRegion(std::string name);
        
		//void generateHDLFilesForAllRegions();

};

#endif
