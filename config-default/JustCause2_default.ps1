Function New-LaunchScriptjc2serverPS {
    # Just Cause 2: Multiplayer - Dedicated Server
    # APP ID # 261140
    ################## Change Default Variables #################

    #                       Server Name
    $global:hostname        = "SERVERNAME"


    ##############################/\##############################
    
    # 7777 TCP/UDP

    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "JcmpServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "jc2mp"
    #                       Default Port for gamedig - change if needed
    $global:port            = "7777"
    #                       Game Process
    $global:process         = "JcmpServer"
    #                       Log Directory 
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog      = "server.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "JustCause2"
    #                       Game-Server-Config
    $global:servercfg       = "config.lua"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable}")'
    # Get User Input version must be set to 0
    Get-UserInput
    
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
  }   