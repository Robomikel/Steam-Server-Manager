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
    $global:EXEDIR = "x64"
    $global:EXE = "ns2"
    $global:GAME = "protocol-valve"
    $global:PROCESS = "ns2"
    $global:SERVERCFGDIR = ""
    $global:LOGDIR = ""
    $global:RCONPORT = "$global:PORT"
    Get-StopServerInstall
    # Game-Server-Configs
    $global:gamedirname = "NaturalSelection"
    $global:config1 = "server.cfg"

    Get-Servercfg
    Select-RenameSource
    $global:RCONPORT = "${global:PORT}"

    
    Select-EditSourceCFG
    # VERSION 2 Requieres  Vars
    $global:launchParams = '@("-console -name `"${$global:HOSTNAME}`" -port ${port} -webadmin -webdomain ${ip} -webuser admin -webpassword `"admin`" -webport 8080 -map ${map} -limit ${maxplayers} -config_path server.cfg -logdir `"\`" -modstorage `"\Workshop`" -mods `"`" -condebug")'

}