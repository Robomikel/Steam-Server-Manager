Function New-LaunchScriptSvenCoopserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # SvenCoop Dedicated Server
    # APP ID # 276060
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:ip}            = "${global:IP}"
    #                       Server Port
    $global:port            = "28015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Map
    $global:defaultmap      = "svencoop1"
    #                       Maxplayers
    $global:maxplayers      = "32"
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
    $global:executable = "SvenDS"
    #$global:executable = "ProjectZomboid64"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "SvenDS"
    #--->game config folder
    $global:servercfgdir = "$serverdir\svencoop"
    #--->game log folder
    $global:logdirectory = "$serverdir"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "SvenCoop"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg
    
    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 0 1 1 1 0
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$executable -console -game svencoop -strictportbind +ip ${ip} -port ${port} +clientport ${clientport} +map ${defaultmap} +servercfgfile server.cfg +maxplayers ${maxplayers} -condebug")'
    # $global:launchParams = '@("$executable -ip ${ip} -adminpassword `"${adminpassword}`" -servername `"${hostname}`"")'

}
