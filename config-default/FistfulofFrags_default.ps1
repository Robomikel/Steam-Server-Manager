Function New-LaunchScriptFOFserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Fistful of Frags Dedicated Server
    # APP ID # 295230
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
    #                       Map
    $global:map             = "fof_depot"
    #                       Maxplayers
    $global:maxplayers      = "20"
    ###########################/\#################################

    
    
    
    
    ###################### Do not change below #####################
    # Requiered Dont change 
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "FOF"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "FOF"
    #--->game config folder
    $global:SERVERCFGDIR = "fof\cfg"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "FistfulofFrags"
    #--->Game-server-manger config name \/
    $global:config1 = "server.cfg"
    $global:RCONPORT = "${global:PORT}"
    #--->Get game-server-config \/\/
    Get-Servercfg

    #--->input questions 
    # Get-UserInput 1 1 0 0 1 1 0 1 0 1 1 1
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE -game fof -strictportbind -ip ${$global:ip} -port ${$global:port} +clientport ${$global:clientport} +tv_port ${$global:sourcetvport} +map ${$global:map} +servercfgfile server.cfg -maxplayers ${$global:maxplayers})'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}