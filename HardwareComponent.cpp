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


void HardwareComponent::createSoftwareAccess(std::string portName){
	if(ports.count(portName) != 0){
		softwareAccessiblePorts.insert(portName);
	}
	else{
		cout << "WARNING : HardwareComponent::createSoftwareAccess failed because port " << portName << " was not found " <<endl;
	}
}

sc_signal_resolved* HardwareComponent::createSignal(std::string name, HardwareComponent::DataType *type){

	sc_signal_resolved *signal = new sc_signal_resolved(name.c_str());

	cout<<"create signal "<<signal->name()<<endl; 
	sc_attribute<HardwareComponent::DataType*> *signalType = new sc_attribute<HardwareComponent::DataType*>( "DataType",type);
	sc_attribute<std::string> *signalClass = new sc_attribute<std::string>("class", "external");
	signal->add_attribute(*signalType);
	signal->add_attribute(*signalClass);
	return signal;
}


void HardwareComponent::buildComponentPorts(){
	for (std::map< string, PortInfo >::iterator it= componentInfo->inputs.begin(); it!=componentInfo->inputs.end(); it++){
		addInput(it->second.name,it->second.type);
	}
	for (std::map< string, PortInfo >::iterator it= componentInfo->outputs.begin(); it!=componentInfo->outputs.end(); it++){
		addOutput(it->second.name,it->second.type);
	}
	for (std::map< string, Param >::iterator it= componentInfo->componentParameters.begin(); it!=componentInfo->componentParameters.end(); it++){
		instanceParameters[it->second.name] = it->second;
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
		ports[name]->type = NULL;
		switch(type->id){
			case DataTypeId_bit:
				ports[name]->type = BIT_TYPE;
				break;
			case DataTypeId_vector:
				ports[name]->type = VECTOR_TYPE(((VectorType*)type)->startIndex, ((VectorType*)type)->indexOperator, ((VectorType*)type)->endIndex);
				break;
			case DataTypeId_integer:
				ports[name]->type = INTEGER_TYPE(((IntegerType*)type)->rangeStart, ((IntegerType*)type)->rangeOperator, ((IntegerType*)type)->rangeEnd);
				break;
			default:
				cout << "string type not supported"<<endl;
		}
		if (ports[name]->type)
			ports[name]->type->instanceParameters = &(this->instanceParameters);
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
	else{
		if (!isDynamic)
			cout<<"port "<<name<<" not found, returning NULL port, please check the component "<<componentInfo->name<< " definition"<<endl;
		else
			cout<<"port "<<name<<" not found for dynamic component " << this->name()<< ", returning NULL port, please check component port definitions"<<endl;
	}
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
				bindedPort->add_attribute(*portConnectionAttr);
			}
			else if ( portConnectionAttr = dynamic_cast< sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value));
				selfPort->add_attribute(*portConnectionAttr);
			}
			else{
				sc_signal_resolved *sig = new sc_signal_resolved();

				sc_attribute<HardwareComponent::DataType*> *signalType = new sc_attribute<HardwareComponent::DataType*>("DataType",ports[selfPortName]->type->clone());
				sig->add_attribute(*signalType);

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
				bindedPort->add_attribute(*portConnectionAttr);
			}
			else if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value)) ;
				selfPort->add_attribute(*portConnectionAttr);
			}
			else{ //binds both ports through a signal
				sc_signal_resolved *sig = new sc_signal_resolved();

				sc_attribute<HardwareComponent::DataType*> *signalType = new sc_attribute<HardwareComponent::DataType*>("DataType",ports[selfPortName]->type->clone());
				sig->add_attribute(*signalType);

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
				bindedPort->add_attribute(*portConnectionAttr);
			}
			else if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value)) ;
				selfPort->add_attribute(*portConnectionAttr);
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
				bindedPort->add_attribute(*portConnectionAttr);
			}
			else if ( portConnectionAttr = dynamic_cast<	sc_attribute< sc_signal_resolved* > *>(port->get_attribute("PortConnection"))){
				(*selfPort)(*(portConnectionAttr->value)) ;
				selfPort->add_attribute(*portConnectionAttr);
			}
			else{ //binds both ports through a signal
				sc_signal_resolved *sig = new sc_signal_resolved();

				sc_attribute<HardwareComponent::DataType*> *signalType = new sc_attribute<HardwareComponent::DataType*>("DataType",ports[selfPortName]->type->clone());
				sig->add_attribute(*signalType);

				sc_attribute< sc_signal_resolved* > *portConnectionAttr = new sc_attribute< sc_signal_resolved* >("PortConnection",sig);

				(*bindedPort)(*sig);
				(*selfPort)(*sig);
				selfPort->add_attribute(*portConnectionAttr);
				bindedPort->add_attribute(*portConnectionAttr);
			}

		}
	}
	else if (port != NULL){
		cout<<__FILE__<<"::"<<__LINE__<<endl;
		cout << "can't portmap port "<< selfPortName << " from " << this->name() << " to " << port->name() <<endl;
		std::map<std::string, PortInfo*>::iterator portsIt = ports.begin();
		cout << "possible ports in "<< this->name() << " are:"<<endl;
		for (portsIt; portsIt!= ports.end(); portsIt++){
			cout << "\t" << portsIt->first << endl;
		}
	}
	else{
		cout<<__FILE__<<"::"<<__LINE__<<endl;
		cout << "can't portmap port "<< selfPortName << " from " << this->name() << " to null port"<<endl;
	}
}

