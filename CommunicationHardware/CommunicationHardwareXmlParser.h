#ifndef CommunicationHardwareXmlParser_h
#define CommunicationHardwareXmlParser_h

#include <iostream>
#include <vector>
#include <systemc>

#include "HardwareComponentXmlParser.h"



class CommunicationHardwareXmlParser : public HardwareComponentXmlParser
{
	public:
		/*variables*/
	public:
		/*methods*/
		CommunicationHardwareXmlParser();
		/*
		 * parses the xml description of the communication hardware entity
		 * converting it into a HardwareComponent instance
		 */

		HardwareComponent* parseXml(std::string communicationHardwareXml);

		HardwareComponent* parseCommunicationHardwareNode(std::string reconfigurableRegionName, xmlNode *communicationHardwareNode);

};

#endif

