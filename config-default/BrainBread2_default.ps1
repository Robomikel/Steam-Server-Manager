Function New-LaunchScriptBB2serverPS {
    # BrainBread 2 Dedicated Server
    # APP ID # 475370
    #
    ################## Change Default Variables ################# 
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Server Port
    ${global:PORT}          = "27015"
    #                       Client Port
    $global:CLIENTPORT      = "27005"
    #                       Source TV Port
    $global:SOURCETVPORT    = "27020"
    # GSLT used for running a public server.
    #                       Game Server Token : Optional
    $global:GSLT            = "GameServerTokenHere"
    #                       Map
    $global:MAP             = "bba_barracks"
    #                       Maxplayers
    $global:MAXPLAYERS      = "20"
    #                       Rcon Password
    $global:RCONPASSWORD    = "$global:RANDOMPASSWORD"
    ###########################/\#################################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXEDIR = ""
    $global:EXE = "BB2"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "BB2"
    $global:SERVERCFGDIR = "cfg"
    $global:ANON = "yes"
    $global:username = ""
    Get-StopServerInstall
    #Game-server-configs \/
    $global:gamedirname = "BrainBread2"
    $global:config1 = "server.cfg"
    Get-Servercfg
    $global:RCONPORT = "${global:PORT}"
    #Get-UserInput 1 1 0 0 1 0 0 1 1 1
    Select-RenameSource
    # game config
    Select-EditSourceCFG
    $global:launchParams = '@("$global:EXE -console -game brainbread2 -strictportbind -ip ${global:IP} -port ${global:PORT} +clientport ${global:CLIENTPORT} +tv_port ${global:SOURCETVPORT} +map ${global:MAP} -maxplayers ${global:MAXPLAYERS} -condebug")'
}