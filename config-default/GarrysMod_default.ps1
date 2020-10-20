Function New-LaunchScriptGMODserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Garry's Mod Dedicated Server
    # APP ID # 4020
    # WIKI
    ################## Change Default Variables #################
    #--->Default Vars
    #                       Server IP
    $global:ip              = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap      = "gm_construct"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Gamemode
    $global:gamemode        = "sandbox"
    #                       Tickrate     
    $global:tickrate        = "66"
    # API key visit - https://steamcommunity.com/dev/apikey
    $global:wsapikey               = ""
    $global:wscollectionid         = ""
    # Custom Start Parameters
    $global:customparms            = "-disableluarefresh"
    #                       Game Server Token
    $global:gslt                   = "GameServerToken"
    ###########################/\#################################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "garrysmod"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\garrysmod\cfg"
    #                       Server Executable
    $global:executable      = "gmod"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "garrysmod"
    #                       Game Process
    $global:process         = "gmod"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\garrysmod"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "GarrysMod"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    # Get User Input version must be set to 0
    Get-UserInput
    #                       Server Launch Command
    If ($gslt -ne "GameServerToken") {
        $global:launchParams    = '@("${executable} -console -game garrysmod -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" -tickrate ${tickrate} +host_workshop_collection ${wscollectionid} -authkey ${wsapikey} +clientport ${clientport} +tv_port ${sourcetvport} +gamemode ${gamemode} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile ${servercfg} -maxplayers ${maxplayers} ${customparms} -condebug")'
    }
    Else {
        $global:launchParams    = '@("${executable} -console -game garrysmod -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" -tickrate ${tickrate} +host_workshop_collection ${wscollectionid} -authkey ${wsapikey} +clientport ${clientport} +tv_port ${sourcetvport} +gamemode ${gamemode} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers ${maxplayers} ${customparms} -condebug")'
    }
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}