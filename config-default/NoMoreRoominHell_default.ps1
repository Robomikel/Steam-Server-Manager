Function New-LaunchScriptNMRIHserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # No More Room in Hell Dedicated Server
    # APP ID # 317670
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Game Server Token (required)
    $global:GSLT            = "GameServerTokenHere"
    #                       Map
    $global:MAP             = "nmo_broadway"
    #                       Maxplayers
    $global:MAXPLAYERS      = "8"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "NMRIH"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "nmrih"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "NMRIH"
    #--->game config folder
    $global:SERVERCFGDIR = "nmrih\cfg"
    $global:LOGDIR = "nmrih"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "NoMoreRoominHell"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars

    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1 0
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE -console -game nmrih -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +map ${global:map} +sv_setsteamaccount ${global:gslt} +servercfgfile server.cfg -maxplayers ${global:maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}