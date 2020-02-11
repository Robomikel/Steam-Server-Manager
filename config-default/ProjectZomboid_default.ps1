Function New-LaunchScriptpzserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Project Zomboid Dedicated Server
    # APP ID # 380870
    # WIKI
        ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    ${global:adminpassword}   = "$global:RANDOMPASSWORD"
    

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################  
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    #$global:EXE = "startServer64.bat"
    $global:EXE = "ProjectZomboid64"
    #--->Requieres \/ \/ game dig 
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "ProjectZomboid64"
    #--->game config folder
    $global:SERVERCFGDIR = "Zomboid\Server"
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "ProjectZomboid"
    #--->Game-server-manger config name \/
    $global:config1 = "server.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars
    $global:defaultRCONPORT = "${global:PORT}"

    #--->input questions 
    # Get-UserInput 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0
    #--->rename srcds.exe \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    # Select-EditSourceCFG
    # --->Launch 
    #$global:launchParams = '@("$global:EXE")'
    $global:launchParams = '@("$global:EXE -ip ${global:ip} -adminpassword `"${global:adminpassword}`" -servername `"${global:HOSTNAME}`"")'

}