Function New-LaunchScriptLambdaWarsserverPS {
    # Lambda Wars Dedicated Server
    # 319060
    # https://lambdawars.com/dedser.php
    ################## Change Default Variables #################
 
    #                       Server Port
    ${global:port}          = "27015"
    #                       Map
    $global:defaultmap      = "gamelobby"
    #                       Maxplayers
    $global:maxplayers      = "8"
    #                       Requieres Steam Login

  
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = ""
    $global:executable = "lambdawars"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "lambdawars"
    $global:servercfgdir = "lambdawars\cfg"
    $global:logdir = "lambdawars"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:servercfg = "server.cfg"
    # Get-Servercfg
    Select-RenameSource
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@("$executable -console --game lambdawars +maxplayers ${maxplayers} +map ${defaultmap} -port ${port} -condebug")'
  }   