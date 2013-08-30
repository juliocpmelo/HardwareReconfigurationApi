
#this script first creates a reconfigurable partition and a configuration with the given .ngc file
#then executes the implementation flow to generate the partial bitstream to the desired configuration module

#env configuration
XILINX_ROOT_DIRECTORY=/cygdrive/c/Xilinx/14.4/ISE_DS/
PLANAHEAD_DIRECTORY=$XILINX_ROOT_DIRECTORY/PlanAhead/
BITGEN_DIRECTORY=$XILINX_ROOT_DIRECTORY/ISE

#inputs to the generation tool
PROJECT_DIRECTORY="D:/DynamicVideoProc/DynamicFilterPlanAhead/"
PROJECT_NAME="DynamicFilterPlanAhead"
PR_PARTITION="hardware_communication_module_0/hardware_communication_module_0/USER_LOGIC_I/communicationHardware_inst"

#auto generated parameters
RECONF_MODULE_NAME="$1"
RUN_NAME="${1}_run"
NGC_FILE="$2"


#run config_1

#add ngc to project
#create run with ngc_name
#run it


if [ "$#" -gt 0 ]; then

	start_time=`date +%s`
	$PLANAHEAD_DIRECTORY/bin/planahead -mode batch -source config_1_script.tcl -tclargs $PROJECT_DIRECTORY $PROJECT_NAME $RUN_NAME $PR_PARTITION $RECONF_MODULE_NAME $NGC_FILE
	
	cd "$PROJECT_DIRECTORY/$PROJECT_NAME.runs/$RUN_NAME/"
	
	$BITGEN_DIRECTORY/bin/nt64/bitgen "$PROJECT_DIRECTORY/$PROJECT_NAME.runs/$RUN_NAME/${RUN_NAME}_routed.ncd" "$PROJECT_DIRECTORY/$PROJECT_NAME.runs/$RUN_NAME/${RUN_NAME}.bit" "$PROJECT_DIRECTORY/$PROJECT_NAME.runs/$RUN_NAME/${RUN_NAME}.pcf" -w -d

	end_time=`date +%s`

	echo Total execution time was $(expr $end_time - $start_time) s

	cd -
else
	echo "usage planAheadRun.sh <reconf_module_name> <ngc_file>"
fi
