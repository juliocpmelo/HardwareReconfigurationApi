#include <cstdio>
#include <iostream>
#include <stdlib.h>

#include "HardwareProject.h"
#include "HardwareComponent.h"
#include "ComponentDatabase.h"

using namespace std;



//os assignents podem vir como descrição do design e adicionar uma forma
//ainda mais genérica de configuração
int main(int argc, char *argv[]){
	cout<<"This progam will test the capability of reconfiguring the FPGA through software"<<endl;
	int var = 0;
	cout<<"running project, type a or b"<<endl;

    //p1->addFile("C:/Documents and Settings/schneider/Meus documentos/julio/doutorado/fpgaProjects/Adder8Bits/combinationalLibrary.vhd");
   // p1->setDevice("EP1C6F256C6");
   // p1->setDeviceFamily("Cyclone");
    //p1->generateConfigFile();
  //  p1->compileProject();
    
    char ch;
    while(true){
        cin>>ch;
        switch (ch){
            case 'a':
            {
                cout<<"generating through software"<<endl;
                HardwareProject *project = new HardwareProject("D:/AutonomicSegmentationSystem/AutonomicImageProcessingDesc.xml");


								/*each reconfigurable region should have a corresponding communicationHardware description*/
								ReconfigurableRegion *region = project->getReconfigurableRegion("AutonomicSegmentation");
								//ReconfigurableRegion *region = project->getReconfigurableRegion("RegionA");

								ComponentDatabase *database = new ComponentDatabase();

								/*generic component declaration, without fixed port number*/
								HardwareComponent *topComponent = new HardwareComponent("AutonomicTreshold", NULL);

								//new API with system C
								cout << __FILE__ << "::" << __LINE__ <<endl; 
								topComponent->addInput("clk", BIT_TYPE);

                topComponent->addInput("lineBuffer_in_x", VECTOR_TYPE( "23", "downto", "0"));
                topComponent->addInput("lineBuffer_in_y", VECTOR_TYPE( "23", "downto", "0"));
                topComponent->addInput("lineBuffer_in_pixel", VECTOR_TYPE( "23", "downto", "0"));
                topComponent->addInput("lineBuffer_in_param", VECTOR_TYPE( "7", "downto", "0"));

                topComponent->addInput("lineBuffer_out_x", VECTOR_TYPE( "23", "downto", "0"));
                topComponent->addInput("lineBuffer_out_y", VECTOR_TYPE( "23", "downto", "0"));
                topComponent->addInput("lineBuffer_out_param", VECTOR_TYPE( "7", "downto", "0"));
                topComponent->addOutput("lineBuffer_out_outputPixel", VECTOR_TYPE( "23", "downto", "0"));
                
								topComponent->addInput("systemStart", BIT_TYPE);
								
								topComponent->addOutput("buffersApDone", BIT_TYPE);
								topComponent->addOutput("buffersApIdle", BIT_TYPE);
								topComponent->addOutput("buffersApReady", BIT_TYPE);
                

								/*external ports are defined in the reconfigurable region xml description*/
								topComponent->portMap("clk", region->getPort("commHardware_clk"));


								/*software acessible inputs will be able to be acessed using the communication hardware API*/
								topComponent->createSoftwareAccess("lineBuffer_in_x");
								topComponent->createSoftwareAccess("lineBuffer_in_y");
								topComponent->createSoftwareAccess("lineBuffer_in_pixel");
								topComponent->createSoftwareAccess("lineBuffer_in_param");
								topComponent->createSoftwareAccess("lineBuffer_out_x");
								topComponent->createSoftwareAccess("lineBuffer_out_y");
								topComponent->createSoftwareAccess("lineBuffer_out_param");
								topComponent->createSoftwareAccess("lineBuffer_out_outputPixel");
								topComponent->createSoftwareAccess("buffersApDone");
								topComponent->createSoftwareAccess("buffersApIdle");
								topComponent->createSoftwareAccess("buffersApReady");
								topComponent->createSoftwareAccess("systemStart");

                region->assignTopComponent(topComponent);


								/*signal declaration*/
								sc_signal_resolved *sig_lineBufferIn_ap_done = database->createSignal("sig_lineBufferIn_ap_done", BIT_TYPE);
								sc_signal_resolved *sig_lineBufferIn_ap_idle = database->createSignal("sig_lineBufferIn_ap_idle", BIT_TYPE);
								sc_signal_resolved *sig_lineBufferIn_ap_ready = database->createSignal("sig_lineBufferIn_ap_ready", BIT_TYPE);

								sc_signal_resolved *sig_lineBufferOut_ap_done = database->createSignal("sig_lineBufferOut_ap_done", BIT_TYPE);
								sc_signal_resolved *sig_lineBufferOut_ap_idle = database->createSignal("sig_lineBufferOut_ap_idle", BIT_TYPE);
								sc_signal_resolved *sig_lineBufferOut_ap_ready = database->createSignal("sig_lineBufferOut_ap_ready", BIT_TYPE);


								HardwareComponent *lineBuffer_in = database->getHardwareComponent("lineBuffer_in", "./autonomicImageThresholdComponents.xml:LineBuffer_wrapper");
								lineBuffer_in->portMap("clk", topComponent->getPort("clk"));
								lineBuffer_in->portMap("pixel", topComponent->getPort("lineBuffer_in_pixel"));
								lineBuffer_in->portMap("x", topComponent->getPort("lineBuffer_in_x"));
								lineBuffer_in->portMap("y", topComponent->getPort("lineBuffer_in_y"));
								lineBuffer_in->portMap("param", topComponent->getPort("lineBuffer_in_param"));
								lineBuffer_in->portMap("ap_start", topComponent->getPort("systemStart"));
								lineBuffer_in->portMap("ap_done", sig_lineBufferIn_ap_done);
								lineBuffer_in->portMap("ap_idle", sig_lineBufferIn_ap_idle);
								lineBuffer_in->portMap("ap_ready", sig_lineBufferIn_ap_ready);

								
								HardwareComponent *lineBuffer_out = database->getHardwareComponent("lineBuffer_out", "./autonomicImageThresholdComponents.xml:LineBuffer_wrapper");
								lineBuffer_out->portMap("clk", topComponent->getPort("clk"));
								lineBuffer_out->portMap("pixel", lineBuffer_in->getPort("outputPixel"));
								lineBuffer_out->portMap("x", topComponent->getPort("lineBuffer_out_x"));
								lineBuffer_out->portMap("y", topComponent->getPort("lineBuffer_out_y"));
								lineBuffer_out->portMap("param", topComponent->getPort("lineBuffer_out_param"));
								lineBuffer_out->portMap("ap_start", topComponent->getPort("systemStart"));
								lineBuffer_out->portMap("ap_done", sig_lineBufferOut_ap_done);
								lineBuffer_out->portMap("ap_idle", sig_lineBufferOut_ap_idle);
								lineBuffer_out->portMap("ap_ready", sig_lineBufferOut_ap_ready);
								lineBuffer_out->portMap("outputPixel", topComponent->getPort("lineBuffer_out_outputPixel"));


                topComponent->portMap("buffersApDone", sig_lineBufferOut_ap_done); //TODO Make and between signals
                topComponent->portMap("buffersApIdle", sig_lineBufferOut_ap_idle); //TODO Make and between signals
                topComponent->portMap("buffersApReady", sig_lineBufferOut_ap_ready); //TODO Make and between signals



								/*TODO find a way to remove these calls*/
								topComponent->addChildObject(lineBuffer_in);
								topComponent->addChildObject(lineBuffer_out);

                project->generateHDLFiles(topComponent);
                //project->generateConfigFile();
                project->compileProject();
								//
								cout<<"hardware component successfully generated"<<endl;
    
            }
            break;
            case 'b':
            {
            	HardwareProject *p1 = new HardwareProject("adder8Bits", 
                                                          "C:/Documents and Settings/schneider/Meus Documentos/julio/doutorado/fpgaProjects/TestHardwareBuilding/");
                p1->generateHDLFiles(NULL);
                p1->generateConfigFile();
                p1->compileProject();
            }
            break;
        }

    }
//	HardwareProject *p2 = new HardwareProject("TestSoftwareReconfiguration", "C:/\"Documents and Settings\"/schneider/", "C:/Documents and Settings/schneider/Meus documentos/julio/doutorado/ArtigoSCProcessorBuilder/simpleModeling.xml");
//	p1->addFile("c:/test.vdl");
//	p1->compileProject();
//	p2->compileProject();
//	while(true){
//		cout<<"-- changing to fpga projects data base -- "<<endl;
//		cin>>var;
//        p2->burnProject("","");
//		cin>>var;
//		p1->burnProject("","");
//		cin>>var;
//	}
}
