/*
 * HardwareReconfiguration.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */
#include "HardwareReconfigurationModule.h"
#include <stdio.h>
#include <stdlib.h>

HardwareReconfigurationModule* createHardwareReconfigurationModule(){
	HardwareReconfigurationModule* hardReconfgModule = malloc(sizeof(HardwareReconfigurationModule));
	return hardReconfgModule;
}
