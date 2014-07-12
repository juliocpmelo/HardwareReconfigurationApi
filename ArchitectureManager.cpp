#include "ArchitectureManager.h"

using namespace std;

ArchitectureManager::ArchitectureManager(CommunicationLink *communicationLink){
	this->communicationModule = new CommunicationModule(communicationLink);
}

void ArchitectureManager::init(){
	
	std::vector<MessageType> messages;
	
	messages.push_back(MessageType_Setup);
	messages.push_back(MessageType_ArchitectureRequest);
	messages.push_back(MessageType_ArchitectureUpdate);

	communicationModule->addMessageHandler(messages, this);
}

void ArchitectureManager::importHardwareProject(std::string projectXMLDesc){
	if (hardwareProject) 
		delete hardwareProject;
	this->hardwareProject = new HardwareProject(projectXMLDesc);
}

void ArchitectureManager::connectToHardwareComponentDataBase(std::string dataBaseAddress){
	if (componentDatabases.count(dataBaseAddress) == 0)
		componentDatabases[dataBaseAddress] = new ComponentDatabase(dataBaseAddress);
	else
		cout << "database already in the current set"<<endl;
}

HardwareComponent* ArchitectureManager::createHardwareComponent(std::string instanceName, std::string componentURI){
	std::string databaseAddress = componentURI.substr(0,(componentURI.find_last_of(":")));
	if (componentDatabases.count(databaseAddress) > 0)
		return componentDatabases[databaseAddress]->getHardwareComponent(instanceName, componentURI);
	else
		return NULL;
}

void ArchitectureManager::synthesizeArchitecture(){
	hardwareProject->generateHDLFilesForAllRegions();
	hardwareProject->compileProject();
}

void ArchitectureManager::handleMessage(Message *msg){
	switch (msg->messageType){
		case MessageType_Setup:
		{
			cout << "MessageType_Setup received" << endl;
			break;
		}
		case MessageType_ArchitectureRequest:
		{
			cout << "MessageType_ArchitectureRequest received" << endl;
			break;
		}
		case MessageType_ArchitectureUpdate:
		{
			cout << "MessageType_ArchitectureUpdate received" <<endl;
			break;
		}
	}
}

void ArchitectureManager::mainLoop(){

	communicationModule->communicationLoop();
	cout<<__FILE__<<"::"<<__LINE__<<endl;
}


