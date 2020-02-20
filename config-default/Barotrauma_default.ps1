Function New-LaunchScriptBTserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Barotrauma Dedicated Server
    # APP ID # 1026340
    # 
    ################## Change Default Variables #################
   

    ##############################/\##############################
    # 27015/UDP
    # 27016/UDP
    
    
    ###################### Do not change below #####################
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->Exe NOT in root server folder \/\/
    $global:executabledir= ""
    #--->rename srcds to this name \/\/
    $global:executable = "DedicatedServer"
    #--->Requieres \/ \/ game dig
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game exe?
    $global:process = "DedicatedServer"
    #--->game config folder
    $global:servercfgdir = ""
    $global:logdir = "ServerLogs"  

    #--->Stop existing process if running 
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "Barotrauma"
    #--->Game-server-manger config name \/
    $global:servercfg = "serversettings.xml"
    #--->Get game-server-config \/\/
    # Get-Servercfg

    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 0 0 1 0 1 0 0 0
    #--->rename srcds.exe \/\/
    # Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    #  Select-EditSourceCFG
    # --->Launch 
    $global:launchParams = '@("$global:executable ")'
    # OR    EXE NOT In server folder ROOT add executabledir\/ \/
    #$global:launchParams = '@("$executabledir\$executable -< LAUNCH PARAMS HERE >-")'
}