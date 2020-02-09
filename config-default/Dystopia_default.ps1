Function New-LaunchScriptDystopiaserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Dystopia Dedicated Server
    #      17585
    # https://steamdb.info/app/17585/
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
    $global:map             = "dys_broadcast"
    #                       Maxplayers
    $global:maxplayers      = "16"
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    # Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    # Exe NOT in root server folder \/\/
    $global:EXEDIR = "bin\win32"
    # rename srcds to this name \/\/
    $global:EXE = "Dystopia"
    # Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    # Requieres \/ \/ AppData Roaming save folder
    $global:SAVES = ""
    # Requieres \/ \/ maybe same as game
    $global:PROCESS = "Dystopia"
    #---game config folder \/\/
    $global:SERVERCFGDIR = "dystopia\cfg"
    #---Stop existing process if running
    Get-StopServerInstall
    # Game-server-manger folder \/
    $global:gamedirname = "Dystopia"
    # Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"
    # Get game-server-config  \/\/
    Get-Servercfg
    # input questions \/\/
    Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    # rename srcds.exe \/\/
    Select-RenameSource
    #---- Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # VERSION 2 launch params exe in root \/\/
    #-game "${serverfiles}/dystopia" -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile ${servercfg} -maxplayers ${maxplayers}
    # OR EXE NOT In ROOT server folder add EXEDIR
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -console -game `"$global:currentdir\${global:server}\dystopia`" -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +map ${global:map} +sv_setsteamaccount ${global:gslt} +servercfgfile server.cfg -maxplayers ${global:maxplayers} -condebug")'      
}