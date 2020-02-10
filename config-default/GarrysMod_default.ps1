Function New-LaunchScriptGMODserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Garry's Mod Dedicated Server
    # APP ID # 4020
    # WIKI
    ################## Change Default Variables #################
    #--->Default Vars
    #                       Server IP
    $global:ip              = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:map             = "gm_construct"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    #                       Gamemode
    $global:gamemode        = "sandbox"
    #                       Tickrate     
    $global:tickrate        = "66"
    # API key visit - https://steamcommunity.com/dev/apikey
    $wsapikey               = ""
    $wscollectionid         = ""
    # Custom Start Parameters
    $customparms            = "-disableluarefresh"
    #                       Game Server Token
    $gslt                   = ""
    ###########################/\#################################

    
    
    
    ###################### Do not change below #####################



    # Requiered Dont change 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = "garrysmod"
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "gmod"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "garrysmod"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "gmod"
    #--->game config folder
    $global:SERVERCFGDIR = "garrysmod\cfg"
    $global:LOGDIR = "garrysmod"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "GarrysMod"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1 1 
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE -console -game garrysmod -strictportbind -ip ${global:ip} -port ${global:port} -tickrate ${global:tickrate} +host_workshop_collection ${wscollectionid} -authkey ${wsapikey} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +gamemode ${global:gamemode} +map ${global:map} +sv_setsteamaccount ${global:gslt} +servercfgfile server.cfg -maxplayers ${global:maxplayers} ${customparms} -condebug")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}