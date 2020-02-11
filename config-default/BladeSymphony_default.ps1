Function New-LaunchScriptbsserverPS {
    # Blade Symphony Dedicated Server
    # APP ID # 228780
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP
    $global:ip              = "${global:IP}"
    #                       Server Port 
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Server Map
    $global:map             = "duel_winter"
    #                      Max Players
    $global:maxplayers      = "16"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    # GSLT used for running a public server.
    #                       Game Server Token
    $global:gslt            = ""
    ##############################/\##############################
    
    
    
    
    ##################### Do not change below #####################
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
    $global:LOGDIR = "berimbau"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "BladeSymphony"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"

    
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -game "$global:currentdir\${global:server}\berimbau" -autoupdate -strictportbind -ip ${$global:ip} -port ${$global:port} +clientport ${$global:clientport} +tv_port ${$global:sourcetvport} +sv_setsteamaccount ${$global:gslt} +map ${$global:map} +servercfgfile server.cfg -maxplayers ${$global:maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}