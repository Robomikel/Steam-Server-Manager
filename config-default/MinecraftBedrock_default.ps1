Function New-LaunchScriptbedrock_serverPS {
    # Minecraft Bedrock
    # 11421000


    ################## Change Default Variables #################

    ###########################/\#################################

    # 19132 TCP/UDP IPV4
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "bedrock_server"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "minecraftbe"
    #                       Game Process
    $global:process         = "bedrock_server"
    #                       Log Directory
    $global:logdirectory    = ""
    #                       Server Log
    $global:consolelog             = ""
    #                        Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server.properites"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable ")'
    Get-MCBRBinaries
}