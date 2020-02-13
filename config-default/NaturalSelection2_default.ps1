Function New-LaunchScriptNS2serverPS {
    #----------   Natural Selection 2 Dedicated Server  -------------------
    # APP ID # 4940
    ################## Change Default Variables #################
    #                       Server IP 
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    $global:PORT            = "27015"
    #                       Map
    $global:MAP             = "ns2_summit"
    #                       Maxplayers
    $global:MAXPLAYERS      = "24"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    #                       Requieres Steam Login

    ##############################/\##############################
    
    
    
    ###################### Do not change below #####################

    # Steamer Vars Do Not Edit
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "Server"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "Server"
    $global:SERVERCFGDIR = "config"
    $global:LOGDIR = ""
    $global:RCONPORT = "$global:PORT"
    Get-StopServerInstall
    # Game-Server-Configs
    $global:gamedirname = "NaturalSelection2"
    $global:config1 = "server.txt"

    # Get-Servercfg
    # Select-RenameSource
    $global:RCONPORT = "${global:PORT}"

    
    # Select-EditSourceCFG
    # VERSION 2 Requieres  Vars
    $global:launchParams = '@("$global:EXE -name `"${$global:HOSTNAME}`" -port ${port} -webadmin -webdomain ${ip} -webuser admin -webpassword `"$global:RCONPASSWORD`" -webport 8080 -map ${map} -limit ${maxplayers} -config_path $global:SERVERCFGDIR\server.txt -logdir `"`" -modstorage `"Workshop`" -mods `"`" -condebug")'

}