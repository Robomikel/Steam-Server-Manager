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
    $global:defaultmap             = "gm_construct"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
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
    $gslt                   = "GameServerTokenHere"
    ###########################/\#################################

    
    
    
    ###################### Do not change below #####################



    # Requiered Dont change 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = "garrysmod"
    #--->executable NOT in root server folder \/\/
    $global:executabledir = ""
    #--->rename srcds to this name \/\/
    $global:executable = "gmod"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "garrysmod"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "gmod"
    #--->game config folder
    $global:SERVERCFGDIR = "garrysmod\cfg"
    $global:LOGDIR = "garrysmod"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "GarrysMod"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1 1 
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executable -console -game garrysmod -strictportbind -ip ${ip} -port ${port} -tickrate ${tickrate} +host_workshop_collection ${wscollectionid} -authkey ${wsapikey} +clientport ${clientport} +tv_port ${sourcetvport} +gamemode ${gamemode} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile server.cfg -maxplayers ${maxplayers} ${customparms} -condebug")'
    # OR    executable NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}