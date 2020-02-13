Function New-LaunchScriptZPSserverPS {
    #
    # Zombie Panic! Source Dedicated Server
    # APP ID # 17505
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
    $global:map             = "zps_deadend"
    #                       Max Players 
    $global:maxplayers      = "20"
      #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    #                       Game Server Token required for public servers
    $global:GSLT            = "GameServerTokenHere"
    ##############################/\##############################
    
    
    
    
    
    ##################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "zps"
    #--->Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "zps"
    #--->game config folder
    $global:SERVERCFGDIR = "zps\cfg"
    $global:LOGDIR = "zps"
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "ZombiePanicSource"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"

    
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch
    $global:launchParams = '@("$global:EXE -console -game zps -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${map} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}