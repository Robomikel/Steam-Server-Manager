Function  New-LaunchScriptSE4serverPS {
    # Sniper Elite 4 Dedicated Server
    # APP ID # 568880
    # http://snipereliteadmin.com/#!/SE4DedicatedServerSetup  
    ################## Change Default Variables #################


    ##############################/\##############################
    
    # Server.AuthPort 8701
    # Server.GamePort 24001
    # Server.UpdatePort 23001
     #Server.LobbyPort 25001
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "SniperElite4_Dedicated"
    $global:executabledir = "$serverdir\bin"
    $global:querytype = "protocol-valve"
    $global:saves = ""
    $global:process = "SniperElite4_Dedicated"
    $global:servercfgdir = "$serverdir"
    $global:logdirectory = "$serverdir"

    $global:gamedirname = ""
    $global:servercfg = "server.cfg"

    Get-StopServerInstall
    $global:launchParams = '@("$executable exec $servercfgdir\Server.cfg")'
}