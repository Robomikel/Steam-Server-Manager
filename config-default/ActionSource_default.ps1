Function New-LaunchScriptAHL2serverPS {
  # Action: Source Dedicated Server
  # 985050
  ################## Change Default Variables #################
  #                       Requires Steam Login
  #                       Server IP
  ${global:IP}            = "${ip}"
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
  $global:hostname        = "SERVERNAME"
  #                       Rcon Password
  $global:RCONPASSWORD    = "$RANDOMPASSWORD"
  ##############################/\##############################
  ###################### Do not change below ###################
  #                       System Directory 
  $global:systemdir       = "$serverdir"
  #                       Server Config Directory
  $global:servercfgdir    = "$serverdir\ahl2\cfg"
  #                       Server Executable
  $global:executable      = "ahl2"
  #                       Server Executable Directory
  $global:executabledir   = "$serverdir"
  #                       Gamedig Query
  $global:querytype       = "protocol-valve"
  #                       Game Process
  $global:process         = "ahl2"
  #                       Log Directory
  $global:logdirectory    = "$serverdir\ahl2"
  #                       Server Log
  $global:consolelog      = "console.log"
  #                       Game-Server-Config Directory 
  $global:gamedirname     = "ActionSource"
  #                       Game-Server-Config
  $global:servercfg       = "server.cfg"
  #                       Server Launch Command
  $global:launchParams    = '@("${executable} -console -game ahl2 -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
  # Get User Input version must be set to 0
  Get-UserInput
  # Download Game-Server-Config
  Get-Servercfg
  # Edit Server Game-Server-Config
  Select-EditSourceCFG
  # Rename Source $executable.exe
  Select-RenameSource
}   