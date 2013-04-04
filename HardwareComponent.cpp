#include "HardwareComponent.h"
using namespace std;

HardwareComponent::HardwareComponent(sc_module_name name, HardwareComponentInfo *infoTable) : sc_module(name){
	isDynamic = true;
	if(infoTable == NULL) {//implies that this component will be dinamically created.
		componentInfo = new HardwareComponentInfo();
	}
	else{
		componentInfo = infoTable;
		buildComponentPorts();
		isDynamic = false;
	}
}

void HardwareComponent::buildComponentPorts(){
	for (std::map< string, PortInfo >::iterator it= componentInfo->inputs.begin(); it!=componentInfo->inputs.end(); it++){
		addInput(it->second.name,it->second.type,it->second.size);
	}
	for (std::map< string, PortInfo >::iterator it= componentInfo->outputs.begin(); it!=componentInfo->outputs.end(); it++){
		addOutput(it->second.name,it->second.type,it->second.size);
	}
}

/* 
 * using declaration file attribute of HardwareComponentInfo there is no need to 
 * put the port datatypes and sizes as attributes for the ports.
 */
void HardwareComponent::addPortAttributes(std::string name, DataType type, int size){
	if(ports.count(name)!=0){
//		sc_attribute< int > portSize("PortSize",size);
//		sc_attribute< DataType > portType("DataType",type);
		/*check data sizes if possible*/
		ports[name]->name = name;
		ports[name]->size = size;
		ports[name]->type = type;

	}
}

void HardwareComponent::addInput(std::string name, DataType type, int size){
	if(isDynamic){
		this->sc_get_curr_simcontext()->hierarchy_push (this);
		ports[name]	= new PortInfo();
		ports[name]->scPort = new sc_in< sc_logic >(name.c_str());
		addPortAttributes(name, type, size);
		this->sc_get_curr_simcontext()->hierarchy_pop ();

		//this->getSimulationContext()->hierarchy_pop();
	}
}

void HardwareComponent::addOutput(std::string name, DataType type, int size){
	if(isDynamic){
		this->sc_get_curr_simcontext()->hierarchy_push (this);
		ports[name]	= new PortInfo();
		ports[name]->scPort = new sc_out< sc_logic >(name.c_str());

		addPortAttributes(name, type, size);
		this->sc_get_curr_simcontext()->hierarchy_pop ();

	}
}

void HardwareComponent::addInout(std::string name, DataType type, int size){
	if(isDynamic){
		this->sc_get_curr_simcontext()->hierarchy_push (this);
		ports[name]	= new PortInfo();
		ports[name]->scPort = new sc_inout< sc_logic >(name.c_str());
		addPortAttributes(name, type, size);
		this->sc_get_curr_simcontext()->hierarchy_pop ();
	}
}

sc_port_base* HardwareComponent::getPort(std::string name){
	if(ports.count(name)!=0)
		return ports[name]->scPort;
	return NULL;
}

void HardwareComponent::portMap(std::string selfPortName, sc_port_base *port){
	if(ports.count(selfPortName) != 0 && port!= NULL){
		if(string(ports[selfPortName]->scPort->kind()) == "sc_in"
			 && string(port->kind()) == "sc_in"){
		cout<<"binding port"<<this->name()<<":"<<selfPortName<<" to "<<port->name()<<endl;
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName]->scPort );
			sc_in<sc_logic> * bindedPort = dynamic_cast<sc_in<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_in"
			 && string(port->kind()) == "sc_out"){
		cout<<"binding port"<<this->name()<<":"<<selfPortName<<" to "<<port->name()<<endl;
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName]->scPort );
			sc_out<sc_logic> * bindedPort = dynamic_cast<sc_out<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_out"
			 && string(port->kind()) == "sc_out"){
		cout<<"binding port"<<this->name()<<":"<<selfPortName<<" to "<<port->name()<<endl;
			sc_out<sc_logic> * selfPort = dynamic_cast<sc_out<sc_logic>* >( ports[selfPortName]->scPort );
			sc_out<sc_logic> * bindedPort = dynamic_cast<sc_out<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
		if(string(ports[selfPortName]->scPort->kind()) == "sc_inout"
			 && string(port->kind()) == "sc_inout"){
		cout<<"binding port"<<this->name()<<":"<<selfPortName<<" to "<<port->name()<<endl;
			sc_inout<sc_logic> * selfPort = dynamic_cast<sc_inout<sc_logic>* >( ports[selfPortName]->scPort );
			sc_inout<sc_logic> * bindedPort = dynamic_cast<sc_inout<sc_logic>* >( port );
			(*selfPort)(*bindedPort);
		}
	}
}

void HardwareComponent::portMap(std::string selfPortName, sc_signal_resolved *signal){
	if(ports.count(selfPortName) != 0){
		if(string(ports[selfPortName]->scPort->kind()) == "sc_in"){
			cout<<"binding signal"<<signal->name()<<" to port "<<this->name()<<":"<<selfPortName<<endl;
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName]->scPort );
			(*selfPort)(*signal);
		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_out"){
			cout<<"binding signal"<<signal->name()<<" to port "<<this->name()<<":"<<selfPortName<<endl;
			sc_out<sc_logic> * selfPort = dynamic_cast<sc_out<sc_logic>* >( ports[selfPortName]->scPort );
			(*selfPort)(*signal);
		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_inout"){
			cout<<"binding signal"<<signal->name()<<" to port "<<this->name()<<":"<<selfPortName<<endl;
			sc_inout<sc_logic> * selfPort = dynamic_cast<sc_inout<sc_logic>* >( ports[selfPortName]->scPort );
			(*selfPort)(*signal);
		}
	}
}

void HardwareComponent::addChildObject(sc_object * child){
	this->add_child_object(child);
}
