Function New-LaunchScriptCOD3MWserverPS {
  # Call of Duty: Modern Warfare 3 - Dedicated Server
  # 42750
  # https://kb.firedaemon.com/support/solutions/articles/4000086728-call-of-duty-modern-warfare-3
  ################## Change Default Variables #################

  #                       Query Port
  $global:queryport       = "27014"
  #                       Server Port
  $global:port            = "27015"
  #                       Map
  $global:defaultmap      = "map_rotation"

  #                       Requieres Steam Login
  
  ##############################/\##############################
    
    
  # "+start_map_rotate" Loads the server.
  # "+set sv_maprotation map_rotation” Loads your map rotation (replace map_rotation with whatever you named your rotation).
  # // Server command-line parameters (this section is for documentation only)

 # // Specify server configuration file (this file)
 # //+set sv_config "filename" (default "server.cfg")

  #// Specify server visibility (1 = LAN, 2 = Internet (default) )
  #+set dedicated 1

  #// Open game port (Steam-visible server game port)
  #+set net_queryPort 27014

  #// Secure game port
  #+set net_port 27015

  #// Steam authentication port
  #+set net_authPort 8766

  #// Steam master server (server browser) port
  #+set net_masterServerPort 27016
    
  ###################### Do not change below #####################
  #                           System Directory
  $global:systemdir           = "$serverdir"
  #                           Server Config Directory
  $global:servercfgdir        = "$serverdir\admin"
  #                           Server Executable
  $global:executable          = "iw5mp_server"
  #                           Server Executable Directory
  $global:executabledir       = "$serverdir"
  #                           Gamedig Query
  $global:querytype           = "protocol-valve"
  #                           Game Process
  $global:process             = "iw5mp_server"
  #                           Log Directory
  $global:logdirectory        = "$serverdir"
  #                           Server Log
  $global:consolelog          = ""
  #                           Game-Server-Config Directory
  $global:gamedirname         = ""
  #                           Game-Server-Config
  $global:servercfg           = "server.cfg"
  #                           Server Launch Command
  $global:launchParams        = '@("${executable} +start_map_rotate +set sv_maprotation ${defaultmap} +set net_queryPort ${queryport} +set net_port ${port} +set net_authPort 8766 +set net_masterServerPort 27016 ")'
  # Get User Input version must be set to 0
  Get-UserInput
}   