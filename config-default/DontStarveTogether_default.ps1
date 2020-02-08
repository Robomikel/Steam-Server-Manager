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
    #--->game config folder
    #$global:SERVERCFGDIR = ""
    #--->Stop existing process if running
    Get-StopServerInstall
    #--->Game-server-manger folder \/
    $global:gamedirname = "DontStarveTogether"

    $shard = "Master"
    $shard2 = "Cave"
    $cluster = "Cluster_1"
    ${persistentstorageroot} = "C:\users\$env:USERNAME\Klei\$global:gamedirname "
    
    #--->Game-server-manger config name \/
    $global:SERVERCFGDIR = "$persistentstorageroot\$cluster\$shard\"
    $global:config1 = "server.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    
    #--->Game-server-manger config name \/
    $global:SERVERCFGDIR = "$persistentstorageroot\$cluster"
    $global:config2 = "cluster.ini"
    #--->Get game-server-config \/\/
    Get-Servercfg
    #--->input questions 1 1 0 0 0 0 0 1 0 1 1 0 0
    #Get-UserInput 1 1 0 0 0 1 1 0 0 0 0 0
    #--->Edit game config \/ SERVERNAME ADMINPASSWORD
    Select-EditSourceCFG
    # BOTH CAVES AND MASTER
    $global:launchParams = '@("$global:EXEDIR\$global:EXE -console -cluster ${cluster} -shard ${shard} -backup_logs ;; $global:EXEDIR\$global:EXE -console -cluster ${cluster} -shard ${shard2} -backup_logs")'
    # Master
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -console -bind_ip ${global:ip} -port ${global:PORT} -players ${global:maxplayers} -persistent_storage_root ${persistentstorageroot} -conf_dir ${global:gamedirname} -cluster ${cluster} -shard ${shard} -backup_logs")'
    # Caves
    #$global:launchParams = '@("$global:EXEDIR\$global:EXE -console -bind_ip ${global:ip} -port ${global:PORT} -players ${global:maxplayers} -persistent_storage_root ${persistentstorageroot} -conf_dir ${global:gamedirname} -cluster ${cluster} -shard ${shard2} -backup_logs")'
}