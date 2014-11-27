#ifndef HardwareComponentXmlParser_H
#define HardwareComponentXmlParser_H

#include <libxml/parser.h>
#include <libxml/tree.h>
#include <iostream>
#include <map>
#include <utility>
#include <vector>
#include <set>

#include "ComponentInstance.h"
#include "SignalComponent.h"
#include "HardwareComponent.h"
#include "ReconfigurableRegion.h"
#include "Architecture.h"


typedef struct Component_t{
	std::string name;
	std::vector< std::pair <std::string, std::string> > inputs;
	std::vector< std::pair <std::string, std::string> > outputs;
	std::map<std::string, std::pair<std::string, std::string> > genericTable;
}Component;

typedef struct ComponentCompare_t {
	bool operator() (const Component& a, const Component& b) const
	{ //std::cout<<"comparing "<<a.name<<" with "<<b.name<<" value "<<(a.name == b.name)<<std::endl;
		return (a.name < b.name);}
}ComponentCompare;


/*
 *! TODO change to build HardwareComponent instead of old API
 * */
class HardwareComponentXmlParser{
	public:
		std::map<Component, std::vector<ComponentInstance>, ComponentCompare > componentTable;
		std::map<std::string, std::vector< std::pair<std::string,std::string> > > genericInitializationTable;
		std::map<std::string, std::set< std::string > > componentPorts;
		std::set<SignalComponent, SignalComponentCompare> signalList;
		std::map<std::string, std::string > inputTable; //input name, input type
		std::map<std::string, std::string > outputTable; //output name, output type
		std::map<std::string, std::pair<std::string, std::string> > genericTable; //generic name, generic type, generic default value

		std::map<std::string, std::string > assignments; //
		std::map<std::string, std::string > signals; //singal name, signal type

		std::vector< std::pair<std::string,std::string> > signalMaps;

		std::string entityNameStr;
		std::string deviceFamily;
		std::string deviceTarget;

		std::set<std::string> dependencyFiles;
		std::string xmlProjectFile;
	private:
		int signalCount;
	public:
		HardwareComponentXmlParser();

		/*
		 * parses the actual xmlFile and converts it into a HardwareComponentInfo vector
		 */
		std::vector<HardwareComponent::HardwareComponentInfo*> getComponentInfo();

		/*real time hardware editing commands*/
		void addComponentInstance(ComponentInstance instance);
		void addSignal(SignalComponent signal);
		void addMap(std::string name, std::string value);
		void addInput(std::string name, std::string type, std::string defaultValue);
		void addOutput(std::string name, std::string type, std::string defaultValue);
		void addGeneric(std::string name, std::string type, std::string defaultValue);

		std::string getValidComponentInstanceName(std::string componentType);
		std::map<std::string, HardwareComponent::HardwareComponentInfo*> parseXmlComponentFile(std::string xmlFile);
		Architecture* parseArchitectureFile(std::string xmlFile, ReconfigurableRegion *region);
		virtual HardwareComponent::PortInfo parsePort(xmlNode * portNode);
		virtual HardwareComponent::Param parseParam(xmlNode * portNode);
		HardwareComponent::DataType* parseType(xmlNode * typeNode);

	private:
		
		std::map<std::string, HardwareComponent::HardwareComponentInfo*> parseComponentBase(xmlNode * componentNode);
		void parseMap(xmlNode *);
		void parseOutput(xmlNode * componentNode);
		void parseInput(xmlNode * componentNode);
		void parseInstance(xmlNode * componentNode);
		void parseAssignment(xmlNode * componentNode);

		/*xml file that represents a whole hardware description*/
		HardwareComponent* parseHardwareTopEntity(xmlNode * rootNode, std::string entityName, ReconfigurableRegion *region);


		void parseGeneric(xmlNode * componentNode);
		void parseSignal(xmlNode * componentNode);

};

#endif //HardwareComponentXmlParser_H
