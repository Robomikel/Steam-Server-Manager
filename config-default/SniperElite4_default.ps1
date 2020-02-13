Function  New-LaunchScriptSE4serverPS {
    # Sniper Elite 4 Dedicated Server
    # APP ID # 568880
    # http://snipereliteadmin.com/#!/SE4DedicatedServerSetup  
    ################## Change Default Variables #################


    ##############################/\##############################
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "SniperElite4_Dedicated"
    $global:EXEDIR = "bin"
    $global:GAME = "protocol-valve"
    $global:SAVES = ""
    $global:PROCESS = "SniperElite4_Dedicated"
    $global:SERVERCFGDIR = ""

    $global:gamedirname = ""
    $global:config1 = "server.cfg"

    Get-StopServerInstall
    $global:launchParams = '@("$global:EXEDIR\$global:EXE exec $global:currentdir\$global:server\Server.cfg")'
}