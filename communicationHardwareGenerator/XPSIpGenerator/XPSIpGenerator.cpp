#include <iostream>
#include <vector>

using namespace std;


#include "HardwareComponentXmlParser.h"
#include "HardwareComponentConverterVHDL.h"

#include <systemc>


class CommunicationHardwareXmlParser : public HardwareComponentXmlParser
{
	public:
		/*variables*/
	public:
		/*methods*/
		CommunicationHardwareXmlParser();
		/*
		 * parses the xml description of the communication hardware entity
		 * converting it into a HardwareComponent instance
		 */

		HardwareComponent* parseXml(std::string communicationHardwareXml);
		HardwareComponent* parseCommunicationHardwareNode(xmlNode *communicationHardwareNode);

};


class CommunicationHardwareConverterVHDL : public HardwareComponentConverterVHDL
{
	public:
		/*variables*/
	public:
		/*methods*/
		CommunicationHardwareConverterVHDL();
		/*
		 * !brief generates a .vhl output containing a component description of the specific
		 * communication hardware given as argument.
		 * !param componentPath path to put the component declaration
		 * !param communicationHardware instance of a communication hardware
		 */
		void buildComponentDescription(std::string componentPath, HardwareComponent* communicationHardware);
};

CommunicationHardwareXmlParser::CommunicationHardwareXmlParser(){}


HardwareComponent* CommunicationHardwareXmlParser::parseCommunicationHardwareNode(xmlNode *communicationHardwareNode){
	xmlNode *currentNode = NULL;

	HardwareComponent::HardwareComponentInfo* componentInfo = new HardwareComponent::HardwareComponentInfo();
	componentInfo->name = "CommunicationHardware";


	for (currentNode = communicationHardwareNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {

	cout<<__FILE__<<"::"<<__LINE__<<endl;
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

	cout<<__FILE__<<"::"<<__LINE__<<endl;
	/*define dataWidth and addressWidth if the user didnt*/
	if (componentInfo->componentParameters.count("commHardware_dataWidth") == 0){
		HardwareComponent::ParamInfo info = {"commHardware_dataWidth", HardwareComponent::DataType_integer, 32, "32"};
		componentInfo->componentParameters[info.name] = info;	
	}
	cout<<__FILE__<<"::"<<__LINE__<<endl;
	if (componentInfo->componentParameters.count("commHardware_addressWidth") == 0){
		HardwareComponent::ParamInfo info = {"commHardware_addressWidth", HardwareComponent::DataType_integer, 32, "32"};
		componentInfo->componentParameters[info.name] = info;
	}

	/*ovewrite possible user-defined inputs*/
	HardwareComponent::PortInfo dataPort = {"commHardware_data", HardwareComponent::DataType_vector, 32};
	componentInfo->inputs[dataPort.name] = dataPort;
	HardwareComponent::PortInfo addressPort = {"commHardware_address", HardwareComponent::DataType_vector, 32};
	componentInfo->inputs[addressPort.name] = addressPort;
	
	HardwareComponent::PortInfo clkPort = {"commHardware_clk", HardwareComponent::DataType_bit, 1};
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


CommunicationHardwareConverterVHDL::CommunicationHardwareConverterVHDL(){}

void CommunicationHardwareConverterVHDL::buildComponentDescription(std::string componentPath, HardwareComponent* communicationHardwareComponent){
	
	ofstream outFile;
	string fileLocation = string(componentPath);
	cout<<"generating vhdl to component "<<endl;
	outFile.open (fileLocation.c_str());

	outFile <<"component "<<communicationHardwareComponent->componentInfo->name<<" is"<<endl; //TODO place the main tag name here
	outFile <<"port ("<<endl;

	std::map<std::string, HardwareComponent::PortInfo*> portsTable = communicationHardwareComponent->ports;

	map<string, HardwareComponent::PortInfo*>::iterator lastElement = portsTable.end();
	lastElement --;
	for(map<string, HardwareComponent::PortInfo*>::iterator it = portsTable.begin(); it != portsTable.end(); it++){
		if (it == lastElement)
			outFile<<translatePort(it->second)<<endl;
		else
			outFile<<translatePort(it->second)<<";"<<endl;

	}
	outFile <<");"<<endl;

	outFile <<"end "<<communicationHardwareComponent->componentInfo->name<<";"<<endl<<endl;

	outFile <<"-- Component Declaration"<<endl<<endl;

	outFile.close();

}


/*
 * IP generation
 * argv[1] : communication hardware xml description file
 * argv[2] : output file location
 */
int main(int argc, char** argv){

	char workingDir[256];


	cout<<"parsing file"<<argv[1]<<endl;
	CommunicationHardwareXmlParser * parser = new CommunicationHardwareXmlParser();
	HardwareComponent* communicationHardwareComponent = parser->parseXml(string(argv[1]));

	CommunicationHardwareConverterVHDL *converter = new CommunicationHardwareConverterVHDL();

	cout<<"parsing to file"<<argv[2]<<endl;
	converter->buildComponentDescription(string(argv[2]), communicationHardwareComponent);
	
}
