Function New-LaunchScriptjc3serverPS {
    # Just Cause™ 3: Multiplayer - Dedicated Server
    # APP ID # 619960
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "SERVERNAME"


    ##############################/\##############################
    
    #  4200 TCP/UDP
  
    ###################### Do not change below #####################
    #                     System Directory
    $global:systemdir     = "$serverdir"
    #                     Server Config Directory
    $global:servercfgdir  = "$serverdir"
    #                     Server Executable
    $global:executable    = "Server"
    #                     Server Executable Directory
    $global:executabledir = "$serverdir"
    #                     Gamedig Query
    $global:querytype     = "jc3mp"
    #                     Default Port for gamedig - change if needed
    $global:port          = "4201"
    #                     Game Process
    $global:process       = "Server"
    #                     Log Directory
    $global:logdirectory  = "$serverdir\logs"
    #                     Server Log
    $global:consolelog    = "Server.log"
    #                     Game-Server-Config Directory
    $global:gamedirname   = "JustCause3"
    #                     Game-Server-Config
    $global:servercfg     = "config.json"
    #                     Server Launch Command
    $global:launchParams  = '@("$executable")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
  }   