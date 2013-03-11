#include "HardwareProjectXmlParser.h"
#include <sstream>
#include <fstream>

using namespace std;

HardwareProjectXmlParser::HardwareProjectXmlParser(string xmlProjectFile){
    this->xmlProjectFile = xmlProjectFile;
}

/*obs : not using xmlFree as it results in a compilation bug because of the libxml2 compiled for windows*/
void HardwareProjectXmlParser::parseComponentBase(xmlNode * componentBaseNode){
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


void HardwareProjectXmlParser::parseOutput(xmlNode * componentNode){
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

void HardwareProjectXmlParser::parseInput(xmlNode * componentNode){
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

void HardwareProjectXmlParser::parseGeneric(xmlNode * componentNode){
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

void HardwareProjectXmlParser::parseInstance(xmlNode * componentNode){
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

void HardwareProjectXmlParser::parseAssignment(xmlNode * componentNode){
    xmlChar *portName = xmlGetProp(componentNode, (const xmlChar *)"port");
    string portNameStr((const char*)portName);
    cout<<"instance name "<<portNameStr<<endl;

    xmlChar *assignTo = xmlGetProp(componentNode, (const xmlChar *)"to");
    string assignToStr((const char*)assignTo);
    cout<<"instance type "<<assignToStr<<endl;
    assignments[portNameStr] = assignToStr;
}

void HardwareProjectXmlParser::parseSignalComponents(xmlNode * componentNode){
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

void HardwareProjectXmlParser::parseMap(xmlNode * currentNode){
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

void HardwareProjectXmlParser::parseRoot(xmlNode * rootNode){
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

void HardwareProjectXmlParser::parseMainEntityXmlFile(){
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

string HardwareProjectXmlParser::getValidComponentInstanceName(string componentType){
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

void HardwareProjectXmlParser::buildMainEntityFile(string projectPath){
    ofstream designFile;
    string fileLocation = projectPath+entityNameStr+".vhdl";
    designFile.open (fileLocation.c_str());
    designFile <<"-- This file was auto generated by the HardwareProjectXmlParser"<<endl<<endl;
    designFile <<"library ieee, combinationalLibrary;"<<endl;
    designFile <<"use ieee.std_logic_1164.all;"<<endl;
    designFile <<"use ieee.std_logic_unsigned.all;"<<endl<<endl;

    designFile <<"entity "<<entityNameStr<<" is"<<endl; //TODO place the main tag name here
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
    designFile <<"port ("<<endl;

    /*generate the header of the entity with the input/outputs*/
    if(inputTable.size() > 0 && outputTable.size() > 0){
        map<string, string >::iterator lastElement = outputTable.end();
        lastElement --;
        for(map<string, string >::iterator it = inputTable.begin(); it != inputTable.end(); it++){
            designFile <<"\t"<<it->first<<": in "<<it->second<<";"<<endl;
        }
        for(map<string, string >::iterator it = outputTable.begin(); it != lastElement; it++){
           designFile <<"\t"<<it->first<<": out "<<it->second<<";"<<endl;
        }
        designFile <<"\t"<<lastElement->first<<": out "<<lastElement->second<<endl;
    }
    else if(inputTable.size() > 0){
        map<string, string >::iterator lastElement = inputTable.end();
        lastElement --;
        for(map<string, string >::iterator it = inputTable.begin(); it != lastElement; it++){
            designFile <<"\t"<<it->first<<": in "<<it->second<<";"<<endl;
        }
        designFile <<"\t"<<lastElement->first<<": out "<<lastElement->second<<endl;
    }
    else if(outputTable.size() > 0){
        map<string, string >::iterator lastElement = outputTable.end();
        lastElement --;
        for(map<string, string >::iterator it = outputTable.begin(); it != lastElement; it++){
            designFile <<"\t"<<it->first<<": out "<<it->second<<";"<<endl;
        }
        designFile <<"\t"<<lastElement->first<<": out "<<lastElement->second<<endl;
    }
    designFile <<");"<<endl;
    designFile <<"end "<<entityNameStr<<";"<<endl<<endl;

    designFile<<"architecture arch of "<<entityNameStr<<" is"<<endl;

    /*generate the component declaration in the architecture file*/
    for(map<Component, vector<ComponentInstance>, ComponentCompare >::iterator it = componentTable.begin(); it!= componentTable.end(); it ++){
        designFile<<"\t"<<"component "<<it->first.name<<endl;
        map<string, pair<string,string> > genericInputs = it->first.genericTable;
        if(genericInputs.size() > 0){
            designFile <<"\t\tgeneric ("<<endl;
            map<string, pair<string,string> >::iterator lastElement = genericInputs.end();
            lastElement --;
            for(map<string, pair<string,string> >::iterator it = genericInputs.begin(); it != lastElement; it++){
                if(it->second.second == "") //has no default value
                    designFile <<"\t\t\t"<<it->first<<" : "<<it->second.first<<";"<<endl;
                else
                    designFile <<"\t\t\t"<<it->first<<" : "<<it->second.first<<" := "<<it->second.second<<";"<<endl;
            }
            if(lastElement->second.second == "") //has no default value
                    designFile <<"\t\t\t"<<lastElement->first<<" : "<<lastElement->second.first<<";"<<endl;
            else
                designFile <<"\t\t\t"<<lastElement->first<<" : "<<lastElement->second.first<<" := "<<lastElement->second.second<<endl;
            designFile <<"\t\t);"<<endl;
        }
        designFile<<"\t\t"<<"port( "<<endl;

        vector< pair<string,string> > inputPorts = it->first.inputs;
        vector< pair<string,string> > outputPorts = it->first.outputs;
        if(inputPorts.size() > 0 && outputPorts.size() > 0){
            for(vector< pair<string,string> >::iterator it2 = inputPorts.begin(); it2!= inputPorts.end(); it2 ++){
                designFile<<"\t\t\t"<<it2->first<<": in "<<it2->second<<";"<<endl;
            }
            vector< pair<string,string> >::iterator lastElement = outputPorts.end();
            lastElement--;
            for(vector< pair<string,string> >::iterator it2 = outputPorts.begin(); it2!= lastElement; it2 ++){
                designFile<<"\t\t\t"<<it2->first<<": out "<<it2->second<<";"<<endl;
            }
            designFile<<"\t\t\t"<<lastElement->first<<": out "<<lastElement->second<<endl;
        }
        else if(inputPorts.size() > 0){
            vector< pair<string,string> >::iterator lastElement = inputPorts.end();
            lastElement--;
            for(vector< pair<string,string> >::iterator it2 = inputPorts.begin(); it2!= lastElement; it2 ++){
                designFile<<"\t\t\t"<<it2->first<<": in "<<it2->second<<";"<<endl;
            }
            designFile<<"\t\t\t"<<lastElement->first<<": in "<<lastElement->second<<endl;
        }
        else if(outputPorts.size() > 0){
            vector< pair<string,string> >::iterator lastElement = outputPorts.end();
            lastElement--;
            for(vector< pair<string,string> >::iterator it2 = outputPorts.begin(); it2!= lastElement; it2 ++){
                designFile<<"\t\t\t"<<it2->first<<": out "<<it2->second<<";"<<endl;
            }
            designFile<<"\t\t\t"<<lastElement->first<<": out "<<lastElement->second<<endl;
        }
        designFile<<"\t\t"<<");"<<endl;
        designFile<<"\tend component;"<<endl;

    }
    
    for(map<string,string>::iterator it = signals.begin(); it!= signals.end(); it ++){
        designFile<<"\t"<<"signal "<<it->first<<" : "<<it->second<<";"<<endl;
    }
  //  for(set<SignalComponent,SignalComponentCompare>::iterator it = signalList.begin(); it!= signalList.end(); it ++){
   //     designFile<<"\t"<<"signal "<<it->name<<" : "<<it->type<<";"<<endl;
   // }
    
    designFile<<"begin"<<endl;

    for(map<Component, vector<ComponentInstance>, ComponentCompare >::iterator it = componentTable.begin(); it!= componentTable.end(); it ++){
        vector<ComponentInstance>::iterator instanceIt;
        for(instanceIt = it->second.begin(); instanceIt != it->second.end(); instanceIt ++){
            if(instanceIt->portMaps.size() > 0){ //dont initialize a component without binds
                designFile<<instanceIt->name<<" : "<<it->first.name<<endl;
                if(instanceIt->genericMaps.size() > 0){
                    designFile<<"generic map ("<<endl;
                    vector<pair<string,string> >::iterator lastElement = instanceIt->genericMaps.end();
                    lastElement --;
                    bool useGenericNames = false;
                    if(instanceIt->genericMaps.begin()->first != "") //if the first one uses the format genericName => value the others must use it too
                        useGenericNames = true;
                    for(vector<pair<string,string> >::iterator genericIt = instanceIt->genericMaps.begin(); genericIt != lastElement; genericIt ++){
                        if(useGenericNames)
                            designFile<<genericIt->first<<" => "<<genericIt->second<<endl;
                        else
                            designFile<<genericIt->second<<endl;
                    }
                    if(useGenericNames)
                        designFile<<lastElement->first<<" => "<<lastElement->second<<endl;
                    else
                        designFile<<lastElement->second<<endl;
                    designFile<<")"<<endl;
                }
                designFile<<"port map ("<<endl;
               
                vector<pair<string,string> >::iterator lastElement = instanceIt->portMaps.end();
                lastElement --;
                bool usePortNames = false;
                if(instanceIt->portMaps.begin()->first != "") //if the first one uses the format portName => value the others must use it too
                    usePortNames = true;
                for(vector<pair<string,string> >::iterator genericIt = instanceIt->portMaps.begin(); genericIt != lastElement; genericIt ++){
                    if(usePortNames)
                        designFile<<genericIt->first<<" => "<<genericIt->second<<endl;
                    else
                        designFile<<genericIt->second<<endl;
                }
                if(usePortNames)
                    designFile<<lastElement->first<<" => "<<lastElement->second<<endl;
                else
                    designFile<<lastElement->second<<endl;
                designFile<<")"<<endl;
            
                designFile<<");"<<endl<<endl;
            }
        }
    }

    for(vector< pair<string,string> >::iterator it = signalMaps.begin(); it!=signalMaps.end(); it++){
        designFile<<it->first<<" <= "<<it->second<<";"<<endl;
    }
    designFile<<endl;

    designFile<<"end arch;"<<endl;
    
    designFile.close();
    cout<<"design file saved to "<<fileLocation<<endl;

}


void HardwareProjectXmlParser::addComponentInstance(ComponentInstance instance){
    map<Component, vector<ComponentInstance>, ComponentCompare >::iterator it;
    for(it=componentTable.begin(); it != componentTable.end(); it++){
        if(it->first.name == instance.type){
            it->second.push_back(instance);
        }
    }
}

void HardwareProjectXmlParser::addSignal(SignalComponent signal){
    signals[signal.name] = signal.type;
}

void HardwareProjectXmlParser::addMap(string name, string value){
    pair<string, string> v(name,value);
    signalMaps.push_back(v);
}

void HardwareProjectXmlParser::addGeneric(std::string name, std::string type, std::string defaultValue){
    pair<string,string> v(type,defaultValue);
    genericTable[name] = v;
}

//TODO check if there is no default value to inputs
void HardwareProjectXmlParser::addInput(std::string name, std::string type, std::string defaultValue){
    inputTable[name] = type;
}
//TODO check if there is no default value to outputs
void HardwareProjectXmlParser::addOutput(std::string name, std::string type, std::string defaultValue){
    outputTable[name] = type;
}

