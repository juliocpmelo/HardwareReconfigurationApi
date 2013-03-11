
#include "ComponentDatabase.h"

ComponentDatabase::ComponentDatabase(){

}

HardwareComponent* ComponentDatabase::getHardwareComponent(std::string instanceName, std::string componentLocator){
//do component lookup
	return new HardwareComponent(sc_module_name(instanceName.c_str()));
}

sc_signal_resolved *ComponentDatabase::createSignal(std::string name, HardwareComponent::DataType type, int size){

	sc_signal_resolved *signal = new sc_signal_resolved(name.c_str());
	sc_attribute<int> signalSize("SignalSize",size);
	sc_attribute<HardwareComponent::DataType> signalType("DataType",type);
	signal->add_attribute(signalType);
	signal->add_attribute(signalSize);
	return signal;
}