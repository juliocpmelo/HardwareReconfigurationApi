#include <iostream>
#include <vector>

#include "CommunicationHardwareConverterVHDL.h"
#include "CommunicationHardwareXmlParser.h"

using namespace std;


/*
 * IP generation
 * argv[1] : communication hardware xml description file
 * argv[2] : output file location
 */
int main(int argc, char** argv){

	char workingDir[256];


	cout<<"parsing file "<<argv[1]<<endl;
	CommunicationHardwareXmlParser * parser = new CommunicationHardwareXmlParser();
	HardwareComponent* communicationHardwareComponent = parser->parseXml(string(argv[1]));

	CommunicationHardwareConverterVHDL *converter = new CommunicationHardwareConverterVHDL();

	cout<<"generating file "<<argv[2]<<endl;
	converter->buildComponentDescription(string(argv[2]), communicationHardwareComponent);
	
}
