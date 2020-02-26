    Function New-LaunchScriptIronArmadaserverPS {
    # Iron Armada Dedicated Server
    # APP ID # 770340
    ################## Change Default Variables ################# 

    ###########################/\#################################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Executable
    $global:executable      = "ironarmadaserver"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "ironarmadaserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\iron\default-cfg-server\servercfg.toml"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -c --console")'
}