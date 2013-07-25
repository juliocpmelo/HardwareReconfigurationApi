#include <iostream>
#include <vector>

using namespace std;


#include "HardwareComponentXmlParser.h"


class CommunicationHardwareXmlParser: public HardwareComponentParser
{
	public:
		/*variables*/
	public:
		/*methods*/
		CommunicationHardwareParser();
		/*
		 * parses the xml description of the communication hardware entity
		 * converting it into a HardwareComponent instance
		 */
		HardwareComponent* parseXml(std::string communicationHardwareXml);
		HardwareComponent* parseCommunicationHardwareNode(xmlNode *communicationHardwareNode);

};

CommunicationHardwareXmlParse::CommunicationHardwareParser(){}

HardwareComponent* CommunicationHardwareXmlParse::parseCommunicationHardwareNode(xmlNode *communicationHardwareNode){
	xmlNode *currentNode = NULL;

	HardwareComponent::HardwareComponentInfo* componentInfo = new HardwareComponent::HardwareComponentInfo();
	componentInfo->name = "CommunicationHardware";

	HardwareComponent::PortInfo clkPort{"commHardware_clk", HardwareComponent::DataType_bit, 1};

	for (currentNode = communicationHardwareNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {

		if(xmlStrcmp(currentNode->name, (const xmlChar *)"param") == 0){

			/*test if the name is add or data and create the corresponding constraints*/
			HardwareComponent::PortInfo info = parsePort(currentNode);
			componentInfo->inputs[inputNameStr] = info;

			HardwareComponent::PortInfo clkPort{"commHardware_addr", HardwareComponent::DataType_bit, 1};
			HardwareComponent::PortInfo clkPort{"commHardware_data", HardwareComponent::DataType_bit, 1};
		}

		else if(xmlStrcmp(currentNode->name, (const xmlChar *)"input") == 0){

			HardwareComponent::PortInfo info = parsePort(currentNode);
			componentInfo->outputs[outputNameStr] = info;
		}
		else if(xmlStrcmp(currentNode->name, (const xmlChar *)"output") == 0){

			HardwareComponent::PortInfo info = parsePort(currentNode);
			componentInfo->outputs[outputNameStr] = info;
		}

	}

	return new HardwareComponent(sc_name("communicationHardware_inst"), componentInfo);

}

HardwareComponent* CommunicationHardwareXmlParser::parseXml(std::string communicationHardwareXml){
	
	doc = xmlReadFile(communicationHardwareXml.c_str(), NULL, 0);

	map<string, HardwareComponent::HardwareComponentInfo*> retMap;

	HardwareComponent *component;

	if (doc == NULL)
	{
		cout<<"error: could not parse file "<<xmlProjectFile<<endl;
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


int main(int argc, char** argv){

	xmlDoc         *doc = NULL;
	xmlNode        *root_element = NULL;
	char workingDir[256];

	ofstream outFile;
	string fileLocation = string(argv[2])+"/"+topComponent->name()+".vhdl";
	cout<<"generating vhdl to component "<<topComponent->name()<<" file :"<<fileLocation<<endl;
	outFile.open (fileLocation.c_str());

	

	CommunicationHardwareXmlParser * parser = new CommunicationHardwareXmlParser();
	HardwareComponent* communicationHardwareComponent = parser->parseXml(arg[1]);


	outFile <<"component "<<communicationHardwareComponent->name()<<" is"<<endl; //TODO place the main tag name here
	outFile <<"port ("<<endl;

	std::map<std::string, HardwareComponent::PortInfo*> portsTable = topComponent->ports;

	map<string, HardwareComponent::PortInfo*>::iterator lastElement = portsTable.end();
	lastElement --;
	for(map<string, HardwareComponent::PortInfo*>::iterator it = portsTable.begin(); it != portsTable.end(); it++){
		if (it == lastElement)
			outFile<<translatePort(it->second)<<endl;
		else
			outFile<<translatePort(it->second)<<";"<<endl;

	}
	outFile <<");"<<endl;

	outFile <<"end "<<topComponent->name()<<";"<<endl<<endl;

	outFile<<"architecture arch of "<<topComponent->name()<<" is"<<endl;

	outFile <<"-- Component Declaration"<<endl<<endl;
	set<HardwareComponent::HardwareComponentInfo*> usedComponentsInfo = getUsedComponents(topComponent);
	/*generate the component declaration in the architecture file*/
	for(set<HardwareComponent::HardwareComponentInfo*>::iterator it = usedComponentsInfo.begin(); it!= usedComponentsInfo.end(); it ++){
		outFile<<(*it)->componentDeclaration<<endl;

	}

}
