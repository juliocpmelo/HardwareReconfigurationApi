/*
 * ArchitectureManager.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#include "ArchitectureManager.h"
#include "CommunicationManager/CommunicationManager.h"


#define DOWNLOAD_DIR "/usr/local/APM/"
#define TMP_ARCH_FILE DOWNLOAD_DIR "/archTmp"
#define TMP_BITSTREAM_FILE DOWNLOAD_DIR "/archTmp"

#include "ReconfigurationManager/HardwareReconfigurationModule.h"
#include "ComponentRepresentation/ReconfigurableRegion.h"
#include "ComponentRepresentation/ComponentModelParser.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

HardwareComponent* getHardwareComponent(void* self, const char* componentInstanceName){

	ArchitectureManager* architectureManager = (ArchitectureManager*) self;
	ComponentSetNode *actComponentIt = architectureManager->components->first;
	while (actComponentIt != NULL){
		if(strcmp(actComponentIt->comp->instanceName,componentInstanceName) == 0)
			return actComponentIt->comp;
		else
			actComponentIt = actComponentIt->next;
	}
	return NULL;
}

void insertHardwareComponent(void* self, HardwareComponent* comp){

	ArchitectureManager* architectureManager = (ArchitectureManager*) self;
	ComponentSetNode *componentIt = malloc(sizeof(ComponentSetNode));
	componentIt->next = NULL;
	componentIt->comp = comp;

	ComponentSetNode *firstComponent = architectureManager->components->first;
	if(firstComponent != NULL){
		componentIt->next = firstComponent;
		architectureManager->components->first = componentIt;
	}
	else{
		architectureManager->components->first = componentIt;
	}
}

/*
 * implements a specific hardware architecture into a reconfigurable region
 * @param self a reference to a instance of the ArchitectureManager class
 * @param architecture a reference to the HardwareComponent to be implemented into the reconfigurable region
 * @param region a reference to the reconfigurable region to be configured
 */
void implementArchitecture(void *self, ReconfigurableRegion *region, Architecture *arch){

	ArchitectureManager* thiz = (ArchitectureManager*) self;
	
	if(arch->uid == -1){
		/*TODO implement architecture request from client side*/
	}
	else{
		HardwareReconfigurationModule *hardawareReconfigurationModule = thiz->hardawareReconfigurationModule;
		if(hardawareReconfigurationModule->reconfigureRegion(hardawareReconfigurationModule, arch->regionName, arch->bitstream)){
			/*set current bistream to region*/
			
			ListNode *currentNode;
			List *reconfigurableRegions = thiz->managedReconfigurableRegions;
			for(currentNode = reconfigurableRegions->first; currentNode != NULL; currentNode = currentNode->next){
				ReconfigurableRegion *region = (ReconfigurableRegion*)currentNode->data;
				if(strcmp(region->name, arch->regionName) == 0){
					region->assignedArchitecture = arch;
					region->assignedHardwareComponent = arch->topComponent;
				}
					
			}
		
		}
		else {
			printf ("error while performing reconfiguration\n");
		}
	}
}

/**
 * \brief callback when a ArchitectureUpdate message is received
 **/
static void architectureUpdateHandler(void* handlerArgs, Message* message){

	ArchitectureManager *thiz = (ArchitectureManager *)handlerArgs;
	printf("Architecure update message received\n");
	ListNode *currentNode;
	List *reconfigurableRegions = thiz->managedReconfigurableRegions;
	int count = 0;
	for(currentNode = reconfigurableRegions->first; currentNode != NULL; currentNode = currentNode->next){
		ReconfigurableRegion *region = (ReconfigurableRegion*)currentNode->data;
		thiz->modifiedRegions[count] = message->messageContent[count];
		if(message->messageContent[count] == 1){
			printf("Region %s modified\n",region->name);
		}
		else{
			printf("Region %s not modified\n",region->name);
		}
		count ++;
	}

	thiz->architectureUpdateReceived = 1;

}

static uint32_t amountDowloaded = 0;
static uint32_t receivingAchitectureDescription = 1;

uint32_t reconfRegionIndex;
uint32_t regionDescriptionFileSize;
uint32_t regionBitstreamSize;
/*auxiliar value used to track the amount downloaded*/
float antVal = 0;
FILE *tmpArchitectureDescriptionFile;
FILE *tmpBitstreamFile;

