Function New-LaunchScriptZPSserverPS {
    #
    # Zombie Panic! Source Dedicated Server
    # APP ID # 17505
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
    $global:defaultmap      = "zps_deadend"
    #                       Max Players 
    $global:maxplayers      = "20"
      #                     Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Game Server Token required for public servers
    $global:gslt            = "GameServerTokenHere"
    ##############################/\##############################
    
    ##################### Do not change below #####################
    #                         System Directory
    $global:systemdir         = "$serverdir"
    #                         Server Config Directory
    $global:servercfgdir      = "$serverdir\zps\cfg"
    #                         Server Executable
    $global:executable        = "zps"
    #                         Server Executable Directory
    $global:executabledir     = "$serverdir"
    #                         Gamedig Query
    $global:querytype         = "protocol-valve"
    #                         Game Process
    $global:process           = "zps"
    #                         Log Directory
    $global:logdirectory      = "$serverdir\zps"
    #                       Server Log
    $global:consolelog             = "console.log"
    #                         Game-Server-Config Directory
    $global:gamedirname       = "ZombiePanicSource"
    #                         Game-Server-Config
    $global:servercfg         = "server.cfg"
    #                         Server Launch Command
    $global:launchParams      = '@("$executable -console -game zps -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}