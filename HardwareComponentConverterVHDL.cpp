
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
	cout<<" converted to "<<convertedPort.str()<<endl;

	return convertedPort.str();
}

std::string HardwareComponentConverterVHDL::translateParam(HardwareComponent::Param* paramInfo){
	
	stringstream convertedParam;
	cout<<" processing to "<<paramInfo->name<<endl;
	
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
	cout<<" converted to "<<convertedParam.str()<<endl;

	return convertedParam.str();

}


std::string HardwareComponentConverterVHDL::translateSignal(sc_signal_resolved* signal){
	
	stringstream convertedSignal;
	
	cout<<"proecessing signal "<<signal->name()<<endl;
	sc_attribute<HardwareComponent::DataType*> *type = dynamic_cast<sc_attribute<HardwareComponent::DataType*>*>(signal->get_attribute("DataType"));

	convertedSignal<<"signal "<<signal->name()<<" : "<<translateType(type->value);
	return convertedSignal.str();
}

std::vector<sc_signal_resolved* > HardwareComponentConverterVHDL::getSignals(HardwareComponent *comp) {
	std::vector<sc_signal_resolved* > signals;
	std::vector<sc_object*> children = comp->get_child_objects();
	for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
		if ( std::string((*i)->kind())=="sc_signal_resolved")	{
			sc_signal_resolved* mptr = dynamic_cast<sc_signal_resolved*>(*i);
			signals.push_back(mptr);
		}
	}
	return signals;
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


std::vector<HardwareComponent* > HardwareComponentConverterVHDL::getChildModules(HardwareComponent *comp) {
	std::vector<HardwareComponent*> retVector;


	std::vector<sc_object*> children = comp->get_child_objects();
	for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
		if ( std::string((*i)->kind())=="sc_module")	{
			HardwareComponent* mptr = dynamic_cast<HardwareComponent*>(*i);
			retVector.push_back(mptr);
		}
	}

	return retVector;
}

/*returns the port of the given component that is connected with the given channel*/
sc_port_base* HardwareComponentConverterVHDL::getConnectedPort(sc_object* channel, sc_module* component){


	std::vector<sc_object*> children = component->get_child_objects();
//	cout << "testing to component "<<component->name()<< " with " << children.size() << " children"<<endl;
	for (std::vector<sc_object*>::iterator i = children.begin(); i != children.end(); i++) {
		if (std::string((*i)->kind())=="sc_in" || std::string((*i)->kind()) =="sc_out") {
			sc_port_base * port = dynamic_cast<sc_port_base*>(*i);
	//		cout<<" type for port "<< (*i)->name()<< " " <<std::string((*i)->kind())<<endl;
			if(port->get_interface() != NULL){
				sc_object * connectedChannel = dynamic_cast<sc_object*>(port->get_interface());
		//		std::cout<<"testing port "<<port->name()<<" that uses channel "<<connectedChannel->name()<<" to "<<channel->name()<<std::endl;
				if(channel->name() == connectedChannel->name() //connected through the same channel
					 and port->get_attribute("PortConnection") != NULL)
					return port;
			}
		}
	}
	return NULL;
}


std::string HardwareComponentConverterVHDL::translateDeclaration(HardwareComponent::HardwareComponentInfo* componentInfo){

	cout<<"generating declaration"<<endl;
	if(!componentInfo->componentDeclaration.empty())
		return componentInfo->componentDeclaration;


	stringstream componentDeclaration;
	componentDeclaration<<"generic ("<<endl;
	std::map<std::string, HardwareComponent::Param> paramTable = componentInfo->componentParameters;

	map<string, HardwareComponent::Param>::iterator lastParam = paramTable.end();
	lastParam --;
	for(map<string, HardwareComponent::Param>::iterator it = paramTable.begin(); it != paramTable.end(); it++){
		if (it == lastParam)
			componentDeclaration<<"\t"<<translateParam(&(it->second))<<endl;
		else
			componentDeclaration<<"\t"<<translateParam(&(it->second))<<";"<<endl;

	}
	componentDeclaration <<");"<<endl;

	componentDeclaration <<"port ("<<endl;

	std::vector< HardwareComponent::PortInfo > portsVector;
	for(map<string, HardwareComponent::PortInfo>::iterator it = componentInfo->inputs.begin(); it != componentInfo->inputs.end(); it++)
		portsVector.push_back(it->second);

	for(map<string, HardwareComponent::PortInfo>::iterator it = componentInfo->outputs.begin(); it != componentInfo->outputs.end(); it++)
		portsVector.push_back(it->second);


	vector< HardwareComponent::PortInfo>::iterator lastElement = portsVector.end();
	lastElement --;
	for(vector< HardwareComponent::PortInfo>::iterator it = portsVector.begin(); it != portsVector.end(); it++){
		if (it == lastElement)
			componentDeclaration<<"\t"<<translatePort(&(*it))<<endl;
		else
			componentDeclaration<<"\t"<<translatePort(&(*it))<<";"<<endl;

	}
	componentDeclaration <<");"<<endl;

	componentDeclaration <<"end "<<componentInfo->name<<";"<<endl<<endl;

	componentInfo->componentDeclaration = componentDeclaration.str();
	cout<<"generating declaration end"<<endl;

	return componentInfo->componentDeclaration;

}



