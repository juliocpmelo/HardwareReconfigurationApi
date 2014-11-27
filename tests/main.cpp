#include <cstdio>
#include <iostream>
#include <stdlib.h>

#include "HardwareProject.h"
#include "HardwareComponent.h"
#include "ComponentDatabase.h"
#include "CommunicationModule/CommunicationModule.h"
#include "ArchitectureManager.h" 
#include "ArdupilotCommLink/AP_CommunicationLink.h"
#include <errno.h>
#include <pthread.h>

using namespace std;


pthread_t ioThreadId;
bool keyBoardActivity;
char pressed_key;
bool stopIo = false;

void* inputThread(void *args){

	while(!stopIo){
		keyBoardActivity = false;
		pressed_key = cin.get();
		if(pressed_key != '\n'){
			keyBoardActivity = true;
			sleep(1);
		}
	}

	return NULL;
}

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
	//
		AP_CommunicationLink *commLink = new AP_CommunicationLink("127.0.0.1", "5763");
		if(commLink->error){
			delete commLink;
			return 0;
		}

		ArchitectureManager *archManager = new ArchitectureManager(commLink);
		archManager->setManagedProject("/home/julio/Documents/ASS/ASS.xml");
		archManager->init();

		pthread_create(&ioThreadId, NULL, inputThread, NULL);
		bool processed = false;
		bool breakLoop = false;
		while (!breakLoop){
			archManager->mainLoop();
			if(keyBoardActivity && !processed){
				switch (pressed_key){
					case 'a':
					{
						processed = true;
						cout<<"generating through software"<<endl;



						/*each reconfigurable region should have a corresponding communicationHardware description*/
						ReconfigurableRegion *region = archManager->getReconfigurableRegion("AutonomicImageSegmentation");

						//ReconfigurableRegion *region = project->getReconfigurableRegion("RegionA");

						ComponentDatabase *database = ComponentDatabase::getInstance();

						database->addDatabaseAddress("/home/julio/Documents/ComponentDatabase/autonomicImageThresholdComponents.xml");

						/*generic component declaration, without fixed port number*/
						HardwareComponent *topComponent = new HardwareComponent("AutonomicTreshold", NULL);

						//new API with system C
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

						/*signal declaration*/
						sc_signal_resolved *sig_lineBufferIn_ap_done = HardwareComponent::createSignal("sig_lineBufferIn_ap_done", BIT_TYPE);
						sc_signal_resolved *sig_lineBufferIn_ap_idle = HardwareComponent::createSignal("sig_lineBufferIn_ap_idle", BIT_TYPE);
						sc_signal_resolved *sig_lineBufferIn_ap_ready = HardwareComponent::createSignal("sig_lineBufferIn_ap_ready", BIT_TYPE);

						sc_signal_resolved *sig_lineBufferOut_ap_done = HardwareComponent::createSignal("sig_lineBufferOut_ap_done", BIT_TYPE);
						sc_signal_resolved *sig_lineBufferOut_ap_idle = HardwareComponent::createSignal("sig_lineBufferOut_ap_idle", BIT_TYPE);
						sc_signal_resolved *sig_lineBufferOut_ap_ready = HardwareComponent::createSignal("sig_lineBufferOut_ap_ready", BIT_TYPE);

						sc_signal_resolved *sig_lineBufferIn_outputPixel_lineBufferOut_pixel = HardwareComponent::createSignal("sig_lineBufferIn_outputPixel_lineBufferOut_pixel", VECTOR_TYPE( "23", "downto", "0"));


						HardwareComponent *lineBuffer_in = database->getHardwareComponent("lineBuffer_in", "/home/julio/Documents/ComponentDatabase/autonomicImageThresholdComponents.xml:LineBuffer_wrapper");
						lineBuffer_in->portMap("clk", topComponent->getPort("clk"));
						lineBuffer_in->portMap("pixel", topComponent->getPort("lineBuffer_in_pixel"));
						lineBuffer_in->portMap("x", topComponent->getPort("lineBuffer_in_x"));
						lineBuffer_in->portMap("y", topComponent->getPort("lineBuffer_in_y"));
						lineBuffer_in->portMap("param", topComponent->getPort("lineBuffer_in_param"));
						lineBuffer_in->portMap("ap_start", topComponent->getPort("systemStart"));
						lineBuffer_in->portMap("ap_done", sig_lineBufferIn_ap_done);
						lineBuffer_in->portMap("ap_idle", sig_lineBufferIn_ap_idle);
						lineBuffer_in->portMap("ap_ready", sig_lineBufferIn_ap_ready);
						lineBuffer_in->portMap("outputPixel", sig_lineBufferIn_outputPixel_lineBufferOut_pixel);


						HardwareComponent *lineBuffer_out = database->getHardwareComponent("lineBuffer_out", "/home/julio/Documents/ComponentDatabase/autonomicImageThresholdComponents.xml:LineBuffer_wrapper");
						lineBuffer_out->portMap("clk", topComponent->getPort("clk"));
						lineBuffer_out->portMap("pixel", sig_lineBufferIn_outputPixel_lineBufferOut_pixel);
						lineBuffer_out->portMap("x", topComponent->getPort("lineBuffer_out_x"));
						lineBuffer_out->portMap("y", topComponent->getPort("lineBuffer_out_y"));
						lineBuffer_out->portMap("param", topComponent->getPort("lineBuffer_out_param"));
						lineBuffer_out->portMap("ap_start", topComponent->getPort("systemStart"));
						lineBuffer_out->portMap("ap_done", sig_lineBufferOut_ap_done);
						lineBuffer_out->portMap("ap_idle", sig_lineBufferOut_ap_idle);
						lineBuffer_out->portMap("ap_ready", sig_lineBufferOut_ap_ready);
						lineBuffer_out->portMap("outputPixel", topComponent->getPort("lineBuffer_out_outputPixel"));


						topComponent->portMap("buffersApDone", sig_lineBufferOut_ap_done); //TODO execute logic operations between signals
						topComponent->portMap("buffersApIdle", sig_lineBufferOut_ap_idle); //TODO execute logic operations between signals
						topComponent->portMap("buffersApReady", sig_lineBufferOut_ap_ready); //TODO execute logic operations between signal



						/*TODO find a way to remove these calls
						 *put use the portMap function to add*/
						topComponent->addChildObject(lineBuffer_in);
						topComponent->addChildObject(lineBuffer_out);

						//project->generateHDLFiles();
						//project->generateConfigFile();
						//project->compileProject();
						//project->generateComponentDescriptionFiles();
						archManager->assignArchitectureToRegion("AutonomicImageSegmentation",topComponent);
						archManager->synthesizeArchitecture();
						archManager->sendArchitecture();
						//
						cout<<"hardware component successfully generated"<<endl;

					}
					break;
					case 'b':
					{
						HardwareProject *p1 = new HardwareProject("adder8Bits", 
								"C:/Documents and Settings/schneider/Meus Documentos/julio/doutorado/fpgaProjects/TestHardwareBuilding/");
						p1->generateHDLFiles();
						p1->generateConfigFile();
						p1->compileProject();
					}
					break;
					case 'c':
						breakLoop = true;
					break;
				}

			}
		}

		stopIo = true;
		cout << "waiting for iothread "<<endl;
		pthread_join(ioThreadId, NULL);
		delete commLink;
		delete archManager;
		return 0;
 		   
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
