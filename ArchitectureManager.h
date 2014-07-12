#ifndef ArchitectureManager_h
#define ArchitectureManager_h

#include <iostream>
#include <map>
#include "HardwareComponent.h"
#include "CommunicationModule/CommunicationModule.h"
#include "ComponentDatabase.h"
#include "HardwareProject.h"

class ArchitectureManager : public MessageHandler{
	
	public:
		/*managed hardware project*/
		HardwareProject *hardwareProject;
		CommunicationModule *communicationModule;
		std::map<std::string, ComponentDatabase *> componentDatabases;

	public:
		
		ArchitectureManager(CommunicationLink *communicationLink);

		void init();

		/**
		 * \brief creates a new HardwareProject and sets it to be managed
		 * 				by the current Architecture manager
		 * \param projectXMLDesc file location of a xml description from the
		 * 				hardware project to be imported
		 **/
		void importHardwareProject(std::string projectXMLDesc);

		/**
     * \brief creates ad ComponentDatabase object connected to the given address
     * \param dataBaseAddress address from the database
     **/
		void connectToHardwareComponentDataBase(std::string dataBaseAddress);	

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

		void mainLoop();
		
	
};
#endif
