Function New-LaunchScriptBlackMesaserverPS {
    #
    # Black Mesa: Deathmatch
    # APP ID # 346680
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
    #                       Server Map 
    $global:defaultmap             = "dm_bounce"
    #                       Max Players 
    $global:maxplayers      = "16"
      #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    
    ##################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->Exe NOT in root server folder \/\/
    $global:executabledir = ""
    #--->rename srcds to this name \/\/
    $global:executable = "bmdm"
    #--->Requieres \/ \/ game dig
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:process = "bmdm"
    #--->game config folder
    $global:servercfgdir = "bms\cfg"
    $global:logdir = "bms"
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "BlackMesa"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"

    
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch
    $global:launchParams = '@("$executable -console -game bms -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$global:executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}