#include "CommunicationHardwareConverterVHDL.h"

using namespace std;

CommunicationHardwareConverterVHDL::CommunicationHardwareConverterVHDL(){}

void CommunicationHardwareConverterVHDL::buildComponentDescription(std::string componentPath, HardwareComponent* communicationHardwareComponent){
	
	ofstream outFile;
//	string fileLocation = string(componentPath + "/commHardwareComponents/"+ communicationHardwareComponent->name());
	cout<<"generating vhdl to component "<<endl;

	outFile.open (componentPath.c_str());
	
	outFile <<"-- This file was auto generated by the CommunicationHardwareGenerator"<<endl<<endl;
	outFile <<"-- Component Declaration"<<endl<<endl;
	outFile <<"component "<<communicationHardwareComponent->componentInfo->name<<" is"<<endl; //TODO place the main tag name here
	std::map<std::string, HardwareComponent::Param> paramTable = communicationHardwareComponent->componentInfo->componentParameters;

	map<string, HardwareComponent::Param>::iterator lastParam = paramTable.end();
	if (paramTable.size() > 0){
		outFile <<"generic ("<<endl;
		lastParam --;
	}
	for(map<string, HardwareComponent::Param>::iterator it = paramTable.begin(); it != paramTable.end(); it++){
		if (it == lastParam)
			outFile<<"\t"<<translateParam(&(it->second))<<endl;
		else
			outFile<<"\t"<<translateParam(&(it->second))<<";"<<endl;

	}
	if (paramTable.size() > 0)
		outFile <<");"<<endl;


	std::map<std::string, HardwareComponent::PortInfo*> portsTable = communicationHardwareComponent->ports;

	map<string, HardwareComponent::PortInfo*>::iterator lastElement = portsTable.end();
	if(portsTable.size() > 0){
		outFile <<"port ("<<endl;
		lastElement --;
	}

	for(map<string, HardwareComponent::PortInfo*>::iterator it = portsTable.begin(); it != portsTable.end(); it++){
		if (it == lastElement)
			outFile<<"\t"<<translatePort(it->second)<<endl;
		else
			outFile<<"\t"<<translatePort(it->second)<<";"<<endl;

	}
	if(portsTable.size() > 0)
		outFile <<");"<<endl;

	outFile <<"end component"<<communicationHardwareComponent->componentInfo->name<<";"<<endl<<endl;

	outFile <<"-- Component Declaration end"<<endl<<endl;

	outFile.close();

}

sc_signal_resolved* CommunicationHardwareConverterVHDL::getSignalToSwInterface(HardwareComponent::PortInfo *swInterface){
	
	sc_signal_resolved *retSignal = new sc_signal_resolved((string(swInterface->name + "_reg")).c_str());
	sc_attribute<HardwareComponent::DataType*> *signalType = new sc_attribute<HardwareComponent::DataType*>( "DataType", swInterface->type);
	retSignal->add_attribute(*signalType);
	
	return retSignal;
}


std::string CommunicationHardwareConverterVHDL::getPadString(int size, int desiredSize){

	string retString;

	int hexPartSize = (desiredSize - size)/4;
	
	int binPartSize = (desiredSize - size)%4;

	cout << "running get pad string to " << size << " , " << desiredSize<< endl;
	if (hexPartSize > 0) {
		retString += "x\"";
		for (int i=0; i<hexPartSize; i++)
			retString += "0";
		retString += "\"";
		if (binPartSize > 0) 
			retString += " & ";
	}

	if (binPartSize > 0) {
		retString += "b\"";
		for (int i=0; i<binPartSize; i++)
			retString += "0";
		retString += "\"";
	}



	return retString;
	
}

std::string CommunicationHardwareConverterVHDL::getNameForReconfRegionFile(std::string projectPath, ReconfigurableRegion *reg){
	string fileLocation = projectPath + "/CommunicationHardware_" + reg->name + ".vhdl";
	return fileLocation;
}


