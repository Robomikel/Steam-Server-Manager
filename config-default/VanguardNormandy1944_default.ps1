Function New-LaunchScriptVanguard1944serverPS {
  # Vanguard: Normandy 1944 Dedicated Server
  # 1017070
  ################## Change Default Variables #################
  #                       Server Name
  $global:hostname        = "SERVERNAME"
  
  ##############################/\##############################
  # server.cfg
  # --net_lobby_default_port=64090
  # --steamqueryport=64100
  ###################### Do not change below #####################
  #                     System Directory
  $global:systemdir     = "$serverdir"
  #                     Server Config Directory
  $global:servercfgdir  = "$serverdir"
  #                     Server Executable
  $global:executable    = "vanguardserver"
  #                     Server Executable Directory
  $global:executabledir = "$serverdir\bin\win_x64"
  #                     Gamedig Query
  $global:querytype     = "protocol-valve"
  #                     Game Process
  $global:process       = "vanguardserver"
  #                     Log Directory
  $global:logdirectory  = "$serverdir"
  #                      Server Log
  $global:consolelog            = "server.log"
  #                     Game-Server-Config Directory 
  $global:gamedirname   = ""
  #                     Game-Server-Config
  $global:servercfg     = "server.cfg"
  #                     Server Launch Command
  $global:launchParams  = '@("$executable -console +sv_servername=`"${hostname}`" -condebug")'
  # Get User Input version must be set to 0
  Get-UserInput
}   