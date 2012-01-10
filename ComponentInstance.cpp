#include "ComponentInstance.h"
using namespace std;

ComponentInstance::ComponentInstance(std::string name, std::string type){
    this->name = name;
    this->type = type;
}
void ComponentInstance::portMap(std::string portName, std::string signal){
    pair<string,string> v(portName,signal);
    portMaps.push_back(v);    
}
void ComponentInstance::genericMap(std::string genericName, std::string value){
    pair<string,string> v(genericName,value);
    genericMaps.push_back(v);
}
