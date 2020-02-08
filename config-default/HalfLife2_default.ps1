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
    $global:map             = "dm_lockdown"
    #                       Maxplayers
    $global:maxplayers      = "16"

    ###########################/\#################################

    
    
    
    ###################### Do not change below #####################
    # Requiered Dont change
    # Version 2.0
    # Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = "hl2mp"
    # Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    # rename srcds to this name \/\/
    $global:EXE = "HL2DM"
    # Requieres \/ \/ game dig
    $global:GAME = "hl2dm"
    # Requieres \/ \/ AppData Roaming save folder
    $global:SAVES = ""
    # Requieres \/ \/ maybe same as game
    $global:PROCESS = "hl2dm"
    #---game config folder \/\/
    $global:SERVERCFGDIR = "hl2mp\cfg"
    #---Stop existing process if running          
    Get-StopServerInstall
    # Game-server-manger folder \/
    $global:gamedirname = "HalfLife2Deathmatch"
    # Game-server-manger config name \/
    $global:config1 = "server.cfg"
    # Get game-server-config  \/\/
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"

    # input questions \/\/
    # Get-UserInput 1 1 0 0 1 1 0 1 1 1 1 1
    # rename srcds.exe \/\/
    Select-RenameSource
    #---- Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # VERSION 2 launch params exe in root \/\/
    $global:launchParams = '@("$global:EXE -console -game hl2mp -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +map ${global:map} +servercfgfile server.cfg -maxplayers ${global:maxplayers}")'
    # $global:launchParams = '@("$global:EXE -console -game "hl2dm" -secure +map dm_lockdown -autoupdate +log on +maxplayers 32 -port 27015 +ip 1.2.3.4 +exec server.cfg")'
    # OR EXE NOT In ROOT server folder add EXEDIR
    # $global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}