#include "HardwareProjectXmlParser.h"
#include "HardwareComponentXmlParser.h"
#include "HardwareComponent.h"

using namespace std;


HardwareProjectXmlParser::HardwareProjectXmlParser(){
	communicationHardwareXmlParser = new CommunicationHardwareXmlParser();
	hardwareComponentXmlParser = new HardwareComponentXmlParser();
}


void HardwareProjectXmlParser::parseHardwareProject(xmlNode *hardwareProjectNode){

	xmlNode *currentNode = NULL;
	xmlNode *communicationHardwareNode = NULL;

	xmlNode *defaultTopComponentNode = NULL;

	for (currentNode = hardwareProjectNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {
		if (currentNode->type == XML_ELEMENT_NODE) {
			if(xmlStrcmp(currentNode->name, (const xmlChar *)"reconfigurableRegion") == 0){
				xmlChar *regionNameChar = xmlGetProp(currentNode, (const xmlChar *)"name");
				string regionName = "";
				if(regionNameChar!=NULL){
					regionName = string((const char*)regionNameChar);
				}

				if( regionName != "") {

					/*search for the communicationHardware tag*/
					for (communicationHardwareNode = currentNode->xmlChildrenNode; communicationHardwareNode; communicationHardwareNode = communicationHardwareNode->next){
						if (xmlStrcmp(communicationHardwareNode->name, (const xmlChar *)"communicationHardware") == 0){	
							break;
						}
					}

					HardwareComponent *communicationHardware = communicationHardwareXmlParser->parseCommunicationHardwareNode(regionName,communicationHardwareNode);
					ReconfigurableRegion *region = new ReconfigurableRegion(regionName, communicationHardware);

					for (defaultTopComponentNode = currentNode->xmlChildrenNode; defaultTopComponentNode; defaultTopComponentNode = defaultTopComponentNode->next){
						if (xmlStrcmp(defaultTopComponentNode->name, (const xmlChar *)"defaultArchitecture") == 0){

							xmlChar *filePathChar = xmlGetProp(defaultTopComponentNode, (const xmlChar *)"file");
							std::string filePath = string((const char*)filePathChar);

							if(xmlStrcmp(filePathChar, (const xmlChar *)"") != 0){
								cout << "parsing default component for region "<<regionName<<endl; 
								cout << "default component file "<<filePath<<endl; 

								Architecture *defaultArch = hardwareComponentXmlParser->parseArchitectureFile(filePath, region);
								defaultArch->uid = 0; //default arch has always uid 0
								
								region->assignArchitecture(defaultArch);
								cout << "region default component parsing successfull"<<endl; 
							}
							break;
						}
					}
					loadedReconfigurableRegions[regionName] = region;

				}

			}
		}
	}
}


void HardwareProjectXmlParser::parseProjectXmlDescription(std::string xmlUri){
	xmlDoc         *doc = NULL;
	xmlNode        *root_element = NULL;


	doc = xmlReadFile(xmlUri.c_str(), NULL, 0);

	if (doc == NULL)
	{
		cout<<"error: could not parse file "<<xmlUri<<endl;
		cout<<"Lib xml error message:"<<endl<<(xmlGetLastError())->message<<endl;

	}
	else
	{

		root_element = xmlDocGetRootElement(doc);

		xmlNode *currentNode = NULL;

		for (currentNode = root_element; currentNode; currentNode = currentNode->next) {
			if (currentNode->type == XML_ELEMENT_NODE) {
				if(xmlStrcmp(currentNode->name, (const xmlChar *)"hardwareProject") == 0){					
					xmlChar *projectPathChar = xmlGetProp(currentNode, (const xmlChar *)"path");
					projectPath = "";
					if(projectPathChar!=NULL){
						projectPath = string((const char*)projectPathChar);
					}

					xmlChar *projectNameChar = xmlGetProp(currentNode, (const xmlChar *)"name");
					projectName = "";
					if(projectNameChar!=NULL){
						projectName = string((const char*)projectNameChar);
					}

					parseHardwareProject(currentNode);
				}
			}
		}

		xmlFreeDoc(doc);
		xmlCleanupParser();
	}


}


std::map<std::string, ReconfigurableRegion* > HardwareProjectXmlParser::getReconfigurableRegions(){
	return this->loadedReconfigurableRegions;
}

std::string HardwareProjectXmlParser::getProjectName(){
	return this->projectName;
}

std::string HardwareProjectXmlParser::getProjectPath(){
	return this->projectPath;
}
