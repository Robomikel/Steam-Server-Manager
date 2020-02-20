Function New-LaunchScriptasrdserverPS {
    # Alien Swarm: Reactive Drop Dedicated Server
    #        (582400)
    # https://steamcommunity.com/app/563560/discussions/1/1319961868328134237/
    
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    ${global:port}          = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
     $global:defaultmap             = "lobby"
    #                       Maxplayers
     $global:maxplayers      = "10"


    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "asrd"
    $global:executabledir= ""
    $global:querytype = "protocol-valve"
    $global:process = "asrd"
    $global:servercfgdir = "reactivedrop\cfg"
    $global:logdir = "reactivedrop"

    Get-StopServerInstall
    Select-RenameSource
    $global:launchParams = '@("$executable -console -game reactivedrop -ip ${ip} -port ${port} +map ${defaultmap} -maxplayers ${maxplayers} +clientport ${clientport} +tv_port ${sourcetvport} +exec server.cfg -condebug")'
    # $launchParams = '@("$executable -console -usegh -nomessagebox -nocrashdialog -num_edicts 8192 -game reactivedrop -heapsize 1572864 -tickrate 100 -port 27070 +map lobby +con_logfile "console.log" -maxplayers 10 +exec server.cfg -condebug")'

}