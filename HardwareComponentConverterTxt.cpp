#include "HardwareComponentConverterTxt.h"

#include <sstream>
#include <map>
#include <deque>

using namespace std;


HardwareComponentConverterTxt::HardwareComponentConverterTxt(){}


std::string HardwareComponentConverterTxt::translateType(HardwareComponent::DataType *type){
	stringstream convertedType;
	switch (type->id){
		case HardwareComponent::DataTypeId_vector:{
			string startIndex = ((HardwareComponent::VectorType*) type)->startIndex;
			string endIndex = ((HardwareComponent::VectorType*) type)->endIndex;
			string operation = ((HardwareComponent::VectorType*) type)->indexOperator;
			convertedType<<"vector ("<<startIndex<<" ... "<<endIndex<<")";
			break;
		}
		case HardwareComponent::DataTypeId_bit:{
			convertedType<<"logic";
			break;
		}
		case HardwareComponent::DataTypeId_integer:{
			string rangeStart = ((HardwareComponent::IntegerType*) type)->rangeStart;
			string rangeEnd = ((HardwareComponent::IntegerType*) type)->rangeEnd;
			string rangeOperation = ((HardwareComponent::IntegerType*) type)->rangeOperator;
			/*TODO think about integer range*/
			if(rangeStart != "")
				convertedType<<"integer ("<<rangeStart<<" ... "<<rangeEnd<<")";
			else
				convertedType<<"integer";
			break;

		}
		default:
			cout<<"type not supported"<<endl;

	}
	return convertedType.str();
}


std::string HardwareComponentConverterTxt::translatePort(HardwareComponent::PortInfo* portInfo){
	
	stringstream convertedPort;

	if(portInfo->portType == HardwareComponent::PortType_in){
		convertedPort<<"port "<<portInfo->name<<" in ";
		string typeStr = translateType(portInfo->type);
		convertedPort<<typeStr;
	}
	else if(portInfo->portType == HardwareComponent::PortType_out){
		convertedPort<<"port "<<portInfo->name<<" out ";
		string typeStr = translateType(portInfo->type);
		convertedPort<<typeStr;
	}
	else if(portInfo->portType == HardwareComponent::PortType_inout){
		convertedPort<<"port "<<portInfo->name<<" inout ";
		string typeStr = translateType(portInfo->type);
		convertedPort<<typeStr;
	}
//	cout<<" converted to "<<convertedPort.str()<<endl;

	return convertedPort.str();
}

std::string HardwareComponentConverterTxt::translateSignal(sc_signal_resolved *signal){ 
	stringstream convertedSignal;
	
	sc_attribute<HardwareComponent::DataType*> *type = dynamic_cast<sc_attribute<HardwareComponent::DataType*>*>(signal->get_attribute("DataType"));

	if (type) 
		convertedSignal<<"signal "<<signal->name()<<" "<<translateType(type->value);
	else
		convertedSignal<<"signal "<<signal->name()<<" null";

	return convertedSignal.str();
}

