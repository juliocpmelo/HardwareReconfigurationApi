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
                HardwareProject *project = new HardwareProject("./CommunicationHardware/communicationHardwareDesc.xml");


								/*each reconfigurable region should have a corresponding communicationHardware description*/
								//ReconfigurableRegion *region = project->getReconfigurableRegion("RegionA");
								ReconfigurableRegion *region = new ReconfigurableRegion("RegionA", NULL);

								ComponentDatabase *database = new ComponentDatabase();

								/*generic component declaration, without fixed port number*/
								HardwareComponent *topComponent = new HardwareComponent("neuronio_test", NULL);

								//new API with system C
								cout << __FILE__ << "::" << __LINE__ <<endl; 



                topComponent->addInput("clk", BIT_TYPE);
                topComponent->addInput("rst", BIT_TYPE);
                topComponent->addInput("wr0", BIT_TYPE);
                topComponent->addInput("wr1", BIT_TYPE);
                topComponent->addInput("wr2", BIT_TYPE);

                topComponent->addInput("in_x0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("in_x1", VECTOR_TYPE( "16", "downto", "0"));

                topComponent->addInput("w0_i", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("w1_i", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("w2_i", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("w3_i", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("w4_i", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("w5_i", VECTOR_TYPE( "16", "downto", "0"));

                topComponent->addInput("bias0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("bias1", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addInput("bias2", VECTOR_TYPE( "16", "downto", "0"));

	
                topComponent->addOutput("addr0", VECTOR_TYPE( "5", "downto", "0"));
                topComponent->addOutput("addr1", VECTOR_TYPE( "5", "downto", "0"));
                topComponent->addOutput("addr2", VECTOR_TYPE( "5", "downto", "0"));

                topComponent->addOutput("a0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("b0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("a1", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("b1", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("a2", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("b2", VECTOR_TYPE( "16", "downto", "0"));

                topComponent->addOutput("regx0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("regx1", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("regx2", VECTOR_TYPE( "16", "downto", "0"));
 
                topComponent->addOutput("net0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("net1", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("net2", VECTOR_TYPE( "16", "downto", "0"));

                topComponent->addOutput("neuron_x0", VECTOR_TYPE( "16", "downto", "0"));
                topComponent->addOutput("neuron_x1", VECTOR_TYPE( "16", "downto", "0"));

                topComponent->addOutput("result", VECTOR_TYPE( "16", "downto", "0"));


								/*external ports are defined in the reconfigurable region xml description*/
								topComponent->portMap("clk", region->getPort("clk"));


								/*software acessible inputs will be able to be acessed using the communication hardware API*/
								topComponent->createSoftwareAccess("wr0");

								/*signal declaration*/
								sc_signal_resolved *signaly0 = database->createSignal("y0", VECTOR_TYPE( "8", "downto", "0"));
								topComponent->addChildObject(signaly0);
								sc_signal_resolved *signaly1 = database->createSignal("y1", VECTOR_TYPE( "8", "downto", "0"));
								topComponent->addChildObject(signaly1);



								//ComponentDatabase loads the "teste_neuronio" component from the rnaBaseComponents.xml
								HardwareComponent *neuronio0 = database->getHardwareComponent("neuronio0", "./rnaBaseComponents.xml:teste_neuronio");
								topComponent->addChildObject(neuronio0);
								neuronio0->portMap("clk",topComponent->getPort("clk"));
                neuronio0->portMap("rst",topComponent->getPort("rst"));
                neuronio0->portMap("wr_result",topComponent->getPort("wr0"));
                neuronio0->portMap("x0",topComponent->getPort("in_x0"));
                neuronio0->portMap("x1",topComponent->getPort("in_x1"));
                neuronio0->portMap("w0",topComponent->getPort("w0_i"));
                neuronio0->portMap("w1",topComponent->getPort("w2_i"));
                neuronio0->portMap("bias",topComponent->getPort("bias0"));
                neuronio0->portMap("addr",topComponent->getPort("addr0"));
                neuronio0->portMap("a",topComponent->getPort("a0"));
                neuronio0->portMap("b",topComponent->getPort("b0"));
                neuronio0->portMap("regx",topComponent->getPort("regx0"));
                neuronio0->portMap("x",topComponent->getPort("net0"));
                neuronio0->portMap("y",signaly0);

								
								HardwareComponent *neuronio1 = database->getHardwareComponent("neuronio1", "./rnaBaseComponents.xml:teste_neuronio");
								topComponent->addChildObject(neuronio1);
                neuronio1->portMap("clk",topComponent->getPort("clk"));
                neuronio1->portMap("rst",topComponent->getPort("rst"));
                neuronio1->portMap("wr_result",topComponent->getPort("wr1"));
                neuronio1->portMap("x0",topComponent->getPort("in_x0"));
                neuronio1->portMap("x1",topComponent->getPort("in_x1"));
                neuronio1->portMap("w0",topComponent->getPort("w1_i"));
                neuronio1->portMap("w1",topComponent->getPort("w3_i"));
                neuronio1->portMap("bias",topComponent->getPort("bias1"));
                neuronio1->portMap("addr",topComponent->getPort("addr1"));
                neuronio1->portMap("a",topComponent->getPort("a1"));
                neuronio1->portMap("b",topComponent->getPort("b1"));
                neuronio1->portMap("regx",topComponent->getPort("regx1"));
                neuronio1->portMap("x",topComponent->getPort("net1"));
                neuronio1->portMap("y",signaly1);
 
								HardwareComponent *neuronio2 = database->getHardwareComponent("neuronio2", "./rnaBaseComponents.xml:teste_neuronio");
								topComponent->addChildObject(neuronio2);
							  neuronio2->portMap("clk",topComponent->getPort("clk"));
                neuronio2->portMap("rst",topComponent->getPort("rst"));
                neuronio2->portMap("wr_result",topComponent->getPort("wr2"));
                neuronio2->portMap("x0",signaly0);
                neuronio2->portMap("x1",signaly1);
                neuronio2->portMap("w0",topComponent->getPort("w4_i"));
                neuronio2->portMap("w1",topComponent->getPort("w5_i"));
                neuronio2->portMap("bias",topComponent->getPort("bias2"));
                neuronio2->portMap("addr",topComponent->getPort("addr2"));
                neuronio2->portMap("a",topComponent->getPort("a2"));
                neuronio2->portMap("b",topComponent->getPort("b2"));
                neuronio2->portMap("regx",topComponent->getPort("regx2"));
                neuronio2->portMap("x",topComponent->getPort("net2"));
                neuronio2->portMap("y",topComponent->getPort("result"));


 								topComponent->portMap("neuron_x0",signaly0);
                topComponent->portMap("neuron_x1",signaly1);



                region->assignTopComponent(topComponent);
                project->generateHDLFiles(topComponent);
                //project->generateConfigFile();
                //project->compileProject();
    
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
