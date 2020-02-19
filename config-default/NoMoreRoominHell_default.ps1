Function New-LaunchScriptNMRIHserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # No More Room in Hell Dedicated Server
    # APP ID # 317670
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:ip}            = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Game Server Token (required)
    $global:gslt            = "GameServerTokenHere"
    #                       Map
    $global:defaultmap             = "nmo_broadway"
    #                       Maxplayers
    $global:maxplayers      = "8"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"
    

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->executable NOT in root server folder \/\/
    $global:executabledir = ""
    #--->rename srcds to this name \/\/
    $global:executable = "NMRIH"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "nmrih"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "NMRIH"
    #--->game config folder
    $global:servercfgdir = "nmrih\cfg"
    $global:logdir = "nmrih"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "NoMoreRoominHell"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars

    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1 0
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executable -console -game nmrih -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    executable NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}