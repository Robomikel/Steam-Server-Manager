Function New-LaunchScriptEternalSilenceserverPS {
    # Eternal Silence Dedicated Server
    # 17555
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    ${global:port}          = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap      = "es_ice"
    #                       Maxplayers
    $global:maxplayers      = "8"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$RANDOMPASSWORD"
    ##############################/\##############################
    ###################### Do not change below ###################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\esmod\cfg"
    #                       Server Executable
    $global:executable      = "esmod"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "esmod"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\esmod"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory 
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console -game esmod -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
    Get-esmodInstallChanges
  }
  
  
Function Get-esmodInstallChanges {
    Get-Infomessage " Creating server.cfg " 'info'
    New-Item $servercfgdir\$servercfg -Force
    Add-Content   $servercfgdir\$servercfg `
    " hostname $hostname
rcon_password $RCONPASSWORD 
sv_password   // only needed to make your server private.
sv_contact your@email.com 

hostport 27016
sv_lan 0 // enable LAN = 1; disable LAN = 0
sv_region 255
// sv_allow_lobby_connect_only 0 - enable/disable Lobby connections 1/0

// mp_disable_autokick 1 - disables autokick=1
sv_allow_wait_command 0
sv_alltalk 1
sv_alternateticks 0
sv_clearhinthistory 0
sv_consistency 1
sv_pausable 0
sv_voiceenable 1
sv_cheats 0
sv_forcepreload 1
sv_pure_kick_clients 0

//exec banned_user.cfg
//exec banned_ip.cfg

sv_log_onefile 0
sv_logbans 1
sv_logecho 0
sv_logfile 1
sv_logflush 0
sv_logsdir logs

sv_minrate 30000
sv_maxrate 60000
sv_minupdaterate 66
sv_maxupdaterate 101
sv_mincmdrate 66
sv_maxcmdrate 101"
}