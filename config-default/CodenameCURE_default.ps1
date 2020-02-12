Function New-LaunchScriptCCserverPS {
    #----------   Codename CURE Dedicated Server Server Install Function   -------------------
    # APP ID # 383410
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:SOURCETVPORT    = "27020"
    #                       Map
    $global:MAP             = "cbe_bunker"
    #                       Maxplayers
    $global:MAXPLAYERS      = "6"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    # # Version 2.0
    $global:MODDIR = ""
    $global:EXE = "cure"
    $global:EXEDIR = ""
    $global:GAME = "insurgency"
    $global:PROCESS = "cure"
    $global:SERVERCFGDIR = "cure\cfg"
    $global:LOGDIR = "cure"
    
    Get-StopServerInstall
    # Game-server-configs \/
    $global:gamedirname = "CodenameCURE"
    $global:config1 = "server.cfg"
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"
    # - - - - - - - - - - - - -

    # Get-UserInput 1 1 0 0 1 1 1 1
    
    Select-RenameSource
    Select-EditSourceCFG

    $global:launchParams = '@("$global:EXE -console -game cure -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${map} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    #Get-SourceMetMod

}