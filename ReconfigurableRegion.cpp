#include "ReconfigurableRegion.h"

ReconfigurableRegion::ReconfigurableRegion(std::string name, HardwareComponent *communicationHardware){

	this->name = name;
	this->communicationHardware = communicationHardware;
	this->assignedTopComponent  = NULL;
}

sc_port_base* ReconfigurableRegion::getPort(std::string portName){
	return communicationHardware->getPort(portName);
}

void ReconfigurableRegion::assignTopComponent(HardwareComponent* component){

	this->assignedTopComponent = component;
}

void ReconfigurableRegion::setBitstreams(std::string totalBitstream, std::string partialBitstream){

	this->totalBitstream = totalBitstream;
	this->partialBitstream = partialBitstream;

}
