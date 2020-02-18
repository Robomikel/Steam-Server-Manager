Function New-LaunchScriptColonySurvivalServerPS {
    # Colony Survival Dedicated Server
    # APP ID # 748090
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Maxplayers
    $global:MAXPLAYERS      = "10"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Server Password
    $global:SERVERPASSWORD  = ""
    #                       Server Port
    $global:PORT            = "27004"
    #                       World Name  
    $global:GALAXYNAME        = "WorldName"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "colonyserver"
    $global:EXEDIR = ""
    $global:GAME = "protocol-valve"
    $global:PROCESS = "colonyserver"
    $global:SERVERCFGDIR = ""
    $global:LOGDIR = "gamedata\logs\server"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = ""

    
    New-servercfgmom
    $global:launchParams = '@("$global:EXE -batchmode -nographics +server.world $global:GALAXYNAME +server.name `"$global:HOSTNAME`" +server.networktype SteamOnline +server.ip ${global:IP} +server.gameport $global:PORT +server.password `"$global:SERVERPASSWORD`" +server.maxplayers $global:MAXPLAYERS")'
}