Function New-LaunchScriptempserverPS {
    #----------   Empyrion: Dedicated Server
    # APP ID # 530870
    $global:MODDIR = ""
    $global:EXE = "EmpyrionLauncher"
    $global:EXEDIR = ""
    $global:GAME = "empyrion"
    $global:PROCESS = "EmpyrionDedicated"
    $global:SERVERCFGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "dedicated.yaml"
    # Get-Servercfg
    Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
    if (($global:PORT = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [30000]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "30000" }else { $global:PORT }
    #if(($global:QUERYPORT = Read-Host -Prompt  (Write-Host "Input Server Query Port, Press enter to accept default value [27131]: " -ForegroundColor Cyan -NoNewline)) -eq ''){$global:QUERYPORT="27131"}else{$global:QUERYPORT}
    Write-Host 'Input hostname: ' -ForegroundColor Cyan -NoNewline
    $global:HOSTNAME = Read-host
    Write-Host "***  Editing Default dedicated.yaml  ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "\bMy Server\b", "$global:HOSTNAME") | Set-Content -Path $global:currentdir\$global:server\$global:config1
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "\b30000\b", "$global:PORT") | Set-Content -Path $global:currentdir\$global:server\$global:config1
    $global:launchParams = '@("$global:EXE -startDedi")'
}