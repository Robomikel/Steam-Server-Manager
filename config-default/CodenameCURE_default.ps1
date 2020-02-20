Function New-LaunchScriptCCserverPS {
    #----------   Codename CURE Dedicated Server Server Install Function   -------------------
    # APP ID # 383410
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap      = "cbe_bunker"
    #                       Maxplayers
    $global:maxplayers      = "6"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    # # Version 2.0
    $global:systemdir = ""
    $global:executable = "cure"
    $global:executabledir = ""
    $global:querytype = "insurgency"
    $global:process = "cure"
    $global:servercfgdir = "cure\cfg"
    $global:logdir = "cure"
    
    Get-StopServerInstall
    # Game-server-configs \/
    $global:gamedirname = "CodenameCURE"
    $global:servercfg = "server.cfg"
    Get-Servercfg
    # - - - - - - - - - - - - -

    # Get-UserInput 1 1 0 0 1 1 1 1
    
    Select-RenameSource
    Select-EditSourceCFG

    $global:launchParams = '@("$executable -console -game cure -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    #Get-SourceMetMod

}