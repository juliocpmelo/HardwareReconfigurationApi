
# args
# 0 projectPath
# 1 projectName
# 2 runName
# 3 prPartition
# 4 reconfComponentName
# 5 reconfModuleName
# 6 ngcFile



set projectPath [lindex $argv 0]
set projectName [lindex $argv 1]
set runName  [lindex $argv 2]
set prPartition  [lindex $argv 3]
set reconfComponentName  [lindex $argv 4]
set reconfModuleName  [lindex $argv 5]
set ngcFile  [lindex $argv 6]

set bbModuleName [string tolower $reconfComponentName]

open_project  "$projectPath/$projectName.ppr"

#still dont know what this command do, however the netlist_1 should be the same in every project
link_design -name netlist_1



#check whether the run to be executed exists or not
set runList [ get_runs $runName ]

if {[llength runList]} {

	#sets the active module to be the black box one
	load_reconfig_modules -reconfig_modules "$prPartition:${bbModuleName}_bb"

	puts "excluding run $runName and module $prPartition:$reconfModuleName"

	delete_reconfig_module "$prPartition:$reconfModuleName"

	delete_run $runName 
}






#delete_reconfig_module "$prPartition:$reconfModuleName"

#creates a reconfigurable module in the target partition
create_reconfig_module -force -name $reconfModuleName -cell $prPartition

#imports the ngc file into the reconfigurable module
import_files -fileset "[string map {/ ~} $prPartition]#$reconfModuleName" -force -norecurse $ngcFile

puts "creating run $runName"

#creates a run to generate the configuration
create_run $runName -flow {ISE 14}

#imports the static part and set the newly created module as part of the actual configuration
config_partition -run $runName -import -import_dir "$projectPath/$projectName.promote/Xconfig_1" -preservation routing
config_partition -run $runName -cell $prPartition -reconfig_module $reconfModuleName -implement

#puts "opening project  $projectPath/$projectName.ppr"



#resets run
#reset_run $runName


set ngdBuild_Time_beg [clock seconds]
#ngd build
launch_runs $runName -next_step
wait_on_run $runName


#map
launch_runs $runName -next_step
wait_on_run $runName


#par
launch_runs $runName -next_step
wait_on_run $runName

set par_Time_end [clock seconds]
set totalTime_taken [expr $par_Time_end - $ngdBuild_Time_beg]
puts "Total Generation Time was: [clock format $totalTime_taken -format %H:%M:%S]"
