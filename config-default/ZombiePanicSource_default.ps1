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
    $global:defaultmap      = "zps_deadend"
    #                       Max Players 
    $global:maxplayers      = "20"
      #                     Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    #                       Game Server Token required for public servers
    $global:gslt            = "GameServerTokenHere"
    ##############################/\##############################
    
    
    
    
    
    ##################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->executable Directory \/\/
    $global:executabledir = "$serverdir"
    #--->rename srcds to this name \/\/
    $global:executable = "zps"
    #--->Requieres \/ \/ game dig
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "zps"
    #--->game config folder
    $global:servercfgdir = "$serverdir\zps\cfg"
    $global:logdirectory = "$serverdir\zps"
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "ZombiePanicSource"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"

    
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch
    $global:launchParams = '@("$executable -console -game zps -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'

}