##############################################################################
## Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/hdmi_out_v1_01_a/data/hdmi_out_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon Apr 29 10:59:59 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "hdmi_out" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
