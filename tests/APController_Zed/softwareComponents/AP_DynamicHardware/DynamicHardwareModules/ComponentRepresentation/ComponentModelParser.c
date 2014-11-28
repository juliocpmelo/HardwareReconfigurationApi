#include "ComponentModelParser.h"
#include "ReconfigurableRegion.h"

#include <string.h>

void skipLine(FILE * filePointer){

	char c = 'a';
	while(c != '\n')
		c = fgetc(filePointer);

}

DataType *readDataType(FILE *file){
	DataType *dataType = malloc(sizeof(DataType));

	char type[50];

	fgets(type, 50, file);

	type[strlen(type) - 1] = '\0'; //removes \n

	dataType->typeString = malloc(sizeof(char)*strlen(type)); 

	strcpy(dataType->typeString, type);
	return dataType;
}


Port* readPort(FILE* file){
	Port* port = NULL;

	char portName[200];
	
	fscanf(file, "%s", portName);

	char portType[10];
	fscanf(file, "%s", portType);
	
	port = createPort(portName, PortType_in, NULL);

	if(strcmp(portType, "in")){
		port->type = PortType_in;
	}
	else if(strcmp(portType, "out")){
		port->type = PortType_out;
	}
	else if(strcmp(portType, "inout")){
		port->type = PortType_inout;
	}

	port->dataType = readDataType(file);

	return port;
}

HardwareComponentInfo* readComponentInfo(FILE *file){

	HardwareComponentInfo *hardwareComponentInfo = createHardwareComponentInfo();

	char componentTypeName[200];
	char command[50]; //port or endComponent
	
	fscanf(file, "%s", componentTypeName);

	hardwareComponentInfo->componentTypeName = malloc(sizeof(char)*strlen(componentTypeName));
	
	strcpy(hardwareComponentInfo->componentTypeName, componentTypeName);

	while ((fscanf(file, "%s", command)) != EOF) 
	{
		if(strcmp(command, "endComponent") == 0){
			printf("component %s info read\n", hardwareComponentInfo->componentTypeName);
			ListNode *currentNode = hardwareComponentInfo->ports->first;
			while (currentNode){
				Port* p = (Port*) currentNode->data;
				
				printf("port %s, type %d, data_type %s\n", p->portName, p->type, p->dataType->typeString);

				currentNode = currentNode->next;
			}
			skipLine(file);
			return hardwareComponentInfo;
		}
		else if(strcmp(command, "port") == 0){
			Port *port = readPort(file);
			list_push_back(hardwareComponentInfo->ports, port);
		}
		else if(strcmp(command, "param") == 0){
			printf ("param tag read\n");
			skipLine(file);
		}
	}

	return NULL;
}

Signal* readSignal(FILE *file){
	
	Signal* signal;
	char signalName[200];
	
	fscanf(file, "%s", signalName);

	signal = createSignal(signalName, NULL);
	
	signal->type = readDataType(file);

	return signal;
}

HardwareComponent* readInstance(FILE *file, List *hardwareComponentTypes){

	char instanceName[200];
	fscanf(file, "%s", instanceName);

	char instanceTypeName[200];
	fscanf(file, "%s", instanceTypeName);
	
	ListNode *currentNode = hardwareComponentTypes->first;
	while(currentNode){
		HardwareComponentInfo *info = (HardwareComponentInfo*) currentNode->data;

		if(strcmp(info->componentTypeName, instanceTypeName) == 0){
			HardwareComponent *comp = createHardwareComponent(instanceName, info);
		/*	
			printf("instance %s type %s read\n", comp->instanceName, comp->componentInfo->componentTypeName);
			ListNode *currentNode = comp->componentPorts->first;
			while (currentNode){
				Port* p = (Port*) currentNode->data;
				
				printf("port %s, type %d, data_type %s\n", p->portName, p->type, p->dataType->typeString);

				currentNode = currentNode->next;
			}
		*/
			return comp;
		}
		currentNode = currentNode->next;
	}
}

