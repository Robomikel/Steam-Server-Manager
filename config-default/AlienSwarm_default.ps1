Function New-LaunchScriptasrdserverPS {
    # Alien Swarm: Reactive Drop Dedicated Server
    #        (582400)
    # https://steamcommunity.com/app/563560/discussions/1/1319961868328134237/
    
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    ${global:PORT}          = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
     $global:MAP             = "lobby"
    #                       Maxplayers
     $global:MAXPLAYERS      = "10"


    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:EXE = "asrd"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "asrd"
    $global:SERVERCFGDIR = "reactivedrop\cfg"
    $global:LOGDIR = "reactivedrop"

    $global:RCONPORT = "${global:PORT}"
    Get-StopServerInstall
    Select-RenameSource
    $global:launchParams = '@("$global:EXE -console -game reactivedrop -ip ${global:IP} -port ${global:PORT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +exec server.cfg -condebug")'
    # $global:launchParams = '@("$global:EXE -console -usegh -nomessagebox -nocrashdialog -num_edicts 8192 -game reactivedrop -heapsize 1572864 -tickrate 100 -port 27070 +map lobby +con_logfile "console.log" -maxplayers 10 +exec server.cfg -condebug")'

}