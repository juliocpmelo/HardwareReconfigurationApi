#include <iostream>

static void initDynamicHardwareModules(AP_AHRS_DCM *ahrs, AP_HAL::UARTDriver* communicationLink){
	dynamicHardwareManager = new AP_DynamicHardware(ahrs, communicationLink);
}

static void updateDynamicHardware(){

	/*std::cout << "Dynamic system context parameters: "<< std::endl;
	std::cout << "Current Pos"<<std::endl;
	std::cout << current_loc.alt/100.0 << " " << convert_latlon_to_float(current_loc.lat) << " " << convert_latlon_to_float(current_loc.lng) << std::endl; 
	std::cout << "Next WP ID: "<<next_WP.id << std::endl; 
	std::cout << "Next WP Pos: " <<std::endl;
	std::cout << next_WP.alt/100.0 << " " << convert_latlon_to_float(next_WP.lat) << " " << convert_latlon_to_float(next_WP.lng) << std::endl; 
*/
	dynamicHardwareManager->update();
}

