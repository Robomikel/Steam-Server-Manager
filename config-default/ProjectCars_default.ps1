Function New-LaunchScriptPCserverPS {
  # Project CARS - Dedicated Server
  # 332670
  ################## Change Default Variables #################
    
  #                       Server Name
  $global:hostname = "$env:USERNAME"

  ##############################/\##############################
    
    
  # steamPort : 8766
  # hostPort : 27015
  # queryPort : 27016

  # UDP / TCP 
    
    
  ###################### Do not change below #####################
  $global:systemdir = ""
  $global:executabledir = ""
  $global:executable = "DedicatedServerCmd"
  $global:querytype = "protocol-valve"
  $global:saves = ""
  $global:process = "DedicatedServerCmd"
  $global:servercfgdir = "\"
  $global:logdir = "logs"
  Get-StopServerInstall
  #Game-server-configs \/
  $global:gamedirname = "ProjectCars"
  $global:servercfg = "server.cfg"
  Get-Servercfg
  # Select-RenameSource
  # game config
  Select-EditSourceCFG
  $global:launchParams = '@("$executable --config server.cfg -condebug")'
}   