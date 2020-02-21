Function New-LaunchScriptHL2DMserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Half-Life 2: Deathmatch Dedicated Server
    #      232370
    # https://kb.firedaemon.com/support/solutions/articles/4000086964-half-life-2-deathmatch
    ################## Change Default Variables #################
    #--->Default Vars
    #                       Server IP
    $global:ip              = "${global:IP}"
    #                       Server Port
    $global:port            = "27015"
    #                       Client Port
    $global:clientport      = "27005"
    #                       Source TV Port
    $global:sourcetvport    = "27020"
    #                       Map
    $global:defaultmap      = "dm_lockdown"
    #                       Maxplayers
    $global:maxplayers      = "16"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$global:RANDOMPASSWORD"

    ###########################/\#################################

    
    
    
    ###################### Do not change below #####################
    # Requiered Dont change
    # Version 2.0
    # Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = "hl2mp"
    # executable Directory \/\/
    $global:executabledir = "$serverdir"
    # rename srcds to this name \/\/
    $global:executable = "HL2DM"
    # Requieres \/ \/ game dig
    $global:querytype = "hl2dm"
    # Requieres \/ \/ AppData Roaming save folder
    $global:saves = ""
    # Requieres \/ \/ maybe same as game
    $global:process = "hl2dm"
    #---game config folder \/\/
    $global:servercfgdir = "$serverdir\hl2mp\cfg"
    $global:logdirectory = "$serverdir\hl2mp"
    #---Stop existing process if running          
    Get-StopServerInstall
    # Game-server-manger folder \/
    $global:gamedirname = "HalfLife2Deathmatch"
    # Game-server-manger config name \/
    $global:servercfg = "server.cfg"
    # Get game-server-config  \/\/
    Get-Servercfg

    # input questions \/\/
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    # rename srcds.executable \/\/
    Select-RenameSource
    #---- Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # VERSION 2 launch params executable in root \/\/
    $global:launchParams = '@("$executable -console -game hl2mp -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} +map ${defaultmap} +servercfgfile server.cfg -maxplayers ${maxplayers} -condebug")'
    # $global:launchParams = '@("$executable -console -game "hl2dm" -secure +map dm_lockdown -autoupdate +log on +maxplayers 32 -port 27015 +ip 1.2.3.4 +exec server.cfg")'

}