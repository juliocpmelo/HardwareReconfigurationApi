/*
 * CommunicationManager.c
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#include "HardwareInterface.h"

/*
 * sets the value of a register
 * @param self a reference to the HardwareInterface
 * @param registerId the id of the register which the value will be get
 * @param value the value to be set into the register
 */
void setRegisterValue(void* self, int registerId, int value){
	((HardwareInterface*)self)->implSetRegisterValue(registerId, value);
}

/*
 * gets a register value into the hardware component
 * @param self a reference to the HardwareInterface
 * @param registerId the id of the register which the value will be get
 * @return the register value
 */
int getRegisterValue(void* self, int registerId){
	return ((HardwareInterface*)self)->implGetRegisterValue(registerId);
}

HardwareInterface *createHardwareInterface(){
	HardwareInterface *hardwareInt = malloc(sizeof(HardwareInterface));

	hardwareInt->setRegisterValue = &setRegisterValue;
	hardwareInt->getRegisterValue = &getRegisterValue;

	setupImplSetRegValueAndImplGetRegValue(hardwareInt);
	return hardwareInt;
}