void CommunicationHardwareConverterVHDL::buildEntityForReconfigurableRegion(std::string projectPath, ReconfigurableRegion *reg){

	ofstream outFile;

	HardwareComponent *communicationHardwareComponent = reg->communicationHardware;
	string fileLocation = projectPath + "/CommunicationHardware_" + reg->name + ".vhdl";
	cout<<"generating vhdl to component "<<projectPath + "/CommunicationHardware_" + reg->name + ".vhdl"<<endl;
	outFile.open (fileLocation.c_str());
	
	outFile <<"-- This file was auto generated by the CommunicationHardwareGenerator"<<endl<<endl;
	outFile <<"library ieee;"<<endl;
	outFile <<"use ieee.std_logic_1164.all;"<<endl;
	outFile <<"use ieee.std_logic_unsigned.all;"<<endl<<endl;

	outFile <<"-- Entity Declaration"<<endl<<endl;
	outFile <<"entity "<<communicationHardwareComponent->componentInfo->name<<" is"<<endl; //TODO place the main tag name here
	outFile <<"generic ("<<endl;
	std::map<std::string, HardwareComponent::Param> paramTable = communicationHardwareComponent->componentInfo->componentParameters;

	map<string, HardwareComponent::Param>::iterator lastParam = paramTable.end();
	lastParam --;
	for(map<string, HardwareComponent::Param>::iterator it = paramTable.begin(); it != paramTable.end(); it++){
		if (it == lastParam)
			outFile<<"\t"<<translateParam(&(it->second))<<endl;
		else
			outFile<<"\t"<<translateParam(&(it->second))<<";"<<endl;

	}
	outFile <<");"<<endl;

	outFile <<"port ("<<endl;

	std::map<std::string, HardwareComponent::PortInfo*> portsTable = communicationHardwareComponent->ports;

	map<string, HardwareComponent::PortInfo*>::iterator lastElement = portsTable.end();
	lastElement --;
	for(map<string, HardwareComponent::PortInfo*>::iterator it = portsTable.begin(); it != portsTable.end(); it++){
		if (it == lastElement)
			outFile<<"\t"<<translatePort(it->second)<<endl;
		else
			outFile<<"\t"<<translatePort(it->second)<<";"<<endl;

	}
	outFile <<");"<<endl;

	outFile <<"end "<<communicationHardwareComponent->componentInfo->name<<";"<<endl<<endl;

	outFile <<"-- Entity Declaration end"<<endl<<endl;

	outFile<<"architecture arch of "<<communicationHardwareComponent->componentInfo->name<<" is"<<endl;

	outFile <<"-- Register Declaration"<<endl<<endl;

	set<string> swAccessibleInterfaces;

	if (reg->assignedTopComponent != NULL){
		swAccessibleInterfaces = reg->assignedTopComponent->softwareAccessiblePorts;
		for(set<string>::iterator it = swAccessibleInterfaces.begin(); it!= swAccessibleInterfaces.end(); it ++){

			HardwareComponent::PortInfo *swAccessibleInterface = reg->assignedTopComponent->ports[*it];

			sc_signal_resolved* convertedSignal = getSignalToSwInterface(swAccessibleInterface);

			outFile<<translateSignal(convertedSignal)<<";"<<endl;
			delete convertedSignal;
		}
	}

	outFile<<"begin"<<endl;



	if (reg->assignedTopComponent != NULL){
	
		outFile <<"-- Main Entity Portmap"<<endl<<endl;


				


		/*no sence in using generic maps here*/
		outFile << reg->assignedTopComponent->name() << "_inst : entity work." << reg->assignedTopComponent->name() << endl;
		outFile << " port map ("<<endl;

		map<string, HardwareComponent::PortInfo*>::iterator lastPortsIt = reg->assignedTopComponent->ports.end();
		if (reg->assignedTopComponent->ports.size() > 0)
			lastPortsIt --;

		for (map<string, HardwareComponent::PortInfo*>::iterator portsIt = reg->assignedTopComponent->ports.begin(); portsIt != reg->assignedTopComponent->ports.end(); portsIt++){
			if( swAccessibleInterfaces.count(portsIt->first) > 0){
				outFile << portsIt->first << " => " << portsIt->first << "_reg";
			}
			else{
				sc_port_base* port = portsIt->second->scPort;
				if(port != NULL && port->get_interface() != NULL){
					sc_object * channel = dynamic_cast<sc_object*>(port->get_interface());
					sc_port_base *connectedPort = getConnectedPort(channel, communicationHardwareComponent);

					if( connectedPort != NULL){ //if any of the component's a port is connected to the current channel it is a direct connection
						cout<<"port "<<connectedPort->name() << " directly connected to "<<port->name()<<endl;
						outFile << port->basename() << " => " << connectedPort->basename();

					}
						else{
						if (portsIt->second->portType == HardwareComponent::PortType_in )
							outFile << portsIt->first << " => " << "(others => 0)";
						else
							outFile << portsIt->first << " => " << "open";
					}
				}

			}

			if (portsIt != lastPortsIt)
				outFile << ","<<endl;
			else			
				outFile << endl;
		}

		

		outFile << ");"<<endl;
	


		outFile <<endl<<"-- Read process from communication hardware"<<endl<<endl;


		outFile <<"readProcess: process(commHardware_clk)"<<endl<<"begin"<<endl;
		outFile <<"if rising_edge(commHardware_clk) and commHardware_mode ='0' then"<<endl;

		int addrCount = 1;

		int commHardwareDataWidth = atoi((communicationHardwareComponent->getParamValue("commHardware_dataWidth")).c_str());
		int commHardwareAddressWidth = atoi((communicationHardwareComponent->getParamValue("commHardware_addressWidth")).c_str());

		/*TODO identify each reconf region and add a unique ID for each*/
		int deviceId = 46;


		set<string>::iterator lastInterface = swAccessibleInterfaces.end();
		if( swAccessibleInterfaces.size() > 0 )
			lastInterface --;


		string deviceIdAddr = "0";

		/*the string is already in hex format so its size is multiplied by 4*/
		string paddedAddr = getPadString(deviceIdAddr.length() * 4, commHardwareAddressWidth);
		paddedAddr += " & x\"" + deviceIdAddr + "\"";
		outFile <<"\t"<<"if commHardware_address = "<<paddedAddr<<" then"<<endl;


		string padToId = getPadString(8,commHardwareDataWidth);
		outFile <<"\t"<<"\t"<<"commHardware_dataOut	<= "<<padToId<<" & x\""<<std::hex<<deviceId<<std::dec<< "\";"<<endl;

		for(set<string>::iterator it = swAccessibleInterfaces.begin(); it!= swAccessibleInterfaces.end(); it ++){

			HardwareComponent::PortInfo *swAccessibleInterface = reg->assignedTopComponent->ports[*it];

			stringstream addrHex;

			addrHex<<std::hex<<addrCount<<std::dec;

			/*the string is already in hex format so its size is multiplied by 4*/
			string paddedAddr = getPadString(addrHex.str().length() * 4, commHardwareAddressWidth);
			paddedAddr += " & x\"" + addrHex.str() + "\"";


			string paddedDataReg = getPadString(swAccessibleInterface->type->size(),commHardwareDataWidth);
			paddedDataReg += " & " + swAccessibleInterface->name + "_reg;";

			outFile <<"\t"<<"elsif commHardware_address = "<<paddedAddr<<" then"<<endl;

			outFile <<"\t"<<"\t"<<"commHardware_dataOut	<= "<<paddedDataReg<<endl;

			if (it == lastInterface)
				outFile <<"\t"<<"end if;"<<endl;

			//		outFile<<translateSignal(convertedSignal)<<";"<<endl;
			addrCount ++;
		}
		if(addrCount == 1)
			outFile <<"\t"<<"end if;"<<endl;

		outFile <<"end if;"<<endl;



		outFile <<"end process readProcess;"<<endl;


		outFile <<endl<<"-- Write process from communication hardware"<<endl<<endl;


		outFile <<"writeProcess: process(commHardware_clk)"<<endl<<"begin"<<endl;
		outFile <<"if rising_edge(commHardware_clk) and commHardware_mode ='1' then"<<endl;

		addrCount = 1;

		bool isFirstWritePort = true;

		for(set<string>::iterator it = swAccessibleInterfaces.begin(); it!= swAccessibleInterfaces.end(); it ++){

			HardwareComponent::PortInfo *swAccessibleInterface = reg->assignedTopComponent->ports[*it];

			if (swAccessibleInterface->portType != HardwareComponent::PortType_out) { //only create sw write interfaces to in or inout ports
				stringstream addrHex;

				addrHex<<std::hex<<addrCount<<std::dec;

				/*the string is already in hex format so its size is multiplied by 4*/
				string paddedAddr = getPadString(addrHex.str().length() * 4, commHardwareAddressWidth);
				paddedAddr += " & x\"" + addrHex.str() + "\"";



				cout << " requiring size from "<<*it<<endl;
				string paddedDataReg = getPadString(swAccessibleInterface->type->size(),commHardwareDataWidth);
				paddedDataReg += " & " + swAccessibleInterface->name + "_reg;";

				if (isFirstWritePort)
					outFile <<"\t"<<"if commHardware_address = "<<paddedAddr<<" then"<<endl;
				else
					outFile <<"\t"<<"elsif commHardware_address = "<<paddedAddr<<" then"<<endl;

				if(swAccessibleInterface->type->size() > 1)
					outFile <<"\t"<<"\t"<<swAccessibleInterface->name + "_reg <= commHardware_dataIn("<<swAccessibleInterface->type->size()-1<<" downto 0);"<<endl;
				else
					outFile <<"\t"<<"\t"<<swAccessibleInterface->name + "_reg <= commHardware_dataIn(0);"<<endl;

				if (it == lastInterface)
					outFile <<"\t"<<"end if;"<<endl;

				isFirstWritePort = false;

			}
			addrCount ++;
		}
		outFile <<"end if;"<<endl;


		outFile <<"end process writeProcess;"<<endl;



	}



	outFile<<"end arch;"<<endl;


	outFile.close();



}

void CommunicationHardwareConverterVHDL::buildRegisterSet(HardwareComponent* topComponent){}

void CommunicationHardwareConverterVHDL::buildReadProcess(){}

void CommunicationHardwareConverterVHDL::buildWriteProcess(){}



