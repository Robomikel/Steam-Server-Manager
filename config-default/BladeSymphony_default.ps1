Function New-LaunchScriptbsserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Blade Symphony Dedicated Server
    # APP ID # 228780
    # WIKI
        # - - - - - - - - - Change Default Variables ------------

    $global:RCONPORT = "${global:PORT}"
    $global:ip = "${global:IP}"
    $global:port = "27015"
    $global:clientport = "27005"
    $global:sourcetvport = "27020"
    $global:map = "duel_winter"
    $global:maxplayers = "16"
    $global:gslt = ""
    
    
    # - - - - - - - Do not change below - - - - - - - - -
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
    $global:ANON = "yes"
    $global:username = ""
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -game "$global:currentdir\${global:server}\berimbau" -autoupdate -strictportbind -ip ${$global:ip} -port ${$global:port} +clientport ${$global:clientport} +tv_port ${$global:sourcetvport} +sv_setsteamaccount ${$global:gslt} +map ${$global:map} +servercfgfile server.cfg -maxplayers ${$global:maxplayers}")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}