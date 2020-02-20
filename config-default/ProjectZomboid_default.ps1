Function New-LaunchScriptpzserverPS {
    #        * * Add to Read-AppID in fn_Actions.ps1 * *
    # Project Zomboid Dedicated Server
    # APP ID # 380870
    # WIKI
        ################## Change Default Variables #################
    #                         Server IP 
    ${global:IP}              = "${global:IP}"
    #                         Server Name
    $global:hostname          = "$env:USERNAME"
    #                         Rcon Password
    ${global:adminpassword}   = "$global:RANDOMPASSWORD"
    

    ##############################/\##############################
    
    
    # Port/s 16261+1 per player
    
    ###################### Do not change below #####################  
    # # Version 2.0
    #--->Requieres \/ \/ Get-SourceMetMod
    $global:systemdir = ""
    #--->executable NOT in root server folder \/\/
    $global:executabledir = ""
    #--->rename srcds to this name \/\/
    #$global:executable = "startServer64.bat"
    $global:executable = "ProjectZomboid64"
    #--->Requieres \/ \/ game dig 
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ AppData Roaming save
    $global:saves = ""
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "ProjectZomboid64"
    #--->game config folder
    $global:servercfgdir = "Zomboid\Server"
    #--->game log folder
    $global:logdir = ""
    #--->Stop existing process if running        
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "ProjectZomboid"
    #--->Game-server-manger config name \/
    $global:servercfg = "server.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->Default Vars

    #--->input questions 
    # Get-UserInput 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0
    #--->rename srcds.executable \/\/
    Select-RenameSource
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    # Select-EditSourceCFG
    # --->Launch 
    #$global:launchParams = '@("$executable")'
    $global:launchParams = '@("$executable -ip ${ip} -adminpassword `"${adminpassword}`" -servername `"${hostname}`"")'

}