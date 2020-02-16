Function New-LaunchScriptLambdaWarsserverPS {
    # Lambda Wars Dedicated Server
    # 319060
    # https://lambdawars.com/dedser.php
    ################## Change Default Variables #################
 
    #                       Server Port
    ${global:PORT}          = "27015"
    #                       Map
    $global:MAP             = "gamelobby"
    #                       Maxplayers
    $global:MAXPLAYERS      = "8"
    #                       Requieres Steam Login

  
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "lambdawars"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "lambdawars"
    $global:SERVERCFGDIR = "lambdawars\cfg"
    $global:LOGDIR = "lambdawars"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:config1 = "server.cfg"
    # Get-Servercfg
    Select-RenameSource
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console --game lambdawars +maxplayers ${global:MAXPLAYERS} +map ${global:MAP} -port ${global:PORT} -condebug")'
  }   