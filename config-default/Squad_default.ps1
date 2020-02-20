Function New-LaunchScriptSquadserverPS {
    # Squad Dedicated Server
    # APP ID # 403240
    # https://squad.gamepedia.com/Server_Configuration
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "7787"
    #                       Query Port
    $global:queryport       = "27165"
    #                       Maxplayers
    $global:maxplayers      = "80"
    #                       Server Name
    # $global:hostname      = "$env:USERNAME"
    ##############################/\##############################
    
    # Need to be open on Windows firewall and router.
    # Port = Game port = UDP (Default 7787, 7788 UDP)
    # QueryPort = Steam query port = UDP (Default 27165 UDP)
    # QueryPort+1 = Second Steam query port = UDP and TCP (Default 27165, 27166 UDP and TCP)
    # RCON Port = UDP and TCP (Default 21114) must be open.
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "SquadGameServer"
    $global:executabledir = ""
    $global:querytype = "protocol-valve"
    $global:process = "SquadGameServer"
    $global:servercfgdir = "\squad_server\SquadGame\ServerConfig\"
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "Server.cfg"

    Get-StopServerInstall
    # Get-Servercfg
    # Select-EditSourceCFG
    
    # $global:launchParams = '@("$executable MULTIHOME=${IP} Port=${port}  QueryPort=${QUERYPORT} FIXEDMAXPLAYERS=${maxplayers} FIXEDMAXTICKRATE=50 RANDOM=ALWAYS -log")'
    $global:launchParams = '@("$executable Port=${port} QueryPort=${queryport} FIXEDMAXPLAYERS=${maxplayers} RANDOM=ALWAYS -log")'

} 