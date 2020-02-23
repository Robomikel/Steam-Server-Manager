Function New-LaunchScriptDystopiaserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Dystopia Dedicated Server
    #      17585
    # https://steamdb.info/app/17585/
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap      = "dys_broadcast"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\dystopia\cfg"
    #                       Server Executable
    $global:executable      = "Dystopia"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\bin\win32"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Dystopia"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\dystopia"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "Dystopia"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console -game `"$currentdir\${serverfiles}\dystopia`" -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}