void HardwareComponent::portMap(std::string selfPortName, sc_signal_resolved *signal){
	if(ports.count(selfPortName) != 0){
		if(string(ports[selfPortName]->scPort->kind()) == "sc_in"){
			//cout<<"binding signal"<<signal->name()<<" to port "<<this->name()<<":"<<selfPortName<<endl;
			sc_in<sc_logic> * selfPort = dynamic_cast<sc_in<sc_logic>* >( ports[selfPortName]->scPort );
			(*selfPort)(*signal);
		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_out"){
			//cout<<"binding signal"<<signal->name()<<" to port "<<this->name()<<":"<<selfPortName<<endl;
			sc_out<sc_logic> * selfPort = dynamic_cast<sc_out<sc_logic>* >( ports[selfPortName]->scPort );
			(*selfPort)(*signal);
		}
		else if(string(ports[selfPortName]->scPort->kind()) == "sc_inout"){
			//cout<<"binding signal"<<signal->name()<<" to port "<<this->name()<<":"<<selfPortName<<endl;
			sc_inout<sc_logic> * selfPort = dynamic_cast<sc_inout<sc_logic>* >( ports[selfPortName]->scPort );
			(*selfPort)(*signal);
		}
	}
}

void HardwareComponent::addChildObject(sc_object * child){
	this->add_child_object(child);
}

string HardwareComponent::getParamValue(std::string paramName){
	if(instanceParameters.count(paramName) != 0 ){
		cout<< "request parameter "<< paramName << " with value " <<instanceParameters[paramName].value<<endl;
		return instanceParameters[paramName].value;
	}
	else{
		cout<< "param "<< paramName << " not found in component " <<this->name()<<endl; 
		cout<< "please check component definitions"<<endl; 
		return "0";
	}
}

std::set<std::string> HardwareComponent::getDependentFiles(){
	set<string> dependentFiles;
	vector<sc_object*> children = this->get_child_objects();
	for(vector<sc_object*>::iterator it = children.begin(); it != children.end(); it++){
		if((*it)->kind() == string("sc_module")) {
			HardwareComponent *comp = dynamic_cast<HardwareComponent*>(*it);
			if(comp->componentInfo->dependencyFiles.size() == 0){
				set<string> dependencies = comp->getDependentFiles();
				dependentFiles.insert(dependencies.begin(), dependencies.end());
			}
			else{
				set<string> dependencies = comp->componentInfo->dependencyFiles;
				dependentFiles.insert(dependencies.begin(), dependencies.end());
			}
		}
	}
	return dependentFiles;
	
}

void HardwareComponent::setParamValue(std::string paramName, std::string value){
	if(instanceParameters.count(paramName) != 0 )
		instanceParameters[paramName].value = value;
}

sc_port_base* HardwareComponent::getConnectedPort(sc_object* channel){


	std::vector<sc_object*> children = this->get_child_objects();
	//cout << "testing to component "<<this->name()<< " with " << children.size() << " children"<<endl;
	for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
		if (std::string((*i)->kind())=="sc_in" || std::string((*i)->kind()) =="sc_out") {
			sc_port_base * port = dynamic_cast<sc_port_base*>(*i);
			//cout<<" type for port "<< (*i)->name()<< " " <<std::string((*i)->kind())<<endl;
			if(port->get_interface() != NULL){
				sc_object * connectedChannel = dynamic_cast<sc_object*>(port->get_interface());
				//std::cout<<"testing port "<<port->name()<<" that uses channel "<<connectedChannel->name()<<" to "<<channel->name()<<std::endl;
				//std::cout<<"attribute "<<port->get_attribute("PortConnection")<<endl;
				if(channel->name() == connectedChannel->name() and //connected through the same channel
					 port->get_attribute("PortConnection") != NULL)
					return port;
			}
		}
	}
	return NULL;
}




std::set<sc_signal_resolved* > HardwareComponent::getSignals() {
	std::set<sc_signal_resolved* > signals;
	std::vector<sc_object*> children = this->get_child_objects();
	for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
		if ( std::string((*i)->kind())=="sc_module")	{
			HardwareComponent *comp_child = (HardwareComponent*) (*i);
			std::vector<sc_object*> children2 = comp_child->get_child_objects();

			for (std::vector<sc_object*>::iterator i2 = children2.begin(); i2 != children2.end(); i2++) {

				if (std::string((*i2)->kind())=="sc_in" || 
						std::string((*i2)->kind()) =="sc_out" ||
						std::string((*i2)->kind()) =="sc_inout") {
					sc_port_base * port = dynamic_cast<sc_port_base*>(*i2);

					sc_object * channel = dynamic_cast<sc_object*>(port->get_interface());

					if(channel != NULL){
						sc_port_base *connectedPort = this->getConnectedPort(channel);


						/*
						 * when a connetion exists and it is not direct to the component given, means
						 * that a signal was automatically created and must be declared in the signal
						 * list
						 */
						if(connectedPort == NULL){
							signals.insert(dynamic_cast<sc_signal_resolved*>(channel));
						}
					}
				}
			}
		}
	}
	return signals;
}

std::vector<HardwareComponent* > HardwareComponent::getChildModules() {
	std::vector<HardwareComponent*> retVector;


	std::vector<sc_object*> children = this->get_child_objects();
	for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
		if ( std::string((*i)->kind())=="sc_module")	{
			HardwareComponent* mptr = dynamic_cast<HardwareComponent*>(*i);
			retVector.push_back(mptr);
		}
	}

	return retVector;
}

