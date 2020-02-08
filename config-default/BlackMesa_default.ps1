Function New-LaunchScriptBlackMesaserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Black Mesa: Deathmatch
    # APP ID # 346680
    # WIKI
    # - - - - - - - - - Change Default Variables ------------

    $global:RCONPORT = "${global:PORT}"
    $global:ip = "${global:IP}"
    $global:port = "27015"
    $global:clientport = "27005"
    $global:sourcetvport = "27020"
    $global:map = "dm_bounce"
    $global:maxplayers = "16"
    # - - - - - - - Do not change below - - - - - - - - -
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "bmdm"
    #--->Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "bmdm"
    #--->game config folder
    $global:SERVERCFGDIR = "bms\cfg"
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "BlackMesa"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    #--->Get game-server-config \/\/
    $global:ANON = "yes"
    $global:username = ""
    Get-Servercfg
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch
    $global:launchParams = '@("$global:EXE -console -game bms -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +sv_setsteamaccount ${global:gslt} +map ${global:defaultmap} +servercfgfile $server.cfg -maxplayers ${global:maxplayers}")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}