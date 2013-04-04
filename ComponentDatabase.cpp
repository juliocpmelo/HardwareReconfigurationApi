
#include "ComponentDatabase.h"

using namespace std;

ComponentDatabase::ComponentDatabase(){
	componentsXmlParser = new HardwareComponentXmlParser();
}

HardwareComponent::HardwareComponentInfo* ComponentDatabase::getHardwareComponentInfo(std::string componentURI){
	string componentLocator = componentURI.substr(0,(componentURI.find_last_of(":")));
	if(loadedComponents.count(componentLocator) == 0){
		/* 
		 * we could check here if its a local or if its a remote location first, 
		 * however for first implementations only local components are allowed
		 */
		map<string, HardwareComponent::HardwareComponentInfo*> loadedComponentInfos = componentsXmlParser->parseXmlComponentFile(componentLocator);
		loadedComponents[componentLocator] = loadedComponentInfos;
	}
	
	string componentName = componentURI.substr(componentURI.find_last_of(":") + 1);
	if ((loadedComponents[componentLocator]).count(componentName) != 0)
		return (loadedComponents[componentLocator])[componentName];
	return NULL;
}

HardwareComponent* ComponentDatabase::getHardwareComponent(std::string instanceName, std::string componentURI){
//do component lookup
	HardwareComponent::HardwareComponentInfo *componentInfo = getHardwareComponentInfo(componentURI);
	cout<<__FILE__<<"::"<<__LINE__<<endl;
	return new HardwareComponent(sc_module_name(instanceName.c_str()), componentInfo);
}


sc_signal_resolved* ComponentDatabase::createSignal(std::string name, HardwareComponent::DataType type, int size){

	sc_signal_resolved *signal = new sc_signal_resolved(name.c_str());
	sc_attribute<int> signalSize("SignalSize",size);
	sc_attribute<HardwareComponent::DataType> signalType("DataType",type);
	signal->add_attribute(signalType);
	signal->add_attribute(signalSize);
	return signal;
}
