Function New-LaunchScriptFFserverPS {
    # Fortress Forever Dedicated Server
    # 329710
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
    $global:defaultmap      = "ff_2fort"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Rcon Password
    $global:RCONPASSWORD    = "$RANDOMPASSWORD"
    ##############################/\##############################
    ###################### Do not change below ###################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\FortressForever\cfg"
    #                       Server Executable
    $global:executable      = "ffserver"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "ffserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\FortressForever"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console -game FortressForever -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile ${servercfg} +maxplayers ${maxplayers} -condebug")'
    # -console -game open_fortress +maxplayers 32 +map dm_hydro
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
    Get-Infomessage " Creating ${servercfg}" 'info'
  New-Item $servercfgdir\${servercfg} -Force
  Add-Content   $servercfgdir\${servercfg} `
  "//Standard SERVER.CFG
  // Put your servers name in quotes here.
  hostname `"${hostname}`" 
  
  sv_password `"${serverpassword}`" // Put a password here to lock your server.
  rcon_password `"${RCONPASSWORD}`" // Put an RCON password here for remote server administration (HLSW, client, etc.)
  
  mp_timelimit 30 // Map time limit, in minutes.
  mp_friendlyfire 0 // Friendly fire. 1 = On. 0 = Off.
  
  //====================================================
  // Class limits.  Set to -1 to disable the class.  0 for unlimited.
  cr_scout 0 // Scout class limit.
  cr_sniper 0 // Sniper class limit.
  cr_soldier 0 // Soldier class limit.
  cr_demoman 0 // Demoman class limit.
  cr_medic 0 // Medic class limit.
  cr_hwguy 0 // HWGuy class limit.
  cr_pyro 0 // Pyro class limit.
  cr_spy 0 // Spy class limit.
  cr_engineer 0 // Engineer class limit.
  
  sv_rcon_maxfailures 3 // How many times an RCON password can be entered incorrectly before banning the user.
  sv_alltalk 0 // Alltalk enables voice comms between all teams/players.
  sv_voiceenable 1 // Enables voice chat. Use 0 for no voice.
  
  mp_allowspectators 1 // Allows players to spectate.
  mp_footsteps 0 // Footstep sounds. 0 = Off, 1 = On
  sv_mincmdrate 0 // Minimum cl_cmdrate
  sv_maxcmdrate 100 // Maximum cl_cmdrate
  sv_minupdaterate 10 // Minimum cl_updaterate
  sv_maxupdaterate 100 // Maximum cl_updaterate
  sv_minrate 2000 // Minimum rate
  sv_maxrate 20000 // Maximum rate
  sv_unlag 1 // Lag compensation.
  sv_maxunlag 0.3
  sv_spectatorchat 1 // Allows spectators to chat.
  sv_cheats 0 // Turns cheat cvars off.
  sv_allowupload 1 // Allow uploading of files to server. (For sprays)
  sv_allowdownload 1 // Allow downloading from server.
  sv_voicecodec vaudio_speex // The servers audio codec.
  sv_specaccelerate 5 // How quickly spectators accelerate when moving around the map.
  sv_specspeed 2 // Spectator max speed.
  
  log on // enable or disable server logging. on is on / off is off
  sv_logbans 1 // Log server bans in the server logs
  sv_logecho 1 // Echo log information to the console. 0 is off 1 is on
  sv_logfile 1 // Log server information in the log file. 0 is off 1 is on
  sv_log_onefile 1 // log everything in one file
  
  exec banned_user.cfg // A list of all bans, in case the server crashes."
  }   
  