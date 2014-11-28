/*
 * HardwareReconfiguration.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef HARDWARERECONFIGURATION_H_
#define HARDWARERECONFIGURATION_H_


typedef int (*ReconfigureRegion_t)(void *self, char *regionName, char *bitstream);

typedef struct  HardwareReconfigurationModule_t{
	ReconfigureRegion_t reconfigureRegion;
}HardwareReconfigurationModule;

HardwareReconfigurationModule * createHardwareReconfigurationModule();
#endif /* HARDWARERECONFIGURATION_H_ */
