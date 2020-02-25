Function New-LaunchScriptDSTserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Don't Starve Together Dedicated Server
    # APP ID # 343050
    # https://steamcommunity.com/sharedfiles/filedetails/?id=590681995
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${ip}"
    #                       Server Port
    $global:port            = "10999"
    #                       RCON Port
    $global:rconport        = "${port}"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "SERVERNAME"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Executable
    $global:executable      = "dontstarve_dedicated_server_nullrenderer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\bin"
    #                       Gamedig Query
    $global:querytype       = "protocol-valve"
    #                       Game Process
    $global:process         = "dontstarve_dedicated_server_nullrenderer"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "DontStarveTogether"

    $global:shard = "Master"
    $global:cluster = "Cluster_1"
    # moved to server folder root
    $global:persistentstorageroot = "$serverdir\Klei"
    
    #                       Server Config Directory
    $global:servercfgdir    = "$persistentstorageroot\$gamedirname\$cluster\$shard\"
    #                       Game-Server-Config
    $global:servercfg       = "server.ini"
    # Download Game-Server-Config
    Get-Servercfg
    #                       Server Config Directory
    $global:servercfgdir    = "$persistentstorageroot\$gamedirname\$cluster"
    #                       Game-Server-Config
    $global:servercfg       = "cluster.ini"
    # Download Game-Server-Config
    Get-Servercfg
    # Edit Server Game-Server-Config
    Select-EditSourceCFG
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -console_enabled -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root ${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${shard} -backup_log_count 10")'

    # BOTH CAVES AND MASTER
    #$global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${shard} -backup_logs ; ; $executable -console -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard cave -backup_logs")'

    # Caves
    #$global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${cave} -backup_logs")'
}