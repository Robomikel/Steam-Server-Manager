Function New-LaunchScriptKF2serverPS {
    # Killing Floor 2 Server
    # APP ID # 232130
    ################## Change Default Variables #################
    #                       Server Port
    $global:PORT            = "7777"
    #                       Query Port
    $global:QUERYPORT       = "27015"
    #                       Map
    $global:MAP             = "KF-BioticsLab"
    #                       GameMode
    $global:GAMEMODE        = "KFGameContent.KFGameInfo_Endless"
    #                       Difficulty
    $global:DIFF            = "0"
    #                       Server Name
    $global:HOSTNAME        = "$env:USERNAME"
    #                       Admin Password
    $global:ADMINPASSWORD    = "$global:RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
    # # Version 2.0
    # $global:MODDIR=""
    $global:EXE = "KFServer"   
    $global:EXEDIR = "Binaries\Win64"
    $global:GAME = "killingfloor2"
    $global:PROCESS = "KFserver"
    $global:SERVERCFGDIR = "\KFGame\Config"
    $global:LOGDIR = ""
    Get-StopServerInstall
    $global:gamedirname = "KillingFloor2"
    $global:config1 = "KFWeb.ini"
    $global:config2 = "LinuxServer-KFEngine.ini"
    $global:config3 = "LinuxServer-KFGame.ini"
    $global:config4 = "LinuxServer-KFInput.ini"
    $global:config5 = "LinuxServer-KFSystemSettings.ini"
    Remove-item $global:currentdir\$global:server\$global:SERVERCFGDIR\PCServer-*.ini -Force  >$null 2>&1
    Get-Servercfg
    Set-Location $global:currentdir\$global:server\$global:SERVERCFGDIR
    Get-ChildItem -Filter "LinuxServer-*.ini" -Recurse | Rename-Item -NewName { $_.name -replace 'LinuxServer', 'PCServer' } -Force
    Set-Location $global:currentdir\$global:server

    # Get-UserInput 0 1 1 0 0 1 0 0 0 1 0 0 1 1 1 0
    # VERSION 2 Requieres  Vars
    Write-Host "***  starting Server before Setting PCServer-KFGame.ini Please Wait ***" -ForegroundColor Magenta -BackgroundColor Black
    .\KF2Server.bat
    timeout 5
    Write-Host "***  stopping Server before Setting PCServer-KFGame.ini Please Wait ***" -ForegroundColor Magenta -BackgroundColor Black
    Get-StopServer
    Write-Host "***  Editing Default Server Name PCServer-KFGame.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\PCServer-KFGame.ini -Raw) -replace "\bKilling Floor 2 Server\b", "$global:HOSTNAME") | Set-Content -Path $global:currentdir\$global:server\KFGame\Config\PCServer-KFGame.ini
    Write-Host "***  Adding ADMIN PASSWORD PCServer-KFGame.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\PCServer-KFGame.ini -Raw) -replace "AdminPassword=", "AdminPassword=$global:ADMINPASSWORD") | Set-Content -Path $global:currentdir\$global:server\KFGame\Config\PCServer-KFGame.ini
    Write-Host "***  Enabling Webmin in KFWeb.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\KFWeb.ini -Raw) -replace "\bbEnabled=false\b", "bEnabled=true") | Set-Content -Path $global:currentdir\$global:server\KFGame\Config\KFWeb.ini
    Write-Host "***  Disabling Takeover PCServer-KFEngine.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $global:currentdir\$global:server\$global:SERVERCFGDIR\PCServer-KFEngine.ini -Raw) -replace "\bbUsedForTakeover=TRUE\b", "bUsedForTakeover=FALSE") | Set-Content -Path $global:currentdir\$global:server\KFGame\Config\PCServer-KFEngine.ini
    $global:launchParams = '@("$global:EXEDIR\$global:EXE ${global:MAP}?Game=${global:GAMEMODE}?Difficulty=${global:DIFF}? -Port=${global:PORT} -QueryPort=${global:QUERYPORT}")'  
    Set-Location $global:currentdir
}