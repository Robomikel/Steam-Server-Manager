Function New-LaunchScriptbsserverPS {
    # Blade Symphony Dedicated Server
    # APP ID # 228780
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP
    $global:ip              = "${ip}"
    #                       Server Port 
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Server Map
    $global:defaultmap      = "duel_winter"
    #                      Max Players
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    # GSLT used for running a public server.
    #                       Game Server Token (required)
    $global:gslt            = "GameServerTokenHere"
    ##############################/\##############################
    
    ##################### Do not change below #####################
    #                       System Directory 
    $global:systemdir       = ""
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\berimbau\cfg"
    #                       Server Executable
    $global:executable      = "BladeSymphony"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\bin\win64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "BladeSymphony"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\berimbau"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "BladeSymphony"
    #                       Game-Server-Config
    $global:servercfg       = "server.cfg"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console -game `"$currentdir\${serverfiles}\berimbau`" -autoupdate -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +sv_setsteamaccount ${gslt} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    # Rename Source $executable.exe
    Select-RenameSource
}