void readBind(FILE *file, HardwareComponent *topComponent){
	
	List *loadedComponents = topComponent->children;
	HardwareComponent *compA = NULL, *compB = NULL;
	
	char instanceAName[200];
	fscanf(file, "%s", instanceAName);
	char instanceAPort[200];
	fscanf(file, "%s", instanceAPort);

	char instanceBName[200];
	fscanf(file, "%s", instanceBName);
	char instanceBPort[200];
	fscanf(file, "%s", instanceBPort);

	if(strcmp(instanceAName,topComponent->instanceName) == 0){
		compA = topComponent;
	}
	else if(strcmp(instanceBName,topComponent->instanceName) == 0){
		compB = topComponent;
	}


	ListNode *currentNode = loadedComponents->first;
	while(currentNode != NULL){ //component instance lookup
		ComponentChild *child = (ComponentChild*)currentNode->data;
		if(child->type == ChildType_HardwareComponent){
			HardwareComponent * comp = (HardwareComponent*)child->child;
			if(compA == NULL && strcmp(comp->instanceName, instanceAName) == 0)
				compA = comp;
			if(compB == NULL && strcmp(comp->instanceName, instanceBName) == 0)
				compB = comp;
		}
		currentNode = currentNode->next;
	}


	Port *portCompA =NULL;
	Port *portCompB =NULL;

	if (compA != NULL && compB != NULL){
		portCompA = compA->getPort(compA, instanceAPort);
		portCompB = compB->getPort(compB, instanceBPort);
	}
	else {
		if(compA)
			printf("%s was not instantied\n", instanceBName);
		else if(compB)
			printf("%s was not instantied\n", instanceAName);
		else{
			printf("%s was not instantied\n", instanceAName);
			printf("%s was not instantied\n", instanceBName);
		}
	}

	if (portCompA != NULL && portCompB != NULL){
		printf("%s::%d\n",__FILE__,__LINE__);
		portBind(portCompA, BindType_portBind ,portCompB);
		printf("port %s p %s bound to component %s p %s\n", compA->instanceName, portCompA->portName, compB->instanceName, portCompB->portName);
	}
	else{
		if(portCompA)
			printf("port %s not found in component %s\n", instanceBPort, compB->instanceName);
		else if(compB)
			printf("port %s not found in component %s\n", instanceAPort, compA->instanceName);
		else{
			printf("port %s not found in component %s\n", instanceBPort, compB->instanceName);
			printf("port %s not found in component %s\n", instanceAPort, compA->instanceName);
		}
	}
}

//TODO signal bind
void readSignalBind(FILE *file, HardwareComponent *topComponent, List *signalList){
	
	List *loadedComponents = topComponent->children;
	HardwareComponent *comp = NULL;
	Port *portComp =NULL;
	Signal *signal;
	
	char instanceName[200];
	fscanf(file, "%s", instanceName);
	char instancePort[200];
	fscanf(file, "%s", instancePort);

	char signalName[200];
	fscanf(file, "%s", signalName);

	if(strcmp(instanceName,topComponent->instanceName) == 0){
		comp = topComponent;
	}

	if (comp == NULL){
		ListNode *currentNode = loadedComponents->first;
		while(currentNode != NULL){ //component instance lookup
			ComponentChild *child = (ComponentChild*)currentNode->data;
			if(child->type == ChildType_HardwareComponent){
				HardwareComponent * compAux = (HardwareComponent*)child->child;
				if(strcmp(compAux->instanceName, instanceName) == 0){
					comp = compAux;
					break;
				}
			}
			currentNode = currentNode->next;
		}
	}
	
	if (comp != NULL)
		portComp = comp->getPort(comp, instancePort);

	if (comp != NULL){
		ListNode *currentNode = signalList->first;
		while(currentNode != NULL){ //signal instance lookup
			Signal *sigAux = (Signal*)currentNode->data;
			if(strcmp(sigAux->name, signalName)){
				signal = sigAux;
				break;
			}
			currentNode = currentNode->next;
		}
	}

		
	if (comp == NULL)
		printf("component %s was not instantied\n", instanceName);
	else if (portComp == NULL)
		printf("port %s not found in component %s\n", instancePort, comp->instanceName);
	else if (signal == NULL)
		printf("signal %s was not declared\n", signalName);
	else{
		portBind(portComp, BindType_signalBind , signal);
		printf("comp %s p %s bound to signal %s\n", comp->instanceName, portComp->portName, signal->name);
	}
}

ReconfigurableRegion* readReconfigurableRegion(FILE *file){

	char regionName[200];
	fscanf(file, "%s", regionName);
	int topCopmponentUid;
	fscanf(file, "%d", &topCopmponentUid);

	ReconfigurableRegion *region = createReconfigurableRegion(regionName, NULL);
	printf("Read %s \n", region->name);

	return region;

}

