
#this script first creates a reconfigurable partition and a configuration with the given .ngc file
#then executes the implementation flow to generate the partial bitstream to the desired configuration module

#env configuration
XILINX_ROOT_DIRECTORY=/cygdrive/c/Xilinx/14.4/ISE_DS/
PLANAHEAD_DIRECTORY=$XILINX_ROOT_DIRECTORY/PlanAhead/
BITGEN_DIRECTORY=$XILINX_ROOT_DIRECTORY/ISE

#inputs to the generation tool
PROJECT_NAME="$1"

PROJECT_DIRECTORY="$2"

RECONF_COMPONENT_NAME="$3" #

RECONF_MODULE_NAME="$4" #

NGC_FILE="$5" #

#this differs only by the case of the letters and the "_buswrapper" word, it should be specified this way when it is used in a
#platform type project. obs: Big case letters are not allowed in Xilinx XPS program to define the type of the bus wrappers in the projects
#TODO think about bare metal project

#auto generated parameters
BUS_WRAPPER_COMPONENT_NAME=`echo $RECONF_COMPONENT_NAME | awk '{print tolower($0)}'`
BUS_WRAPPER_COMPONENT_NAME="${BUS_WRAPPER_COMPONENT_NAME}_buswrapper"

RUN_NAME="${4}_run"

PR_PARTITION="${BUS_WRAPPER_COMPONENT_NAME}_0/${BUS_WRAPPER_COMPONENT_NAME}_0/USER_LOGIC_I/${RECONF_COMPONENT_NAME}_communicationHardware_inst"

#run config_1

#add ngc to project
#create run with ngc_name
#run it


if [ "$#" -gt 0 ]; then

	start_time=`date +%s`

#	$PLANAHEAD_DIRECTORY/bin/planahead -mode batch -source compilationScript.tcl -tclargs "$PROJECT_DIRECTORY/PA" $PROJECT_NAME $RUN_NAME $PR_PARTITION $RECONF_COMPONENT_NAME $RECONF_MODULE_NAME $NGC_FILE
	
	end_time=`date +%s`

	echo Total execution time was $(expr $end_time - $start_time) s

	cd -
else
	echo "usage planAheadRun.sh <reconf_module_name> <ngc_file>"
fi
