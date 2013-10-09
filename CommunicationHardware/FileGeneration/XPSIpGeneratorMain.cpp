#include <iostream>
#include <vector>
#include <map>

#include <stdio.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>


#include "CommunicationHardwareConverterVHDL.h"
#include "CommunicationHardwareXmlParser.h"
#include "HardwareProject.h"

using namespace std;


void printUsage(){

	cout<<"this program generates a set of componenent files to be used together with the HardwareReconfiguration API"<<endl;
	cout<<"usage:"<<endl;
	cout<<"./CommHardwareComponentGenerator [vhdl|verilog]+ <xmlProjectDescription>"<<endl;
	
}
/*
 * IP generation
 * argv[1] : communication hardware xml description file
 * argv[2] : output file location
 */
int main(int argc, char** argv){


	if (argc != 3){
		printUsage();
		return -1;
	}


/*TODO add verilog support*/
//	HardwareProject *project= new HardwareProject("D:/AutonomicSegmentationSystem/AutonomicImageProcessingDesc.xml");
//
//
	HardwareProject *project= new HardwareProject(string(argv[2]));

	map<std::string, ReconfigurableRegion* >	communicationHardwareTable = project->managedReconfRegions;




	if(strcmp(argv[1], "vhdl") == 0){
		
		cout<<"generating component files for vhdl"<<endl;
		CommunicationHardwareConverterVHDL *converter = new CommunicationHardwareConverterVHDL();
		map<std::string, ReconfigurableRegion* >::iterator it;
		
		cout<<"generating vhdl to component "<<endl;
		if (mkdir (string(project->projectPath + "/commHardwareComponents").c_str(), 0755) == -1) { 
			if (errno != EEXIST){
				cout <<"Failed to create directory " << project->projectPath + "/commHardwareComponents" << endl;
				return -1;
			}
		}

		for (it = communicationHardwareTable.begin(); it!=communicationHardwareTable.end(); it++){
			cout<<"generating file "<<project->projectPath<< "/ipcores/"<<it->second->communicationHardware->name()<< ".vhdl"<<endl;

			string fileLocation = string(project->projectPath + "/commHardwareComponents/" + it->second->communicationHardware->name() + ".vhdl");
			converter->buildComponentDescription(fileLocation, it->second->communicationHardware);
		}
	}
	else{
		cout<<"language "<<argv[2]<<" not supported yet"<<endl;
	}

	return 0;
}
