#include "ReconfigurableRegion.h"

#include <stdio.h>
#include <stdlib.h>
int ReconfigurableRegion_compare(void* regionA, void* regionB){
	ReconfigurableRegion* regA = (ReconfigurableRegion*) regionA;
	ReconfigurableRegion* regB = (ReconfigurableRegion*) regionB;

	if(strcmp(regA->name, regB->name) == 0){
		if(regA->assignedArchitecture->uid == regB->assignedArchitecture->uid)
			return 1;
	}
	return 0;
	
}

ReconfigurableRegion* createReconfigurableRegion(const char* name, HardwareComponent* hardwareComponent){
	ReconfigurableRegion *region = malloc(sizeof(ReconfigurableRegion));
	region->assignedHardwareComponent = hardwareComponent;
	region->name = strdup(name);
	region->assignedArchitecture = NULL;
	return region;
}

void destroyReconfigurableRegion(ReconfigurableRegion *reg){

	/*TODO implement destroy for all other components*/
	
}


