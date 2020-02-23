Function New-LaunchScriptSquadserverPS {
    # Squad Dedicated Server
    # APP ID # 403240
    # https://squad.gamepedia.com/Server_Configuration
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "7787"
    #                       Query Port
    $global:queryport       = "27165"
    #                       Maxplayers
    $global:maxplayers      = "80"
    #                       Server Name
    # $global:hostname      = "SERVERNAME"
    ##############################/\##############################
    
    # Need to be open on Windows firewall and router.
    # Port = Game port = UDP (Default 7787, 7788 UDP)
    # QueryPort = Steam query port = UDP (Default 27165 UDP)
    # QueryPort+1 = Second Steam query port = UDP and TCP (Default 27165, 27166 UDP and TCP)
    # RCON Port = UDP and TCP (Default 21114) must be open.
    
    
    
    ###################### Do not change below #####################
    #                               System Directory
    $global:systemdir               = "$serverdir"
    #                               Server Config Directory
    $global:servercfgdir            = "$serverdir\squad_server\SquadGame\ServerConfig\"
    #                               Server Executable
    $global:executable              = "SquadGameServer"
    #                               Server Executable Directory
    $global:executabledir           = "$serverdir"
    #                               Gamedig Query
    $global:querytype               = "protocol-valve"
    #                               Game Process
    $global:process                 = "SquadGameServer"
    #                               Log Directory
    $global:logdirectory            = "$serverdir"
    #                               Game-Server-Config Directory
    $global:gamedirname             = ""
    #                               Game-Server-Config
    $global:servercfg               = "Server.cfg"
    #                               Server Launch Command
    $global:launchParams            = '@("$executable MULTIHOME=${IP} Port=${port} QueryPort=${queryport} FIXEDMAXPLAYERS=${maxplayers} FIXEDMAXTICKRATE=50 RANDOM=ALWAYS -log")'
} 