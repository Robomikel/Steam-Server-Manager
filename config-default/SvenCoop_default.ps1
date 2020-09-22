Function New-LaunchScriptSvenCoopserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # SvenCoop Dedicated Server
    # APP ID # 276060
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:ip}            = "${ip}"
    #                       Server Port
    $global:port            = "28015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Map
    $global:defaultmap      = "svencoop1"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"

    ##############################/\##############################

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\svencoop"
    #                       Server Executable
    $global:executable      = "SvenDS"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "SvenDS"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "console-*.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "SvenCoop"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console -game svencoop -strictportbind +ip ${ip} -port ${port} +hostname `"${hostname}`" +clientport ${clientport} +map ${defaultmap} +servercfgfile ${servercfg} +maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}
