Function New-LaunchScriptDODSserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Day of Defeat Source Dedicated Server
    # APP ID # 232290
    # https://kb.firedaemon.com/support/solutions/articles/4000086944-day-of-defeat-source
    ################## Change Default Variables #################
    #                       Server IP 
    $global:ip              = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Map
    $global:defaultmap             = "dod_Anzio"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->Exe NOT in root server folder \/\/
    $global:executabledir = ""
    #--->rename srcds to this name \/\/
    $global:executable = "dods"
    #--->Requieres \/ \/ game dig
    $global:querytype = "dods"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:process = "dods"
    #--->game config folder
    $global:servercfgdir = "dod\cfg"
    $global:logdir = "dod"  

    
    #--->Stop existing process if running 
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "DayOfDefeat"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 0 0 1 0 1 0 0 0
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    #$global:launchParams = '@("$executable -console -game `"dods`" -secure +map ${defaultmap} -autoupdate +log on +maxplayers ${maxplayers} -port ${port}  +ip ${ip} +exec server.cfg")'
    $global:launchParams = '@("$executable -console -game dod -strictportbind +ip ${ip} -port ${port} +clientport ${clientport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}