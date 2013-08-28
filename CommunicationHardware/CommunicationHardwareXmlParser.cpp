#include "CommunicationHardwareXmlParser.h"

using namespace std;

CommunicationHardwareXmlParser::CommunicationHardwareXmlParser(){
}


HardwareComponent* CommunicationHardwareXmlParser::parseCommunicationHardwareNode(xmlNode *communicationHardwareNode){
	xmlNode *currentNode = NULL;

	HardwareComponent::HardwareComponentInfo* componentInfo = new HardwareComponent::HardwareComponentInfo();
	componentInfo->name = "CommunicationHardware";


	for (currentNode = communicationHardwareNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {

		if(xmlStrcmp(currentNode->name, (const xmlChar *)"param") == 0){
			
			/*test if the name is add or data and create the corresponding constraints*/
			HardwareComponent::ParamInfo info = parseParam(currentNode);
			componentInfo->componentParameters[info.name] = info;
		}

		else if(xmlStrcmp(currentNode->name, (const xmlChar *)"input") == 0){

			HardwareComponent::PortInfo info = parsePort(currentNode);
			componentInfo->outputs[info.name] = info;
		}
		else if(xmlStrcmp(currentNode->name, (const xmlChar *)"output") == 0){
			HardwareComponent::PortInfo info = parsePort(currentNode);
			componentInfo->outputs[info.name] = info;
		}
	}

	/*define dataWidth and addressWidth if the user didnt*/
	if (componentInfo->componentParameters.count("commHardware_dataWidth") == 0){
		HardwareComponent::ParamInfo info = {"commHardware_dataWidth", INTEGER_TYPE("","",""), "32"};
		componentInfo->componentParameters[info.name] = info;	
	}
	if (componentInfo->componentParameters.count("commHardware_addressWidth") == 0){
		HardwareComponent::ParamInfo info = {"commHardware_addressWidth", INTEGER_TYPE("","",""), "32"};
		componentInfo->componentParameters[info.name] = info;
	}

	/*ovewrite possible user-defined inputs*/
	HardwareComponent::PortInfo dataPort = {"commHardware_data", VECTOR_TYPE("commHardware_dataWidth", "downto", "0")};
	componentInfo->inputs[dataPort.name] = dataPort;
	HardwareComponent::PortInfo addressPort = {"commHardware_address", VECTOR_TYPE("commHardware_addressWidth", "downto", "0")};
	componentInfo->inputs[addressPort.name] = addressPort;
	
	HardwareComponent::PortInfo clkPort = {"commHardware_clk", BIT_TYPE};
	componentInfo->inputs[clkPort.name] = clkPort;
		

	return new HardwareComponent(sc_module_name("communicationHardware_inst"), componentInfo);

}

HardwareComponent* CommunicationHardwareXmlParser::parseXml(std::string communicationHardwareXml){
	
	xmlDoc         *doc = NULL;
	xmlNode        *root_element = NULL;
	doc = xmlReadFile(communicationHardwareXml.c_str(), NULL, 0);

	map<string, HardwareComponent::HardwareComponentInfo*> retMapi;

	HardwareComponent *component;

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
					component = parseCommunicationHardwareNode(currentNode);
				}
			}
		}
	}
	return component;

}

