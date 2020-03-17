Function New-LaunchScriptNMRIHserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # No More Room in Hell Dedicated Server
    # APP ID # 317670
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:ip}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Game Server Token (required)
    $global:gslt            = "GameServerTokenHere"
    #                       Map
    $global:defaultmap      = "nmo_broadway"
    #                       Maxplayers
    $global:maxplayers      = "8"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    

    ##############################/\##############################
    
    ###################### Do not change below ##################### 
    #                       System Directory
    $global:systemdir       = "$serverdir\nmrih"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\nmrih\cfg"
    #                       Server Executable
    $global:executable      = "NMRIH"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "nmrih"
    #                       Game Process
    $global:process         = "NMRIH"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\nmrih"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "NoMoreRoominHell"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console -game nmrih -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}