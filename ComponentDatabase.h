#ifndef ComponentDatabase_h
#define ComponentDatabase_h

#include <iostream>
#include <map>
#include "HardwareComponent.h"
#include "HardwareComponentXmlParser.h"

class ComponentDatabase{
	private:
		HardwareComponentXmlParser *componentsXmlParser;
		std::map<std::string, HardwareComponent::HardwareComponentInfo*> loadedComponents;

	public:
		std::map<std::string, HardwareComponent::HardwareComponentInfo*> componentCache;
	public:
		//static ComponentDatabase* getInstance();
		//looks up for a component with given locator and instantiate it with the given name
		HardwareComponent *getHardwareComponent(std::string instanceName, std::string componentLocator);
		sc_signal_resolved *createSignal(std::string name, HardwareComponent::DataType type, int size=1);
		HardwareComponent::HardwareComponentInfo* getHardwareComponentInfo(std::string componentLocator);
		ComponentDatabase();

};


#endif