static void newArchitectureReceived(void* handlerArgs, Message *message){
	/*it sends this Message to the RecocnfigurationManager that will
	 * handle the bitstream messages accordingly*/

	ArchitectureManager *thiz = (ArchitectureManager *)handlerArgs;
	switch(message->messageType){
		case MessageType_NewArchitecture:
		{
			ListNode *currentNode;
			List *reconfigurableRegions = thiz->managedReconfigurableRegions;

			int count = 1;
			/* message format
			 * 4 region index 
			 * 4 region description file size
			 * 4 region bitstream file size
			 **/
			reconfRegionIndex = BufferFunctions_readInt(message->messageContent);
			regionDescriptionFileSize = BufferFunctions_readInt(message->messageContent + 4);
			regionBitstreamSize = BufferFunctions_readInt(message->messageContent + 8);
			printf("new architecture message received for reg %d sizes (d=%d, b=%d)\n", reconfRegionIndex, regionDescriptionFileSize, regionBitstreamSize);
			/*get bitstreams sizes and size for the description file of data*/
			break;
		}
		case MessageType_DataChunk:
		{
			//printf("new architecture message data chunk received\n");
			//printf("chunk [t=%d, s=%d, i=%d]\n", getDataChunckType(message), getDataChunkDataSize(message), getDataChunkIndex(message));

			if(receivingAchitectureDescription){ //receiving architecture description
				if(amountDowloaded == 0){
					char fileName[50];
					bzero(fileName, 50);
					sprintf(fileName,"%s%d.cfg", TMP_ARCH_FILE, reconfRegionIndex);
					tmpArchitectureDescriptionFile = fopen	(fileName, "wb");
				}

				amountDowloaded += getDataChunkDataSize(message);
				fwrite(getDataChunckData(message), getDataChunkDataSize(message), 1, tmpArchitectureDescriptionFile);
				if(amountDowloaded == regionDescriptionFileSize){
					amountDowloaded = 0;
					receivingAchitectureDescription = 0;
					fclose(tmpArchitectureDescriptionFile);
					printf("description downloaded %s%d.cfg\n", TMP_ARCH_FILE, reconfRegionIndex); 
				}	
			}
			else{ //receiving bitstream
				if(amountDowloaded == 0){
					char fileName[50];
					bzero(fileName, 50);
					sprintf(fileName,"%s%d.bit", TMP_BITSTREAM_FILE, reconfRegionIndex);
					tmpBitstreamFile = fopen	(fileName, "wb");
				}
				
				amountDowloaded += getDataChunkDataSize(message);
				fwrite(getDataChunckData(message), getDataChunkDataSize(message), 1, tmpBitstreamFile);
				if((float)amountDowloaded/regionBitstreamSize - antVal > 0.05){ //shows download status every 5%
					printf("dowload bitstream %d / %d\n", amountDowloaded, regionBitstreamSize); 
					antVal = (float)amountDowloaded/regionBitstreamSize;
				}
				if(amountDowloaded == regionBitstreamSize){
					antVal = 0;
					amountDowloaded = 0;
					receivingAchitectureDescription = 1;
					fclose(tmpBitstreamFile);
					printf("bitstream downloaded %s%d.bit\n", TMP_ARCH_FILE, reconfRegionIndex); 
					thiz->newArchitectureReceived = 1;
				}
			}
			break;
		}
	}
}

static void setupMessageHandler(void* handlerArgs, Message *message){
	ArchitectureManager *thiz = (ArchitectureManager *)handlerArgs;
	thiz->setupReceived = 1;
}

void addArchitectureUpdateListener(void *self, ArchitectureUpdateListener_t listener, void *listenerArgs){
	ArchitectureManager *thiz = (ArchitectureManager*)self;
	ArchitectureUpdateListenerNode *node = malloc(sizeof(ArchitectureUpdateListenerNode));
	node->listener = listener;
	node->listenerArgs = listenerArgs;
	list_push_back(thiz->regionUpdateListeners, node);
}

void notifyArchitectureUpdate(void *self, int reconfigurableRegionIndex){

	ArchitectureManager *thiz = (ArchitectureManager*)self;
	List *reconfigurableRegions = thiz->managedReconfigurableRegions;
	ListNode *current = reconfigurableRegions->first;

	ReconfigurableRegion *region = NULL;
	Architecture *newArch = NULL;
	int count = 0;
	for (current = reconfigurableRegions->first; current !=  NULL; current = current->next, count ++){
		region = (ReconfigurableRegion*) current->data;
		if(count == reconfigurableRegionIndex){
			char bitstreamFile[50];
			sprintf(bitstreamFile,"%s%d.bit", TMP_ARCH_FILE, reconfRegionIndex);
			
			char archFileName[50];
			sprintf(archFileName,"%s%d.cfg", TMP_ARCH_FILE, reconfRegionIndex);
			newArch = ComponentModelParser_loadArchitecture(archFileName);
			newArch->bitstream = strdup(bitstreamFile);
			list_push_back(thiz->loadedArchitectures, newArch);
			break;
		}
	}

	if(region && newArch){
		current = thiz->regionUpdateListeners->first;
		for (current; current !=  NULL; current = current->next, count ++){
			ArchitectureUpdateListenerNode *updateListener = (ArchitectureUpdateListenerNode*) current->data;
			updateListener->listener(region, newArch, updateListener->listenerArgs);
		}
	}
}


