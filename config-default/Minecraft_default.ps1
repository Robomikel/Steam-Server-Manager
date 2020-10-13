Function New-LaunchScriptminecraft_serverPS {
    # Minecraft
    # 11500000


    ################## Change Default Variables #################

    ###########################/\#################################

    # 25565 TCP/UDP IPV4
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable Directory
    $global:executable      = "server.jar"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "minecraft"
    #                       Game Process
    $global:process         = "java"
    #                       Log Directory
    $global:logdirectory    = ""
    #                       Server Log
    $global:consolelog      = ""
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "server.properties"
    #                       Server Launch Command
    $global:launchParams    = '@("java -Xms1024M -Xmx1024M -jar $executable nogui")'
    # Get User Input version must be set to 0
    Get-UserInput
    Get-MCjavaBinaries
}