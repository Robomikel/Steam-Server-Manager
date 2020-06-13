Function New-LaunchScriptOnesetPS {
    # Onset Dedicated Server
    # APP ID # 1204170
    ################## Change Default Variables #################

    ##############################/\##############################
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "OnsetServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "OnsetServer"
    #                       Log Directory
    $global:logdirectory    = ""
    #                       Server Log
    $global:consolelog      = ""
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server_config.json"
    #                       Server Launch Command
    $global:launchParams    = '@("${executable}")'
      # Get User Input version must be set to 0
    Get-UserInput
    # Download Game-Server-Config
    # Get-Servercfg
    # Edit Server Game-Server-Config
    # Select-EditSourceCFG
} 