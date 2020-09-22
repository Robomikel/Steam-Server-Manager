Function New-LaunchScriptHL2DMserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Half-Life 2: Deathmatch Dedicated Server
    #      232370
    # https://kb.firedaemon.com/support/solutions/articles/4000086964-half-life-2-deathmatch
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
    $global:defaultmap      = "dm_lockdown"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"

    ###########################/\#################################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "hl2mp"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\hl2mp\cfg"
    #                       Server Executable
    $global:executable      = "HL2DM"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "hl2dm"
    #                       Game Process
    $global:process         = "hl2dm"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\hl2mp"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "HalfLife2Deathmatch"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console -game hl2mp -strictportbind -ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile {server.cfg} -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}