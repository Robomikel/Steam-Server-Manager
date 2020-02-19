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
    $global:defaultmap             = "duel_winter"
    #                      Max Players
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    # GSLT used for running a public server.
    #                       Game Server Token (required)
    $global:gslt            = "GameServerTokenHere"
    ##############################/\##############################
    
    
    
    
    ##################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->Exe NOT in root server folder \/\/
    $global:executabledir = "bin\win64"
    #--->rename srcds to this name \/\/
    $global:executable = "BladeSymphony"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:process = "BladeSymphony"
    #--->game config folder
    $global:servercfgdir = "berimbau\cfg"
    $global:logdir = "berimbau"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "BladeSymphony"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"

    
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executabledir\$executable -console -game `"$currentdir\${server}\berimbau`" -autoupdate -strictportbind -ip ${$ip} -port ${$port} +clientport ${$clientport} +tv_port ${$sourcetvport} +sv_setsteamaccount ${$gslt} +map ${$defaultmap} +servercfgfile server.cfg -maxplayers ${$maxplayers} -condebug")'
    # OR    EXE NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$global:executabledir\$global:executable -< LAUNCH PARAMS HERE >-")'
}