Function New-LaunchScriptSvenCoopserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # SvenCoop Dedicated Server
    # APP ID # 276060
    # WIKI
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "28015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Map
    $global:MAP             = "svencoop1"
    #                       Maxplayers
    $global:MAXPLAYERS      = "32"
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
    $global:EXE = "SvenDS "
    #$global:EXE = "ProjectZomboid64"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "SvenDS "
    #--->game config folder
    $global:SERVERCFGDIR = "svencoop"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "SvenCoop"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    #--->Get game-server-config \/\/
    $global:RCONPORT = "${global:PORT}"
    Get-Servercfg
    
    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 0 1 1 1 0
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE -console -game svencoop -strictportbind +ip ${$global:ip} -port ${$global:port} +clientport ${$global:clientport} +map ${$global:map} +servercfgfile server.cfg +maxplayers ${$global:maxplayers}")'
    # $global:launchParams = '@("$global:EXE -ip ${global:ip} -adminpassword `"${global:adminpassword}`" -servername `"${global:HOSTNAME}`"")'

}