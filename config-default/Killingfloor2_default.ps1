Function New-LaunchScriptKF2serverPS {
    # Killing Floor 2 Server
    # APP ID # 232130
    ################## Change Default Variables #################
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap             = "KF-BioticsLab"
    #                       GameMode
    $global:gamemode        = "KFGameContent.KFGameInfo_Endless"
    #                       Difficulty
    $global:diff            = "0"
    #                       Server Name
    $global:hostname        = "$env:USERNAME"
    #                       Admin Password
    $global:adminpassword    = "$global:RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
    # # Version 2.0
    # $global:systemdir=""
    $global:executable = "KFServer"   
    $global:executabledir = "Binaries\Win64"
    $global:querytype = "killingfloor2"
    $global:process = "KFserver"
    $global:servercfgdir = "\KFGame\Config"
    $global:logdir = ""
    Get-StopServerInstall
    $global:gamedirname = "KillingFloor2"
    $global:servercfg = "KFWeb.ini"
    $global:config2 = "LinuxServer-KFEngine.ini"
    $global:config3 = "LinuxServer-KFGame.ini"
    $global:config4 = "LinuxServer-KFInput.ini"
    $global:config5 = "LinuxServer-KFSystemSettings.ini"
    Remove-item $currentdir\$serverfiles\$servercfgdir\PCServer-*.ini -Force  >$null 2>&1
    Get-Servercfg
    Set-Location $currentdir\$serverfiles\$servercfgdir
    Get-ChildItem -Filter "LinuxServer-*.ini" -Recurse | Rename-Item -NewName { $_.name -replace 'LinuxServer', 'PCServer' } -Force
    Set-Location $currentdir\$serverfiles

    # Get-UserInput 0 1 1 0 0 1 0 0 0 1 0 0 1 1 1 0
    # VERSION 2 Requieres  Vars
    Write-Host "***  starting Server before Setting PCServer-KFGame.ini Please Wait ***" -ForegroundColor Magenta -BackgroundColor Black
    .\KF2Server.bat
    timeout 5
    Write-Host "***  stopping Server before Setting PCServer-KFGame.ini Please Wait ***" -ForegroundColor Magenta -BackgroundColor Black
    Get-StopServer
    Write-Host "***  Editing Default Server Name PCServer-KFGame.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $currentdir\$serverfiles\$servercfgdir\PCServer-KFGame.ini -Raw) -replace "\bKilling Floor 2 Server\b", "$hostname") | Set-Content -Path $currentdir\$serverfiles\KFGame\Config\PCServer-KFGame.ini
    Write-Host "***  Adding ADMIN PASSWORD PCServer-KFGame.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $currentdir\$serverfiles\$servercfgdir\PCServer-KFGame.ini -Raw) -replace "AdminPassword=", "AdminPassword=$ADMINPASSWORD") | Set-Content -Path $currentdir\$serverfiles\KFGame\Config\PCServer-KFGame.ini
    Write-Host "***  Enabling Webmin in KFWeb.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $currentdir\$serverfiles\$servercfgdir\KFWeb.ini -Raw) -replace "\bbEnabled=false\b", "bEnabled=true") | Set-Content -Path $currentdir\$serverfiles\KFGame\Config\KFWeb.ini
    Write-Host "***  Disabling Takeover PCServer-KFEngine.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $currentdir\$serverfiles\$servercfgdir\PCServer-KFEngine.ini -Raw) -replace "\bbUsedForTakeover=TRUE\b", "bUsedForTakeover=FALSE") | Set-Content -Path $currentdir\$serverfiles\KFGame\Config\PCServer-KFEngine.ini
    $global:launchParams = '@("$executabledir\$executable ${defaultmap}?Game=${gamemode}?Difficulty=${diff}? -Port=${port} -QueryPort=${queryport}")'  
    Set-Location $currentdir
}