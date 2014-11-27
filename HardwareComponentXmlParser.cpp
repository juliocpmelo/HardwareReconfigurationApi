#include "HardwareComponentXmlParser.h"
#include "ComponentDatabase.h"
#include <sstream>
#include <fstream>

using namespace std;

HardwareComponentXmlParser::HardwareComponentXmlParser(){
//    this->xmlProjectFile = xmlProjectFile;
}


HardwareComponent::DataType* HardwareComponentXmlParser::parseType(xmlNode * typeNode){

	xmlChar *typeChar = xmlGetProp(typeNode, (const xmlChar *)"type");
	HardwareComponent::DataType * type;

	if(xmlStrcmp(typeChar,(const xmlChar*) "bit") == 0)
		type = new HardwareComponent::DataType(HardwareComponent::DataTypeId_bit);
	else if(xmlStrcmp(typeChar,(const xmlChar*) "vector") == 0){
		
		/*start and end values are strings, thus the description is able to use the params*/
		xmlChar *startIndexChar = xmlGetProp(typeNode, (const xmlChar *)"startIndex");
		string startIndex;
		if(startIndexChar != NULL)
			startIndex = string((const char*)startIndexChar);
		else
			startIndex = "1";

		/*operator could be downto, upto or to*/
		xmlChar *vectorIndexOperationChar = xmlGetProp(typeNode, (const xmlChar *)"op");
		string vectorIndexOperation;
		if(vectorIndexOperationChar != NULL)
			vectorIndexOperation = string((const char*)vectorIndexOperationChar);
		else
			vectorIndexOperation = "downto";

		xmlChar *endIndexChar = xmlGetProp(typeNode, (const xmlChar *)"endIndex");
		string endIndex;
		if(endIndexChar != NULL)
			endIndex = string((const char*)endIndexChar);
		else
			endIndex = "0";

		cout<<"creating vector type "<<startIndex<<" "<<endIndex<<" "<<vectorIndexOperation<<endl;
		type = new HardwareComponent::VectorType(startIndex,endIndex,vectorIndexOperation);

	}
	else if(xmlStrcmp(typeChar,(const xmlChar*) "integer") == 0){
		/*start and end values are strings, thus the description is able to use the params*/
		xmlChar *rangeStartChar = xmlGetProp(typeNode, (const xmlChar *)"rangeStart");
		string rangeStart;
		if(rangeStartChar != NULL)
			rangeStart = atoi((const char*)rangeStartChar);
		else
			rangeStart = "1";

		/*operator could be downto, upto or to*/
		xmlChar *rangeOperationChar = xmlGetProp(typeNode, (const xmlChar *)"rangeOp");
		string rangeOperation;
		if(rangeOperationChar != NULL)
			rangeOperation = atoi((const char*)rangeOperationChar);
		else
			rangeOperation = "downto";

		xmlChar *rangeEndChar = xmlGetProp(typeNode, (const xmlChar *)"rangeEnd");
		string rangeEnd;
		if(rangeEndChar != NULL)
			rangeEnd = atoi((const char*)rangeEndChar);
		else
			rangeEnd = "0";

		type = new HardwareComponent::IntegerType(rangeStart,rangeEnd,rangeOperation);
	}
	else
		type = new HardwareComponent::DataType(HardwareComponent::DataTypeId_bit);

	return type;
}

HardwareComponent::PortInfo HardwareComponentXmlParser::parsePort(xmlNode * portNode){
	xmlChar *portName = xmlGetProp(portNode, (const xmlChar *)"name");
	string portNameStr((const char*)portName);

	HardwareComponent::DataType *portType  = parseType(portNode);

	HardwareComponent::PortInfo info = {portNameStr, portType, HardwareComponent::PortType_in, NULL};
	
	return info;
}


