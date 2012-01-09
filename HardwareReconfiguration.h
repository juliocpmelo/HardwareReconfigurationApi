
#ifndef HardwareReconfiguration_h
#define HardwareReconfiguration_h

#include "HardwareProjectXmlParser.h"
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
        HardwareProjectXmlParser *hardwareProjectXmlParser;
	public:
		/**
		*\param projectName project name
		*\param projectPath project path location
		*/
		HardwareProject(std::string projectName, std::string projectPath, std::string xmlLocation);
		
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
		
        /**
		*\brief sets the assignments in the project
        *\param assignmentTable a map where each key corresponds to a input/output in the design
        * and each value corresponds to a IO port in the target FPGA
		*/
		void setAssignments(std::map<std::string, std::string> assignmentTable);
		
		void addFile(std::string addFile);
        
        void addComponentInstance(ComponentInstance* instance);
        void addSignal(Signal* signal);
        void addInput(std::string name, std::string type, std::string defaultValue="");
        void addOutput(std::string name, std::string type, std::string defaultValue="");
        void addGeneric(std::string name, std::string type, std::string defaultValue="");

        /*TODO add component definition*/
        void addComponent();
        
};

#endif
