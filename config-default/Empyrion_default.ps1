Function New-LaunchScriptempserverPS {
    #----------   Empyrion: Dedicated Server
    # APP ID # 530870
    ################## Change Default Variables #################
    #                       Server Port
    $global:port            = "30000"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    ###########################/\#################################
    
    ###################### Do not change below #####################
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir"
    #                       Server Executable
    $global:executable      = "EmpyrionLauncher"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir"
    #                       Gamedig Query
    $global:querytype       = "empyrion"
    #                       Game Process
    $global:process         = "EmpyrionDedicated"
    #                       Log Directory
    $global:logdirectory    = "$serverdir"
    #                       Game-Server-Config Directory
    $global:gamedirname     = ""
    #                       Game-Server-Config
    $global:servercfg       = "dedicated.yaml"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable -startDedi")'
    # Install Adjustment
    Write-Host "***  Editing Default dedicated.yaml  ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace "\bMy Server\b", "$hostname") | Set-Content -Path $servercfgdir\$servercfg
    ((Get-Content -path $servercfgdir\$servercfg -Raw) -replace "\b30000\b", "$port") | Set-Content -Path $servercfgdir\$servercfg
}