HardwareComponent::Param HardwareComponentXmlParser::parseParam(xmlNode * paramNode){

	xmlChar *paramName = xmlGetProp(paramNode, (const xmlChar *)"name");
	string paramNameStr((const char*)paramName);
	cout<<"param tag name "<<paramNameStr<<endl;

	xmlChar *paramTypeChar = xmlGetProp(paramNode, (const xmlChar *)"type");
	HardwareComponent::DataType *paramType  = NULL;

	
	if(xmlStrcmp(paramTypeChar,(const xmlChar*) "integer") == 0)
		paramType = new HardwareComponent::IntegerType("","","");
	else if(xmlStrcmp(paramTypeChar,(const xmlChar*) "string") == 0)
		paramType = new HardwareComponent::DataType(HardwareComponent::DataTypeId_string);
	else
		paramType = new HardwareComponent::IntegerType("","","");


	xmlChar *paramDefaultValue = xmlGetProp(paramNode, (const xmlChar *)"defaultValue");
	string paramDefaultValueStr = "";
	if(paramDefaultValue != NULL){
		paramDefaultValueStr = string((const char*)paramDefaultValue);
	}
	
	HardwareComponent::Param info = {paramNameStr, paramType, paramDefaultValueStr, paramDefaultValueStr};

	return info;

}





