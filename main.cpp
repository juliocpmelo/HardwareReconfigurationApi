#include <cstdio>
#include <iostream>
#include <stdlib.h>

#include "HardwareReconfiguration.h"

using namespace std;
//Set PATH=libxml2-2.7.8.win32\bin;zlib-1.2.5\bin;iconv-1.9.2.win32\bin;%PATH%

//os assignents podem vir como descrição do design e adicionar uma forma
//ainda mais genérica de configuração
int main(int argc, char *argv[]){
	cout<<"This progam will test the capability of reconfiguring the FPGA through software"<<endl;
	int var = 0;
	cout<<"running project"<<endl;

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
                HardwareProject *project = new HardwareProject("neuronio_test", 
                                                               "C:/Documents and Settings/schneider/Meus Documentos/julio/doutorado/fpgaProjects/TestHardwareBuilding/",
                                                               "C:/Documents and Settings/schneider/Meus documentos/julio/doutorado/HardwareReconfigurationApi/rnaBaseComponents.xml");
                /*
            	<generic name="data_length" type="integer" defaultValue="16"/>
            	<generic name="addr_length" type="integer" defaultValue="5"/>
                */
                project->addGeneric("data_length","integer","16");
                project->addGeneric("addr_length","integer","5");

                /*
            	<input name="clk" type="std_logic"/>
            	<input name="rst" type="std_logic"/>
            	<input name="wr0" type="std_logic"/>
            	<input name="wr1" type="std_logic"/>
            	<input name="wr2" type="std_logic"/>
            	
            	<input name="in_x0" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="in_x1" type="std_logic_vector(data_length-1 downto 0)"/>
            	
            	<input name="w0_i" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="w1_i" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="w2_i" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="w3_i" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="w4_i" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="w5_i" type="std_logic_vector(data_length-1 downto 0)"/>

                <input name="bias0" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="bias1" type="std_logic_vector(data_length-1 downto 0)"/>
            	<input name="bias2" type="std_logic_vector(data_length-1 downto 0)"/>
            	*/
                project->addInput("clk","std_logic");
                project->addInput("rst","std_logic");
                project->addInput("wr0","std_logic");
                project->addInput("wr1","std_logic");
                project->addInput("wr2","std_logic");

                project->addInput("in_x0","std_logic_vector(data_length-1 downto 0)");
                project->addInput("in_x1","std_logic_vector(data_length-1 downto 0)");

                project->addInput("w0_i","std_logic_vector(data_length-1 downto 0)");
                project->addInput("w1_i","std_logic_vector(data_length-1 downto 0)");
                project->addInput("w2_i","std_logic_vector(data_length-1 downto 0)");
                project->addInput("w3_i","std_logic_vector(data_length-1 downto 0)");
                project->addInput("w4_i","std_logic_vector(data_length-1 downto 0)");
                project->addInput("w5_i","std_logic_vector(data_length-1 downto 0)");

                project->addInput("bias0","std_logic_vector(data_length-1 downto 0)");
                project->addInput("bias1","std_logic_vector(data_length-1 downto 0)");
                project->addInput("bias2","std_logic_vector(data_length-1 downto 0)");

                /*
            	<output name="addr0" type="std_logic_vector(addr_length-1 downto 0)"/>
            	<output name="addr1" type="std_logic_vector(addr_length-1 downto 0)"/>
            	<output name="addr2" type="std_logic_vector(addr_length-1 downto 0)"/>
            	
            	<output name="a0" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="b0" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="a1" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="b1" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="a2" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="b2" type="out std_logic_vector(data_length-1 downto 0)"/>
            	
            	<output name="regx0" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="regx1" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="regx2" type="out std_logic_vector(data_length-1 downto 0)"/>
            	
            	<output name="net0" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="net1" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="net2" type="out std_logic_vector(data_length-1 downto 0)"/>
            	
            	<output name="neuron_x0" type="out std_logic_vector(data_length-1 downto 0)"/>
            	<output name="neuron_x1" type="out std_logic_vector(data_length-1 downto 0)"/>
            	
            	<output name="result" type="out std_logic_vector(data_length-1 downto 0)"/>
                */
                project->addOutput("addr0","std_logic_vector(addr_length-1 downto 0)");
                project->addOutput("addr1","std_logic_vector(addr_length-1 downto 0)");
                project->addOutput("addr2","std_logic_vector(addr_length-1 downto 0)");

                project->addOutput("a0","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("b0","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("a1","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("b1","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("a2","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("b2","std_logic_vector(data_length-1 downto 0)");

                project->addOutput("regx0","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("regx1","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("regx2","std_logic_vector(data_length-1 downto 0)");

                project->addOutput("net0","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("net1","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("net2","std_logic_vector(data_length-1 downto 0)");

                project->addOutput("neuron_x0","std_logic_vector(data_length-1 downto 0)");
                project->addOutput("neuron_x1","std_logic_vector(data_length-1 downto 0)");

                project->addOutput("result","std_logic_vector(data_length-1 downto 0)");

                /*
                <signalBase>
            		<signal name="y1" type="std_logic_vector(data_length - 1 downto 0)"/>
            		<signal name="y0" type="std_logic_vector(data_length - 1 downto 0)"/>
            	</signalBase>
            	*/
                Signal *signal1 = new Signal("y1","std_logic_vector(data_length - 1 downto 0)");
                Signal *signal2 = new Signal("y0", "std_logic_vector(data_length - 1 downto 0)");
                project->addSignal(signal1);
                project->addSignal(signal2);

                /*
            	<instance name="neuron0" type="teste_neuronio">
            		<genericMap  genericName="data_length" value="data_length"/>
            		<!-- if we are going to declare the signals there is no need to put the bind component tag -->
            		<portMap portName="clk" value="clk"/>
            		<portMap portName="rst" value="rst"/>
            		<portMap portName="wr_result" value="wr0"/>
            		<portMap portName="x0" value="in_x0"/>
            		<portMap portName="x1" value="in_x1"/>
            		<portMap portName="w0" value="w0_i"/>
            		<portMap portName="w1" value="w2_i"/>
            		<portMap portName="bias" value="bias0"/>
            		<portMap portName="addr" value="addr0"/>
            		<portMap portName="a" value="a0"/>
            		<portMap portName="b" value="b0"/>
            		<portMap portName="regx" value="regx0"/>
            		<portMap portName="x" value="net0"/>
            		<portMap portName="y" value="y0"/>
            	</instance>
                */
                ComponentInstance *neuronio0 = new ComponentInstance("neuron0","teste_neuronio");
                neuronio0->portMap("clk","clk");
                neuronio0->portMap("rst","rst");
                neuronio0->portMap("wr_result","wr0");
                neuronio0->portMap("x0","in_x0");
                neuronio0->portMap("x1","in_x1");
                neuronio0->portMap("w0","w0_i");
                neuronio0->portMap("w1","w2_i");
                neuronio0->portMap("bias","bias0");
                neuronio0->portMap("addr","addr0");
                neuronio0->portMap("a","a0");
                neuronio0->portMap("b","b0");
                neuronio0->portMap("regx","regx0");
                neuronio0->portMap("x","net0");
                neuronio0->portMap("y","y0");
                project->addComponentInstance(neuronio0);

                /*
            	<instance name="neuron1" type="teste_neuronio">
            		<genericMap  genericName="data_length" value="data_length"/>
            		<!-- if we are going to declare the signals there is no need to put the bind component tag -->
            		<portMap portName="clk" value="clk"/>
            		<portMap portName="rst" value="rst"/>
            		<portMap portName="wr_result" value="wr1"/>
            		<portMap portName="x0" value="in_x0"/>
            		<portMap portName="x1" value="in_x1"/>
            		<portMap portName="w0" value="w1_i"/>
            		<portMap portName="w1" value="w3_i"/>
            		<portMap portName="bias" value="bias1"/>
            		<portMap portName="addr" value="addr1"/>
            		<portMap portName="a" value="a1"/>
            		<portMap portName="b" value="b1"/>
            		<portMap portName="regx" value="regx1"/>
            		<portMap portName="x" value="net1"/>
            		<portMap portName="y" value="y1"/>
            	</instance>
                */
                ComponentInstance *neuronio1 = new ComponentInstance("neuron1","teste_neuronio");
                neuronio1->portMap("clk","clk");
                neuronio1->portMap("rst","rst");
                neuronio1->portMap("wr_result","wr1");
                neuronio1->portMap("x0","in_x0");
                neuronio1->portMap("x1","in_x1");
                neuronio1->portMap("w0","w1_i");
                neuronio1->portMap("w1","w3_i");
                neuronio1->portMap("bias","bias1");
                neuronio1->portMap("addr","addr1");
                neuronio1->portMap("a","a1");
                neuronio1->portMap("b","b1");
                neuronio1->portMap("regx","regx1");
                neuronio1->portMap("x","net1");
                neuronio1->portMap("y","y1");
                project->addComponentInstance(neuronio1);

            	/*
            	<instance name="neuron2" type="teste_neuronio">
            		<genericMap  genericName="data_length" value="data_length"/>
            		<!-- if we are going to declare the signals there is no need to put the bind component tag -->
            		<portMap portName="clk" value="clk"/>
            		<portMap portName="rst" value="rst"/>
            		<portMap portName="wr_result" value="wr2"/>
            		<portMap portName="x0" value="y0"/>
            		<portMap portName="x1" value="y1"/>
            		<portMap portName="w0" value="w4_i"/>
            		<portMap portName="w1" value="w5_i"/>
            		<portMap portName="bias" value="bias2"/>
            		<portMap portName="addr" value="addr2"/>
            		<portMap portName="a" value="a2"/>
            		<portMap portName="b" value="b2"/>
            		<portMap portName="regx" value="regx2"/>
            		<portMap portName="x" value="net2"/>
            		<portMap portName="y" value="result"/>
            	</instance>
            	*/
                ComponentInstance *neuronio2 = new ComponentInstance("neuron2","teste_neuronio");
                neuronio2->portMap("clk","clk");
                neuronio2->portMap("rst","rst");
                neuronio2->portMap("wr_result","wr2");
                neuronio2->portMap("x0","y0");
                neuronio2->portMap("x1","y1");
                neuronio2->portMap("w0","w4_i");
                neuronio2->portMap("w1","w5_i");
                neuronio2->portMap("bias","bias2");
                neuronio2->portMap("addr","addr2");
                neuronio2->portMap("a","a2");
                neuronio2->portMap("b","b2");
                neuronio2->portMap("regx","regx2");
                neuronio2->portMap("x","net2");
                neuronio2->portMap("y","result");
                project->addComponentInstance(neuronio2);

                project->ioMap("neuron_x0", signal1);
                project->ioMap("neuron_x1", signal2);
                project->generateHDLFile();
                project->generateConfigFile();
                project->compileProject();
    
            }
            break;
            case 'b':
            {
            	HardwareProject *p1 = new HardwareProject("adder8Bits", 
                                                          "C:/Documents and Settings/schneider/Meus Documentos/julio/doutorado/fpgaProjects/TestHardwareBuilding/", 
                                                          "C:/Documents and Settings/schneider/Meus documentos/julio/doutorado/HardwareReconfigurationApi/testeRnaModeling.xml");
                p1->generateHDLFile();
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
