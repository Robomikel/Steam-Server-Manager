Function New-LaunchScriptTF2serverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Team Fortress 2 Dedicated Server
    # APP ID # 232250
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Game Server Token
    $global:gslt            = "GameServerTokenHere"
    #                       Map
    $global:defaultmap      = "cp_badlands"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->executable Directory \/\/
    $global:executabledir = "$serverdir"
    #--->rename srcds to this name \/\/
    $global:executable = "tf2"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "tf2"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "tf2"
    #--->game config folder
    $global:servercfgdir = "$serverdir\tf\cfg"
    $global:logdirectory = "$serverdir\tf"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "TeamFortress2"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars

    #--->input questions 
    # Get-UserInput 1 1 0 0 0 1 1 1 1 1 1 1
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executable -console -game tf -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +sv_setsteamaccount ${gslt} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # OR    executable NOT In server folder ROOT add executabledir \/ \/
    #$global:launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}