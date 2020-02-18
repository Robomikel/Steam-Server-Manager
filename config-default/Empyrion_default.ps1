Function New-LaunchScriptempserverPS {
    #----------   Empyrion: Dedicated Server
    # APP ID # 530870
    ################## Change Default Variables #################
    #                       Server Port
    $global:PORT            = "30000"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    ###########################/\#################################
    
    
    
    
    ###################### Do not change below #####################
    $global:MODDIR = ""
    $global:EXE = "EmpyrionLauncher"
    $global:EXEDIR = ""
    $global:GAME = "empyrion"
    $global:PROCESS = "EmpyrionDedicated"
    $global:SERVERCFGDIR = ""
    $global:LOGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "dedicated.yaml"
    # Get-Servercfg
    Write-Host "***  Editing Default dedicated.yaml  ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "\bMy Server\b", "$global:HOSTNAME") | Set-Content -Path $global:currentdir\$global:server\$global:config1
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "\b30000\b", "$global:PORT") | Set-Content -Path $global:currentdir\$global:server\$global:config1
    $global:launchParams = '@("$global:EXE -startDedi")'
}