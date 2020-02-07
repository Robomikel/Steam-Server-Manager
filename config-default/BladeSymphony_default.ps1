Function New-LaunchScriptbsserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Blade Symphony Dedicated Server
    # APP ID # 228780
    # WIKI
    # Requiered Dont change 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = "bin"
    #--->rename srcds to this name \/\/
    $global:EXE = "BladeSymphony"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "BladeSymphony"
    #--->game config folder
    $global:SERVERCFGDIR = "berimbau\cfg"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "BladeSymphony"
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
    $global:defaultmap = "duel_winter"
    $global:defaultmaxplayers = "16"
    $global:defaultgslt = ""
    #--->input questions 
    Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -game "$global:currentdir\${global:server}\berimbau" -autoupdate -strictportbind -ip ${$global:ip} -port ${$global:port} +clientport ${$global:clientport} +tv_port ${$global:sourcetvport} +sv_setsteamaccount ${$global:gslt} +map ${$global:map} +servercfgfile server.cfg -maxplayers ${$global:maxplayers}")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}