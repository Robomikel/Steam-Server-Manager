Function New-LaunchScriptCOD3MWserverPS {
  # Call of Duty: Modern Warfare 3 - Dedicated Server
  # 42750
  # https://kb.firedaemon.com/support/solutions/articles/4000086728-call-of-duty-modern-warfare-3
  ################## Change Default Variables #################

  #                       Query Port
  $global:QUERYPORT       = "27014"
  #                       Server Port
  $global:PORT            = "27015"
  #                       Map
  $global:MAP             = "map_rotation"

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
  $global:MODDIR = ""
  $global:EXEDIR = ""
  $global:EXE = "iw5mp_server"
  $global:GAME = "protocol-valve"
  $global:SAVES = ""
  $global:PROCESS = "iw5mp_server"
  $global:SERVERCFGDIR = "admin"
  $global:LOGDIR = ""
  Get-StopServerInstall
  #Game-server-configs \/
  $global:gamedirname = ""
  $global:config1 = "server.cfg"
  # Get-Servercfg
  # Select-RenameSource
  # game config
  # Select-EditSourceCFG
  $global:launchParams = '@("$global:EXE +start_map_rotate +set sv_maprotation ${global:MAP} +set net_queryPort ${global:QUERYPORT} +set net_port ${global:PORT} +set net_authPort 8766 +set net_masterServerPort 27016 ")'
}   