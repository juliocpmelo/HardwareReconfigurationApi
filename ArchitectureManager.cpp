#include "ArchitectureManager.h"
#include "Util/BufferFunctions.h"
#include "Util/FileFunctions.h"

using namespace Util;

using namespace std;

ArchitectureManager::ArchitectureManager(CommunicationLink *communicationLink){
	this->communicationModule = new CommunicationModule(communicationLink);
	this->hardwareProject = NULL; 
}

void ArchitectureManager::init(){
	
	std::vector<MessageType> messages;
	
	messages.push_back(MessageType_Setup);
	messages.push_back(MessageType_ArchitectureRequest);

	communicationModule->addMessageHandler(messages, this);
}

void ArchitectureManager::setManagedProject(std::string projectXMLDesc){
	if (hardwareProject) 
		delete hardwareProject;
	this->hardwareProject = new HardwareProject(projectXMLDesc);
	std::map<std::string, ReconfigurableRegion*> managedReconfRegions = this->hardwareProject->managedReconfRegions;
	std::map<std::string, ReconfigurableRegion*>::iterator reconfRegionIt;

	for(reconfRegionIt=managedReconfRegions.begin(); reconfRegionIt != managedReconfRegions.end(); reconfRegionIt++)
		this->addArchitecture(reconfRegionIt->first, reconfRegionIt->second->getAssignedTopComponent()); //add the current default architectures

//get reconfigurable regions and default hardwareComponents for initializing
}

ReconfigurableRegion* ArchitectureManager::getReconfigurableRegion(std::string regionName){
	if(hardwareProject){
		return hardwareProject->getReconfigurableRegion(regionName);
	}
	return NULL;
}

void ArchitectureManager::connectToHardwareComponentDataBase(std::string dataBaseAddress){
	ComponentDatabase *db = ComponentDatabase::getInstance();
	db->addDatabaseAddress(dataBaseAddress);
}

HardwareComponent* ArchitectureManager::createHardwareComponent(std::string instanceName, std::string componentURI){
	std::string databaseAddress = componentURI.substr(0,(componentURI.find_last_of(":")));
	if (componentDatabases.count(databaseAddress) > 0)
		return componentDatabases[databaseAddress]->getHardwareComponent(instanceName, componentURI);
	else
		return NULL;
}

void ArchitectureManager::addArchitecture(std::string reconfigurableRegionName, HardwareComponent *topComponent){
	bool regionFound = false;
	std::vector< std::pair < std::string, std::vector <Architecture*> > >::iterator storedArchitecturesIt;
	for(storedArchitecturesIt = storedArchitectures.begin(); storedArchitecturesIt != storedArchitectures.end(); storedArchitecturesIt++){
		if((*storedArchitecturesIt).first == reconfigurableRegionName){
			regionFound = true;
			/*TODO check if architecture has not alredy been added*/
			Architecture *arch = new Architecture(topComponent,reconfigurableRegionName);
			arch->uid = (*storedArchitecturesIt).second.size();
			/*architecture description needs to be generated after uid assign*/
			arch->descriptionFile = hardwareProject->generateArchitectureDescription(arch);

			cout<< "Adding architecture for comp "<< arch->topComponent->name() << " with uid " << (*storedArchitecturesIt).second.size() << endl;
			(*storedArchitecturesIt).second.push_back(arch);
		}
	}

	/*create default component*/
	if(!regionFound){
		pair<string, vector<Architecture*> > newRegionSet;

		newRegionSet.first = reconfigurableRegionName;

		Architecture *arch = new Architecture(topComponent, reconfigurableRegionName);
		arch->uid = 0;
		arch->descriptionFile = hardwareProject->generateArchitectureDescription(arch);

		newRegionSet.second.push_back(arch);

		storedArchitectures.push_back(newRegionSet);
	}

}

Architecture* ArchitectureManager::getArchitecture(std::string reconfigurableRegionName, HardwareComponent *topComponent){
	std::vector< std::pair < std::string, std::vector <Architecture*> > >::iterator storedArchitecturesIt;

	for(storedArchitecturesIt = storedArchitectures.begin(); storedArchitecturesIt != storedArchitectures.end(); storedArchitecturesIt++){
		if((*storedArchitecturesIt).first == reconfigurableRegionName){
			vector<Architecture*> storedArchs = (*storedArchitecturesIt).second;
			vector<Architecture*>::iterator archIt;
			for(archIt = storedArchs.begin(); archIt != storedArchs.end(); archIt++){
				/*TODO: check architectural information between components before returning*/
				if(topComponent == (*archIt)->topComponent)
					return (*archIt);
			}
		}
	}

	return NULL; //not found
}



void ArchitectureManager::synthesizeArchitecture(){
	hardwareProject->generateHDLFiles();
	hardwareProject->compileProject();
	hardwareProject->generateComponentDescriptionFiles();
}

void ArchitectureManager::sendArchitectureUpdateMessage(){

	Message* msg = new Message;
	msg->messageType = MessageType_ArchitectureUpdate;
	//size: 1 x numOfReconfRegions boolean with the modified ReconfigurableRegions
	//			4 number of incoming data chunk messages with the current architecture description
	int reconfRegionsNumber = this->hardwareProject->managedReconfRegions.size(); //use total reconf regions to handle the setup message
	msg->messageSize = reconfRegionsNumber;

	msg->messageContent = new uint8_t[msg->messageSize];

	std::map<std::string, ReconfigurableRegion*> managedReconfRegions = this->hardwareProject->managedReconfRegions;
	std::map<std::string, ReconfigurableRegion*>::iterator reconfRegionIt;

	int count = 0;
	for(reconfRegionIt=managedReconfRegions.begin(); reconfRegionIt != managedReconfRegions.end(); reconfRegionIt++){
		if(reconfRegionIt->second->modified)
			msg->messageContent[count] = 1;
		else
			msg->messageContent[count] = 0;
		count ++;
	}

	this->communicationModule->communicationLink->sendMessage(msg);
}