Architecture* readArchitecture(FILE *architectureDescriptionFile){
	List *compInfoList = createList(NULL);
	List *signalList = createList(NULL);

	char * line = NULL;
	size_t len = 0;
	ssize_t read;

	int isFirstComponent;
	ReconfigurableRegion *currentRegion = NULL;
	HardwareComponent *topComponent = NULL;

	Architecture *currentArch = NULL;

	char command[50]; //port, architecture, endArchitecture, bind, signalBind, component, endComponent 

	int skipToNextRegion = 0;
	int architectureUid;
	char regionName[200];

	printf("Parsing Architecture\n");
	while ((fscanf(architectureDescriptionFile, "%s", command)) != EOF) {
		if(strcmp(command, "architecture") == 0){ //architecture <architectureId> <reconfigurableRegionName>
			printf("%s tag read\n", command);
			fscanf(architectureDescriptionFile, "%d", &architectureUid);
			fscanf(architectureDescriptionFile, "%s", regionName);
			isFirstComponent = 1;
		}
		else if(strcmp(command, "endArchitecture") == 0){
			currentArch = createArchitecture(topComponent, regionName);
			currentArch->uid = architectureUid;
			return currentArch;
		}
		else if(strcmp(command, "component") == 0){
			HardwareComponentInfo * compInfo = readComponentInfo(architectureDescriptionFile);
			if(isFirstComponent){
				topComponent = createHardwareComponent(compInfo->componentTypeName, compInfo);
				isFirstComponent = 0;
			}
			list_push_back(compInfoList,compInfo);
		}
		else if(strcmp(command, "signal") == 0){
			Signal *signal = readSignal(architectureDescriptionFile);
			list_push_back(signalList,signal);
		}
		else if(strcmp(command, "instance") == 0){
			HardwareComponent *componentInstance = readInstance(architectureDescriptionFile, compInfoList);
			topComponent->addChild(topComponent, ChildType_HardwareComponent, componentInstance);
		}
		else if(strcmp(command, "bind") == 0){
			readBind(architectureDescriptionFile, topComponent);
		}
		else if(strcmp(command, "signalBind") == 0){
			readSignalBind(architectureDescriptionFile, topComponent, signalList);
		}
		else { //skip line
			skipLine(architectureDescriptionFile);
		}
	}

	return NULL;
}


Architecture* ComponentModelParser_loadArchitecture(char *architectureFilePath){
	FILE *architectureFile = fopen(architectureFilePath, "r");
	Architecture *arch = NULL; 
	if (architectureFile == NULL)
		printf("cant find config file %s\n", architectureFilePath);
	else{
		arch = readArchitecture(architectureFile);
		fclose(architectureFile);
	}
	return arch; 
}

void ComponentModelParser_loadReconfigurableRegions(List *reconfigurableRegions, char* configFilePath){

	List *compInfoList = createList(NULL);
	List *signalList = createList(NULL);

	FILE *configFile = fopen(configFilePath, "r");
	char * line = NULL;
	size_t len = 0;
	ssize_t read;

	int isFirstComponent;
	ReconfigurableRegion *currentRegion = NULL;
	HardwareComponent *topComponent = NULL;
	Architecture *regionArch = NULL;

	char command[50]; //port, bind, signalBind, component, endComponent, reconfigurableRegion

	if (configFile == NULL)
		printf("cant find config file %s\n", configFilePath);
	else
	{
		printf("Parsing Reconfigurable Region Config File\n");
		while ((fscanf(configFile, "%s", command)) != EOF) {
			if(strcmp(command, "reconfigurableRegion") == 0){ //region <RegionName>
				printf("%s tag read\n", command);
				currentRegion = readReconfigurableRegion(configFile);
				regionArch = readArchitecture(configFile);
			}
			else if(strcmp(command, "endReconfigurableRegion") == 0){
				currentRegion->assignedHardwareComponent = regionArch->topComponent;
				currentRegion->assignedArchitecture = regionArch;
				list_push_back(reconfigurableRegions,currentRegion);
				currentRegion = NULL;
				regionArch = NULL;
			}
			else { //skip line
				skipLine(configFile);
			}
			/*parse config line*/
		}
	}

	fclose(configFile);
}
