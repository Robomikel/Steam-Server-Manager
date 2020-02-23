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

    # Steamer Vars Do Not Edit
    $global:systemdir = ""
    $global:executabledir = "$serverdir"
    $global:executable = "Server"
    $global:querytype = "protocol-valve"
    $global:process = "Server"
    $global:servercfgdir = "$serverdir\config"
    $global:logdirectory = "$serverdir"
    
    # Game-Server-Configs
    $global:gamedirname = "NaturalSelection2"
    $global:servercfg = "server.txt"

    $global:launchParams = '@("$executable -name `"${hostname}`" -port ${port} -webadmin -webdomain ${ip} -webuser admin -webpassword `"${rconpassword}`" -webport 8080 -map ${defaultmap} -limit ${maxplayers} -config_path $servercfgdir\server.txt -logdir `"`" -modstorage `"Workshop`" -mods `"`" -condebug")'

}