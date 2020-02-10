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
    $global:map             = "dm_bounce"
    #                       Max Players 
    $global:maxplayers      = "16"
      #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    
    ##################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "bmdm"
    #--->Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "bmdm"
    #--->game config folder
    $global:SERVERCFGDIR = "bms\cfg"
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "BlackMesa"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"
    $global:ANON = "yes"
    $global:username = ""
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch
    $global:launchParams = '@("$global:EXE -console -game bms -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +sv_setsteamaccount ${global:gslt} +map ${global:defaultmap} +servercfgfile $server.cfg -maxplayers ${global:maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}