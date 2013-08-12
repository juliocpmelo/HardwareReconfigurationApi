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
		addInput(it->second.name,it->second.type);
	}
	for (std::map< string, PortInfo >::iterator it= componentInfo->outputs.begin(); it!=componentInfo->outputs.end(); it++){
		addOutput(it->second.name,it->second.type);
	}
}

/* 
 * using declaration file attribute of HardwareComponentInfo there is no need to 
 * put the port datatypes and sizes as attributes for the ports.
 */
void HardwareComponent::addPortAttributes(std::string name, DataType* type){
	if(ports.count(name)!=0){
//		sc_attribute< int > portSize("PortSize",size);
//		sc_attribute< DataType > portType("DataType",type);
		/*check data sizes if possible*/
		ports[name]->name = name;
		ports[name]->type = type;

	}
}

void HardwareComponent::addInput(std::string name, DataType* type){
	if(isDynamic){
		this->sc_get_curr_simcontext()->hierarchy_push (this);
		ports[name]	= new PortInfo();
		ports[name]->scPort = new sc_in< sc_logic >(name.c_str());
		ports[name]->portType = PortType_in;
		addPortAttributes(name, type);
		this->sc_get_curr_simcontext()->hierarchy_pop ();

		//this->getSimulationContext()->hierarchy_pop();
	}
}

void HardwareComponent::addOutput(std::string name, DataType* type){
	if(isDynamic){
		this->sc_get_curr_simcontext()->hierarchy_push (this);
		ports[name]	= new PortInfo();
		ports[name]->scPort = new sc_out< sc_logic >(name.c_str());
		ports[name]->portType = PortType_out;
		addPortAttributes(name, type);
		this->sc_get_curr_simcontext()->hierarchy_pop ();

	}
}

void HardwareComponent::addInout(std::string name, DataType* type){
	if(isDynamic){
		this->sc_get_curr_simcontext()->hierarchy_push (this);
		ports[name]	= new PortInfo();
		ports[name]->scPort = new sc_inout< sc_logic >(name.c_str());
		ports[name]->portType = PortType_inout;
		addPortAttributes(name, type);
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
			//cout<<"binding port (in) "<<this->name()<<":"<<selfPortName<<" to (in) "<<port->name()<<endl;
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName]->scPort );
			sc_in<sc_logic> * bindedPort = dynamic_cast<sc_in<sc_logic>* >( port );

			sc_attribute< sc_signal_resolved* > *portConnectionAttr; 
			if ( portConnectionAttr = dynamic_cast< sc_attribute< sc_signal_resolved* > *>(selfPort->get_attribute("PortConnection"))){
				(*bindedPort)(*(portConnectionAttr->value));
			}
			else if ( portConnectionAttr = dynamic_cast< sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value));
			}
			else{
				sc_signal_resolved *sig = new sc_signal_resolved();
				sc_attribute< sc_signal_resolved* > *portConnectionAttr = new sc_attribute< sc_signal_resolved* >("PortConnection",sig);

				(*bindedPort)(*sig);
				(*selfPort)(*sig);
				selfPort->add_attribute(*portConnectionAttr);
				bindedPort->add_attribute(*portConnectionAttr);
				
			}

		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_in"
			 && string(port->kind()) == "sc_out"){
			//cout<<"binding port"<<this->name()<<":"<<selfPortName<<" to "<<port->name()<<endl;
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName]->scPort );
			sc_out<sc_logic> * bindedPort = dynamic_cast<sc_out<sc_logic>* >( port );

			sc_attribute< sc_signal_resolved* > *portConnectionAttr; 
			if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(selfPort->get_attribute("PortConnection")) ){ //tests for a already binded port
				(*bindedPort)(*(portConnectionAttr->value)) ;
			}
			else if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value)) ;
			}
			else{ //binds both ports through a signal
				sc_signal_resolved *sig = new sc_signal_resolved();
				sc_attribute< sc_signal_resolved* > *portConnectionAttr = new sc_attribute< sc_signal_resolved* >("PortConnection",sig);

				(*bindedPort)(*sig);
				(*selfPort)(*sig);
				selfPort->add_attribute(*portConnectionAttr);
				bindedPort->add_attribute(*portConnectionAttr);
			}

		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_out"
			 && string(port->kind()) == "sc_out"){
			//cout<<"binding port (out) "<<this->name()<<":"<<selfPortName<<" to (out) "<<port->name()<<endl;
			sc_out<sc_logic> * selfPort = dynamic_cast<sc_out<sc_logic>* >( ports[selfPortName]->scPort );
			sc_out<sc_logic> * bindedPort = dynamic_cast<sc_out<sc_logic>* >( port );
			/*binding should be done through signals for some strange reason*/
			sc_attribute< sc_signal_resolved* > *portConnectionAttr; 
			if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(selfPort->get_attribute("PortConnection")) ){ //tests for a already binded port
				(*bindedPort)(*(portConnectionAttr->value)) ;
			}
			else if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value)) ;
			}
			else{ //binds both ports through a signal
				sc_signal_resolved *sig = new sc_signal_resolved();
				sc_attribute< sc_signal_resolved* > *portConnectionAttr = new sc_attribute< sc_signal_resolved* >("PortConnection",sig);

				(*bindedPort)(*sig);
				(*selfPort)(*sig);
				selfPort->add_attribute(*portConnectionAttr);
				bindedPort->add_attribute(*portConnectionAttr);
			}

		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_inout"
			 && string(port->kind()) == "sc_inout"){
			//cout<<"binding port"<<this->name()<<":"<<selfPortName<<" to "<<port->name()<<endl;
			sc_inout<sc_logic> * selfPort = dynamic_cast<sc_inout<sc_logic>* >( ports[selfPortName]->scPort );
			sc_inout<sc_logic> * bindedPort = dynamic_cast<sc_inout<sc_logic>* >( port );
			sc_attribute< sc_signal_resolved* > *portConnectionAttr; 
			if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(selfPort->get_attribute("PortConnection")) ){ //tests for a already binded port
				(*bindedPort)(*(portConnectionAttr->value)) ;
			}
			else if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value)) ;
			}
			else{ //binds both ports through a signal
				sc_signal_resolved *sig = new sc_signal_resolved();
				sc_attribute< sc_signal_resolved* > *portConnectionAttr = new sc_attribute< sc_signal_resolved* >("PortConnection",sig);

				(*bindedPort)(*sig);
				(*selfPort)(*sig);
				selfPort->add_attribute(*portConnectionAttr);
				bindedPort->add_attribute(*portConnectionAttr);
			}

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
