Function New-LaunchScriptSquadserverPS {
    # Squad Dedicated Server
    # APP ID # 403240
    # https://squad.gamepedia.com/Server_Configuration
    ################## Change Default Variables #################
    #                       Server IP
    # ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "7787"
    #                       Query Port
    $global:QUERYPORT       = "27165"
    #                       Maxplayers
    $global:MAXPLAYERS      = "80"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    ##############################/\##############################
    
    # Need to be open on Windows firewall and router.
    # Port = Game port = UDP (Default 7787, 7788 UDP)
    # QueryPort = Steam query port = UDP (Default 27165 UDP)
    # QueryPort+1 = Second Steam query port = UDP and TCP (Default 27165, 27166 UDP and TCP)
    # RCON Port = UDP and TCP (Default 21114) must be open.
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "SquadGameServer"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "SquadGameServer"
    $global:SERVERCFGDIR = "\squad_server\SquadGame\ServerConfig\"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "Server.cfg"

    
    # Get-Servercfg
    # Select-EditSourceCFG
    
    # $global:launchParams = '@("$global:EXE MULTIHOME=${global:IP} Port=${global:PORT}  QueryPort=${global:QUERYPORT} FIXEDMAXPLAYERS=${global:MAXPLAYERS} FIXEDMAXTICKRATE=50 RANDOM=ALWAYS -log")'
    $global:launchParams = '@("$global:EXE Port=${global:PORT} QueryPort=${global:QUERYPORT} FIXEDMAXPLAYERS=${global:MAXPLAYERS} RANDOM=ALWAYS -log")'

} 