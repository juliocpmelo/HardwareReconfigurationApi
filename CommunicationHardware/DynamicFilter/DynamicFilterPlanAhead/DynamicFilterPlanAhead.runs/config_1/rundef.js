//
// PlanAhead(TM)
// rundef.js: a PlanAhead-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-1999, 2001-2012 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "C:/Xilinx/14.4/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.4/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.4/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.4/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.4/ISE_DS/common/bin/nt64;C:/Xilinx/14.4/ISE_DS/common/lib/nt64;C:/Xilinx/14.4/ISE_DS/PlanAhead/bin;";
} else {
  PathVal = "C:/Xilinx/14.4/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.4/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.4/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.4/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.4/ISE_DS/common/bin/nt64;C:/Xilinx/14.4/ISE_DS/common/lib/nt64;C:/Xilinx/14.4/ISE_DS/PlanAhead/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "ngdbuild",
         "-intstyle ise -p xc5vlx110tff1136-1 -dd _ngo -uc \"config_1.ucf\" \"config_1.edf\"" );
ISEStep( "map",
         "-intstyle pa -w -pr b \"config_1.ngd\"" );
ISEStep( "par",
         "-intstyle pa \"config_1.ncd\" -w \"config_1_routed.ncd\"" );
ISEStep( "trce",
         "-intstyle ise -o \"config_1.twr\" -v 30 -l 30 \"config_1_routed.ncd\" \"config_1.pcf\"" );
ISEStep( "xdl",
         "-secure -ncd2xdl -nopips \"config_1_routed.ncd\" \"config_1_routed.xdl\"" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
