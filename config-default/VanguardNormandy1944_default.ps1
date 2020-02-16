Function New-LaunchScriptVanguard1944serverPS {
  # Vanguard: Normandy 1944 Dedicated Server
  # 1017070
  ################## Change Default Variables #################
  #                       Server Name
  $global:HOSTNAME = "$env:USERNAME"
  
  ##############################/\##############################
    
    
  # server.cfg
  # --net_lobby_default_port=64090

  # --steamqueryport=64100
    
  ###################### Do not change below #####################
  $global:MODDIR = ""
  $global:EXEDIR = "bin\win_x64"
  $global:EXE = "vanguardserver"
  $global:GAME = "protocol-valve"
  $global:SAVES = ""
  $global:PROCESS = "vanguardserver"
  $global:SERVERCFGDIR = ""
  $global:LOGDIR = ""
  Get-StopServerInstall
  #Game-server-configs \/
  $global:gamedirname = ""
  $global:config1 = "server.cfg"
  # Get-Servercfg
  # Select-RenameSource
  # game config
  # Select-EditSourceCFG
  $global:launchParams = '@("$global:EXEDIR\$global:EXE -console +sv_servername=`"${global:HOSTNAME}`" -condebug")'
}   