void HardwareComponentConverterVHDL::buildTopComponentFile(string projectPath, HardwareComponent *topComponent){

		//topComponent->sc_get_curr_simcontext()->initialize(true);

    ofstream designFile;
    string fileLocation = projectPath+"/"+topComponent->name()+".vhdl";
		cout<<"generating vhdl to component "<<topComponent->name()<<" file :"<<fileLocation<<endl;
    designFile.open (fileLocation.c_str());
    designFile <<"-- This file was auto generated by the HardwareProjectXmlParser"<<endl<<endl;
    designFile <<"library ieee, combinationalLibrary;"<<endl;
    designFile <<"use ieee.std_logic_1164.all;"<<endl;
    designFile <<"use ieee.std_logic_unsigned.all;"<<endl<<endl;

		cout<<__FILE__<<"::"<<__LINE__<<endl;

		/* by default dont generate main entity with generics
    if(genericTable.size() > 0){
        designFile <<"generic ("<<endl;
        map<string, pair<string,string> >::iterator lastElement = genericTable.end();
        lastElement --;
        for(map<string, pair<string,string> >::iterator it = genericTable.begin(); it != lastElement; it++){
            if(it->second.second == "") //has no default value
                designFile <<"\t"<<it->first<<" : "<<it->second.first<<";"<<endl;
            else
                designFile <<"\t"<<it->first<<" : "<<it->second.first<<" := "<<it->second.second<<";"<<endl;
        }
        if(lastElement->second.second == "") //has no default value
                designFile <<"\t"<<lastElement->first<<" : "<<lastElement->second.first<<";"<<endl;
        else
            designFile <<"\t"<<lastElement->first<<" : "<<lastElement->second.first<<" := "<<lastElement->second.second<<endl;
        designFile <<");"<<endl;
    }

		*/
    /*generate the header of the entity with the input/outputs*/

    designFile <<"entity "<<topComponent->name()<<" is"<<endl; //TODO place the main tag name here
    designFile <<"port ("<<endl;
		
    std::map<std::string, HardwareComponent::PortInfo*> portsTable = topComponent->ports;

		map<string, HardwareComponent::PortInfo*>::iterator lastElement = portsTable.end();
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
		vector<sc_signal_resolved*> signals = getSignals(topComponent);
    for(vector<sc_signal_resolved*>::iterator it = signals.begin(); it!= signals.end(); it ++){
			string translation = translateSignal(*it);
			designFile<<translateSignal(*it)<<";"<<endl;
    }
		
    designFile<<"begin"<<endl;

    designFile <<"-- Architectural Declaration"<<endl<<endl;


		vector<HardwareComponent*> childModules = getChildModules(topComponent);


   
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

							sc_port_base *connectedPort = getConnectedPort(channel, topComponent);

							if( connectedPort != NULL){ //if any of the component's a port is connected to the current channel it is a direct connection
								cout<<"port "<<connectedPort->name() << " directly connected to "<<port->name()<<endl;
								portMap += port->basename();
							 	portMap += "->";
							  portMap += connectedPort->basename();
							  portMap += ",\n";

							}
							else{ //else it should be connected through a signal
								cout<<"port "<<port->name()<<" conneted through signal "<<channel->name()<<endl;

								portMap += port->basename();
							 	portMap += "->";
							  portMap += channel->basename();
							  portMap += ",\n";
							}
						}
					}
				}
				portMap = portMap.substr(0,portMap.size()-2);

				designFile << portMap<< endl;
				
				designFile << "); --"<<module->name()<<endl;

			}
		}


/*    for(vector< pair<string,string> >::iterator it = signalMaps.begin(); it!=signalMaps.end(); it++){
        designFile<<it->first<<" <= "<<it->second<<";"<<endl;
    }
*/
    designFile<<endl;



    designFile<<"end arch;"<<endl;
    
    designFile.close();
    cout<<"design file saved to "<<fileLocation<<endl;

}


