
#include "HardwareComponentConverterVHDL.h"
#include <sstream>
#include <map>
#include <deque>

using namespace std;

HardwareComponentConverterVHDL::HardwareComponentConverterVHDL(){

}

std::string HardwareComponentConverterVHDL::translateType(HardwareComponent::DataType *type){
	stringstream convertedType;
	switch (type->id){
		case HardwareComponent::DataTypeId_vector:{
			string startIndex = ((HardwareComponent::VectorType*) type)->startIndex;
			string endIndex = ((HardwareComponent::VectorType*) type)->endIndex;
			string operation = ((HardwareComponent::VectorType*) type)->indexOperator;
			convertedType<<"std_logic_vector("<<startIndex<<" "<<operation<<" "<<endIndex<<")";
			break;
		}
		case HardwareComponent::DataTypeId_bit:{
			convertedType<<"std_logic";
			break;
		}
		case HardwareComponent::DataTypeId_integer:{
			string rangeStart = ((HardwareComponent::IntegerType*) type)->rangeStart;
			string rangeEnd = ((HardwareComponent::IntegerType*) type)->rangeEnd;
			string rangeOperation = ((HardwareComponent::IntegerType*) type)->rangeOperator;
			/*TODO think about integer range*/
			if(rangeStart != "")
				convertedType<<"integer : range ("<<rangeStart<<" "<<rangeOperation<<" "<<rangeEnd<<")";
			else
				convertedType<<"integer";
			break;

		}
		default:
			cout<<"type not handled"<<endl;

	}
	return convertedType.str();
}

std::string HardwareComponentConverterVHDL::translatePort(HardwareComponent::PortInfo* portInfo){
	
	stringstream convertedPort;

	if(portInfo->portType == HardwareComponent::PortType_in){
		convertedPort<<portInfo->name<<": in ";
		string typeStr = translateType(portInfo->type);
		convertedPort<<typeStr;
	}
	else if(portInfo->portType == HardwareComponent::PortType_out){
		convertedPort<<portInfo->name<<": out ";
		string typeStr = translateType(portInfo->type);
		convertedPort<<typeStr;
	}
	else if(portInfo->portType == HardwareComponent::PortType_inout){
		convertedPort<<portInfo->name<<": inout ";
		string typeStr = translateType(portInfo->type);
		convertedPort<<typeStr;
	}
//	cout<<" converted to "<<convertedPort.str()<<endl;

	return convertedPort.str();
}

std::string HardwareComponentConverterVHDL::translateParam(HardwareComponent::Param* paramInfo){
	
	stringstream convertedParam;
//	cout<<" processing to "<<paramInfo->name<<endl;
	
	convertedParam<<paramInfo->name<<" ";
	switch (paramInfo->type->id){
		case HardwareComponent::DataTypeId_integer:{
			 /*TODO think about integer range*/
			 convertedParam<<": integer";
			 break;
		}
		case HardwareComponent::DataTypeId_string:{
			 /*TODO think about integer range*/
			 convertedParam<<": string";
			 break;
		}
		default:
			 convertedParam<<": integer";
	}
	if(paramInfo->defaultValue != ""){
		convertedParam<<" := "<<paramInfo->defaultValue;
	}
//	cout<<" converted to "<<convertedParam.str()<<endl;

	return convertedParam.str();

}


std::string HardwareComponentConverterVHDL::translateSignal(sc_signal_resolved* signal){
	
	stringstream convertedSignal;
	
	cout<<"proecessing signal "<<signal->name()<<endl;
	sc_attribute<HardwareComponent::DataType*> *type = dynamic_cast<sc_attribute<HardwareComponent::DataType*>*>(signal->get_attribute("DataType"));

	if (type) 
		convertedSignal<<"signal "<<signal->name()<<" : "<<translateType(type->value);
	else
		convertedSignal<<"signal "<<signal->name()<<" : null type";

	return convertedSignal.str();
}

std::set<HardwareComponent::HardwareComponentInfo* > HardwareComponentConverterVHDL::getUsedComponents(HardwareComponent *comp) {
	std::set<HardwareComponent::HardwareComponentInfo*> infoSet;

	std::deque<HardwareComponent*> componentDeque;

	componentDeque.push_back(comp);
	while (!componentDeque.empty()){
		HardwareComponent * currentComp = componentDeque.front();
		std::vector<sc_object*> children = currentComp->get_child_objects();
		for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
			if ( std::string((*i)->kind())=="sc_module")	{
				HardwareComponent* mptr = dynamic_cast<HardwareComponent*>(*i);
				componentDeque.push_back(mptr);
				infoSet.insert(mptr->componentInfo);
			}
		}
		componentDeque.pop_front();
	}
	return infoSet;
}


