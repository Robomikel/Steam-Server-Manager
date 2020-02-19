Function New-LaunchScriptColonySurvivalServerPS {
    # Colony Survival Dedicated Server
    # APP ID # 748090
    ################## Change Default Variables #################
    #                       Server IP
    ${global:IP}            = "${global:IP}"
    #                       Maxplayers
    $global:maxplayers      = "10"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Server Password
    $global:serverpassword  = ""
    #                       Server Port
    $global:port            = "27004"
    #                       World Name  
    $global:galaxyname        = "WorldName"
    ##############################/\##############################
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "colonyserver"
    $global:executabledir = ""
    $global:querytype = "protocol-valve"
    $global:process = "colonyserver"
    $global:servercfgdir = ""
    $global:logdir = "gamedata\logs\server"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = ""

    
    New-servercfgmom
    $global:launchParams = '@("$executable -batchmode -nographics +server.world ${galaxyname} +server.name `"${hostname}`" +server.networktype SteamOnline +server.ip ${ip} +server.gameport ${port} +server.password `"${serverpassword}`" +server.maxplayers ${maxplayers}")'
}