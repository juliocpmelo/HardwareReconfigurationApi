#include "ReconfigurableRegion.h"

ReconfigurableRegion::ReconfigurableRegion(std::string name, HardwareComponent *communicationHardware){

	this->name = name;
	//this->loadCacheInformation();
	this->communicationHardware = communicationHardware;
	this->assignedTopComponent  = NULL;
	this->modified = false;
}

sc_port_base* ReconfigurableRegion::getPort(std::string portName){
	return communicationHardware->getPort(portName);
}

void ReconfigurableRegion::assignArchitecture(Architecture *arch){
	this->assignedArchitecture = arch;
	this->assignedTopComponent = arch->topComponent;
	if(arch->bitstream == "")
		this->modified = true;
}

void ReconfigurableRegion::setBitstreams(std::string totalBitstream, std::string partialBitstream){

	//this->totalBitstream = totalBitstream;
	//this->partialBitstream = partialBitstream;
	this->assignedArchitecture->bitstream = partialBitstream;
}


