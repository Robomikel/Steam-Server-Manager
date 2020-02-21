Function New-LaunchScriptVanguard1944serverPS {
  # Vanguard: Normandy 1944 Dedicated Server
  # 1017070
  ################## Change Default Variables #################
  #                       Server Name
  $global:hostname        = "$env:USERNAME"
  
  ##############################/\##############################
    
    
  # server.cfg
  # --net_lobby_default_port=64090

  # --steamqueryport=64100
    
  ###################### Do not change below #####################
  $global:systemdir = ""
  $global:executabledir = "$serverdir\bin\win_x64"
  $global:executable = "vanguardserver"
  $global:querytype = "protocol-valve"
  $global:saves = ""
  $global:process = "vanguardserver"
  $global:servercfgdir = "$serverdir"
  $global:logdirectory = "$serverdir"
  Get-StopServerInstall
  #Game-server-configs \/
  $global:gamedirname = ""
  $global:servercfg = "server.cfg"
  # Get-Servercfg
  # Select-RenameSource
  # game config
  # Select-EditSourceCFG
  $global:launchParams = '@("$executable -console +sv_servername=`"${hostname}`" -condebug")'
}   