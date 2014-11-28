/*
 * ArchitectureManager.h
 *
 *  Created on: 24.05.2013
 *      Author: Julio
 */

#ifndef ARCHITECTUREMANAGER_H_
#define ARCHITECTUREMANAGER_H_

#include "HardwareInterface.h"
#include "ComponentRepresentation/HardwareComponent.h"
#include "ComponentRepresentation/ReconfigurableRegion.h"
#include "CommunicationManager/CommunicationManager.h"
#include "ReconfigurationManager/HardwareReconfigurationModule.h"

typedef struct HardwareInterface_t {
	
	/**
	 * list containing port names and indexes to be accessed
	 **/
	List *communicationTable;

	/**/
	uint32_t getPortValue(char *portName);
	void setPortValue(char *portName, uint32_t value);

} HardwareInterface;

HardwareInterface* createHardwareInterface(List *communicationTable);
