Function New-LaunchScriptColonySurvivalServerPS {
    # Colony Survival Dedicated Server
    # APP ID # 748090
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${ip}"
    #                       Maxplayers
    $global:maxplayers      = "10"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Server Port
    $global:port            = "27004"
    #                       World Name  
    $global:galaxyname      = "WorldName"
    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "colonyserver"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "colonyserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\gamedata\logs\server"
    #                       Server Log
    $global:consolelog             = "*.txt"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -batchmode -nographics +server.world ${galaxyname} +server.name `"${hostname}`" +server.networktype SteamOnline +server.ip ${ip} +server.gameport ${port} +server.password `"${serverpassword}`" +server.maxplayers ${maxplayers}")'
    # Get User Input version must be set to 0
    Get-UserInput
}