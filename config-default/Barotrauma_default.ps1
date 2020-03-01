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
    #                           Server Directory 
    $global:systemdir           = "$serverdir"
    #                           Server Config Directory
    $global:servercfgdir        = "$serverdir"
    #                           Server Executable
    $global:executable          = "DedicatedServer"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "DedicatedServer"
    #                           Log Directory
    $global:logdirectory        = "$serverdir\ServerLogs"  
    #                           Game-Server-Config Directory
    $global:gamedirname         = "Barotrauma"
    #                           Game-Server-Config
    $global:servercfg           = "serversettings.xml"
    #                           Server Launch Command 
    $global:launchParams        = '@("$executable")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    #Get-Servercfg
    # Edit Server Game-Server-Config
    #Select-EditSourceCFG
    # Rename Source $executable.exe
    #Select-RenameSource
}