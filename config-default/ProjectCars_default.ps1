Function New-LaunchScriptPCserverPS {
  # Project CARS - Dedicated Server
  # 332670
  ################## Change Default Variables #################
    
  #                       Server Name
  $global:hostname        = "SERVERNAME"

  ##############################/\##############################
    
  # steamPort : 8766
  # hostPort : 27015
  # queryPort : 27016
  # UDP / TCP 

  ###################### Do not change below #####################
  #                     System Directory
  $global:systemdir     = "$serverdir"
  #                     Server Config Directory
  $global:servercfgdir  = "$serverdir"
  #                     Server Executable
  $global:executable    = "DedicatedServerCmd"
  #                     Server Executable Directory
  $global:executabledir = "$serverdir"
  #                     Gamedig Query
  $global:querytype     = "protocol-valve"
  #                     Game Process
  $global:process       = "DedicatedServerCmd"
  #                     Log Directory
  $global:logdirectory  = "$serverdir\logs"
  #                       Server Log
  $global:consolelog    = ""
  #                     Game-Server-Config Directory
  $global:gamedirname   = "ProjectCars"
  #                     Game-Server-Config
  $global:servercfg     = "server.cfg"
  #                     Server Launch Command
  $global:launchParams  = '@("$executable --config server.cfg -condebug")'
  # Get User Input version must be set to 0
  Get-UserInput
  # Download Game-Server-Config
  Get-Servercfg
  # Edit Server Game-Server-Config
  Select-EditSourceCFG
}   