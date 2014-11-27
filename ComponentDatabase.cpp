
#include "ComponentDatabase.h"

using namespace std;
static ComponentDatabase* instance = NULL;

ComponentDatabase::ComponentDatabase(){
	componentsXmlParser = new HardwareComponentXmlParser();
}

void ComponentDatabase::addDatabaseAddress(std::string databaseAddress){
	/*TODO: preload component info*/
	this->databaseAddresses.insert(databaseAddress);
}

HardwareComponent::HardwareComponentInfo* ComponentDatabase::getHardwareComponentInfo(std::string componentURI){
	string componentDatabaseAddress = componentURI.substr(0,(componentURI.find_last_of(":")));
	if(loadedComponents.count(componentDatabaseAddress) == 0){
		/* 
		 * we could check here if its a local or if its a remote location first, 
		 * however for first implementations only local components are allowed
		 */
		map<string, HardwareComponent::HardwareComponentInfo*> loadedComponentInfos = componentsXmlParser->parseXmlComponentFile(componentDatabaseAddress);
		loadedComponents[componentDatabaseAddress] = loadedComponentInfos;
	}
	if(databaseAddresses.find(componentDatabaseAddress) == databaseAddresses.end())
		this->addDatabaseAddress(componentDatabaseAddress);
	
	string componentName = componentURI.substr(componentURI.find_last_of(":") + 1);
	if ((loadedComponents[componentDatabaseAddress]).count(componentName) != 0)
		return (loadedComponents[componentDatabaseAddress])[componentName];
	return NULL;
}

HardwareComponent* ComponentDatabase::getHardwareComponent(std::string instanceName, std::string componentURI){
//do component lookup
	HardwareComponent::HardwareComponentInfo *componentInfo = getHardwareComponentInfo(componentURI);
	return new HardwareComponent(sc_module_name(instanceName.c_str()), componentInfo);
}



ComponentDatabase* ComponentDatabase::getInstance(){
	if(instance == NULL){
		instance = new ComponentDatabase();
	}

	return instance;

}


