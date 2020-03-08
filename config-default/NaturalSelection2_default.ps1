Function New-LaunchScriptNS2serverPS {
    #----------   Natural Selection 2 Dedicated Server  -------------------
    # APP ID # 4940
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "27015"
    #                       Map
    $global:defaultmap      = "ns2_summit"
    #                       Maxplayers
    $global:maxplayers      = "24"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Rcon Password
    $global:rconpassword    = "$RANDOMPASSWORD"
    #                       Requieres Steam Login

    ##############################/\##############################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\config"
    #                       Server Executable
    $global:executable      = "Server"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "Server"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Server Log
    $global:consolelog             = "console.log"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "NaturalSelection2"
    #                       Game-Server-Config
    $global:servercfg       = "server.txt"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -name `"${hostname}`" -port ${port} -webadmin -webdomain ${ip} -webuser admin -webpassword `"${rconpassword}`" -webport 8080 -map ${defaultmap} -limit ${maxplayers} -config_path $servercfgdir\server.txt -logdir `"`" -modstorage `"Workshop`" -mods `"`" -condebug")'
    # Get User Input version must be set to 0
    Get-UserInput
}