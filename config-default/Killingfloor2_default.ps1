Function New-LaunchScriptKF2serverPS {
    # Killing Floor 2 Server
    # APP ID # 232130
    ################## Change Default Variables #################
    #                       Server Port
    $global:port            = "7777"
    #                       Query Port
    $global:queryport       = "27015"
    #                       Map
    $global:defaultmap      = "KF-BioticsLab"
    #                       GameMode
    $global:gamemode        = "KFGameContent.KFGameInfo_Endless"
    #                       Difficulty
    $global:diff            = "0"
    #                       Server Name
    $global:hostname        = "SERVERNAME"
    #                       Admin Password
    $global:adminpassword   = "$RANDOMPASSWORD"

    ##############################/\##############################
    
    
    
    
    ###################### Do not change below ##################### 
    #                       System Directory
    $global:systemdir       = "$serverdir"
    #                       Server Config Directory
    $global:servercfgdir    = "$serverdir\KFGame\Config"   
    #                       Server Executable
    $global:executable      = "KFServer"
    #                       Server Executable Directory
    $global:executabledir   = "$serverdir\Binaries\Win64"
    #                       Gamedig Query
    $global:querytype       = "killingfloor2"
    #                       Game Process
    $global:process         = "KFserver"
    #                       Log Directory
    $global:logdirectory    = "$serverdir\KFGame\Logs"
    #                       Game-Server-Config Directory
    $global:gamedirname     = "KillingFloor2"
    #                       Game-Server-Config
    $global:servercfg       = "KFWeb.ini"
    $global:config2         = "LinuxServer-KFEngine.ini"
    $global:config3         = "LinuxServer-KFGame.ini"
    $global:config4         = "LinuxServer-KFInput.ini"
    $global:config5         = "LinuxServer-KFSystemSettings.ini"
    #                       Server Launch Command
    $global:launchParams    = '@("$executable ${defaultmap}?Game=${gamemode}?Difficulty=${diff}? -Port=${port} -QueryPort=${queryport}")'
    # Get User Input version must be set to 0
    Get-UserInput
    # Install Adjustment
    Remove-item $servercfgdir\PCServer-*.ini -Force  >$null 2>&1
    Get-Servercfg
    Set-Location $servercfgdir
    Get-ChildItem -Filter "LinuxServer-*.ini" -Recurse | Rename-Item -NewName { $_.name -replace 'LinuxServer', 'PCServer' } -Force
    Set-Location $serverdir
    Write-Host "***  starting Server before Setting PCServer-KFGame.ini Please Wait ***" -ForegroundColor Magenta -BackgroundColor Black
    .\KF2Server.bat
    timeout 5
    Write-Host "***  stopping Server before Setting PCServer-KFGame.ini Please Wait ***" -ForegroundColor Magenta -BackgroundColor Black
    Get-StopServer
    Write-Host "***  Editing Default Server Name PCServer-KFGame.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $servercfgdir\PCServer-KFGame.ini -Raw) -replace "\bKilling Floor 2 Server\b", "$hostname") | Set-Content -Path $servercfgdir\PCServer-KFGame.ini
    Write-Host "***  Adding ADMIN PASSWORD PCServer-KFGame.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $servercfgdir\PCServer-KFGame.ini -Raw) -replace "AdminPassword=", "AdminPassword=$ADMINPASSWORD") | Set-Content -Path $servercfgdir\PCServer-KFGame.ini
    Write-Host "***  Enabling Webmin in KFWeb.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $servercfgdir\KFWeb.ini -Raw) -replace "\bbEnabled=false\b", "bEnabled=true") | Set-Content -Path $servercfgdir\KFWeb.ini
    Write-Host "***  Disabling Takeover PCServer-KFEngine.ini ***" -ForegroundColor Magenta -BackgroundColor Black
    ((Get-Content -path $servercfgdir\PCServer-KFEngine.ini -Raw) -replace "\bbUsedForTakeover=TRUE\b", "bUsedForTakeover=FALSE") | Set-Content -Path $servercfgdir\PCServer-KFEngine.ini
    Set-Location $currentdir
}