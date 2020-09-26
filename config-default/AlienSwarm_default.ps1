Function New-LaunchScriptasrdserverPS {
    # Alien Swarm: Reactive Drop Dedicated Server
    #        (582400)
    # https://steamcommunity.com/app/563560/discussions/1/1319961868328134237/
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
     $global:defaultmap     = "lobby"
    #                       Maxplayers
    $global:maxplayers      = "10"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ##############################/\##############################
    #  
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\reactivedrop\cfg"
    #                       Server Executable
    $global:executable      = "asrd"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "asrd"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\reactivedrop"
    #                       Server Log
    $global:consolelog      = "console.log"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable} -console -game reactivedrop -ip ${ip} -port ${port} +hostname `"${hostname}`" +map ${defaultmap} -maxplayers ${maxplayers} +clientport ${clientport} +tv_port ${sourcetvport} +exec ${servercfg} -condebug")'
      # Get User Input version must be set to 0
    Get-UserInput
    # Rename Source $executable.exe
    Select-RenameSource
}