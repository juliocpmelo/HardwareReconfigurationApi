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

typedef void (*SetRegisterValueImpl_t) (int registerId, int value);
typedef int (*GetRegisterValueImpl_t) (int registerId);


typedef struct HardwareInterfaceModule_t{

	SetRegisterValue_t setRegisterValue;
	GetRegisterValue_t getRegisterValue;

	SetRegisterValueImpl_t implSetRegisterValue;
	GetRegisterValueImpl_t implGetRegisterValue;

}HardwareInterface;

HardwareInterface *createHardwareInterface();

/**
 * @brief sets implementation dependent RegisterRead and RegisterWrite functions
 * @param the instance of the hardwareInterface struct that handles this communication
 **/
void setupImplSetRegValueAndImplGetRegValue(HardwareInterface *selfInstance);

#endif /* HARDWAREINTERFACE_H_ */
