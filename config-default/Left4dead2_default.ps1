Function New-LaunchScriptLFD2serverPS {
    #----------   left4dead2 Server CFG    -------------------
    # APP ID # 222860
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Map
    $global:defaultmap      = "c1m1_hotel"
    #                       Maxplayers
    $global:maxplayers      = "8"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"

    ##############################/\##############################
    
    ###################### Do not change below ##################### 
    #                       System Directory
    $global:systemdir       = "left4dead2"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\left4dead2\cfg"
    #                       Server Executable
    $global:executable      = "l4d2"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "left4dead2"
    #                       Game Process
    $global:process         = "l4d2"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\left4dead2"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "Left4Dead2"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console -game left4dead2 -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +hostip ${extip} +maxplayers ${maxplayers} +map `"${defaultmap}`" -condebug ")'
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}