std::set<HardwareComponent::HardwareComponentInfo* > HardwareComponentConverterTxt::getUsedComponents(HardwareComponent *comp) {
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

std::string HardwareComponentConverterTxt::translateDeclaration(HardwareComponent::HardwareComponentInfo* componentInfo){
	
	stringstream componentDeclaration;

	componentDeclaration << "component " << componentInfo->name << endl;

	std::map<std::string, HardwareComponent::Param> paramTable = componentInfo->componentParameters;

	/*only add the generic keyword when there are any generics declared*/
	for(map<string, HardwareComponent::Param>::iterator it = paramTable.begin(); it != paramTable.end(); it++){
		componentDeclaration<<translateParam(&(it->second))<<endl;
	}


	std::vector< HardwareComponent::PortInfo > portsVector;
	for(map<string, HardwareComponent::PortInfo>::iterator it = componentInfo->inputs.begin(); it != componentInfo->inputs.end(); it++)
		portsVector.push_back(it->second);

	for(map<string, HardwareComponent::PortInfo>::iterator it = componentInfo->outputs.begin(); it != componentInfo->outputs.end(); it++)
		portsVector.push_back(it->second);

	for(vector< HardwareComponent::PortInfo>::iterator it = portsVector.begin(); it != portsVector.end(); it++){
		componentDeclaration<<translatePort(&(*it))<<endl;
	}
	
	componentDeclaration <<"endComponent "<<componentInfo->name;

	cout<<"generating declaration end"<<endl;

	return componentDeclaration.str();

}

void HardwareComponentConverterTxt::buildReconfRegionsDescriptionFile(std::string path, std::string projectName, ReconfigurableRegion *region){
	ofstream txtFile;
	string fileLocation = path + "/" + projectName +".cfg";
	
	txtFile.open (fileLocation.c_str(), std::ofstream::out | std::ofstream::app);
	
	txtFile<< "reconfigurableRegion " << region->name << endl;
	
	Architecture *arch = region->getAssignedArchitecture();

	txtFile<< "architecture " << arch->uid << " " <<arch->regionName <<endl;
	txtFile.close();

	if(region->getAssignedTopComponent())
		buildTopComponentFile(fileLocation, region->getAssignedTopComponent());
	

	txtFile.open (fileLocation.c_str(), std::ofstream::out | std::ofstream::app);
	txtFile<< "endArchitecture " << arch->uid << " " <<arch->regionName <<endl;

	txtFile<< "endReconfigurableRegion " << region->name <<endl;
	txtFile.close();
 
  cout<<"description file saved to "<<fileLocation<<endl;
}

std::string translateCommunicationTable(Architecture *arch){
	set<string> swAccessibleInterfaces;
	if (arch->topComponent)
		swAccessibleInterfaces = arch->topComponent->softwareAccessiblePorts;

	stringstream communicationTable;
	int interfaceIndex = 0;
	for(set<string>::iterator it = swAccessibleInterfaces.begin(); it!= swAccessibleInterfaces.end(); it ++){
		communicationTable<<(*it)<<" "<<interfaceIndex<<endl;
		interfaceIndex ++;
	}
	return communicationTable.str();
}

std::string HardwareComponentConverterTxt::buildArchitectureDescriptionFile(std::string path, Architecture *arch){
	ofstream txtFile;
	stringstream fileLocationss;
	fileLocationss << path << "/"<< arch->regionName << arch->uid<<".cfg";
	string fileLocation = fileLocationss.str();
	
	txtFile.open (fileLocation.c_str(), std::ofstream::out); //overwrite existing archs with the same uid
	
	txtFile<< "architecture " << arch->uid << " " <<arch->regionName <<endl;
	txtFile<< "communicationTable" <<endl;
	txtFile<< translateCommunicationTable(arch);
	txtFile<< "endCommunicationTable" <<endl;
	txtFile.close();

	if(arch->topComponent)
		buildTopComponentFile(fileLocation, arch->topComponent);
	

	txtFile.open (fileLocation.c_str(), std::ofstream::out | std::ofstream::app);
	txtFile<< "endArchitecture " << arch->uid << " " <<arch->regionName <<endl;

	txtFile.close();
 
  cout<<"description file saved to "<<fileLocation<<endl;
	return fileLocation;
}

void HardwareComponentConverterTxt::buildTopComponentFile(std::string filePath, HardwareComponent *topComponent){

	ofstream txtFile;
  
	txtFile.open (filePath.c_str(),  std::ofstream::out | std::ofstream::app);


	/*top component declaration*/
  txtFile<<"component "<<topComponent->name() <<endl; //TODO place the main tag name here
	std::map<std::string, HardwareComponent::PortInfo*> portsTable = topComponent->ports;

	for(map<string, HardwareComponent::PortInfo*>::iterator it = portsTable.begin(); it != portsTable.end(); it++){
		txtFile<<translatePort(it->second)<<endl;
	}
	txtFile<<"endComponent "<<topComponent->name()<<endl; //TODO place the main tag name here
	
	
	/*secondary component declaration*/
	set<HardwareComponent::HardwareComponentInfo*> usedComponentsInfo = getUsedComponents(topComponent);
	
	for(set<HardwareComponent::HardwareComponentInfo*>::iterator it = usedComponentsInfo.begin(); it!= usedComponentsInfo.end(); it ++){
    	txtFile<<translateDeclaration(*it)<<endl;
  }

	/*signal declaration*/
	set<sc_signal_resolved*> signals = topComponent->getSignals();
	for(set<sc_signal_resolved*>::iterator it = signals.begin(); it!= signals.end(); it ++){
		cout<<"translate signal "<<(*it)->name()<<endl; 
		string translation = translateSignal(*it);
		txtFile<<translateSignal(*it)<<endl;
	}

	/*binds*/

	
	vector<HardwareComponent*> childModules = topComponent->getChildModules();

	for (vector<HardwareComponent*>::iterator it = childModules.begin(); it != childModules.end(); it++){
		if(std::string((*it)->kind()) == "sc_module"){

			HardwareComponent *module = (HardwareComponent*) (*it);
			txtFile <<"instance "<< module->name() << " " << module->componentInfo->name<<endl;

			std::vector<sc_object*> children = module->get_child_objects();



			string portMap = "";
			for (std::vector<sc_object*>::iterator it2 = children.begin(); it2 != children.end(); it2++) {
				if (std::string((*it2)->kind()) =="sc_in" || 
						std::string((*it2)->kind()) =="sc_out" ||
						std::string((*it2)->kind()) =="sc_inout") {
					sc_port_base * port = dynamic_cast<sc_port_base*>(*it2);

					if(port->get_interface() != NULL){
						sc_object * channel = dynamic_cast<sc_object*>(port->get_interface());

						sc_port_base *connectedPort = topComponent->getConnectedPort(channel);
						//if any of the component's a port is connected to the current channel it is a direct connection
						if( connectedPort != NULL){
							portMap += string("bind ") + module->name();
							portMap += string(" ") + port->basename();
							portMap += string(" ") + topComponent->name();
							portMap += string(" ") + connectedPort->basename();
							portMap += "\n";

						}
						else{ //else it should be connected through a signal

							portMap += string("signalBind ") + module->name();
							portMap += string(" ") + port->basename();
							portMap += string(" ") + channel->basename();
							portMap += "\n";
						}
					}
				}
			}
			txtFile << portMap;
		}
	}

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
					txtFile << "signalBind " << topComponent->name()<< " "<< port->basename() 
									<< " " << channel->name() << endl;
				}
			}
		}
	}



	txtFile.close();
}

std::string HardwareComponentConverterTxt::translateParam(HardwareComponent::Param* paramInfo){
	stringstream convertedParam;
//	cout<<" processing to "<<paramInfo->name<<endl;
	
	convertedParam<<"param "<<paramInfo->name<<" ";
	switch (paramInfo->type->id){
		case HardwareComponent::DataTypeId_integer:{
			 /*TODO think about integer range*/
			 convertedParam<<" integer";
			 break;
		}
		case HardwareComponent::DataTypeId_string:{
			 /*TODO think about integer range*/
			 convertedParam<<" string";
			 break;
		}
		default:
			 convertedParam<<" integer";
	}
	if(paramInfo->defaultValue != ""){
		convertedParam<<" default "<<paramInfo->defaultValue;
	}

	return convertedParam.str();
}

std::string getNameForHardwareComponentFile(std::string projectPath, HardwareComponent *topComponent){return "";}


