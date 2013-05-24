##############################################################################
## Filename:          D:\Users\Julio\Downloads\Atlys_HDMI_PLB_demo\project/drivers/simple_video_filter_v1_00_a/data/simple_video_filter_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Fri Apr 26 16:22:05 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "simple_video_filter" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
