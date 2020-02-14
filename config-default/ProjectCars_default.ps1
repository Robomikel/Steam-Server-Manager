Function New-LaunchScriptPCserverPS {
  # Project CARS - Dedicated Server
  # 332670
  ################## Change Default Variables #################
    
  #                       Server Name
  $global:HOSTNAME = "$env:USERNAME"

  ##############################/\##############################
    
    
  # steamPort : 8766
  # hostPort : 27015
  # queryPort : 27016

  # UDP / TCP 
    
    
  ###################### Do not change below #####################
  $global:MODDIR = ""
  $global:EXEDIR = ""
  $global:EXE = "DedicatedServerCmd"
  $global:GAME = "protocol-valve"
  $global:SAVES = ""
  $global:PROCESS = "DedicatedServerCmd"
  $global:SERVERCFGDIR = "\"
  $global:LOGDIR = "logs"
  Get-StopServerInstall
  #Game-server-configs \/
  $global:gamedirname = "ProjectCars"
  $global:config1 = "server.cfg"
  Get-Servercfg
  # Select-RenameSource
  # game config
  Select-EditSourceCFG
  $global:launchParams = '@("$global:EXE --config server.cfg -condebug")'
}   