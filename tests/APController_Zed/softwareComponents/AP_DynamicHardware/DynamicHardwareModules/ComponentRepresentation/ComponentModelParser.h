#ifndef ComponentModelParser_h
#define ComponentModelParser_h

#include <Util/List.h>
#include <stdio.h>
#include <stdlib.h>
#include "HardwareComponent.h"
#include "Architecture.h"

/**
 * @brief loads all reconfigurable regions described at the file to the current list
 * @param reconfigurableRegions list to be used as return param, at the end the list will
 * 				contain all ReconfigurableRegion instances described at configFile
 * @param configFilePath a description file with the current status of the reconfigurable
 * 				regions
 **/
void ComponentModelParser_loadReconfigurableRegions(List *reconfigurableRegions, char* configFilePath);

/**
 * @brief loads a single region component 
 * @param reconfigurableRegionName name of the region from which the component will be loaded 
 * @param configFilePath a description file with the current status of the reconfigurable
 * 				region
 **/
Architecture* ComponentModelParser_loadArchitecture(char *architectureFilePath);

#endif //ComponentModelParser_h
