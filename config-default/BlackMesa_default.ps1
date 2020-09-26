Function New-LaunchScriptBlackMesaserverPS {
    #
    # Black Mesa: Deathmatch
    # APP ID # 346680
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${ip}"
    #                       Server Port 
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Server Map 
    $global:defaultmap      = "dm_bounce"
    #                       Max Players 
    $global:maxplayers      = "16"
      #                     Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    ##############################/\##############################
    
    ##################### Do not change below #####################
    #                       System Directory 
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\bms\cfg"
    #                       Server Executable 
    $global:executable      = "bmdm"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "bmdm"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\bms"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "BlackMesa"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console -game bms -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}