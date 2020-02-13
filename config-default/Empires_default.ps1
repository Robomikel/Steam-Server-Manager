Function New-LaunchScriptemserverPS {
    # Empires Dedicated Server
    # 460040
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    ${global:PORT}          = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:SOURCETVPORT    = "27020"
    #                       Map
    $global:MAP             = "emp_streetsoffire"
    #                       Maxplayers
    $global:MAXPLAYERS      = "62"


    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "Empires"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "Empires"
    $global:SERVERCFGDIR = "empires\cfg"
    $global:LOGDIR = "empires"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:config1 = "server.cfg"
    #   Get-Servercfg
    Select-RenameSource
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game empires -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${map} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
  }   