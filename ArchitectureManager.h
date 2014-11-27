#ifndef ArchitectureManager_h
#define ArchitectureManager_h

#include <iostream>
#include <map>
#include "HardwareComponent.h"
#include "CommunicationModule/CommunicationModule.h"
#include "ComponentDatabase.h"
#include "HardwareProject.h"
#include "Architecture.h"

class ArchitectureManager : public MessageHandler{
	
	public:
		/*managed hardware project*/
		HardwareProject *hardwareProject;
		CommunicationModule *communicationModule;
		std::map<std::string, ComponentDatabase *> componentDatabases;

		//each component architecture assigned to a ReconfigurableRegion is stored into this
		//architecture manager as a single entry. Architectures are different if they differ 
		//in number, type and internal interconnection from their components.
		std::vector< std::pair < std::string, std::vector <Architecture*> > > storedArchitectures;



	public:
		
		ArchitectureManager(CommunicationLink *communicationLink);

		void init();

		/**
		 * \brief creates a new HardwareProject and sets it to be managed
		 * 				by the current Architecture manager
		 * \param projectXMLDesc file location of a xml description from the
		 * 				hardware project to be imported
		 **/
		void setManagedProject(std::string projectXMLDesc);

		
		ReconfigurableRegion* getReconfigurableRegion(std::string regionName);

		/**
     * \brief creates ad ComponentDatabase object connected to the given address
     * \param dataBaseAddress address from the database
     **/
		void connectToHardwareComponentDataBase(std::string dataBaseAddress);	


		void addArchitecture(std::string reconfigurableRegionName, HardwareComponent *topComponent);

		Architecture* getArchitecture(std::string reconfigurableRegionName, HardwareComponent *topComponent);

		/**
     * \brief retrieves a new instance of a HardwareComponent from the given database
     * \param hwComponentId identifier from the desired hardware component 
     * \param dataBaseAddress address from the database
     **/	
		HardwareComponent* createHardwareComponent(std::string hwComponentId, std::string databaseAddress);

		/**
		 * \brief inherit from MessageHandler
		 **/
		virtual void handleMessage(Message *msg);	

		void synthesizeArchitecture();

		void sendArchitectureUpdateMessage();

		void sendArchitecture();

		void sendNewArchitecture(uint8_t requestedRegion);

		void assignArchitectureToRegion(std::string regionName, HardwareComponent *architecture);

		/**
		 * could be called in a multi thread context
		 **/
		void mainLoop();
		
	
};
#endif
