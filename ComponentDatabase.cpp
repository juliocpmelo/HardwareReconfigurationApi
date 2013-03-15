
#include "ComponentDatabase.h"

ComponentDatabase::ComponentDatabase(){
	componentsXmlParser = new HardwareComponentXmlParser();
}

HardwareComponent::HardwareComponentInfo* getHardwareComponentInfo(std::string componentLocator){
	if(loadedComponents.count(componentLocator) != 0)
		return loadedComponents[componentLocator];

	/* 
	 * we could check here if its a local or if its a remote location first, however for
	 * first implementation only local components are allowed
	 */
	HardwareComponent::HardwareComponentInfo *componentInfo;
}

HardwareComponent* ComponentDatabase::getHardwareComponent(std::string instanceName, std::string componentLocator){
//do component lookup
	HardwareComponent::HardwareComponentInfo *componentInfo = NULL;
	return new HardwareComponent(sc_module_name(instanceName.c_str()), componentInfo);
}


sc_signal_resolved *ComponentDatabase::createSignal(std::string name, HardwareComponent::DataType type, int size){

	sc_signal_resolved *signal = new sc_signal_resolved(name.c_str());
	sc_attribute<int> signalSize("SignalSize",size);
	sc_attribute<HardwareComponent::DataType> signalType("DataType",type);
	signal->add_attribute(signalType);
	signal->add_attribute(signalSize);
	return signal;
}
