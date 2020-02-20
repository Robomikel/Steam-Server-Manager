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
    $global:defaultmap      = "dys_broadcast"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    # Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    # executable NOT in root server folder \/\/
    $global:executabledir = "bin\win32"
    # rename srcds to this name \/\/
    $global:executable = "Dystopia"
    # Requieres \/ \/ game dig
    $global:querytype = "protocol-valve"
    # Requieres \/ \/ AppData Roaming save folder
    $global:saves = ""
    # Requieres \/ \/ maybe same as game
    $global:process = "Dystopia"
    #---game config folder \/\/
    $global:servercfgdir = "dystopia\cfg"
    $global:logdir = "dystopia"
    #---Stop existing process if running
    Get-StopServerInstall
    # Game-server-manger folder \/
    $global:gamedirname = "Dystopia"
    # Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    # Get game-server-config  \/\/
    Get-Servercfg
    # input questions \/\/
    #Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    # rename srcds.executable \/\/
    Select-RenameSource
    #---- Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # VERSION 2 launch params executable in root \/\/
    #-game "${serverfiles}/dystopia" -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile ${servercfg} -maxplayers ${maxplayers}
    # OR executable NOT In ROOT server folder add executabledir
    $global:launchParams = '@("$executabledir\$executable -console -game `"$currentdir\${serverfiles}\dystopia`" -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'      
}