#include "HardwareComponentXmlParser.h"
#include <sstream>
#include <fstream>

using namespace std;

HardwareComponentXmlParser::HardwareComponentXmlParser(string xmlProjectFile){
    this->xmlProjectFile = xmlProjectFile;
}

/*obs : not using xmlFree as it results in a compilation bug because of the libxml2 compiled for windows*/
void HardwareComponentXmlParser::parseComponentBase(xmlNode * componentBaseNode){
    xmlNode *componentNode = NULL;
    cout<<__FILE__<<"::"<<__LINE__<<endl;
    for(componentNode = componentBaseNode->xmlChildrenNode; componentNode; componentNode = componentNode->next){
        if (componentNode->type == XML_ELEMENT_NODE) {
            xmlChar *name = xmlGetProp(componentNode, (const xmlChar *)"name");
            string nameStr((const char*)name);
            cout<<"componentName "<<nameStr<<endl;

            xmlChar *file = xmlGetProp(componentNode, (const xmlChar *)"file");
            string fileStr = "";
            if(file!=NULL){
                fileStr = string((const char*)file);
                dependencyFiles.insert(fileStr);
            }

            Component component;
            component.name = nameStr;
            cout<<"component table size "<<componentTable.size()<<endl;
            cout<<"component declarations size "<<componentTable.count(component)<<" for "<<component.name<<endl;
            if(componentTable.count(component) == 0){ //not add components again in the component table
                xmlNode *currentNode = NULL;
                for (currentNode = componentNode->xmlChildrenNode; currentNode; currentNode = currentNode->next) {
                    if (currentNode->type == XML_ELEMENT_NODE) {
                        if(xmlStrcmp(currentNode->name, (const xmlChar *)"generic") == 0){
                            xmlChar *genericName = xmlGetProp(currentNode, (const xmlChar *)"name");
                            string genericNameStr((const char*)genericName);
                            cout<<"generic tag name "<<genericNameStr<<endl;

                            xmlChar *type = xmlGetProp(currentNode, (const xmlChar *)"type");
                            string typeStr = "";
                            if(type != NULL){
                                typeStr = string((const char*)type);
                            }
                            else
                                typeStr = "integer";
                            
                        
                            xmlChar *defaultValue = xmlGetProp(currentNode, (const xmlChar *)"defaultValue");
                            string defaultValueStr = "";
                            if(defaultValue != NULL){
                                defaultValueStr = string((const char*)defaultValue);
                            }
                            pair<string,string> v(typeStr,defaultValueStr);
                            component.genericTable[genericNameStr] = v;
                            
                        }
                        else if(xmlStrcmp(currentNode->name, (const xmlChar *)"input") == 0){
                            cout<<"input tag"<<endl;
                            xmlChar *inputName = xmlGetProp(currentNode, (const xmlChar *)"name");
                            string inputNameStr((const char*)inputName);
    
                            xmlChar *inputType = xmlGetProp(currentNode, (const xmlChar *)"type");
                            string inputTypeStr;
                            if(inputType == NULL)
                                inputTypeStr = "std_logic";
                            else
                                inputTypeStr = string((const char*)inputType);
                            pair<string,string> p;
                            p.first = inputNameStr;
                            p.second = inputTypeStr;
                            component.inputs.push_back(p);
                        }
                        else if(xmlStrcmp(currentNode->name, (const xmlChar *)"output") == 0){
                            cout<<"output tag"<<endl;
                            xmlChar *outputName = xmlGetProp(currentNode, (const xmlChar *)"name");
                            string outputNameStr((const char*)outputName);
    
                            xmlChar *outputType = xmlGetProp(currentNode, (const xmlChar *)"type");
                            string outputTypeStr;
                            if(outputType == NULL)
                                outputTypeStr = "std_logic";
                            else
                                outputTypeStr = string((const char*)outputType);
                            pair<string,string> p;
                            p.first = outputNameStr;
                            p.second = outputTypeStr;
                            component.outputs.push_back(p);
                        }
                        else if(xmlStrcmp(currentNode->name, (const xmlChar *)"dependency") == 0){
                            xmlChar *file = xmlGetProp(currentNode, (const xmlChar *)"file");
                            fileStr = "";
                            if(file!=NULL){
                                fileStr = string((const char*)file);
                                dependencyFiles.insert(fileStr);
                            }
                            dependencyFiles.insert(fileStr);
                        }
                    }
                }
            }
            componentTable[component] = vector<ComponentInstance>();
        }
    }
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

void HardwareComponentXmlParser::parseRoot(xmlNode * rootNode){
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

void HardwareComponentXmlParser::parseMainEntityXmlFile(){
    xmlDoc         *doc = NULL;
    xmlNode        *root_element = NULL;
    char workingDir[256];
    
    doc = xmlReadFile(xmlProjectFile.c_str(), NULL, 0);
    
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

                if(xmlStrcmp(currentNode->name, (const xmlChar *)"hardwareTopEntity") == 0){
                    xmlChar *entityName = xmlGetProp(currentNode, (const xmlChar *)"name");
                    this->entityNameStr = string((const char*)entityName);

                    xmlChar *deviceFamily = xmlGetProp(currentNode, (const xmlChar *)"deviceFamily");
                    if(deviceFamily != NULL)
                        this->deviceFamily = string((const char*)deviceFamily);

                    xmlChar *deviceTarget = xmlGetProp(currentNode, (const xmlChar *)"deviceTarget");
                    if(deviceTarget != NULL)
                        this->deviceTarget = string((const char*)deviceTarget);


                    parseRoot(currentNode->xmlChildrenNode);
                }
            }
        }
        
        /*
        * free the document
        */
        xmlFreeDoc(doc);
    }
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
