/*
 * HardwareInterface.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef HARDWAREINTERFACE_H_
#define HARDWAREINTERFACE_H_


typedef void (*SetRegisterValue_t) (void* self,int registerId, int value);
typedef int (*GetRegisterValue_t) (void* self,int registerId);

typedef struct HardwareInterfaceModule_t{

	SetRegisterValue_t setRegisterValue;
	GetRegisterValue_t getRegisterValue;

}HardwareInterface;

HardwareInterface *createHardwareInterface();

#endif /* HARDWAREINTERFACE_H_ */