/*obs : not using xmlFree as it results in a compilation bug because of the libxml2 compiled for windows*/
std::map<std::string, HardwareComponent::HardwareComponentInfo*> HardwareComponentXmlParser::parseComponentBase(xmlNode * componentBaseNode){
    xmlNode *componentNode = NULL;
		map<string, HardwareComponent::HardwareComponentInfo*> loadedComponents;
		for(componentNode = componentBaseNode->xmlChildrenNode; componentNode; componentNode = componentNode->next){
			HardwareComponent::HardwareComponentInfo *componentInfo = NULL;
			if (componentNode->type == XML_ELEMENT_NODE &&
					xmlStrcmp(componentNode->name, (const xmlChar*)"component") == 0) {
				
				componentInfo = new HardwareComponent::HardwareComponentInfo();
				xmlChar *name = xmlGetProp(componentNode, (const xmlChar *)"name");
				string nameStr((const char*)name);
				componentInfo->name = nameStr;

				xmlChar *file = xmlGetProp(componentNode, (const xmlChar *)"file");
				string fileStr = "";
				if(file!=NULL){
					fileStr = string((const char*)file);
					componentInfo->dependencyFiles.insert(fileStr);
				}

				loadedComponents[nameStr] = componentInfo;

				xmlNode *currentNode = NULL;
				for (currentNode = componentNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {
					if (currentNode->type == XML_ELEMENT_NODE) {
						if(xmlStrcmp(currentNode->name, (const xmlChar *)"param") == 0){

							HardwareComponent::Param param = parseParam(currentNode);
							componentInfo->componentParameters[param.name] = param;

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
						else if(xmlStrcmp(currentNode->name, (const xmlChar *)"dependency") == 0){
							xmlChar *file = xmlGetProp(currentNode, (const xmlChar *)"file");
							fileStr = "";
							if(file!=NULL){
								fileStr = string((const char*)file);
								dependencyFiles.insert(fileStr);
							}
							componentInfo->dependencyFiles.insert(fileStr);
						}
						else if(xmlStrcmp(currentNode->name, (const xmlChar *)"declaration") == 0){
							if (xmlHasProp(currentNode, (const xmlChar *)"file")){ //declaration in a file
								/*get the file string and fill the component declaration string*/
							}
							else{ //declaration as string
								xmlNode *textNode = NULL;
								for(textNode = currentNode->xmlChildrenNode; textNode; textNode = textNode->next){
									if (textNode->type == XML_TEXT_NODE) {
										xmlChar *declaration = textNode->content;
										string declarationStr = "";
										if(declaration!=NULL){
											componentInfo->componentDeclaration = string((const char*)declaration);
											break;
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return loadedComponents;
   // xmlFree(type);
   // xmlChar *header = xmlGetProp(componentNode, (const xmlChar *)"header");
   // cout<<"header "<<header<<endl;
   // xmlFree(header);
   // xmlChar *lib = xmlGetProp(componentNode, (const xmlChar *)"lib");
   // cout<<"lib "<<lib<<endl;
   // xmlFree(lib);
}


void HardwareComponentXmlParser::parseOutput(xmlNode * componentNode){
    xmlChar *outputName = xmlGetProp(componentNode, (const xmlChar *)"name");
    string outputNameStr((const char*)outputName);
    cout<<"output name "<<outputNameStr<<endl;
   // xmlFree(name);
    xmlChar *type = xmlGetProp(componentNode, (const xmlChar *)"type");
    string typeStr;
    if(type != NULL)
        typeStr = string((const char*)type);
    else
        typeStr = "std_logic";
    cout<<"output type "<<typeStr<<endl;
    outputTable[outputNameStr] = typeStr;
}

void HardwareComponentXmlParser::parseInput(xmlNode * componentNode){
    xmlChar *inputName = xmlGetProp(componentNode, (const xmlChar *)"name");
    string inputNameStr((const char*)inputName);
    cout<<"input name "<<inputNameStr<<endl;
   // xmlFree(name);
    xmlChar *type = xmlGetProp(componentNode, (const xmlChar *)"type");
    string typeStr;
    if(type != NULL)
        typeStr = string((const char*)type);
    else
        typeStr = "std_logic";
    
    inputTable[inputNameStr] = typeStr;
}

void HardwareComponentXmlParser::parseGeneric(xmlNode * componentNode){
    xmlChar *genericName = xmlGetProp(componentNode, (const xmlChar *)"name");
    string genericNameStr((const char*)genericName);
    cout<<"generic name "<<genericNameStr<<endl;
   // xmlFree(name);
    xmlChar *type = xmlGetProp(componentNode, (const xmlChar *)"type");
    string typeStr = "";
    if(type != NULL){
        typeStr = string((const char*)type);    
    }
    else
        typeStr = "integer";

    xmlChar *defaultValue = xmlGetProp(componentNode, (const xmlChar *)"defaultValue");
    string defaultValueStr = "";
    if(defaultValue != NULL){
        defaultValueStr = string((const char*)defaultValue);    
    }
    pair<string,string> v(typeStr,defaultValueStr);
    genericTable[genericNameStr] = v;
}

void HardwareComponentXmlParser::parseInstance(xmlNode * componentNode){
    xmlChar *instanceName = xmlGetProp(componentNode, (const xmlChar *)"name");
    string instanceNameStr((const char*)instanceName);
    cout<<"instance name "<<instanceNameStr<<endl;

    xmlChar *instanceType = xmlGetProp(componentNode, (const xmlChar *)"type");
    string instanceTypeStr((const char*)instanceType);
    cout<<"instance type "<<instanceTypeStr<<endl;

    xmlNode *currentNode = NULL;
    vector<pair<string,string> > genericMaps;
    vector<pair<string,string> > portMaps;
    for (currentNode = componentNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {
        if (currentNode->type == XML_ELEMENT_NODE) {
            if(xmlStrcmp(currentNode->name, (const xmlChar *)"genericMap") == 0){
                xmlChar *genericName = xmlGetProp(currentNode, (const xmlChar *)"genericName");
                string genericNameStr = "";
                if(genericName != NULL)
                    genericNameStr = string((const char*)genericName);
                
                xmlChar *value = xmlGetProp(currentNode, (const xmlChar *)"value");
                string valueStr = "";
                valueStr = string((const char*)value);
                pair<string,string> v(genericNameStr,valueStr);
                genericMaps.push_back(v);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"portMap") == 0){
                
                xmlChar *portName = xmlGetProp(currentNode, (const xmlChar *)"portName");
                string portNameStr = "";
                if(portName != NULL)
                    portNameStr = string((const char*)portName);
                
                xmlChar *value = xmlGetProp(currentNode, (const xmlChar *)"value");
                string valueStr = "";
                valueStr = string((const char*)value);
              //  cout<<"portmap "<<portNameStr<<" = > "<<valueStr<<endl;
                pair<string,string> v(portNameStr,valueStr);
                portMaps.push_back(v);
            }
        }
    }
    

    map<Component, vector<ComponentInstance>, ComponentCompare >::iterator it;
    for(it=componentTable.begin(); it != componentTable.end(); it++){
        if(it->first.name == instanceTypeStr){
            ComponentInstance instance(instanceNameStr,instanceTypeStr);
            instance.genericMaps = genericMaps;
            instance.portMaps = portMaps;
            it->second.push_back(instance);
        }
    }
    
}

void HardwareComponentXmlParser::parseAssignment(xmlNode * componentNode){
    xmlChar *portName = xmlGetProp(componentNode, (const xmlChar *)"port");
    string portNameStr((const char*)portName);
    cout<<"instance name "<<portNameStr<<endl;

    xmlChar *assignTo = xmlGetProp(componentNode, (const xmlChar *)"to");
    string assignToStr((const char*)assignTo);
    cout<<"instance type "<<assignToStr<<endl;
    assignments[portNameStr] = assignToStr;
}

void HardwareComponentXmlParser::parseSignal(xmlNode * componentNode){
	xmlNode *currentNode = NULL;
	vector<pair<string,string> > genericMaps;
	for (currentNode = componentNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {
		xmlChar *signalName = xmlGetProp(currentNode, (const xmlChar *)"name");
		string signalNameStr = "";
		signalNameStr = string((const char*)signalName);

		xmlChar *type = xmlGetProp(currentNode, (const xmlChar *)"type");
		string typeStr = "";
		typeStr = string((const char*)type);
		signals[signalNameStr] = typeStr;
	}
}

void HardwareComponentXmlParser::parseMap(xmlNode * currentNode){
    xmlChar *signalName = xmlGetProp(currentNode, (const xmlChar *)"name");
    string signalNameStr = "";
    signalNameStr = string((const char*)signalName);
    xmlChar *value = xmlGetProp(currentNode, (const xmlChar *)"value");
    string valueStr = "";
    valueStr = string((const char*)value);
    pair<string, string> v(signalNameStr,valueStr);
    signalMaps.push_back(v);
}

void parsePortBind(xmlNode *portBindNode, std::vector<HardwareComponent*> instantiedComponents){
	
	xmlChar *componentAname_char = xmlGetProp(portBindNode, (const xmlChar *)"componentA");
	std::string componentAname = string((const char*)componentAname_char);

	xmlChar *componentAPort_char = xmlGetProp(portBindNode, (const xmlChar *)"portA");
	std::string componentAPort = string((const char*)componentAPort_char);

	xmlChar *componentBname_char = xmlGetProp(portBindNode, (const xmlChar *)"componentB");
	std::string componentBname = string((const char*)componentBname_char);

	xmlChar *componentBPort_char = xmlGetProp(portBindNode, (const xmlChar *)"portB");
	std::string componentBPort = string((const char*)componentBPort_char);

	HardwareComponent *componentA=NULL, *componentB=NULL;

	std::vector<HardwareComponent*>::iterator componentIt;
	for(componentIt = instantiedComponents.begin(); componentIt != instantiedComponents.end(); componentIt++){
		if((*componentIt)->name() == componentAname){
			componentA = *componentIt;
		}
		else if ((*componentIt)->name() == componentBname){
			componentB = *componentIt;
		}
		if(componentA != NULL && componentB != NULL)
			break;
	}

	if(componentA != NULL)
		if(componentB != NULL){
			cout<<"Port Map ComponentA "<<componentAname<<" port "<< componentAPort<<endl;
			cout<<"To ComponentB "<<componentBname<<" port "<<componentBPort<<endl;
			componentA->portMap(componentAPort, componentB->getPort(componentBPort));
		}
		else
			cout<<"ComponentB "<<componentBname<<" was not declared"<<endl;
	else
		cout<<"ComponentA "<<componentAname<<" was not declared"<<endl;
}

void parseRegionPortBind(xmlNode *regionPortBindNode, std::vector<HardwareComponent*> instantiedComponents, ReconfigurableRegion *region){
	
	xmlChar *regionPort_char = xmlGetProp(regionPortBindNode, (const xmlChar *)"regionport");
	std::string regionPort = string((const char*)regionPort_char);

	xmlChar *componentname_char = xmlGetProp(regionPortBindNode, (const xmlChar *)"component");
	std::string componentname = string((const char*)componentname_char);

	xmlChar *componentPort_char = xmlGetProp(regionPortBindNode, (const xmlChar *)"port");
	std::string componentPort = string((const char*)componentPort_char);

	HardwareComponent *component=NULL;

	std::vector<HardwareComponent*>::iterator componentIt;
	for(componentIt = instantiedComponents.begin(); componentIt != instantiedComponents.end(); componentIt++){
		if ((*componentIt)->name() == componentname){
			component = *componentIt;
			break;
		}
	}

	if(component != NULL){
		if(region->getPort(regionPort) != NULL){
			cout<<"Port Map Component "<<componentname<<" port "<< componentPort<<endl;
			cout<<"To region "<<region->name<<" port "<<regionPort<<endl;
			component->portMap(componentPort, region->getPort(regionPort));	
		}
		else
			cout<<"No port "<<regionPort<<" on region "<< region->name<<endl;
	}
	else
		cout<<"Component "<<componentname<<" was not declared"<<endl;
}



void parseSignalBind(xmlNode *signalBindNode, vector<HardwareComponent*> instantiedComponents, std::vector<sc_signal_resolved*> instantiedSignals){
	
	xmlChar *componentName_char = xmlGetProp(signalBindNode, (const xmlChar *)"component");
	std::string componentName = string((const char*)componentName_char);

	xmlChar *componentPort_char = xmlGetProp(signalBindNode, (const xmlChar *)"port");
	std::string componentPort = string((const char*)componentPort_char);

	xmlChar *signalName_char = xmlGetProp(signalBindNode, (const xmlChar *)"signal");
	std::string signalName = string((const char*)signalName_char);


	HardwareComponent *component = NULL; 
	sc_signal_resolved* signal = NULL;


	std::vector<HardwareComponent*>::iterator componentIt;
	for(componentIt = instantiedComponents.begin(); componentIt != instantiedComponents.end(); componentIt++){
		if((*componentIt)->name() == componentName){
			component = *componentIt;
			break;
		}
	}

	std::vector<sc_signal_resolved*>::iterator signalIt;
	for(signalIt = instantiedSignals.begin(); signalIt != instantiedSignals.end(); signalIt++){
		if((*signalIt)->name() == signalName){
			signal = *signalIt;
			break;
		}
	}

	if(component != NULL)
		if(signal != NULL){
			cout << "port map "<<componentName << " p "<<componentPort << " sig "<<signalName<<endl;
			
			component->portMap(componentPort, signal);
		}
		else
			cout<<"Signal "<<signalName<<" was not declared"<<endl;
	else
		cout<<"Comopnent "<<componentName<<" was not declared"<<endl;
}

void parseRegionSignalBind(xmlNode *regionSignalBindNode, std::vector<sc_signal_resolved*> instantiedSignals, ReconfigurableRegion *region){
	
	xmlChar *regionPortName_char = xmlGetProp(regionSignalBindNode, (const xmlChar *)"regionport");
	std::string regionPortName = string((const char*)regionPortName_char);

	xmlChar *signalName_char = xmlGetProp(regionSignalBindNode, (const xmlChar *)"signal");
	std::string signalName = string((const char*)signalName_char);


	sc_signal_resolved* signal = NULL;


	std::vector<sc_signal_resolved*>::iterator signalIt;
	for(signalIt = instantiedSignals.begin(); signalIt != instantiedSignals.end(); signalIt++){
		if((*signalIt)->name() == signalName){
			signal = *signalIt;
			break;
		}
	}

	if(region->getPort(regionPortName) != NULL)
		if(signal != NULL){
			cout << "region signal map "<<region->name << " p "<<regionPortName << " sig "<<signalName<<endl;
			
			region->communicationHardware->portMap(regionPortName, signal);
		}
		else
			cout<<"Signal "<<signalName<<" was not declared"<<endl;
	else
		cout<<"Region "<<region->name<<" has no port "<<regionPortName<<endl;
}

bool isPortSwAccessible(xmlNode *portNode){
	xmlChar *portSwAccessible = xmlGetProp(portNode, (const xmlChar *)"swAccess");
	if(portSwAccessible)
		if(xmlStrcmp(portSwAccessible, (const xmlChar *)"true") == 0)
			return true;
	return false;
}


HardwareComponent* HardwareComponentXmlParser::parseHardwareTopEntity(xmlNode * rootNode, std::string entityName, ReconfigurableRegion *region){
	xmlNode *currentNode = NULL;
	ComponentDatabase *localDb = NULL;
	std::vector<HardwareComponent*> instantiedComponents;

	std::vector<sc_signal_resolved*> instantiedSignals;

	HardwareComponent *hardwareTopEntity = new HardwareComponent(entityName.c_str(), NULL);
	instantiedComponents.push_back(hardwareTopEntity);

	for (currentNode = rootNode; currentNode; currentNode = currentNode->next) {
		if (currentNode->type == XML_ELEMENT_NODE) {
			if(xmlStrcmp(currentNode->name, (const xmlChar *)"componentDatabase") == 0){
				xmlChar *dataBaseLocation_char = xmlGetProp(currentNode, (const xmlChar *)"file");
				std::string dataBaseLocation = string((const char*)dataBaseLocation_char);
				localDb = ComponentDatabase::getInstance();
				localDb->addDatabaseAddress(dataBaseLocation);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"componentInstance") == 0){

				xmlChar *name_char = xmlGetProp(currentNode, (const xmlChar *)"name");
				std::string name = string((const char*)name_char);

				xmlChar *type_char = xmlGetProp(currentNode, (const xmlChar *)"type");
				std::string type = string((const char*)type_char);

				HardwareComponent *comp = localDb->getHardwareComponent(name, type);
				hardwareTopEntity->addChildObject(comp);
				instantiedComponents.push_back(comp);
				//parseInstance(currentNode);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"output") == 0){
				HardwareComponent::PortInfo info = parsePort(currentNode);
				hardwareTopEntity->addOutput(info.name, info.type);
				if(isPortSwAccessible(currentNode)){
					hardwareTopEntity->createSoftwareAccess(info.name);
				}
				//parseOutput(currentNode);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"input") == 0){
				HardwareComponent::PortInfo info = parsePort(currentNode);
				hardwareTopEntity->addInput(info.name, info.type);
				if(isPortSwAccessible(currentNode))
					hardwareTopEntity->createSoftwareAccess(info.name);
				//parseInput(currentNode);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"signal") == 0){

				xmlChar *name_char = xmlGetProp(currentNode, (const xmlChar *)"name");
				std::string name = string((const char*)name_char);
				
				HardwareComponent::DataType *signalType = parseType(currentNode);
				sc_signal_resolved *signal = HardwareComponent::createSignal(name, signalType);
				instantiedSignals.push_back(signal);

			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"portbind") == 0){
				parsePortBind(currentNode, instantiedComponents);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"signalbind") == 0){
				parseSignalBind(currentNode, instantiedComponents, instantiedSignals);
				//parseSignalComponents(currentNode);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"regionportbind") == 0){
				parseRegionPortBind(currentNode, instantiedComponents, region);
			}
			else if(xmlStrcmp(currentNode->name, (const xmlChar *)"regionsignalbind") == 0){
				parseRegionSignalBind(currentNode, instantiedSignals, region);
			}
		}
	}
	return hardwareTopEntity;
}

std::map<std::string, HardwareComponent::HardwareComponentInfo*> HardwareComponentXmlParser::parseXmlComponentFile(std::string xmlFile){
	xmlDoc         *doc = NULL;
	xmlNode        *root_element = NULL;
	cout<<"parsing description file "<<xmlFile<<endl;
	doc = xmlReadFile(xmlFile.c_str(), NULL, 0);

	map<string, HardwareComponent::HardwareComponentInfo*> retMap;

	if (doc == NULL)
	{
		cout<<"error: could not parse file "<<xmlProjectFile<<endl;
	}
	else
	{

		/*
		 * Get the root element node
		 */
		signalCount = 0;
		root_element = xmlDocGetRootElement(doc);

		xmlNode *currentNode = NULL;

		for (currentNode = root_element; currentNode; currentNode = currentNode->next) {
			if (currentNode->type == XML_ELEMENT_NODE) {
				if(xmlStrcmp(currentNode->name, (const xmlChar *)"componentBase") == 0){
					cout<<"parsing node "<<currentNode->name<<endl;
					retMap = parseComponentBase(currentNode);
				}
			}
		}
		xmlFreeDoc(doc);
		xmlCleanupParser();
	}
	cout<<"returning"<<endl;
	return retMap;
}

Architecture* HardwareComponentXmlParser::parseArchitectureFile(std::string xmlFile, ReconfigurableRegion *region){
	xmlDoc         *doc = NULL;
	xmlNode        *root_element = NULL;

	doc = xmlReadFile(xmlFile.c_str(), NULL, 0);

	if (doc == NULL)
	{
		cout<<"error: could not parse file "<<xmlProjectFile<<endl;
	}
	else
	{

		/*
		 * Get the root element node
		 */
		signalCount = 0;
		root_element = xmlDocGetRootElement(doc);

		xmlNode *currentNode = NULL;

		for (currentNode = root_element; currentNode; currentNode = currentNode->next) {
			if (currentNode->type == XML_ELEMENT_NODE) {

				if(xmlStrcmp(currentNode->name, (const xmlChar *)"architecture") == 0){
					xmlChar *regionName = xmlGetProp(currentNode, (const xmlChar *)"region");
					string regionNameStr = string((const char*)regionName);
					
					xmlChar *bitstream = xmlGetProp(currentNode, (const xmlChar *)"bitstream");
					string bitstreamStr = string((const char*)bitstream);

					HardwareComponent *topComponent = NULL;

					/*search for hardwareTopEntity tag*/
					xmlNode *currentNode2 = NULL;
					for (currentNode2 = currentNode->xmlChildrenNode; currentNode2; currentNode2 = currentNode2->next)
					{
						if(currentNode2->type == XML_ELEMENT_NODE){
							if(xmlStrcmp(currentNode2->name, (const xmlChar *)"hardwareTopEntity") == 0){

								xmlChar *entityName = xmlGetProp(currentNode2, (const xmlChar *)"name");
								string entityNameStr = string((const char*)entityName);
								topComponent = parseHardwareTopEntity(currentNode2->xmlChildrenNode, entityNameStr, region);
								break;
							}
						}
					}
					Architecture *arch = new Architecture(topComponent,regionNameStr);
					arch->bitstream = bitstreamStr;
					return arch;
				}
			}
		}

		/*
		 * free the document
		 */
		xmlFreeDoc(doc);
		xmlCleanupParser();
	}
	return NULL;
}

string HardwareComponentXmlParser::getValidComponentInstanceName(string componentType){
    srand(time(NULL));

    int rNumber = rand();
    
    stringstream componentName;
    bool nameValid = false;
    
    while(!nameValid){
        rNumber = rand();
        componentName<<componentType<<rNumber;
        nameValid = true;
        for(map<Component, vector<ComponentInstance>, ComponentCompare >::iterator it = componentTable.begin(); it!= componentTable.end(); it ++){
//            if(it->se)
        }
    }
    return componentName.str();
}


void HardwareComponentXmlParser::addComponentInstance(ComponentInstance instance){
    map<Component, vector<ComponentInstance>, ComponentCompare >::iterator it;
    for(it=componentTable.begin(); it != componentTable.end(); it++){
        if(it->first.name == instance.type){
            it->second.push_back(instance);
        }
    }
}

void HardwareComponentXmlParser::addSignal(SignalComponent signal){
    signals[signal.name] = signal.type;
}

void HardwareComponentXmlParser::addMap(string name, string value){
    pair<string, string> v(name,value);
    signalMaps.push_back(v);
}

void HardwareComponentXmlParser::addGeneric(std::string name, std::string type, std::string defaultValue){
    pair<string,string> v(type,defaultValue);
    genericTable[name] = v;
}

//TODO check if there is no default value to inputs
void HardwareComponentXmlParser::addInput(std::string name, std::string type, std::string defaultValue){
    inputTable[name] = type;
}
//TODO check if there is no default value to outputs
void HardwareComponentXmlParser::addOutput(std::string name, std::string type, std::string defaultValue){
    outputTable[name] = type;
}

