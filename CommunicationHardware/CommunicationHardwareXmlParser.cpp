#include "CommunicationHardwareXmlParser.h"

using namespace std;

CommunicationHardwareXmlParser::CommunicationHardwareXmlParser(){
}


HardwareComponent* CommunicationHardwareXmlParser::parseCommunicationHardwareNode(std::string reconfigurableRegionName, xmlNode *communicationHardwareNode){
	xmlNode *currentNode = NULL;

	HardwareComponent::HardwareComponentInfo* componentInfo = new HardwareComponent::HardwareComponentInfo();
	componentInfo->name = reconfigurableRegionName + "_communicationHardware";


	for (currentNode = communicationHardwareNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {

		if(xmlStrcmp(currentNode->name, (const xmlChar *)"param") == 0){
			
			/*test if the name is add or data and create the corresponding constraints*/
			HardwareComponent::Param info = parseParam(currentNode);
			componentInfo->componentParameters[info.name] = info;
		}

		else if(xmlStrcmp(currentNode->name, (const xmlChar *)"input") == 0){
			HardwareComponent::PortInfo info = parsePort(currentNode);
			info.portType = HardwareComponent::PortType_in;
			componentInfo->inputs[info.name] = info;
		}
		else if(xmlStrcmp(currentNode->name, (const xmlChar *)"output") == 0){
			HardwareComponent::PortInfo info = parsePort(currentNode);
			info.portType = HardwareComponent::PortType_out;
			componentInfo->outputs[info.name] = info;
		}
	}

	/*define dataWidth and addressWidth if the user didnt*/
	if (componentInfo->componentParameters.count("commHardware_dataWidth") == 0){
		HardwareComponent::Param info = {"commHardware_dataWidth", INTEGER_TYPE("","",""),"32","32"};
		componentInfo->componentParameters[info.name] = info;	
	}
	if (componentInfo->componentParameters.count("commHardware_addressWidth") == 0){
		HardwareComponent::Param info = {"commHardware_addressWidth", INTEGER_TYPE("","",""),"32","32"};
		componentInfo->componentParameters[info.name] = info;
	}

	/*ovewrite possible user-defined inputs*/

	HardwareComponent::PortInfo dataInPort = {"commHardware_dataIn", VECTOR_TYPE("commHardware_dataWidth - 1", "downto", "0"), HardwareComponent::PortType_in, NULL};
	componentInfo->inputs[dataInPort.name] = dataInPort;

	HardwareComponent::PortInfo dataOutPort = {"commHardware_dataOut", VECTOR_TYPE("commHardware_dataWidth - 1", "downto", "0"), HardwareComponent::PortType_out, NULL};
	componentInfo->outputs[dataOutPort.name] = dataOutPort;

	HardwareComponent::PortInfo addressPort = {"commHardware_address", VECTOR_TYPE("commHardware_addressWidth - 1", "downto", "0"), HardwareComponent::PortType_in, NULL};
	componentInfo->inputs[addressPort.name] = addressPort;
		
	HardwareComponent::PortInfo clkPort = {"commHardware_clk", BIT_TYPE};
	componentInfo->inputs[clkPort.name] = clkPort;
		

	string moduleName = reconfigurableRegionName + "_communicationHardware"; 
	return new HardwareComponent(sc_module_name(moduleName.c_str()), componentInfo);

}

HardwareComponent* CommunicationHardwareXmlParser::parseXml(std::string communicationHardwareXml){
	
	xmlDoc         *doc = NULL;
	xmlNode        *root_element = NULL;
	doc = xmlReadFile(communicationHardwareXml.c_str(), NULL, 0);

	map<string, HardwareComponent::HardwareComponentInfo*> retMapi;

	HardwareComponent *component;

	/*TODO update to the new xml format*/
	if (doc == NULL)
	{
		cout<<"error: could not parse file "<<communicationHardwareXml<<endl;
	}
	else
	{

		root_element = xmlDocGetRootElement(doc);

		xmlNode *currentNode = NULL;

		for (currentNode = root_element; currentNode; currentNode = currentNode->next) {
			if (currentNode->type == XML_ELEMENT_NODE) {
				if(xmlStrcmp(currentNode->name, (const xmlChar *)"communicationHardware") == 0){
					component = parseCommunicationHardwareNode("", currentNode);
				}
			}
		}
	}
	return component;

}