std::string HardwareComponentConverterVHDL::translateDeclaration(HardwareComponent::HardwareComponentInfo* componentInfo){

	cout<<"generating declaration"<<endl;
	if(!componentInfo->componentDeclaration.empty()){
		return componentInfo->componentDeclaration;
	}


	stringstream componentDeclaration;

	componentDeclaration << "component " << componentInfo->name << endl;

	std::map<std::string, HardwareComponent::Param> paramTable = componentInfo->componentParameters;

	map<string, HardwareComponent::Param>::iterator lastParam = paramTable.end();
	/*only add the generic keyword when there are any generics declared*/
	if(paramTable.size() > 0){
		componentDeclaration<<"generic ("<<endl;
		lastParam --;
	}
	for(map<string, HardwareComponent::Param>::iterator it = paramTable.begin(); it != paramTable.end(); it++){
		if (it == lastParam)
			componentDeclaration<<"\t"<<translateParam(&(it->second))<<endl;
		else
			componentDeclaration<<"\t"<<translateParam(&(it->second))<<";"<<endl;

	}
	if(paramTable.size() > 0)
		componentDeclaration <<");"<<endl;



	std::vector< HardwareComponent::PortInfo > portsVector;
	for(map<string, HardwareComponent::PortInfo>::iterator it = componentInfo->inputs.begin(); it != componentInfo->inputs.end(); it++)
		portsVector.push_back(it->second);

	for(map<string, HardwareComponent::PortInfo>::iterator it = componentInfo->outputs.begin(); it != componentInfo->outputs.end(); it++)
		portsVector.push_back(it->second);


	vector< HardwareComponent::PortInfo>::iterator lastElement = portsVector.end();
	/*only add the port keyword when there are any ports declared*/
	if(portsVector.size() > 0){
		componentDeclaration <<"port ("<<endl;
		lastElement --;
	}
	for(vector< HardwareComponent::PortInfo>::iterator it = portsVector.begin(); it != portsVector.end(); it++){
		if (it == lastElement)
			componentDeclaration<<"\t"<<translatePort(&(*it))<<endl;
		else
			componentDeclaration<<"\t"<<translatePort(&(*it))<<";"<<endl;

	}
	
	if(portsVector.size() > 0)
		componentDeclaration <<");"<<endl;

	componentDeclaration <<"end component "<<componentInfo->name<<";"<<endl<<endl;

	componentInfo->componentDeclaration = componentDeclaration.str();
	cout<<"generating declaration end"<<endl;

	return componentInfo->componentDeclaration;

}

std::string HardwareComponentConverterVHDL::getNameForHardwareComponentFile(std::string projectPath, HardwareComponent *topComponent){
  string fileLocation = projectPath+"/"+topComponent->name()+".vhdl";
	return fileLocation;
}


/**
 * TODO think about nested auto generated HardwareComponent entities
 **/
