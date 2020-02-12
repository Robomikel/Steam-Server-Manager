Function New-LaunchScriptBTserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Barotrauma Dedicated Server
    # APP ID # 1026340
    # 
    ################## Change Default Variables #################
   

    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:MODDIR = ""
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = ""
    #--->rename srcds to this name \/\/
    $global:EXE = "DedicatedServer"
    #--->Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:SAVES = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "DedicatedServer"
    #--->game config folder
    $global:SERVERCFGDIR = ""
    $global:LOGDIR = "ServerLogs"  

    

    # $global:RCONPORT        = "${global:PORT}"
    #--->Stop existing process if running 
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "Barotrauma"
    #--->Game-server-manger config name \/
    $global:config1 = "serversettings.xml"
    #--->Get game-server-config \/\/
    # Get-Servercfg

    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 0 0 1 0 1 0 0 0
    #--->rename srcds.exe \/\/
    # Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    #  Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:EXE ")'
    # OR    EXE NOT In server folder ROOT add EXEDIR \/ \/
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -< LAUNCH PARAMS HERE >-")'
}