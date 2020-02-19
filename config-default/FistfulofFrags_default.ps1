Function New-LaunchScriptFOFserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Fistful of Frags Dedicated Server
    # APP ID # 295230
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP
    $global:ip              = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap             = "fof_depot"
    #                       Maxplayers
    $global:maxplayers      = "20"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ###########################/\#################################

    
    
    
    
    ###################### Do not change below #####################
    # Requiered Dont change 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->executable NOT in root server folder \/\/
    $global:executabledir = ""
    #--->rename srcds to this name \/\/
    $global:executable = "FOF"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "FOF"
    #--->game config folder
    $global:servercfgdir = "fof\cfg"
    $global:logdir = "fof"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "FistfulofFrags"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 0 1 1 1
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executable -game fof -console -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    executable NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}