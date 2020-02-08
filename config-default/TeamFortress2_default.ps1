Function New-LaunchScriptTF2serverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Team Fortress 2 Dedicated Server
    # APP ID # 232250
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:SOURCETVPORT    = "27020"
    #                       Game Server Token
    $global:GSLT            = ""
    #                       Map
    $global:MAP             = "cp_badlands"
    #                       Maxplayers
    $global:MAXPLAYERS      = "16"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "tf2"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "tf2"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "tf2"
    #--->game config folder
    $global:SERVERCFGDIR = "tf\cfg"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "TeamFortress2"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars
    $global:RCONPORT = "${global:PORT}"

    #--->input questions 
    # Get-UserInput 1 1 0 0 0 1 1 1 1 1 1 1
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE -console -game tf -strictportbind -ip ${global:ip} -port ${global:port} +clientport ${global:clientport} +tv_port ${global:sourcetvport} +map ${global:map} +sv_setsteamaccount ${global:gslt} +servercfgfile server.cfg -maxplayers ${global:maxplayers}")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}