##############################################################################
## Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/vmodcam_v1_00_a/data/vmodcam_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Thu Apr 25 10:47:50 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "vmodcam" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" "C_MEM0_BASEADDR" "C_MEM0_HIGHADDR" 
}
