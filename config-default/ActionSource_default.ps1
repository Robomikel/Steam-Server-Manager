Function New-LaunchScriptAHL2serverPS {
  # Action: Source Dedicated Server
  # 985050
  ################## Change Default Variables #################
  #                       Server IP
  ${global:IP}            = "${global:IP}"
  #                       Server Port
  ${global:PORT}          = "27015"
  #                       Client Port
  $global:CLIENTPORT      = "27005"
  #                       Source TV Port
  $global:SOURCETVPORT    = "27020"
  #                       Game Server Token
  $global:GSLT            = ""
  #                       Map
  $global:MAP             = "act_airport"
  #                       Maxplayers
  $global:MAXPLAYERS      = "20"
  #                       Requieres Steam Login
  #                       Steam Anonymous user
  $global:ANON            = "no"
  #                       Steam Username
  $global:username        = ""
  ##############################/\##############################
  
  
  
  
  
  ###################### Do not change below #####################
  $global:MODDIR = ""
  $global:EXEDIR = ""
  $global:EXE = "ahl2"
  $global:GAME = "protocol-valve"
  $global:SAVES = ""
  $global:PROCESS = "ahl2"
  $global:SERVERCFGDIR = "cfg"

  Get-StopServerInstall
  #Game-server-configs \/
  $global:gamedirname = "ActionSource"
  $global:config1 = "server.cfg"
  Get-Servercfg
  Select-RenameSource
  # game config
  Select-EditSourceCFG
  $global:launchParams = '@("$global:EXE -console -game ahl2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} -condebug")'
}   