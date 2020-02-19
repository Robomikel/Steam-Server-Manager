Function New-LaunchScriptempserverPS {
    #----------   Empyrion: Dedicated Server
    # APP ID # 530870
    ################## Change Default Variables #################
    #                       Server Port
    $global:port            = "30000"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    ###########################/\#################################
    
    
    
    
    ###################### Do not change below #####################
    $global:systemdir = ""
    $global:executable = "EmpyrionLauncher"
    $global:executabledir = ""
    $global:querytype = "empyrion"
    $global:process = "EmpyrionDedicated"
    $global:servercfgdir = ""
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:servercfg = "dedicated.yaml"
    # Get-Servercfg
    Write-Host "***  Editing Default dedicated.yaml  ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $currentdir\$serverfiles\$servercfg -Raw) -replace "\bMy Server\b", "$hostname") | Set-Content -Path $currentdir\$serverfiles\$servercfg
    ((Get-Content -path $currentdir\$serverfiles\$servercfg -Raw) -replace "\b30000\b", "$port") | Set-Content -Path $currentdir\$serverfiles\$servercfg
    $global:launchParams = '@("$executable -startDedi")'
}