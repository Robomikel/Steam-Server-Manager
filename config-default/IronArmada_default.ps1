Function New-LaunchScriptIronArmadaserverPS {
    # Iron Armada Dedicated Server
    # APP ID # 770340
    ################## Change Default Variables ################# 

    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "ironarmadaserver"
    $global:EXEDIR = ""
    $global:GAME = ""
    $global:SAVES = ""
    $global:PROCESS = "ironarmadaserver"
    $global:SERVERCFGDIR = "iron\default-cfg-server\servercfg.toml"
    $global:LOGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = ""

    
    
    $global:launchParams = '@("$global:EXE -c --console")'
}