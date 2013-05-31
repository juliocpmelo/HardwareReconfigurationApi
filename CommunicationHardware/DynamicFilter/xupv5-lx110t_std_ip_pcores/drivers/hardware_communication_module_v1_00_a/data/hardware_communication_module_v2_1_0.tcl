##############################################################################
## Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/hardware_communication_module_v1_00_a/data/hardware_communication_module_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon May 27 13:34:57 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "hardware_communication_module" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
