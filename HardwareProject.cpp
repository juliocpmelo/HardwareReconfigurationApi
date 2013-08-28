#include "HardwareProject.h"
#include "HardwareComponentConverterVHDL.h"
#include <stdio.h>
#include <unistd.h>
#include <windows.h>
#include <fstream>


using namespace std;

HardwareProject::HardwareProject(std::string projectXmlDescriptionUri){
	this->projectXmlDescriptionUri = projectXmlDescriptionUri;

	hardwareProjectXmlParser = new HardwareProjectXmlParser();
	hardwareProjectXmlParser->parseProjectXmlDescription(this->projectXmlDescriptionUri);

	this->managedReconfRegions = hardwareProjectXmlParser->getReconfigurableRegions();

	this->projectName = hardwareProjectXmlParser->getProjectName();
	this->projectPath = hardwareProjectXmlParser->getProjectPath();

}

HardwareProject::HardwareProject(std::string projectName, std::string projectPath){
	
	this->projectName = projectName;
	this->projectPath = projectPath;
}

void HardwareProject::setTopLevelComponent(HardwareComponent *topLevelComponent){
	this->topLevelComponent = topLevelComponent;

	/*get all software accessible interfaces and generate a communication hardawre accordingly*/

	/*get all portmaped interfaces to the communication hardware*/
}


void HardwareProject::burnProject(std::string cableName, std::string programmingMode){
	string systemCommand = "";
	systemCommand += "C:/altera/70/quartus/bin/quartus_pgm "; //programmer executable name
	systemCommand += "-c USB-Blaster -m JTAG "; //burner interface type
	systemCommand += "-o p;C:"+projectPath+"/"+projectName+".sof"; //burn options and project name
	system(systemCommand.c_str());
}

void HardwareProject::setDevice(std::string deviceName){
     this->deviceName = deviceName;
}

void HardwareProject::setDeviceFamily(std::string deviceFamily){
     this->deviceFamily = deviceFamily;
}

void HardwareProject::generateConfigFile(){

    ofstream configFile;
    string fileLocation = projectPath+"config_file.tcl";
    configFile.open (fileLocation.c_str());

    configFile<<"project_new "<<projectName<<" -overwrite"<<endl;
    configFile<<"#global assignments"<<endl;

    for (vector<string>::iterator it = projectFiles.begin(); it != projectFiles.end(); it++){
        //copy the file from the original location to the working dir
        string fileName = (*it).substr((*it).find_last_of("/")+1,(*it).size());
        configFile<<"set_global_assignment -name VHDL_FILE "<<fileName<<endl;    
    }
    configFile<<"set_global_assignment -name VHDL_FILE "<<projectName+".vhdl"<<endl;    
    configFile<<"set_global_assignment -name TOP_LEVEL_ENTITY "<<projectName<<endl;

    configFile<<"#assignements "<<endl;
    for(map<string, string >::iterator it = hardwareComponentXmlParser->assignments.begin(); it!= hardwareComponentXmlParser->assignments.end(); it++){
        configFile<<"set_location_assignment -to "<<it->first<<" "<<it->second<<endl;
    }
    configFile<<"project_close "<<endl;
    
    cout<<"config file saved to "<<fileLocation<<endl;
}

void HardwareProject::generateHDLFiles(HardwareComponent *comp){
		HardwareComponentConverterVHDL *converter = new HardwareComponentConverterVHDL();
    converter->buildTopComponentFile(projectPath, topLevelComponent);
}

static void copyAllFilesToWorkingDir(vector<string> files, string path){
    for (vector<string>::iterator it = files.begin(); it != files.end(); it++){
        //copy the file from the original location to the working dir
        ifstream ifs((*it).c_str(), std::ios::binary);
        string fileName = (*it).substr((*it).find_last_of("/")+1,(*it).size());
        cout<<"copying file name "<<fileName<<endl;
        ofstream ofs((path+"/"+fileName).c_str(), std::ios::binary);
        ofs << ifs.rdbuf();
    }
}

/*usar quartus_map, quartus_fit e quartus_asm*/
void HardwareProject::compileProject(){
    chdir(projectPath.c_str());
    copyAllFilesToWorkingDir(projectFiles, projectPath);

    copyAllFilesToWorkingDir(vector<string>(hardwareComponentXmlParser->dependencyFiles.begin(), hardwareComponentXmlParser->dependencyFiles.end()), projectPath);
	string systemCommand = "";
    systemCommand += "C:/altera/70/quartus/bin/quartus_sh -t \"" + projectPath + "config_file.tcl\"";  //compiler executable name
    cout<<"executing system command"<<systemCommand<<endl;
    system(systemCommand.c_str());

    systemCommand = "";    
    systemCommand += "C:/altera/70/quartus/bin/quartus_map ";  //compiler executable name
    //systemCommand += "--set=VHDL_FILE=\"" + projectName + ".vhdl\" "; 
    //systemCommand += "--set=VHDL_FILE=\"combinationalLibrary.vhd\" ";
    //systemCommand += "--set=TOP_LEVEL_ENTITY=\"adder8Bits.vhd\" ";
    //systemCommand += "--source=\"" + projectPath+"/"+projectName + ".vhdl\" ";
    systemCommand += "\"" + projectPath+"/"+projectName + "\"";
    systemCommand += " --family=\"" + deviceFamily + "\"";
    cout<<"executing system command"<<systemCommand<<endl;
    system(systemCommand.c_str());

    systemCommand = "";
	systemCommand += "C:/altera/70/quartus/bin/quartus_fit "; //compiler executable name
	systemCommand += "\"" + projectPath+"/"+projectName + "\"";
    systemCommand += " --part=\"" + this->deviceName + "\"";
    cout<<"executing system command"<<systemCommand<<endl;
	system(systemCommand.c_str());
	
	systemCommand = "";
	systemCommand += "C:/altera/70/quartus/bin/quartus_asm "; //compiler executable name
	systemCommand += "\"" + projectPath+"/"+projectName + "\"";
    cout<<"executing system command"<<systemCommand<<endl;
	system(systemCommand.c_str());
}

void HardwareProject::addFile(string file){
     projectFiles.push_back(file);
}

