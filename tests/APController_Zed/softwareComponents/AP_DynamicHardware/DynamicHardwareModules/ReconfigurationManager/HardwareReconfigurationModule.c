/*
 * HardwareReconfiguration.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */
#include "HardwareReconfigurationModule.h"
#include <stdio.h>
#include <stdlib.h>

int reconfigureRegion(void *self, char *regionName, char *bitstream){
	/*call the implemented reconfiguration module*/
	printf("Reconfigure region %s bitstream %s\n", regionName, bitstream);
	return 1;
}

HardwareReconfigurationModule* createHardwareReconfigurationModule(){
	HardwareReconfigurationModule* hardReconfgModule = malloc(sizeof(HardwareReconfigurationModule));
	hardReconfgModule->reconfigureRegion = &reconfigureRegion;
	return hardReconfgModule;
}
