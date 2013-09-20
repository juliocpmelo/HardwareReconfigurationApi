#include "HardwareComponentXmlParser.h"
#include <sstream>
#include <fstream>

using namespace std;

HardwareComponentXmlParser::HardwareComponentXmlParser(){
//    this->xmlProjectFile = xmlProjectFile;
}


HardwareComponent::PortInfo HardwareComponentXmlParser::parsePort(xmlNode * portNode){
	xmlChar *portName = xmlGetProp(portNode, (const xmlChar *)"name");
	string portNameStr((const char*)portName);

	xmlChar *portTypeChar = xmlGetProp(portNode, (const xmlChar *)"type");
	HardwareComponent::DataType *portType  = NULL;

	if(xmlStrcmp(portTypeChar,(const xmlChar*) "bit") == 0)
		portType = new HardwareComponent::DataType(HardwareComponent::DataTypeId_bit);
	else if(xmlStrcmp(portTypeChar,(const xmlChar*) "vector") == 0){
		
		/*start and end values are strings, thus the description is able to use the params*/
		xmlChar *portStartIndexChar = xmlGetProp(portNode, (const xmlChar *)"startIndex");
		string portStartIndex;
		if(portStartIndexChar != NULL)
			portStartIndex = string((const char*)portStartIndexChar);
		else
			portStartIndex = "1";

		/*operator could be downto, upto or to*/
		xmlChar *portVectorIndexOperationChar = xmlGetProp(portNode, (const xmlChar *)"op");
		string portVectorIndexOperation;
		if(portVectorIndexOperationChar != NULL)
			portVectorIndexOperation = string((const char*)portVectorIndexOperationChar);
		else
			portVectorIndexOperation = "downto";

		xmlChar *portEndIndexChar = xmlGetProp(portNode, (const xmlChar *)"endIndex");
		string portEndIndex;
		if(portEndIndexChar != NULL)
			portEndIndex = string((const char*)portEndIndexChar);
		else
			portEndIndex = "0";

		cout<<"creating vector type "<<portStartIndex<<" "<<portEndIndex<<" "<<portVectorIndexOperation<<endl;
		portType = new HardwareComponent::VectorType(portStartIndex,portEndIndex,portVectorIndexOperation);

	}
	else if(xmlStrcmp(portTypeChar,(const xmlChar*) "integer") == 0){
		/*start and end values are strings, thus the description is able to use the params*/
		xmlChar *rangeStartChar = xmlGetProp(portNode, (const xmlChar *)"rangeStart");
		string rangeStart;
		if(rangeStartChar != NULL)
			rangeStart = atoi((const char*)rangeStartChar);
		else
			rangeStart = "1";

		/*operator could be downto, upto or to*/
		xmlChar *rangeOperationChar = xmlGetProp(portNode, (const xmlChar *)"rangeOp");
		string rangeOperation;
		if(rangeOperationChar != NULL)
			rangeOperation = atoi((const char*)rangeOperationChar);
		else
			rangeOperation = "downto";

		xmlChar *rangeEndChar = xmlGetProp(portNode, (const xmlChar *)"rangeEnd");
		string rangeEnd;
		if(rangeEndChar != NULL)
			rangeEnd = atoi((const char*)rangeEndChar);
		else
			rangeEnd = "0";

		portType = new HardwareComponent::IntegerType(rangeStart,rangeEnd,rangeOperation);
	}
	else
		portType = new HardwareComponent::DataType(HardwareComponent::DataTypeId_bit);

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
		cout<<__FILE__<<"::"<<__LINE__<<endl;
		for(componentNode = componentBaseNode->xmlChildrenNode; componentNode; componentNode = componentNode->next){
			HardwareComponent::HardwareComponentInfo *componentInfo = NULL;
			if (componentNode->type == XML_ELEMENT_NODE &&
					xmlStrcmp(componentNode->name, (const xmlChar*)"component") == 0) {
				
				componentInfo = new HardwareComponent::HardwareComponentInfo();
				xmlChar *name = xmlGetProp(componentNode, (const xmlChar *)"name");
				string nameStr((const char*)name);
				cout<<"componentName "<<nameStr<<endl;
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

void HardwareComponentXmlParser::parseSignalComponents(xmlNode * componentNode){
    xmlNode *currentNode = NULL;
    vector<pair<string,string> > genericMaps;
    for (currentNode = componentNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {
        if (currentNode->type == XML_ELEMENT_NODE) {
            if(xmlStrcmp(currentNode->name, (const xmlChar *)"signal") == 0){
                xmlChar *signalName = xmlGetProp(currentNode, (const xmlChar *)"name");
                string signalNameStr = "";
                signalNameStr = string((const char*)signalName);
                
                xmlChar *type = xmlGetProp(currentNode, (const xmlChar *)"type");
                string typeStr = "";
                typeStr = string((const char*)type);
                signals[signalNameStr] = typeStr;
            }
        }
    }
}

void HardwareComponentXmlParser::parseMap(xmlNode * currentNode){
    cout<<__FILE__<<"::"<<__LINE__<<endl;
    xmlChar *signalName = xmlGetProp(currentNode, (const xmlChar *)"name");
    string signalNameStr = "";
    signalNameStr = string((const char*)signalName);
    cout<<__FILE__<<"::"<<__LINE__<<endl;    
    xmlChar *value = xmlGetProp(currentNode, (const xmlChar *)"value");
    string valueStr = "";
    valueStr = string((const char*)value);
    pair<string, string> v(signalNameStr,valueStr);
    signalMaps.push_back(v);
    cout<<__FILE__<<"::"<<__LINE__<<endl;    
}

void HardwareComponentXmlParser::parseHardwareTopEntity(xmlNode * rootNode){
    xmlNode *currentNode = NULL;
    for (currentNode = rootNode; currentNode; currentNode = currentNode->next) {
        if (currentNode->type == XML_ELEMENT_NODE) {
            if(xmlStrcmp(currentNode->name, (const xmlChar *)"componentBase") == 0){
                cout<<"parsing componentBase tag"<<endl;
                parseComponentBase(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"instance") == 0){
                cout<<"parsing instance tag"<<endl;
                parseInstance(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"output") == 0){
                cout<<"parsing output tag"<<endl;
                parseOutput(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"input") == 0){
                cout<<"parsing input tag"<<endl;
                parseInput(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"generic") == 0){
                cout<<"parsing generic tag"<<endl;
                parseGeneric(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"assign") == 0){
                cout<<"parsing assign tag"<<endl;
                parseAssignment(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"signalBase") == 0){
                cout<<"signal base tag"<<endl;
                parseSignalComponents(currentNode);
            }
            else if(xmlStrcmp(currentNode->name, (const xmlChar *)"ioMap") == 0 ||
                    xmlStrcmp(currentNode->name, (const xmlChar *)"signalMap") == 0){
                 cout<<"parsing "<<currentNode->name<<endl;
                parseMap(currentNode);
            }
        }
    }
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
	}
	cout<<"returning"<<endl;
	return retMap;
}

HardwareComponent* HardwareComponentXmlParser::parseMainEntityXmlFile(std::string xmlFile){
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
				cout<<"xlm element node "<<currentNode->name<<endl;

				if(xmlStrcmp(currentNode->name, (const xmlChar *)"HardwareTopEntity") == 0){
					xmlChar *entityName = xmlGetProp(currentNode, (const xmlChar *)"name");
					this->entityNameStr = string((const char*)entityName);

					xmlChar *deviceFamily = xmlGetProp(currentNode, (const xmlChar *)"deviceFamily");
					if(deviceFamily != NULL)
						this->deviceFamily = string((const char*)deviceFamily);

					xmlChar *deviceTarget = xmlGetProp(currentNode, (const xmlChar *)"deviceTarget");
					if(deviceTarget != NULL)
						this->deviceTarget = string((const char*)deviceTarget);


					parseHardwareTopEntity(currentNode->xmlChildrenNode);
				}
			}
		}

		/*
		 * free the document
		 */
		xmlFreeDoc(doc);
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

