Function  New-LaunchScriptSE4serverPS {
    # Sniper Elite 4 Dedicated Server
    # APP ID # 568880
    # http://snipereliteadmin.com/#!/SE4DedicatedServerSetup  
    ################## Change Default Variables #################


    ##############################/\##############################
    
    # Server.AuthPort 8701
    # Server.GamePort 24001
    # Server.UpdatePort 23001
     #Server.LobbyPort 25001
    
    
    ###################### Do not change below #####################
    #                           System Directory
    $global:systemdir           = "$serverdir"
    #                           Server Config Directory
    $global:servercfgdir        = "$serverdir"
    #                           Server Executable
    $global:executable          = "SniperElite4_Dedicated"
    #                           Server Executable Directory
    $global:executabledir       = "$serverdir\bin"
    #                           Gamedig Query
    $global:querytype           = "protocol-valve"
    #                           Game Process
    $global:process             = "SniperElite4_Dedicated"
    #                           Log Directory
    $global:logdirectory        = "$serverdir"
    #                           Game-Server-Config Directory
    $global:gamedirname         = ""
    #                           Game-Server-Config
    $global:servercfg           = "server.cfg"
    #                           Server Launch Command
    $global:launchParams        = '@("$executable exec $servercfgdir\Server.cfg")'
}