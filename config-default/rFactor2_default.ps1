Function New-LaunchScriptrFactor2serverPS {
    # rFactor 2 Dedicated Server
    # APP ID # 400300
    # https://docs.studio-397.com/users-guide/setting-up-a-dedicated-server
    ################## Change Default Variables #################

    ##############################/\##############################
    
    # Multiplayer.JSON 
    # "HTTP Server Port":64297
    # "Simulation Port":54297
    # UDP+TCP 54297
    # TCP 64297
    # UDP 64298
    # UDP 64299
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = ""
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\rFactor2-Dedicated\Saved\Config\WindowsServer"
    #                       Server Executable
    $global:executable      = "rFactor2 Dedicated"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\rFactor2-Dedicated\Bin64"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "rFactor2 Dedicated"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog             = ""
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = ""
    #                       Server Launch Command
    $global:launchParams    = '@("$executable +path=".."")'
} 