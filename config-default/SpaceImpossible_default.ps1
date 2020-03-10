Function New-LaunchScriptSpacecImpossibleserverPS {
    # Space Impossible Dedicated Server
    # 1222650
    ################## Change Default Variables #################

  
    ##############################/\##############################
    
    
    # Ports 4545 and 4546 TCP/UDP 
    # 27015 Query
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "SIDedicatedServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "SIDedicatedServer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\SIDedicatedServer_Data"
    #                       Server Log
    $global:consolelog      = ""
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "serverconfig.txt"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -config serverconfig.txt -console -batchmode -nographics -LOG")'
  }   