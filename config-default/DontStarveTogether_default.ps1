Function New-LaunchScriptDSTserverPS {
    #* * Add to Read-AppID in fn_Actions.ps1 * *
    # Don't Starve Together Dedicated Server
    # APP ID # 343050
    # https://steamcommunity.com/sharedfiles/filedetails/?id=590681995
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:port            = "10999"
    #                       RCON Port
    $global:rconport        = "${global:port}"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    #--->executable Directory \/\/
    $global:executabledir = "$serverdir\bin"
    #--->rename srcds to this name \/\/
    $global:executable = "dontstarve_dedicated_server_nullrenderer"
    #--->Requieres \/ \/ game dig
    $global:querytype = "protocol-valve"
    #--->Requieres \/ \/ maybe same as game executable?
    $global:process = "dontstarve_dedicated_server_nullrenderer"
    $global:logdirectory = "$serverdir"
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "DontStarveTogether"

    $global:shard = "Master"
    $global:cluster = "Cluster_1"
    # moved to server folder root
    $global:persistentstorageroot = "Klei"
    
    #--->Game-server-manger config name \/
    $global:servercfgdir = "$persistentstorageroot\$gamedirname\$cluster\$shard\"
    $global:servercfg = "server.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    
    #--->Game-server-manger config name \/
    $global:servercfgdir = "$persistentstorageroot\$gamedirname\$cluster"
    $global:servercfg = "cluster.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    Select-EditSourceCFG
    # BOTH CAVES AND MASTER
    #$global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${shard} -backup_logs ; ; $executable -console -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard cave -backup_logs")'
    
    # Master
    $global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${shard} -backup_logs")'
    
    # Caves
    #$global:launchParams = '@("$executable -console -bind_ip ${ip} -port ${port} -players ${maxplayers} -persistent_storage_root $serverdir\${persistentstorageroot} -conf_dir ${gamedirname} -cluster ${cluster} -shard ${cave} -backup_logs")'
}