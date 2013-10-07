#include <iostream>
#include <vector>
#include <map>

#include "CommunicationHardwareConverterVHDL.h"
#include "CommunicationHardwareXmlParser.h"
#include "HardwareProject.h"

using namespace std;


void printUsage(){

	cout<<"this program generates a set of componenent files to be used together with the HardwareReconfiguration API"<<endl;
	cout<<"usage:"<<endl;
	cout<<"./VhdlComponentGenerator <xmlProjectDescription>"<<endl;
	
}
/*
 * IP generation
 * argv[1] : communication hardware xml description file
 * argv[2] : output file location
 */
int main(int argc, char** argv){

	char workingDir[256];

	if (argc != 2){
		printUsage();
		return -1;
	}

	cout<<"parsing file "<<argv[1]<<endl;


//	HardwareProject *project= new HardwareProject("D:/AutonomicSegmentationSystem/AutonomicImageProcessingDesc.xml");
	HardwareProject *project= new HardwareProject(string(argv[1]));

	map<std::string, ReconfigurableRegion* >	communicationHardwareTable = project->managedReconfRegions;

	CommunicationHardwareConverterVHDL *converter = new CommunicationHardwareConverterVHDL();



	map<std::string, ReconfigurableRegion* >::iterator it;
	for (it = communicationHardwareTable.begin(); it!=communicationHardwareTable.end(); it++){
		cout<<"generating file "<<project->projectPath<< "/ipcores/"<<it->second->communicationHardware->name()<< ".vhdl"<<endl;
		converter->buildComponentDescription(project->projectPath, it->second->communicationHardware);
	}

	return 0;
}
