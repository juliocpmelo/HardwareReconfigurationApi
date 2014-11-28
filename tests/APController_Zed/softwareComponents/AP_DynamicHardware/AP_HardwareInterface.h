
#ifndef AP_HardwareInterface_h
#define AP_HardwareInterface_h


extern "C"{
	#include "DynamicHardwareModules/ArchitectureManager/HardwareInterface.h"

	/*c-like read and write functions*/
	void AP_setRegisterValue(int registerId, int value);
	int AP_getRegisterValue(int registerId);

}


/*create loop to check env variables
 * create reference to DynamicHardware modules
 * create communication component based on the mavlink protocol
 * TODO create a dynamicHardware.pde in order to interface with this class
 */
class AP_HardwareInterface {
	public:
		AP_HardwareInterface();

		void setRegisterValue(int registerId, int value);
		int getRegisterValue(int registerId);
		bool initHardwareInterface(); 

	private:
		static AP_HardwareInterface* selfInstance;

};


#endif //AP_HardwareInterface_h


