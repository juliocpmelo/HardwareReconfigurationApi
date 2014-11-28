
#include "Architecture.h"
#include <stdio.h>
#include <stdlib.h>

Architecture* createArchitecture(HardwareComponent *topComponent, char *regionName){
	Architecture *arch = malloc(sizeof(Architecture));
	arch->regionName = strdup(regionName);
	arch->topComponent = topComponent;
	arch->uid = -1;
	arch->bitstream = NULL;
	arch->descriptionFile = NULL;
	return arch;
}
