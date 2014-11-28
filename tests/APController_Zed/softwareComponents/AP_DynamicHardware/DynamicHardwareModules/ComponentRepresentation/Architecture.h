#ifndef Architecture_h
#define Architecture_h

#include "HardwareComponent.h"
/**
 * An architecture is composed by a hardware component synthesized for
 * a specific reconfigurable region
 **/
typedef struct Architecture_t{

	/*Hardware componenent that is the top component in this architecture*/
	HardwareComponent *topComponent;

	/*Region in which this arcthicture fits into*/
	char *regionName;
	
	/*architecture identifier*/
	int uid;

	/*bitstream used to implement this architecture*/
	char* bitstream;

	/*description file containing the main components into this architecture*/
	char* descriptionFile;

}Architecture;

Architecture* createArchitecture(HardwareComponent *topComponent, char *regionName);

#endif