/**
 * @brief creates the setup message to be sent for initial connection with the server
 * @param list of reconfigurable regions handled by the architecture manager
 * @param maximum message size supported by the reconfiguration manager
 **/
Message* createSetupMessage(List *reconfigurableRegions, int communicationManager_maxMessageSize){

	ListNode *current = reconfigurableRegions->first;

	int messageSize = (1 + reconfigurableRegions->size) * sizeof(uint32_t);
	char* buffer = malloc(sizeof(uint32_t) * messageSize); 
	
	BufferFunctions_writeInt(buffer, communicationManager_maxMessageSize); //max message size
	
	int count = 1;
	while (current != NULL){
		ReconfigurableRegion *region = (ReconfigurableRegion*) current->data;
		BufferFunctions_writeInt(buffer + 4*count, region->assignedArchitecture->uid); //current uid for every managed region
		printf("SetupMessage %d reg %d uid %d\n", messageSize,count - 1,region->assignedArchitecture->uid);
		current = current->next;
		count++;
	}
	

	return createMessage(MessageType_Setup, messageSize, buffer, NULL);
}

/**
 * @brief sends a message requesting the architecture related with the given reconfigurable region
 * @param self a reference to the ArchitectureManager
 * @param reconfigurableRegionIndex a number that reffers which reconfigurable 
 * 				region needs to be updated
 **/
void sendArchitectureRequestMessage(ArchitectureManager *self, int reconfigurableRegionIndex){
	
	int messageSize = 4; //request only one reconfigurable region each message
	uint8_t *messageContent = malloc(sizeof(uint8_t) * messageSize);
	BufferFunctions_writeInt(messageContent, reconfigurableRegionIndex);
	
	Message *archRequest = createMessage(MessageType_ArchitectureRequest, messageSize, messageContent, NULL);

	CommunicationLink *communicationLink = self->communicationManager->communicationLink;
	communicationLink->sendMessage(communicationLink,archRequest);

}

/*
 * Handles the architecture update messages
 * TOTHINK: Maybe auto update would be better to this
 * @return true when the architecture had been downloaded and it is ready for implement
 */
int handleArchitectureUpdate (ArchitectureManager *self){
	switch(self->architectureUpdateState){
		case ArchitectureUpdateState_sendArchitectureRequest:
		{	
			int count = 0;
			ListNode *currentNode;
			List *reconfigurableRegions = self->managedReconfigurableRegions;
			for(currentNode = reconfigurableRegions->first; currentNode != NULL; currentNode = currentNode->next){
				ReconfigurableRegion *region = (ReconfigurableRegion*)currentNode->data;
				if(self->modifiedRegions[count]){
					reconfRegionIndex = count;
					sendArchitectureRequestMessage(self,count);
					break;
				}
				count ++;
			}

			printf("Architecture request sent\n");
			self->architectureUpdateState = ArchitectureUpdateState_waitArchitecture;
			return 0;
		}
		case ArchitectureUpdateState_waitArchitecture:
		{
			if(self->newArchitectureReceived){	
				printf("new architecture received\n");
				self->notifyArchitectureUpdate(self, reconfRegionIndex);
				self->architectureUpdateState = ArchitectureUpdateState_finished;
			}
			return 0;
		}
		case ArchitectureUpdateState_finished: //reset internal auxiliary states
		{
			self->architectureUpdateReceived = 0;
			self->newArchitectureReceived = 0;
			self->architectureUpdateState = ArchitectureUpdateState_sendArchitectureRequest;
			return 1;
		}
	}
}

/*
 * implements a specific hardware component into the dynamic region
 * @param self a reference to a instance of the ArchitectureManager class
 * @param callback a reference	 to a callback to be called when a new component is ready to be implemented into the hardware
 */
//void registerComponentReadyCallback(void *self, ComponentReadyCallback_t *callback)


