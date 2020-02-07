Function New-LaunchScriptSdtdserverPS {
    #----------   7Days2Die Ask for input for server cfg    -------------------
    # APP ID # 294420
    $global:MODDIR = ""
    $global:EXE = "startdedicated.bat"
    $global:EXEDIR = ""
    $global:GAME = "7d2d"
    $global:SAVES = "7DaysToDie"
    $global:PROCESS = "7daystodieserver"
    $global:SERVERCFGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = ""
    $global:config1 = "serverconfig.xml"
    # Get-Servercfg
    # - - - - - - - - - - - - -
    Write-Host '*** Configure Instance *****' -ForegroundColor Yellow -BackgroundColor Black
    if (($global:PORT = Read-Host -Prompt (Write-Host "Input Server Port,Press enter to accept default value [26900]: " -ForegroundColor Cyan -NoNewline)) -eq '') { $global:PORT = "26900" }else { $global:PORT }
    Write-Host 'Input Server name: ' -ForegroundColor Cyan -NoNewline
    $global:HOSTNAME = Read-host
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace "My Game Host", "$global:HOSTNAME") | Set-Content -Path $global:currentdir\$global:server\$global:config1 
    ((Get-Content -path $global:currentdir\$global:server\$global:config1 -Raw) -replace '26900', "$global:PORT") | Set-Content -Path $global:currentdir\$global:server\$global:config1 
    ((Get-Content -path $global:currentdir\$global:server\startdedicated.bat -Raw) -replace 'pause', 'exit') | Set-Content -Path $global:currentdir\$global:server\startdedicated.bat        
    $global:launchParams = '@("$global:EXE")'

}