void HardwareComponentConverterVHDL::buildTopComponentFile(string projectPath, HardwareComponent *topComponent){

		//topComponent->sc_get_curr_simcontext()->initialize(true);

    ofstream designFile;
    string fileLocation = projectPath+"/"+topComponent->name()+".vhdl";
		cout<<"generating vhdl to component "<<topComponent->name()<<" file :"<<fileLocation<<endl;
    designFile.open (fileLocation.c_str());
    designFile <<"-- This file was auto generated by the HardwareProjectXmlParser"<<endl<<endl;
    designFile <<"library ieee;"<<endl;
    designFile <<"use ieee.std_logic_1164.all;"<<endl;
    designFile <<"use ieee.std_logic_unsigned.all;"<<endl<<endl;


    /*generate the header of the entity with the input/outputs*/

    designFile <<"entity "<<topComponent->name()<<" is"<<endl; //TODO place the main tag name here
    designFile <<"port ("<<endl;
		
    std::map<std::string, HardwareComponent::PortInfo*> portsTable = topComponent->ports;

		map<string, HardwareComponent::PortInfo*>::iterator lastElement = portsTable.end();
		if(portsTable.size() > 0)
			lastElement --;
		for(map<string, HardwareComponent::PortInfo*>::iterator it = portsTable.begin(); it != portsTable.end(); it++){
			if (it == lastElement)
				designFile<<translatePort(it->second)<<endl;
			else
				designFile<<translatePort(it->second)<<";"<<endl;

		}
		designFile <<");"<<endl;

    designFile <<"end "<<topComponent->name()<<";"<<endl<<endl;

    designFile<<"architecture arch of "<<topComponent->name()<<" is"<<endl;

    designFile <<"-- Component Declaration"<<endl<<endl;
		set<HardwareComponent::HardwareComponentInfo*> usedComponentsInfo = getUsedComponents(topComponent);

		/*generate the component declaration in the architecture file*/
    for(set<HardwareComponent::HardwareComponentInfo*>::iterator it = usedComponentsInfo.begin(); it!= usedComponentsInfo.end(); it ++){
    	designFile<<translateDeclaration(*it)<<endl;			
    }
    
    designFile <<"-- Signal Declaration"<<endl<<endl;
		set<sc_signal_resolved*> signals = topComponent->getSignals();
    for(set<sc_signal_resolved*>::iterator it = signals.begin(); it!= signals.end(); it ++){
			string translation = translateSignal(*it);
			designFile<<translateSignal(*it)<<";"<<endl;
    }
		
    designFile<<"begin"<<endl;

    designFile <<endl<<endl<<"-- Architectural Declaration --"<<endl<<endl;


		vector<HardwareComponent*> childModules = topComponent->getChildModules();


   /*generate port maps for each used component*/
		designFile <<endl<<endl<< "-- component's port maps "<<endl<<endl;
		for (vector<HardwareComponent*>::iterator it = childModules.begin(); it != childModules.end(); it++){
			if(std::string((*it)->kind()) == "sc_module"){

				HardwareComponent *module = (HardwareComponent*) (*it);
				designFile << module->name() << ":" << module->componentInfo->name << " port map ("<<endl;
				
				std::vector<sc_object*> children = module->get_child_objects();



				string portMap = "";
				for (std::vector<sc_object*>::iterator it2 = children.begin(); it2 != children.end(); it2++) {
					if (std::string((*it2)->kind()) =="sc_in" || 
							std::string((*it2)->kind()) =="sc_out" ||
							std::string((*it2)->kind()) =="sc_inout") {
						std::cout<<"processing port "<<(*it2)->name()<<std::endl;
						sc_port_base * port = dynamic_cast<sc_port_base*>(*it2);

						if(port->get_interface() != NULL){
							sc_object * channel = dynamic_cast<sc_object*>(port->get_interface());

							sc_port_base *connectedPort = topComponent->getConnectedPort(channel);

							if( connectedPort != NULL){ //if any of the component's a port is connected to the current channel it is a direct connection
								cout<<"port "<<connectedPort->name() << " directly connected to "<<port->name()<<endl;
								portMap += port->basename();
							 	portMap += "=>";
							  portMap += connectedPort->basename();
							  portMap += ",\n";

							}
							else{ //else it should be connected through a signal
								cout<<"port "<<port->name()<<" conneted through signal "<<channel->name()<<endl;

								portMap += port->basename();
							 	portMap += "=>";
							  portMap += channel->basename();
							  portMap += ",\n";
							}
						}
					}
				}
				portMap = portMap.substr(0,portMap.size()-2); //removes the ",\n" in the end of string

				designFile << portMap<< endl;
				
				designFile << "); --"<<module->name()<<endl;

			}
		}

		/*generate signal maps for the rest of the signals*/

		
		designFile <<endl<<endl<< "-- signal maps --"<<endl<<endl;
		vector<sc_object*> topComponeneChildren = topComponent->get_child_objects();
		for (vector<sc_object*>::iterator it = topComponeneChildren.begin(); it != topComponeneChildren.end(); it++){
			if (std::string((*it)->kind()) =="sc_in" || 
					std::string((*it)->kind()) =="sc_out" ||
					std::string((*it)->kind()) =="sc_inout") {
				
				std::cout<<"processing port "<<(*it)->name()<<std::endl;
				sc_port_base * port = dynamic_cast<sc_port_base*>(*it);

				if(port->get_interface() != NULL){
					sc_object * channel = dynamic_cast<sc_object*>(port->get_interface());
					sc_port_base *connectedPort = NULL;

					for (std::vector<HardwareComponent*>::iterator it2 = childModules.begin(); it2 != childModules.end(); it2++) {
						connectedPort = (*it2)->getConnectedPort(channel);
						if(connectedPort != NULL)
							break;
					}
					//if the top component port is not connected to any other component port, but it still has
					//a connected interface, means that this port is connected directly to a signal
					if (connectedPort == NULL){
						designFile << port->basename() << " <= " << channel->name() << ";"<<endl;
					}
				}
			}
		}




    designFile<<endl;



    designFile<<"end arch;"<<endl;
    
    designFile.close();
    cout<<"design file saved to "<<fileLocation<<endl;

}