/*this function is supposed to be called in loop to make the whole system work*/
void archManagerMainLoop(void *self){

	ArchitectureManager* thiz = (ArchitectureManager*) self;
	CommunicationManager *communicationManager = thiz->communicationManager;
	
	switch(thiz->state){
	
		case ArchtectureManagerState_init:
		{
			printf("sending setup message\n");
			Message* setupMessage = createSetupMessage(thiz->managedReconfigurableRegions, communicationManager->supportedMessageSize);
			communicationManager->communicationLink->sendMessage(communicationManager->communicationLink,setupMessage);
			thiz->state = ArchtectureManagerState_waitForSetup;
			break;
		}
		case ArchtectureManagerState_waitForSetup:
		{
			if(thiz->setupReceived){
				printf("setup message received from server!\n");
				thiz->state = ArchtectureManagerState_wait;
			}
			else
				printf("waiting for setup message\n");
			break;
		}
		case ArchtectureManagerState_handleArchitectureUpdate:
		{
			//printf("handle new architecture\n");
			if(handleArchitectureUpdate(thiz)){
				thiz->state = ArchtectureManagerState_wait;
			}
			break;
		}
		case ArchtectureManagerState_wait:
		{
			if(thiz->architectureUpdateReceived && thiz->acceptNewArchitecture){
				thiz->state = ArchtectureManagerState_handleArchitectureUpdate;
			}
			break;
		}
	}
	communicationManager->communicationLoop(communicationManager);
}

/**
 * \brief loads the current configuration from the given file
 * \param architectureManager instance of the architecture manager
 * \param architectureInfoFile path to the configuraton file
 */
void loadArchitectureInfo(void* self){
	ArchitectureManager* thiz = (ArchitectureManager*) self;
	ArchitectureInfo* info = thiz->architectureInfo;
	ComponentModelParser_loadReconfigurableRegions(thiz->managedReconfigurableRegions, info->reconfigurableRegionsConfigFile);
}

/*
 * creates a new instance of the ArchitectureManager class connected into the given server
 * @param serverId a identifier to the server
 */
ArchitectureManager* createArchitectureManager(ArchitectureInfo *info, CommunicationManager *commMgr){

	HardwareReconfigurationModule *hardwareReconfMdl = createHardwareReconfigurationModule();
	HardwareInterface *hardwareInterfaceModule = createHardwareInterface();

	ArchitectureManager* archManager = malloc(sizeof(ArchitectureManager));
	archManager->architectureInfo = info;
	archManager->communicationManager = commMgr;
	
	archManager->implementArchitecture = &implementArchitecture;
	archManager->getHardwareComponent = &getHardwareComponent;
	archManager->insertHardwareComponent = &insertHardwareComponent;

	archManager->hardawareReconfigurationModule = hardwareReconfMdl;
	archManager->hardwareInterfaceModule = hardwareInterfaceModule;

	archManager->newArchitectureReceivedHandler = &newArchitectureReceived;
	archManager->setupMessageHandler = &setupMessageHandler;
	archManager->architectureUpdateHandler = &architectureUpdateHandler;
	
	archManager->archManagerMainLoop = &archManagerMainLoop;
	archManager->addArchitectureUpdateListener = &addArchitectureUpdateListener;
	archManager->notifyArchitectureUpdate = &notifyArchitectureUpdate;
	
	archManager->managedReconfigurableRegions = createList(&ReconfigurableRegion_compare);
	archManager->regionUpdateListeners = createList(NULL);
	archManager->loadedArchitectures = createList(NULL);
	
	loadArchitectureInfo(archManager);
	archManager->modifiedRegions = malloc(sizeof(uint8_t) * archManager->managedReconfigurableRegions->size);
	bzero(archManager->modifiedRegions, archManager->managedReconfigurableRegions->size);
	
	archManager->state = ArchtectureManagerState_init;
	archManager->setupReceived = 0;
	archManager->architectureUpdateReceived = 0;
	archManager->acceptNewArchitecture = 0;
	archManager->newArchitectureReceived = 0;

	commMgr->addMessageHandler(commMgr, MessageType_ArchitectureUpdate, &architectureUpdateHandler, archManager);
	commMgr->addMessageHandler(commMgr, MessageType_Setup, &setupMessageHandler, archManager);
	commMgr->addMessageHandler(commMgr, MessageType_NewArchitecture, &newArchitectureReceived, archManager);

			
	return archManager;
}

void setReconfigurableRegionsConfigFile(void* self, const char *configFile){
	ArchitectureInfo* thiz = (ArchitectureInfo*) self;
	int size = strlen(configFile);
	thiz->reconfigurableRegionsConfigFile = malloc(sizeof(char)*(size+1));
	strcpy(thiz->reconfigurableRegionsConfigFile, configFile);
}

ArchitectureInfo* createArchitectureInfo(){
	ArchitectureInfo* architectureInfo = malloc(sizeof(ArchitectureInfo));
	architectureInfo->setReconfigurableRegionsConfigFile = &setReconfigurableRegionsConfigFile;
	return architectureInfo;
}