/*TODO change here to use the Architecture class
 * 		 create a create Architecture method
 * 		 change the compile methods to create individual architecture description files
 * 		 for each architecture
 **/
void ArchitectureManager::assignArchitectureToRegion(std::string regionName, HardwareComponent *topComponent){
	ReconfigurableRegion *reg = this->getReconfigurableRegion(regionName);
	if(reg){
		this->addArchitecture(regionName, topComponent);
		Architecture *arch = this->getArchitecture(regionName, topComponent);
		reg->assignArchitecture(arch);
	}
}

void ArchitectureManager::sendArchitecture(){

	sendArchitectureUpdateMessage();
}

void ArchitectureManager::sendNewArchitecture(uint8_t requestedRegion){

	Message* newArchitectureMessageStarter = new Message;
	newArchitectureMessageStarter->messageType = MessageType_NewArchitecture;

	// 4 region index
	// 4 region description file size
	// 4 region bitstream file size 
	newArchitectureMessageStarter->messageSize = 12;

	uint8_t *messageContent = new uint8_t[12];

	newArchitectureMessageStarter->messageContent = messageContent;

	std::map<std::string, ReconfigurableRegion*> managedReconfRegions = this->hardwareProject->managedReconfRegions;
	std::map<std::string, ReconfigurableRegion*>::iterator reconfRegionIt;

	int count = 0;
	int descriptionFileSize = 0; 
	int bitstreamSize = 0;
	uint8_t *bitstreamBytes, *descriptionFileBytes;

	for(reconfRegionIt=managedReconfRegions.begin(); reconfRegionIt != managedReconfRegions.end(); reconfRegionIt++){
		if(count == requestedRegion){
			//descriptionFileSize = hardwareProject->getRegionDescriptionFileSizeBytes(reconfRegionIt->first);
			Architecture *regArchitecure = reconfRegionIt->second->getAssignedArchitecture();

			descriptionFileSize = getFileSize(regArchitecure->descriptionFile);
			descriptionFileBytes = getFileBytes(regArchitecure->descriptionFile);
			bitstreamSize = getFileSize(regArchitecure->bitstream);
			bitstreamBytes = getFileBytes(regArchitecure->bitstream);

			writeInt(messageContent, requestedRegion) ;
			writeInt(messageContent + 4, descriptionFileSize);
			writeInt(messageContent + 8, bitstreamSize);

			cout << "description file size "<< descriptionFileSize << " bitstream file size " << bitstreamSize << endl;

			//clear this region update since it has already beeen handled
			//clear the modified bit since the region information has already been sent
			reconfRegionIt->second->modified = false;
	
			//send information only about one of the regions
			break; 
		}
		count ++;
	}

	Message *newArchitectureMessageBitstream = new Message;
	newArchitectureMessageBitstream->messageType = MessageType_NewArchitecture;
	newArchitectureMessageBitstream->messageSize = bitstreamSize;
	newArchitectureMessageBitstream->messageContent = bitstreamBytes;

	Message *newArchitectureMessageDescritpion = new Message;
	newArchitectureMessageDescritpion->messageType = MessageType_NewArchitecture;
	newArchitectureMessageDescritpion->messageSize = descriptionFileSize;
	newArchitectureMessageDescritpion->messageContent = descriptionFileBytes;
	

	
	this->communicationModule->communicationLink->sendMessage(newArchitectureMessageStarter);
	this->communicationModule->communicationLink->sendMessage(newArchitectureMessageDescritpion);
	this->communicationModule->communicationLink->sendMessage(newArchitectureMessageBitstream);

}

void ArchitectureManager::handleMessage(Message *msg){
	switch (msg->messageType){
		case MessageType_Setup:
		{
			cout << "MessageType_Setup received" << endl;
			cout << "Max message size " << readInt(msg->messageContent) << endl;
			int maxMessageSize = readInt(msg->messageContent);
			int reconfRegionsNumber = this->hardwareProject->managedReconfRegions.size(); //use total reconf regions to handle the setup message
			cout << "Max message size " << maxMessageSize << " regN " << reconfRegionsNumber << endl;

			for(int i=0; i<reconfRegionsNumber; i++)
				cout << "Reconf region "<< i <<" uid " << readInt(msg->messageContent + 4*(i+1)) << endl;

			this->communicationModule->communicationLink->sendSetupMessage();
			cout << "Server setup message sent " << endl;
			break;
		}
		case MessageType_ArchitectureRequest:
		{
			cout << "MessageType_ArchitectureRequest received" << endl;

			int reconfRegionsNumber = this->hardwareProject->managedReconfRegions.size(); //use total reconf regions to handle the setup message
			cout << "Reconf region "<< readInt(msg->messageContent)<< " needs update" << endl;
			sendNewArchitecture(readInt(msg->messageContent));
			break;
		}
	}
}

void ArchitectureManager::mainLoop(){
	communicationModule->communicationLoop();
}


