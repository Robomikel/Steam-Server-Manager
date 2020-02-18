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
    $global:RCONPORT        = "${global:PORT}"
    #                       Maxplayers
    $global:maxplayers      = "32"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    #--->Exe NOT in root server folder \/\/
    $global:EXEDIR = "bin"
    #--->rename srcds to this name \/\/
    $global:EXE = "dontstarve_dedicated_server_nullrenderer"
    #--->Requieres \/ \/ game dig
    $global:GAME = "protocol-valve"
    #--->Requieres \/ \/ maybe same as game exe?
    $global:PROCESS = "dontstarve_dedicated_server_nullrenderer"
    $global:LOGDIR = ""
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "DontStarveTogether"

    $global:shard = "Master"
    $global:cluster = "Cluster_1"
    # moved to server folder root
    $global:persistentstorageroot = "Klei"
    
    #--->Game-server-manger config name \/
    $global:SERVERCFGDIR = "$global:persistentstorageroot\$global:gamedirname\$global:cluster\$global:shard\"
    $global:config1 = "server.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    
    #--->Game-server-manger config name \/
    $global:SERVERCFGDIR = "$global:persistentstorageroot\$global:gamedirname\$global:cluster"
    $global:config1 = "cluster.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    Select-EditSourceCFG
    # BOTH CAVES AND MASTER
    #$global:launchParams = '@("$global:EXE -console -bind_ip ${global:ip} -port ${global:PORT} -players ${global:maxplayers} -persistent_storage_root $global:currentdir\$global:server\${global:persistentstorageroot} -conf_dir ${global:gamedirname} -cluster ${global:cluster} -shard ${global:shard} -backup_logs ; ; $global:EXE -console -persistent_storage_root $global:currentdir\$global:server\${global:persistentstorageroot} -conf_dir ${global:gamedirname} -cluster ${global:cluster} -shard cave -backup_logs")'
    
    # Master
    $global:launchParams = '@("$global:EXE -console -bind_ip ${global:ip} -port ${global:PORT} -players ${global:maxplayers} -persistent_storage_root $global:currentdir\$global:server\${global:persistentstorageroot} -conf_dir ${global:gamedirname} -cluster ${global:cluster} -shard ${global:shard} -backup_logs")'
    
    # Caves
    #$global:launchParams = '@("$global:EXE -console -bind_ip ${global:ip} -port ${global:PORT} -players ${global:maxplayers} -persistent_storage_root $global:currentdir\$global:server\${global:persistentstorageroot} -conf_dir ${global:gamedirname} -cluster ${global:cluster} -shard ${global:cave} -backup_logs")'
}