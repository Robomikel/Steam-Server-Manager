    Function New-LaunchScriptIronArmadaserverPS {
    # Iron Armada Dedicated Server
    # APP ID # 770340
    ################## Change Default Variables ################# 

    ###########################/\#################################
    
    
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "ironarmadaserver"
    $global:executabledir = "$serverdir"
    $global:querytype = ""
    $global:saves = ""
    $global:process = "ironarmadaserver"
    $global:servercfgdir = "$serverdir\iron\default-cfg-server\servercfg.toml"
    $global:logdirectory = "$serverdir"
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = ""

    
    
    $global:launchParams = '@("$executable -c --console")'
}