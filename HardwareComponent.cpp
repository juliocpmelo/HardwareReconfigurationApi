#include "HardwareComponent.h"
using namespace std;

HardwareComponent::HardwareComponent(sc_module_name name, HardwareComponentInfo *infoTable) : sc_module(name){
	if(infoTable == NULL) {//implies that this component will be dinamically created.
		componentInfo = new HardwareComponentInfo();
		isDynamic = true;
	}
	else{
		componentInfo = infoTable;
		isDynamic = false;
	}
}

void HardwareComponent::addPortAttributes(std::string name, DataType type, int size){
	if(ports.count(name)!=0){
		sc_attribute< int > portSize("PortSize",size);
		sc_attribute< DataType > portType("DataType",type);
		ports[name]->add_attribute(portSize);
		ports[name]->add_attribute(portType);
	}
}

void HardwareComponent::addInput(std::string name, DataType type, int size){
	ports[name]	= new sc_in< sc_logic >(name.c_str());
	addPortAttributes(name, type, size);
}

void HardwareComponent::addOutput(std::string name, DataType type, int size){
	ports[name]	= new sc_out< sc_logic >(name.c_str());
	addPortAttributes(name, type, size);
}

void HardwareComponent::addInout(std::string name, DataType type, int size){
	ports[name]	= new sc_inout< sc_logic >(name.c_str());
	addPortAttributes(name, type, size);
}

sc_port_base* HardwareComponent::getPort(std::string name){
	if(ports.count(name)!=0)
		return ports[name];
	return NULL;
}

void HardwareComponent::portMap(std::string selfPortName, sc_port_base *port){
	if(ports.count(selfPortName) != 0){
		if(string(ports[selfPortName]->kind()) == "sc_in"
			 && string(port->kind()) == "sc_in"){
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName] );
			sc_in<sc_logic> * bindedPort = dynamic_cast<sc_in<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
		else if(string(ports[selfPortName]->kind()) == "sc_in"
			 && string(port->kind()) == "sc_out"){
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName] );
			sc_out<sc_logic> * bindedPort = dynamic_cast<sc_out<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
		else if(string(ports[selfPortName]->kind()) == "sc_out"
			 && string(port->kind()) == "sc_out"){
			sc_out<sc_logic> * selfPort = dynamic_cast<sc_out<sc_logic>* >( ports[selfPortName] );
			sc_out<sc_logic> * bindedPort = dynamic_cast<sc_out<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
		if(string(ports[selfPortName]->kind()) == "sc_inout"
			 && string(port->kind()) == "sc_inout"){
			sc_inout<sc_logic> * selfPort = dynamic_cast<sc_inout<sc_logic>* >( ports[selfPortName] );
			sc_inout<sc_logic> * bindedPort = dynamic_cast<sc_inout<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
	}
}

void HardwareComponent::portMap(std::string selfPortName, sc_signal_resolved *signal){
	if(ports.count(selfPortName) != 0){
		if(string(ports[selfPortName]->kind()) == "sc_in"){
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName] );
			(*selfPort)(*signal);
		}
		else if(string(ports[selfPortName]->kind()) == "sc_out"){
			sc_out<sc_logic> * selfPort = dynamic_cast<sc_out<sc_logic>* >( ports[selfPortName] );
			(*selfPort)(*signal);
		}
		if(string(ports[selfPortName]->kind()) == "sc_inout"){
			sc_inout<sc_logic> * selfPort = dynamic_cast<sc_inout<sc_logic>* >( ports[selfPortName] );
			(*selfPort)(*signal);
		}
	}
}

void HardwareComponent::addChildComponent(sc_module * child){
	this->add_child_object(child);

}
