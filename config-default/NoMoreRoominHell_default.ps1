Function New-LaunchScriptNMRIHserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # No More Room in Hell Dedicated Server
    # APP ID # 317670
    # WIKI
    # Requiered Dont change 
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
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "NoMoreRoominHell"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars
    $global:RCONPORT = "${global:PORT}"
    $global:defaultip = "${global:IP}"
    $global:defaultport = "27015"
    $global:defaultclientport = "27005"
    $global:defaultsourcetvport = "27020"
    $global:defaultmap = "nmo_broadway"
    $global:defaultmaxplayers = "8"
    #--->input questions 
    Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1 0
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE -game nmrih -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +map ${global:map} +sv_setsteamaccount ${global:gslt} +servercfgfile server.cfg -maxplayers ${global:maxplayers}")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}