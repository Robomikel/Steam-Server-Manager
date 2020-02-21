Function New-LaunchScriptemserverPS {
    # Empires Dedicated Server
    # 460040
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
    $global:defaultmap      = "emp_streetsoffire"
    #                       Maxplayers
    $global:maxplayers      = "62"


    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executabledir = "$serverdir"
    $global:executable = "Empires"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "Empires"
    $global:servercfgdir = "$serverdir\empires\cfg"
    $global:logdirectory = "$serverdir\empires"
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = ""
    $global:servercfg = "server.cfg"
    #   Get-Servercfg
    Select-RenameSource
    # game config
    # Select-EditSourceCFG
    $global:launchParams = '@("$executable -console -game empires -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
  }   