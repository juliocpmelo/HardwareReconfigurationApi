#ifndef Architecture_h
#define Architecture_h

#include "HardwareComponent.h"

/**
 * An architecture is composed by a hardware component synthesized for
 * a specific reconfigurable region
 **/
class Architecture{
	public:
  /*Hardware componenent that is the top component in this architecture*/
  HardwareComponent *topComponent;

  /*Region in which this arcthicture fits into*/
	std::string regionName;
  
  /*architecture identifier*/
  int uid;

  /*bitstream used to implement this architecture*/
	std::string bitstream;

  /*description file containing the main components into this architecture*/
	std::string descriptionFile;

	public:
		Architecture(HardwareComponent *topComponent, std::string regionName) : topComponent(topComponent), regionName(regionName)
		{
			uid = -1;
			bitstream = "";
			descriptionFile = "";
		}

};

#endif
