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
    $global:map             = "dod_Anzio"
    #                       Maxplayers
    $global:maxplayers      = "16"
    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "dods"
    #--->Requieres \/ \/ game dig
    $global:GAME = "dods"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "dods"
    #--->game config folder
    $global:SERVERCFGDIR = "dod\cfg"
    $global:LOGDIR = "dod"  
    $global:ANON = "yes"
    $global:username = ""

    $global:RCONPORT        = "${global:PORT}"
    #--->Stop existing process if running 
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "DayOfDefeat"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 0 0 1 0 1 0 0 0
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    #$global:launchParams = '@("$global:EXE -console -game `"dods`" -secure +map ${global:map} -autoupdate +log on +maxplayers ${global:maxplayers} -port ${global:port}  +ip ${global:ip} +exec server.cfg")'
    $global:launchParams = '@("$global:EXE -console -game dod -strictportbind +ip ${ip} -port ${port} +clientport ${clientport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}