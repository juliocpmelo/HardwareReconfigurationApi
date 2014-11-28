
#ifndef	ReconfigurableRegion_h
#define ReconfigurableRegion_h

#include "HardwareComponent.h"
#include "Architecture.h"

typedef struct ReconfigurableRegion_t {

	/*name of the reconfigurable region*/
	char *name;
	
	/*current hardware component assigned to this region*/
	HardwareComponent *assignedHardwareComponent;

	/*current description of the internal architecture assigned to this region*/
	Architecture *assignedArchitecture;

}ReconfigurableRegion;

int ReconfigurableRegion_compare(void* regionA, void* regionB);

ReconfigurableRegion* createReconfigurableRegion(const char* name, HardwareComponent* hardwareComponent);

#endif
