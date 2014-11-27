#ifndef ComponentDatabase_h
#define ComponentDatabase_h

#include <iostream>
#include <map>
#include <set>
#include "HardwareComponent.h"
#include "HardwareComponentXmlParser.h"

class ComponentDatabase{
	private:
		HardwareComponentXmlParser *componentsXmlParser;
		//double map with first key being the locator, second key being the component name, 
		//maping the component info
		std::map<std::string, std::map< std::string, HardwareComponent::HardwareComponentInfo*> > loadedComponents;
		std::set<std::string> databaseAddresses;

	public:
		//static ComponentDatabase* getInstance();
		//looks up for a component with given locator and instantiate it with the given name
		//TODO: check uri format
		HardwareComponent *getHardwareComponent(std::string instanceName, std::string componentURI);
		HardwareComponent::HardwareComponentInfo* getHardwareComponentInfo(std::string componentURI);
		
		void addDatabaseAddress(std::string databaseAddress);

		static ComponentDatabase* getInstance();

	private:
		ComponentDatabase();
};


#endif
