#include "AP_HardwareInterface.h"
#include <iostream>
using namespace std;

AP_HardwareInterface* AP_HardwareInterface::selfInstance=NULL;

/*@implements setupImplSetRegValueAndImplGetRegValue from HardwareInterface.h0*/
void setupImplSetRegValueAndImplGetRegValue(HardwareInterface *hwInterfaceInstance){
	hwInterfaceInstance->implSetRegisterValue = &AP_setRegisterValue;
	hwInterfaceInstance->implGetRegisterValue = &AP_getRegisterValue;
}

void AP_setRegisterValue(int registerId, int value){
	//TODO zedboard implementation	
}

int AP_getRegisterValue(int registerId){
	//TODO zedboard implementation	
	return 0;
}

AP_HardwareInterface::AP_HardwareInterface(){}

void AP_HardwareInterface::setRegisterValue(int registerId, int value){

}

int AP_HardwareInterface::getRegisterValue(int registerId){
}

bool AP_HardwareInterface::initHardwareInterface(){

	if(selfInstance)
		return false;
	else{
		selfInstance = this;
		return true;
	}
}


