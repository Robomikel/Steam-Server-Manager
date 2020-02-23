    Function New-LaunchScriptIronArmadaserverPS {
    # Iron Armada Dedicated Server
    # APP ID # 770340
    ################## Change Default Variables ################# 

    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:servercfgdir = "$serverdir\iron\default-cfg-server\servercfg.toml"
    $global:executabledir = "$serverdir"
    $global:executable = "ironarmadaserver"
    $global:querytype = ""
    $global:saves = ""
    $global:process = "ironarmadaserver"
    $global:logdirectory = "$serverdir"
    $global:gamedirname = ""
    $global:servercfg = ""
    # Server Launch Command
    $global:launchParams = '@("$executable -c --console")'
}