Function New-LaunchScriptAHL2serverPS {
  # Action: Source Dedicated Server
  # 985050
  ################## Change Default Variables #################
  #                       Server IP
  ${global:IP}            = "${global:IP}"
  #                       Server Port
  ${global:port}          = "27015"
  #                       Client Port
  $global:clientport      = "27005"
  #                       Source TV Port
  $global:sourcetvport    = "27020"
  #                       Map
  $global:defaultmap      = "act_airport"
  #                       Maxplayers
  $global:maxplayers      = "20"
  #                       Server Name
  $global:hostname        = "$env:USERNAME"
  #                       Rcon Password
  $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
  #                       Requieres Steam Login

  ##############################/\##############################
  
  
  
  
  
  ###################### Do not change below #####################
  $global:systemdir = ""
  $global:executabledir = "$serverdir"
  $global:executable = "ahl2"
  $global:querytype = "protocol-valve"
  $global:saves = ""
  $global:process = "ahl2"
  $global:servercfgdir = "$serverdir\ahl2\cfg"
  $global:logdirectory = "$serverdir\ahl2"
  Get-StopServerInstall
  #game-server-configs \/
  $global:gamedirname = "ActionSource"
  $global:servercfg = "server.cfg"
  Get-Servercfg
  Select-RenameSource
  # game config
  Select-EditSourceCFG
  $global:launchParams = '@("$executable -console -game ahl2 -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} -maxplayers ${maxplayers} -condebug")'
}   