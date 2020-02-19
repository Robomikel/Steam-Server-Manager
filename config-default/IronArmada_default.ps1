    Function New-LaunchScriptIronArmadaserverPS {
    # Iron Armada Dedicated Server
    # APP ID # 770340
    ################## Change Default Variables ################# 

    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "ironarmadaserver"
    $global:executabledir = ""
    $global:querytype = ""
    $global:saves = ""
    $global:process = "ironarmadaserver"
    $global:servercfgdir = "iron\default-cfg-server\servercfg.toml"
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = ""

    
    
    $global:launchParams = '@("$executable -c --console")'
}